<div align="center">

<h1>NVIM Config</h1>

![docker build](https://img.shields.io/github/workflow/status/danielnehrig/nvim/ci?label=build&logo=docker&style=for-the-badge)
[![Lua](https://img.shields.io/badge/Lua-blue.svg?style=for-the-badge&logo=lua)](http://www.lua.org)
[![Neovim Stable](https://img.shields.io/badge/Neovim%20Stable-green.svg?style=for-the-badge&logo=neovim)](https://neovim.io)
[![Neovim Nightly](https://img.shields.io/badge/Neovim%20Nightly-red.svg?style=for-the-badge&logo=neovim)](https://neovim.io)
![Work In Progress](https://img.shields.io/badge/Work%20In%20Progress-orange?style=for-the-badge)

</div>

## Preview

https://user-images.githubusercontent.com/4050749/136713743-4117a967-c5f5-4735-ad1c-9a6743fb743c.mp4

Try it out yourself!\
(stable version)

```bash
docker run -it \
  --entrypoint /bin/bash \
  -v $(pwd):/mnt/workspace \
  danielnehrig/nvim:latest \
  -c "source /root/.bashrc && nvim"
```

(nightly version)

```bash
docker run -it \
  --entrypoint /bin/bash \
  -v $(pwd):/mnt/workspace \
  danielnehrig/nvim:nightly \
  -c "source /root/.bashrc && nvim"
```

## Synposis

I've been using vim for about 7-8 years now  
while i was aware that neovim was a thing\
i didn't really understand or tried to understand\
which problems it tries to solve which vim has\
one day I jumped about features for the 0.5.0 upcoming release\
which was about the native LSP in neovim\
while i was using YCM at that time for VIM\
(which i was pretty happy with)\
i thought lets give it a shot how it works for neovim\
this is when i realized that neovim had a LUA JIT\
implemented at that moment i was sold to it due to prior lua experience\
i investigated the lua plugin ecosystem while fairly small at that time\
it grew and grew and grew... It looked promising\
now we are here back at it again configuring the same editor\
with better features\
this time getting a IDE like experience\
getting rid of prior pain points with vim\
and getting rid of bad habits.\
the journey begins

Started 09.04.21

## The Main Goals

The Config should fully support:

- Typescript / Javascript
- Rust
- Java
- Go
- Python

CONFIG SETUP:

- IDE capabilities (lsp,debug,project management,build,lint,test) ✅
- Debloating the Config (staying under 100ms boot up time) ✅
- remove unused plugins ✅
- move to the build in LSP ✅
- add formatting and linting ✅
- Debug ✅
- intuitive mappings ✅
- fast tab/buffer navigation ✅
- project management ✅
- session management ✅
- file management ✅
- lazy load plugins ✅
- Treesitter Setup ✅
- Refactoring ✅

## Philosophy and side infos

Vim is a modal text editing solution so is neovim\
it does not strive to be a IDE but it offers IDE like capabilities\
with it's exposed lua API and the Community revolving around it\
creating a big up and coming plugin ecosystem\
since vim/neovim are writtin in c it's a blazing fast editor\
vs its competitors
while it has it's plugin ecosystem and IDE like capabilities\
it does not offer a out of the box solution like VSCode\
for that case boilerplate configurations like Lunarvim or Lvim are out there\
even this config would be a great place to start to have IDE like capabilities\
it's inspired by Lvim though not cloned

### Nvim Log

_[Logs](./nvim.log) created on_

- i9 9900k 5Ghz
- 32GB Ram
- Arch Linux

### Requirements

_Font:_

- Nerd Font any Monospaced One (if not monospaced the dashboard logo will not work)

_Package managers:_

- _python3.9_
- _node_
- _go_
- _rust/cargo_
- _luarocks_
- _brew_ (mac support)
- _yay_ (archlinux support)

_NVIM V ^0.7.\*_

_LSPs in path:_

- pyright
- efm (for lint and formatting mainly lua and js,ts)
- typescript-language-server
- rust-analyzer
- gopls
- sumneko-lua
- jdtls
- etc... check lsp config for more info

_DAP:_

- Some Adapters can be installed with Dap install
- Java Adapter has to be installed manually

### Setup

0. `git clone https://github.com/danielnehrig/nvim ~/.config/nvim && cd ~/.config/nvim`
1. `./package.py`
2. `nvim +'autocmd User PackerComplete sleep 100ms | qa'`
3. `nvim +'autocmd User PackerComplete TSInstall all' +'PackerSync'`
4. _optional:_ `DIInstall python` `DIInstall chrome` `DIInstall jsnode`
