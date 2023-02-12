# setups up srg, prefers rg but falls back to ag, ack, or grep

# Prefixes a shortcut tag to relevant output lines.
display_shortcuts() {
    # Note that by default ack uses the --nogroup -H option by default when
    # output is piped or redirected, so we do get a file name on each line as $1
    # We could have restored the default look for ack with the --group option, but
    # it turns out that this is actually simpler to parse with --nogroup and then
    # reformat the output to match the --group formats.
    awk -v f_name="" -F':' '
    BEGIN {x=1};
    {
        if ($1 != f_name) {
            f_name=$1;
            sub(/\[[0-9]{1,2}(;[0-9]{0,2}){0,2}m\[K$/, "[0m[K", $1);
            printf("\n%s\n", $1);
        };
        printf("[%s] ", x);
        printf("%s", $2);
        for (i=3; i<=NF; i++) {
            printf(":%s", $i);
        }
        printf("\n");
        x++;
    };'
}

# Processes the output that goes into the shortcut file:
# Format: line_number:full_file_path
process_shorcut_paths() {
    # Using : as the delimiter here should be fine, because : is not used in file names
    awk -F':' '
    {
        gsub(/\[([0-9]{0,2}(;[0-9]{0,2}){0,2})?[m|K]/, "", $0);
        print $2 " " $1;
    };'
}

# From upstream
remove_escaped_chars() {
    # Need to use the right option for sed/gsed

    # Linux/Cygwin
    if is-linux || is-cygwin; then
        sed -r "s/\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
    # macOS/BSD
    elif is-darwin || is-bsd; then
        sed -E "s/\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
    fi
}

srg() {
    # Variable(s) to remove magic values from the code
    srg_dev_null=/dev/null

    # srg shortcut file. '.~/.srg_shortcurt' if the variable SRG_SHORTCUT is not
    # defined.
    if [ ! -z ${SRG_SHORTCUT+x} ]; then
        srg_shortcut_file=${SRG_SHORTCUT}
    else
        srg_shortcut_file=~/.srg_shortcuts
    fi

    # Determine which search tool to use
    if [[ $(whence rg) ]]; then
        srg_tool="rg --color always --with-filename --line-number"
    # Fall back to ag
    elif [[ $(whence ag) ]]; then
        srg_tool='ag --color'
    # Fall back to ack
    elif [[ $(whence ack) ]]; then
        srg_tool='ack --color'
    # Oh geez, fall back to grep
    elif [[ $(whence grep) ]]; then
        srg_tool='grep -r -I -n --color=always'
    # Show not so helpful printout
    else
        echo "Can't help you, sorry!"
        return
    fi

    # The actual wrapper around ack, ag, grep or ripgrep
    eval ${srg_tool} "$@" | tee >${srg_dev_null} >(display_shortcuts) >(remove_escaped_chars | process_shorcut_paths >! ${srg_shortcut_file})
}

F(){
    # srg shortcut file. '.~/.srg_shortcurt' if the variable SRG_SHORTCUT is not defined.
    if [ ! -z ${SRG_SHORTCUT+x} ]; then
        srg_shortcutfile=${SRG_SHORTCUT}
    else
        srg_shortcutfile=~/.srg_shortcuts
    fi

    # Get the line number and the file name

    _srg_line=`sed -n "$1p" < ${srg_shortcutfile}`
    _lineno=`echo $_srg_line | awk '{ print $1 }'`
    _fname=`echo $_srg_line | awk '{ print $2 }'`

    if [ -f ${srg_shortcut} ]; then
        # VS Code
        if [[ "$EDITOR" == 'code' ]]; then
            code -g ${_fname}:${_lineno}
        # SublimeText
        elif [[ "$EDITOR" =~ 'subl' ]]; then
            subl ${_fname}:${_lineno}
        # Emacs & Vim
        else
            ${EDITOR} +${_lineno} ${_fname}
        fi
    else
        echo "srg shortcuts file '~/.srg_shortcuts' not found."
        echo "Please define the env. variable SRG_SHORTCUT or check if the file exist."
        exit 0
    fi
}
