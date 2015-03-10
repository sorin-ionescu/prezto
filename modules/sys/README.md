Sys
===

Expose operating system informations (LSB, uname, chroot, etc.) to prompts.

Theming
-------

To display information about the operating system in a prompt, define the
following styles in the `prompt_name_setup` function, where the syntax for
setting a style is as follows:

    zstyle ':prezto:module:sys:info:${id}' format 'string'

### Linux Standard Base (LSB)

| Id               | Format Code | Description
| ---------------- | :---------: | ---------------------------------------------------
| lsb\_id          |     %i      | Distributor's ID
| lsb\_description |     %d      | Description of the currently installed distribution
| lsb\_release     |     %r      | Release number of the currently installed distribution
| lsb\_codename    |     %c      | Code name of the currently installed distribution.

### System information (uname)

| Id                     | Format Code | Description
| ---------------------- | :---------: | ---------------------------------------------------
| uname\_all             |     %A      | All informations
| uname\_hw              |     %H      | The hardware-platform
| uname\_kernel\_name    |     %K      | The kernel name
| uname\_kernel\_release |     %R      | The kernel release
| uname\_kernel\_version |     %V      | The kernel version
| uname\_machine         |     %M      | The Machine hardware name
| uname\_nodename        |     %N      | The network node hostname
| uname\_processor       |     %P      | The processor type
| uname\_os              |     %O      | The operating system

### Chroot

| Id        | Format Code | Description
| --------- | :---------: | ---------------------------------------------------
| chroot    |     %C      | The chroot name

### SSH

| Id                   | Format Code | Description
| -------------------- | :---------: | -----------------------------------------
| ssh\_tty             |      %T     | The tty name (path to the device)
| ssh\_server\_address |      %X     | The server IP address
| ssh\_server\_port    |      %Y     | The server port number
| ssh\_client\_address |      %x     | The client IP address
| ssh\_client\_port    |      %y     | The client port address

Usage Example
-------------

First, format the system informations attributes:

    zstyle ':prezto:module:sys:info:lsb_id' format '%i'
    zstyle ':prezto:module:sys:info:lsb_codename' format '%c'
    zstyle ':prezto:module:sys:info:chroot' format 'chroot:'
    zstyle ':prezto:module:sys:info:ssh_tty' format ' via ssh'
    zstyle ':prezto:module:sys:info:ssh_client_address' format 'Connected from %x'
    zstyle ':prezto:module:sys:info:ssh_client_port' format ':%y'

Second, format how the above attributes are displayed in prompts.

    zstyle ':prezto:module:sys:info:keys' format 'prompt' '%T using %C%i/%c' 'rprompt' '%x%y'

Last, add `$sys_info[prompt]` to `$PROMPT` and `$sys_info[rprompt]` to
`$RPROMPT` respectively and call `sys-info` in the `prompt_name_setup`
function.

Author
------

  - [Emmanuel Bouthenot](https://github.com/k0lter)
