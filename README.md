# ghi

`ghi` retrieve and install software from a GitHub release downloadable assets.

## Installation

Clone this repository somewhere and put this script in your PATH.

```bash
git clone git@github.com:archf/ghi.git
```

This script needs to be placed in the sudoers 'secure_path'. Quickly create
that symlink in `/usr/local/bin`:

```bash
sudo make install
```

## Usage

```
GHI
  A custom git command to install software from a github release.
  See https://github.com/archf/git-pkg.

Limitations
Using the 'latest' release will only work if the release is not tagged as a
'draft' or 'prerelease'.

if [ -n "$ZSH_VERSION" ]; then
USAGE
  ghi [OPTIONS] CMD [PATTERN]

OPTIONS
  -h|--help       Show this help menu.
  -t|--tag        Output latest release 'tag_name' and exit.
  -r|--repository Set Github repository in the '<user|org>/<repository_name>'
                  Defaults to use .git/config file.
                  setting in your project directory.
  --assets-dir    Directory where to download archives. Defaults to '~/.ghi'.
                  This allows for easy removal of installed software.
  -p|--prefix     Directory where to unpack a tar archive typically containing
                  a binary executable. Defaults to '/usr/local/bin' when this
                  script is ran in priviledged mode, '~/bin' otherwise.
  -v|--verbose

CMD
  install     Install/unpack software from downloadable assets.
  search      Search for assets
  help        Show this help menu.
```

### Search all assets of latest release

```
> ghi search --repository sharkdp/hyperfine
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine-musl_1.6.0_amd64.deb
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine-musl_1.6.0_i386.deb
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine-v1.6.0-i686-unknown-linux-gnu.tar.gz
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine-v1.6.0-i686-unknown-linux-musl.tar.gz
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine-v1.6.0-x86_64-apple-darwin.tar.gz
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine-v1.6.0-x86_64-pc-windows-msvc.zip
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine-v1.6.0-x86_64-unknown-linux-gnu.tar.gz
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine-v1.6.0-x86_64-unknown-linux-musl.tar.gz
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine_1.6.0_amd64.deb
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine_1.6.0_i386.deb
```

### Search for assets matching specific PATTERN

```
> ghi search --repository sharkdp/hyperfine deb

https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine-musl_1.6.0_amd64.deb
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine-musl_1.6.0_i386.deb
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine_1.6.0_amd64.deb
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine_1.6.0_i386.deb
```

### Installing a specific archive

```
> ./ghi install -r fgeller/kt
Error: too many possible asset to download. Current matches are:

https://github.com/fgeller/kt/releases/download/v12.1.0/kt-v12.1.0-darwin-amd64.txz
https://github.com/fgeller/kt/releases/download/v12.1.0/kt-v12.1.0-linux-amd64.txz

Consider using a more specific asset filtering PATTERN than '.*'.
```

Now if we input a filtering PATTERN

```
> ghi install -r fgeller/kt 'linux-amd64.txz'
Installing
https://github.com/fgeller/kt/releases/download/v12.1.0/kt-v12.1.0-linux-amd64.txz
from repository 'fgeller/kt'
```

### Get latest release's tag

```
> ghi search --tag --repository sharkdp/hyperfine
v1.6.0
```

## TODO

- choosing a release other than latest
- handle tarbals containing a directory and/or multiple files
- handle rpms
- fix help menu

## Other tools worth mentioning

This is inpired heavily from [ghr](https://github.com/tcnksm/ghr), a tool doing
the reverse operation, i.e: create a GitHub Release and upload artifacts in
parallel.

Other notable tools:
- [hub](https://github.com/github/hub) - a git wrapper that makes git easier to use with GitHub
- [github-release](https://github.com/aktau/github-release)
- [gothub](https://github.com/itchio/gothub) (a fork of aktau/gitub-release)
