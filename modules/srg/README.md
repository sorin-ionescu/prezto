srg
======

A personalized fork of [sack](https://github.com/sampson-chen/sack) with no options and support for rg and freebsd

Creates srg and F to invoke rg (or ag, or ack, or grep) and open results directly in $EDITOR

Usage
-----

```shell
$ srg "pattern"

relative/path/to/file
[1] 123: matching text

relative/path/to/alt
[2] 456: more matching text

$ F 2 # opens relative/path/to/alt at line 456 in $EDITOR
```
