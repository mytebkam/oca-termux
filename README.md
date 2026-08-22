```
   ____   ____  _
  / __ \ / ___|/ \
 | |  | | |   / _ \
 | |__| | |__/ ___ \
  \____/ \____/_/  \_\
      A G E N T · termux
```

# oca — OpenCode Agent, Termux edition

A tiny wrapper around [OpenCode](https://opencode.ai) for **Termux**.
`cd` into a project, run `oca`, say what you need — it does the rest.

## Install

```bash
git clone https://github.com/YOURUSER/oca-termux.git
cd oca-termux
./install.sh
oca setup      # installs opencode (via proot-distro Ubuntu if on Termux/Android)
oca auth       # add your model provider key (OpenAI/Anthropic/OpenRouter/etc.)
```

## Use

```bash
cd ~/projects/my-app
oca                              # opens the interactive agent (TUI) here
oca "add a dark mode toggle"     # one-shot: fire a task and let it run
oca ~/projects/other-app         # jump into another project's TUI
oca ~/projects/other-app "fix the failing test"
```

## Android/Termux note

Termux runs on Android (bionic libc), and OpenCode's npm package only ships
prebuilt binaries for `darwin/linux/win32`. A plain `npm i -g opencode-ai`
fails on Termux with `EBADPLATFORM`. `oca setup` detects this and instead
installs a real Ubuntu userland via [proot-distro](https://github.com/termux/proot-distro)
and puts opencode there. `oca` and `oca auth` transparently run through it
(binding your current directory in), so day-to-day usage looks identical —
you never have to `proot-distro login` by hand.

## Utility commands

```bash
oca doctor    # shows PATH tools, installed pkg packages, opencode/node/git status
oca setup     # (re)installs opencode + base deps
oca auth      # opencode auth, native or through proot-distro
oca --help
```

`oca doctor` is handy before asking the agent to do something that needs a
specific tool — it tells you at a glance what's already available in `$PATH`
and via `pkg`, so you know whether to `pkg install` something first.

## Why

OpenCode's TUI/CLI already does the heavy lifting; `oca` just removes the
Termux-specific friction — checking dependencies, installing opencode itself,
and giving you a couple of memorable one-liners for the common flow:
**cd → ask → ship.**

## Requirements

- Termux (or any Linux shell with `bash`, `curl`, `git`)
- Node.js (installed automatically by `oca setup`)

## License

MIT
