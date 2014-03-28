#
# Copyright © 2014 George Crabtree & Christopher Newton. MIT License
#

k () {
  # ------------------------------------------------------------------------------------------------------------------------
  # Setup
  # ------------------------------------------------------------------------------------------------------------------------
  # Turn on 256 colour terminal, not sure this works at all.
  OLD_TERM=$TERM
  TERM='xterm-256color'

  # Stop stat failing when a directory contains either no files or no hidden files
  setopt local_options null_glob

  # ---------------------------------
  # Vars

  # Get now
  EPOCH=`date +%s`
  TOTAL_BLOCKS=0
  MAX_LEN=(0 0 0 0 0 0)

  # String "~|~" acts a delimeter to split string
  STAT_CALL="%b~#~%Sp~|~%l~|~%Su~|~%Sg~|~%Z~|~%Sm~|~%N~|~%Y"
  STAT_TIME="%s^%d^%b^%H:%M^%Y"

  # Array to hold results from `stat` call
  RESULTS=()

  # only set once so must be out of the main loop
  IS_GIT_REPO=false

  # ------------------------------------------------------------------------------------------------------------------------
  # Stat call to get directory listing
  # ------------------------------------------------------------------------------------------------------------------------

  # Break total blocks of the front of the stat call, then push the rest to results
  i=1; stat -f $STAT_CALL -t $STAT_TIME . .. .* * | while read STAT_RESULTS
  do
    STAT_RESULTS=(${(s:~#~:)STAT_RESULTS})
    TOTAL_BLOCKS=$((TOTAL_BLOCKS+STAT_RESULTS[1]))
    RESULTS+=($STAT_RESULTS[2])
    i=$((i+1))
  done

  # Print total block before listing
  echo "total "$TOTAL_BLOCKS

  # On each result calculate padding by getting max length on each array member
  j=1; while [[ j -le $#RESULTS  ]]
  do
    A=(${(s:~|~:)RESULTS[j]})
    if [[ $#A[1] -ge $MAX_LEN[1] ]]; then MAX_LEN[1]=$#A[1]; fi;
    if [[ $#A[2] -ge $MAX_LEN[2] ]]; then MAX_LEN[2]=$#A[2]; fi;
    if [[ $#A[3] -ge $MAX_LEN[3] ]]; then MAX_LEN[3]=$#A[3]; fi;
    if [[ $#A[4] -ge $MAX_LEN[4] ]]; then MAX_LEN[4]=$#A[4]; fi;
    if [[ $#A[5] -ge $MAX_LEN[5] ]]; then MAX_LEN[5]=$#A[5]; fi;
    j=$((j+1))
  done

  # ------------------------------------------------------------------------------------------------------------------------
  # Loop through each line of stat, pad where appropriate and do git dirty checking
  # ------------------------------------------------------------------------------------------------------------------------

  k=1; while [[ k -le $#RESULTS  ]]
  do
    # We check if the result is a git repo later, so set a blank marker indication the result is not a git repo
    REPOMARKER=" "
    IS_DIRECTORY=false
    IS_SYMLINK=false
    IS_EXECUTABLE=false

    # create array from results by splitting on ~|~
    A=(${(s:~|~:)RESULTS[k]})
       PERMISSIONS=$A[1]
          SYMLINKS=$A[2]
             OWNER=$A[3]
             GROUP=$A[4]
          FILESIZE=$A[5]
              DATE=(${(s:^:)A[6]}) # Split date on ^
              NAME=$A[7]
    SYMLINK_TARGET=$A[8]

    # Check for file types
    if [[ -d $NAME ]]; then IS_DIRECTORY=true; fi
    if [[ -L $NAME ]]; then   IS_SYMLINK=true; fi

    # is this a git repo
    if [[ $k == 1 && $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
      then
      IS_GIT_REPO=true
    fi;

    # Pad so all the lines align - firstline gets padded the other way
    while [[ $#PERMISSIONS -lt $MAX_LEN[1] ]]; do PERMISSIONS=$PERMISSIONS" "; done;
    while [[ $#SYMLINKS    -lt $MAX_LEN[2] ]]; do SYMLINKS=" "$SYMLINKS;       done;
    while [[ $#OWNER       -lt $MAX_LEN[3] ]]; do OWNER=" "$OWNER;             done;
    while [[ $#GROUP       -lt $MAX_LEN[4] ]]; do GROUP=" "$GROUP;             done;
    while [[ $#FILESIZE    -lt $MAX_LEN[5] ]]; do FILESIZE=" "$FILESIZE;       done;

    # ------------------------------------------------------------------------------------------------------------------------
    # Colour the permissions - TODO
    # ------------------------------------------------------------------------------------------------------------------------
    # Colour the first character based on filetype
    FILETYPE=$PERMISSIONS
    FILETYPE=$FILETYPE[1]
    if [[ $IS_DIRECTORY == true ]]
      then
      FILETYPE=${FILETYPE//d/"\033[1;36md\033[0m"};
    elif [[ $IS_SYMLINK == true ]];
      then
      FILETYPE=${FILETYPE//l/"\033[0;35ml\033[0m"};
    elif [[ $FILETYPE == "-" ]];
      then
      FILETYPE=${FILETYPE//-/"\033[0;37m-\033[0m"};
    fi

    # Permissions Owner
    PER1=$PERMISSIONS
    PER1=$PER1[2,4]

    # Permissions Group
    PER2=$PERMISSIONS
    PER2=$PER2[5,7]

    # Permissions User
    PER3=$PERMISSIONS
    PER3=$PER3[8,10]

    PERMISSIONS_OUTPUT=$FILETYPE$PER1$PER2$PER3

    # --x --x --x warning
    if [[ $PER1[3] == "x" || $PER1[3] == "x" || $PER3[3] == "x" ]]; then IS_EXECUTABLE=true; fi

    # --- --- rwx warning
    if [[ $PER3 == "rwx" ]]; then PERMISSIONS_OUTPUT="\033[30;41m$PERMISSIONS\033[0m"; fi

    # ------------------------------------------------------------------------------------------------------------------------
    # Colour the symlinks - TODO
    # ------------------------------------------------------------------------------------------------------------------------

    # ------------------------------------------------------------------------------------------------------------------------
    # Colour Owner and Group
    # ------------------------------------------------------------------------------------------------------------------------
    OWNER="\033[38;5;241m$OWNER\033[0m"
    GROUP="\033[38;5;241m$GROUP\033[0m"

    # ------------------------------------------------------------------------------------------------------------------------
    # Colour file weights
    # ------------------------------------------------------------------------------------------------------------------------
    # GREEN_TO_RED=(46 82 118 154 190 226 220 214 208 202 196)
    COLOR=(7) # cant get int to work somehow?
      if [[ $FILESIZE -le 1024 ]];    then COLOR[1]=46;    # <= 1kb
    elif [[ $FILESIZE -le 2048 ]];    then COLOR[1]=82;    # <= 2kb
    elif [[ $FILESIZE -le 3072 ]];    then COLOR[1]=118;   # <= 3kb
    elif [[ $FILESIZE -le 5120 ]];    then COLOR[1]=154;   # <= 5kb
    elif [[ $FILESIZE -le 10240 ]];   then COLOR[1]=190;   # <= 10kb
    elif [[ $FILESIZE -le 20480 ]];   then COLOR[1]=226;   # <= 20kb
    elif [[ $FILESIZE -le 40960 ]];   then COLOR[1]=220;   # <= 40kb
    elif [[ $FILESIZE -le 102400 ]];  then COLOR[1]=214;   # <= 100kb
    elif [[ $FILESIZE -le 262144 ]];  then COLOR[1]=208;   # <= 0.25mb ]] 256kb
    elif [[ $FILESIZE -le 524288 ]];  then COLOR[1]=202;   # <= 0.5mb || 512kb
    else                                   COLOR[1]=196;   # >= 0.5mb || 512kb
    fi;
    FILESIZE="\033[38;5;$COLOR[1]m$FILESIZE\033[0m"

    # ------------------------------------------------------------------------------------------------------------------------
    # Colour the date and time based on age, then format for output
    # ------------------------------------------------------------------------------------------------------------------------
    # Setup colours based on time difference
    TIME_DIFF=$(($EPOCH-$DATE[1]))
      if [[ $TIME_DIFF -lt 0 ]];        then TIME_COLOR=196m;   # < in the future, #spooky
    elif [[ $TIME_DIFF -lt 60 ]];       then TIME_COLOR=255m;   # < less than a min old
    elif [[ $TIME_DIFF -lt 3600 ]];     then TIME_COLOR=252m;   # < less than an hour old
    elif [[ $TIME_DIFF -lt 86400 ]];    then TIME_COLOR=250m;   # < less than 1 day old
    elif [[ $TIME_DIFF -lt 604800 ]];   then TIME_COLOR=244m;   # < less than 1 week old
    elif [[ $TIME_DIFF -lt 2419200 ]];  then TIME_COLOR=244m;   # < less than 28 days (4 weeks) old
    elif [[ $TIME_DIFF -lt 15724800 ]]; then TIME_COLOR=242m;   # < less than 26 weeks (6 months) old
    elif [[ $TIME_DIFF -lt 31449600 ]]; then TIME_COLOR=240m;   # < less than 1 year old
    elif [[ $TIME_DIFF -lt 62899200 ]]; then TIME_COLOR=238m;   # < less than 2 years old
    else                                     TIME_COLOR=236m;   # > more than 2 years old
    fi;

    # Format date to show year if more than 6 months since last modified
    if [[ $TIME_DIFF -lt 15724800 ]]; then
      DATE_OUTPUT=$DATE[2]" "$DATE[3]" "$DATE[4]
      else
      DATE_OUTPUT=$DATE[2]" "$DATE[3]"  "$DATE[5]
    fi;
    DATE_OUTPUT[1]=${DATE_OUTPUT[1]//0/" "} # If day of month begins with zero, replace zero with space

    # Apply colour to formated date
    DATE_OUTPUT="\033[38;5;$TIME_COLOR$DATE_OUTPUT\033[0m"

    # ------------------------------------------------------------------------------------------------------------------------
    # Colour the repomarker
    # ------------------------------------------------------------------------------------------------------------------------
     # Check for git repo, first checking if the result is a directory
    if [[ ($IS_GIT_REPO == false || $k == 1 || $k == 2) && ($IS_DIRECTORY == true || $IS_SYMLINK == true && $IS_DIRECTORY == true) ]] # if a directory
      then
      if [[ -d $NAME"/.git" ]] # if contains a git folder
        then
        if command git --git-dir=`pwd`/$NAME/.git --work-tree=`pwd`/$NAME diff --quiet --ignore-submodules HEAD &>/dev/null # if dirty
          then REPOMARKER="\033[0;32m|\033[0m" # Show a green vertical bar for dirty
          else REPOMARKER="\033[0;31m|\033[0m" # Show a red vertical bar if clean
        fi
      fi
    fi

    if [[ $IS_GIT_REPO == true && $k != 1 && $k != 2 && $NAME != '.git' ]]
      then
      STATUS=$(command git status --porcelain --ignored --untracked-files="normal" $NAME);
      STATUS=$STATUS[1,2]
        if [[ $STATUS == ' M' ]]; then REPOMARKER="\033[0;31m|\033[0m";     # Modified
      elif [[ $STATUS == '??' ]]; then REPOMARKER="\033[38;5;214m|\033[0m"; # Untracked
      elif [[ $STATUS == '!!' ]]; then REPOMARKER="\033[38;5;238m|\033[0m"; # Ignored
      elif [[ $STATUS == 'A ' ]]; then REPOMARKER="\033[38;5;093m|\033[0m"; # Added
      else                             REPOMARKER="\033[0;32m|\033[0m";     # Good
      fi
    fi

    # ------------------------------------------------------------------------------------------------------------------------
    # Colour the filename
    # ------------------------------------------------------------------------------------------------------------------------
    if [[ $IS_DIRECTORY == true ]]
      then
      NAME="\033[1;36m"$NAME"\033[0m"
    elif [[ $IS_SYMLINK == true ]];
      then
      NAME="\033[0;35m"$NAME"\033[0m"
    fi

    # ------------------------------------------------------------------------------------------------------------------------
    # Format symlink target
    # ------------------------------------------------------------------------------------------------------------------------
    if [[ $SYMLINK_TARGET != "" ]]; then SYMLINK_TARGET="-> "$SYMLINK_TARGET; fi

    # ------------------------------------------------------------------------------------------------------------------------
    # Display final result
    # ------------------------------------------------------------------------------------------------------------------------
    echo $PERMISSIONS_OUTPUT " "$SYMLINKS $OWNER " "$GROUP " "$FILESIZE $DATE_OUTPUT $REPOMARKER $NAME $SYMLINK_TARGET

    k=$((k+1)) # Bump loop index
  done
  TERM=$OLD_TERM
}

# http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
