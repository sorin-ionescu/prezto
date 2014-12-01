# Please
This adds utilities for runnning the previous command with super powers.

## Usage

### Please command
The `please` command simply repeats the previous command preceded by sudo.

Warning: You should be aware of the fact that this is also done in a shell that you just opened and you don't see what you execute with root privileges.
```shell
 ❯ id
uid=501(eugenk) gid=20(staff)

 ❯ please
uid=0(root) gid=0(wheel)
```

### Key binding
There is also a keybinding (`Ctrl+Shift+S`) that puts your previous command to the commandline and prepends `sudo ` to it.
This is useful when you want so see or edit your previous command before executing it.
```shell
 ❯ id
uid=501(eugenk) gid=20(staff)

[Ctrl+Shift+S yields:]
 ❯ sudo id
```
