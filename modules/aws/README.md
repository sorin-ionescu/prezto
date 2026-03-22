# AWS

Integrates the [AWS CLI][1] into the shell environment.

## Completions

AWS CLI v2 ships with `aws_completer`. This module enables it automatically when
present.

## Functions

- `aws-info` exposes information about the AWS environment via the `$aws_info`
  associative array.

## Theming

To display the active AWS profile and region in a prompt, define the following
styles in the `prompt_name_setup` function.

```sh
# %p - profile name.
zstyle ':prezto:module:aws:info:profile' format 'profile:%p '

# %r - region name.
zstyle ':prezto:module:aws:info:region' format 'region:%r '
```

Then add `$aws_info[profile]` and `$aws_info[region]` to `$PROMPT` or `$RPROMPT`
and call `aws-info` in the `prompt_name_precmd` hook function.

The region is read from `$AWS_REGION` or `$AWS_DEFAULT_REGION`; if neither is set,
it falls back to the value in `~/.aws/config` for the active profile.

## Authors

_The authors of this module should be contacted via the [issue tracker][2]._

- [David Tagatac](https://github.com/tagatac)

[1]: https://aws.amazon.com/cli/
[2]: https://github.com/sorin-ionescu/prezto/issues
