CMake
=====

Initializes build directories for [CMake][1].

### Usage

```sh
# In the root directory of a CMake project:
$ mb
# Or with additional flags:
$ mb -DSOME_EXTRA_FLAGS="foo"
```

### Options

```sh
# Set the install prefix.
zstyle ':prezto:module:cmake' install-prefix '/usr'

# Set the build prefix.
zstyle ':prezto:module:cmake' build-prefix '_build'

# Set the build profiles.
zstyle ':prezto:module:cmake' profiles 'Debug' 'Release'

# Whether to support clang as well.
zstyle ':prezto:module:cmake' support-clang 'yes'
```

### Aliases

* `mb` initialize build directories.


Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Benjamin Chrétien](https://github.com/bchretien)

[1]: https://cmake.org
[2]: https://github.com/sorin-ionescu/prezto/issues
