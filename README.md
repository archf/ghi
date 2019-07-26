
##

## Usage

### Search for release

```
> git pkg search sharkdp/hyperfine
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

### Searching for specific archives

```
> git pkg search --pattern "hyperfine_1.*_amd64.deb" sharkdp/hyperfine
https://github.com/sharkdp/hyperfine/releases/download/v1.6.0/hyperfine_1.6.0_amd64.deb
```

### installing a specific archive

> git pkg install -p "hyperfine_1.*_amd64.deb"  sharkdp/hyperfine
Option'__asset_tmp_dir' undefined, using directory /home/archf/Downloads
[sudo] password for archf:
```

It makes no assumption the archive you want to install. Thus if your pattern is
used yields too many results, nothing will happen

Get the tag of the latest release

```
> git pkg search --tag  sharkdp/hyperfine
v1.6.0
```

## TODO

- choosing a release other than latest
- choosing a git server other than github
