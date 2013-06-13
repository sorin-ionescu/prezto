Last Command
============

Notifies if the command completes and terminal isn't the foreground window.

Settings
--------

### Growl

By default, `notify` will use the Notification Center on Mac OSX via
`terminal-notifier` and will fall back to Growl if this is not available. To
force the use of growl, add the following to *zpreztorc*.

    zstyle ':prezto:module:notify' force-growl 'yes'

### Auto-notify if window not focused

This module can automatically notify if a (long running) command completes
while the terminal window does not have focus. This will pop up a notification
with information about the last command like this:

![Last command notification](http://codearcana.com/images/zsh_theme_popup.png)

To enable this feature, add the following to *zpreztorc*:

    zstyle ':prezto:module:notify' auto-notify 'yes'

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Alex Reece](https://github.com/awreece)

[1]: https://github.com/awreece/prezto/issues

