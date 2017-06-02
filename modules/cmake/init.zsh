#
# Initialize build directories for CMake.
#
# Authors:
#   Benjamin Chrétien <chretien dot b at gmail dot com>
#   Thomas Moulard <thomas dot moulard at gmail dot com>
#

# Get the install prefix.
zstyle -s ':prezto:module:cmake' install-prefix '_cmake_install_prefix' \
  || _cmake_install_prefix=

# Get the build prefix.
zstyle -s ':prezto:module:cmake' build-prefix '_cmake_build_prefix' \
  || _cmake_build_prefix='_build'

# Get the profiles to consider or use the default.
zstyle -a ':prezto:module:cmake' profiles '_cmake_profiles' \
  || _cmake_profiles=(Debug Release)

# Get the generator to use.
zstyle -s ':prezto:module:cmake' generator '_cmake_generator' \
  || _cmake_generator=

# Whether to look for clang as well.
zstyle -b ':prezto:module:cmake' support-clang '_cmake_support_clang' \
  || _cmake_support_clang=true

# Check for clang.
_cmake_has_clang=false
if (( ${_cmake_support_clang} && $+commands[clang] )); then
  _cmake_has_clang=true
fi

function makeBuildDirectory
{
  local extra_flags="$@"

  local d=`pwd`
  if `test x$(find . -maxdepth 1 -name CMakeLists.txt) = x`; then
    echo "Run this in your project's root directory"
    return 1
  fi

  local common_flags=""

  # If an install prefix was provided.
  if [[ ! -z "${_cmake_install_prefix}" ]]; then
    common_flags+=" -DCMAKE_INSTALL_PREFIX=\"${_cmake_install_prefix}\""
  fi

  # If a generator was provided.
  if [[ ! -z "${_cmake_generator}" ]]; then
    common_flags+=" -G\"${_cmake_generator}\""
  fi

  # Create default GCC profiles.
  for p in "${_cmake_profiles[@]}"; do
    echo "*** Creating ${p:l} profile..."
    local build_dir="${d}/${_cmake_build_prefix}/${p:l}"
    local cmake_cmd="cmake ${common_flags} ${extra_flags} -DCMAKE_BUILD_TYPE=${p} \"${d}\""
    mkdir -p "${build_dir}"
    (cd "${build_dir}" && eval ${cmake_cmd})
    echo "*** ...done!"
  done

  # If clang is available, create clang profiles.
  if ${_cmake_has_clang}; then
    for p in "${_cmake_profiles[@]}"; do
      echo "*** Creating ${p:l} profile (clang)..."
      local build_dir="${d}/${_cmake_build_prefix}/clang+${p:l}"
      local cmake_cmd="cmake ${common_flags} ${extra_flags} -DCMAKE_BUILD_TYPE=${p} \"${d}\""
      mkdir -p "${build_dir}"
      (cd "${build_dir}" && CC=clang CXX=clang++ eval ${cmake_cmd})
      echo "*** ...done!"
    done
  fi
}

alias mb=makeBuildDirectory

# Enable CMake completion
(( $+functions[compdef] )) && {
  compdef _cmake makeBuildDirectory
}
