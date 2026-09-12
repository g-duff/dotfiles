# mise TODO / possibilities

Running log of mise features we've looked at for this repo — what's
adopted, what's being considered, and what we've decided against (with
reasons, so we don't re-litigate later).

## Adopted

- [x] `[tools]` in `mise/config.toml` replaces the old Homebrew `Brewfile`
      for CLI tools/runtimes/LSPs — cross-platform, no Mason needed.
- [x] `[dotfiles]` with `mode = "template"` for Ghostty's config — one
      source file, `os()` picks `font-size` (10 Linux / 20 macOS) instead
      of maintaining separate files per OS.
- [x] Location-agnostic bootstrap for the mise config itself — a small
      script run from inside the cloned repo, not a hardcoded path in
      version control:
      ```sh
      #!/bin/sh
      set -eu
      ln -sfn "$(pwd)" ~/.dotfiles
      mkdir -p ~/.config/mise
      ln -sf ~/.dotfiles/mise/config.toml ~/.config/mise/config.toml
      ```
      Keeps the "clone anywhere, it just works" property Stow has, while
      still letting mise manage everything downstream of `~/.dotfiles`.

## Under consideration (not yet adopted)

- [ ] **Migrate remaining Stow-managed dotfiles to `[dotfiles]`**
      (`.zshrc`, `.tmux.conf`, `starship.toml`, nvim config) using
      `symlink` / `symlink-each` mode. Would let one tool own both tool
      installs and file placement. Not urgent — Stow works fine for
      static files; only worth it if we want templating on more of them.
- [ ] **`mise bootstrap` as the single entry point** — chains
      `bootstrap packages install` → `dotfiles apply` →
      `bootstrap macos-defaults apply` → `bootstrap user apply` →
      `mise install` → a `bootstrap` task, in one command. Could
      eventually replace `setup.sh` entirely, including the apt/brew
      Layer 0 step (`[bootstrap.packages]` supports both `apt:` and
      `brew:` prefixes). Bigger migration — worth revisiting once we've
      lived with plain `[dotfiles]` for a while.
- [ ] **`[bootstrap.user].login_shell`** — declaratively set/converge the
      login shell (`chsh` equivalent) instead of a manual step.
- [ ] **`[bootstrap.macos.defaults]`** — declarative macOS `defaults
      write` settings (Dock, Finder, etc.), if we ever want that level of
      machine config in the repo.
- [ ] **Dotfiles history/tracking** (`mise bootstrap dotfiles track`,
      checkpoints, cross-machine sync via a git origin) — lets mise save
      a rollback-able history of files we edit in place (e.g. `.zshrc`)
      rather than only managing static copies/templates/symlinks. Neat,
      but adds a sync/encryption setup step we haven't needed yet.
- [ ] **`git-tracked directory` manifest mode** (`manifest = "git"`) —
      could let us point one `[dotfiles]` entry at most of the repo root
      instead of listing every file individually. Worth it only if the
      file list grows enough to be annoying to maintain by hand.

## Decided against / not planned

- Making `dotfiles.root` itself dynamic/templated — no evidence this is
  supported, and not needed: the repo clone path is meant to be
  constant across machines (`~/src/dotfiles` or similar), with `os()`
  and `variants` handling per-machine differences *inside* that fixed
  root.
- Using `variants` for Ghostty's config target path — unnecessary once
  we noticed both OSes read the same XDG path
  (`~/.config/ghostty/config`); `os()` inside the template is enough on
  its own.
- Fonts via mise — `fonts.sh` stays a standalone script. Fonts aren't
  versioned CLI tools or simple config files; mise's tool/dotfiles model
  doesn't fit them well.

## Open questions to verify before adopting anything above

- [ ] Does `[settings]` in general support Tera templating, or only
      `[tools]`/`[tasks]`/`[dotfiles]` entries? Affects whether more
      dynamic config (beyond `dotfiles.root`, which we've ruled out) is
      viable elsewhere.
- [ ] Re-check `mise bootstrap`'s experimental/stability status before
      relying on it as the single entry point — confirm on
      `mise.jdx.dev/bootstrap.html` and the CLI reference for the
      installed version.
- [ ] If we adopt dotfiles history/sync: decide on encryption
      (`[history.encryption].recipients`) before tracking anything
      remotely sensitive (SSH config, etc.).
