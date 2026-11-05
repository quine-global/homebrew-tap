# homebrew-tap

Homebrew tap for Quine apps. Public, read-only at
[git.quineglobal.com/quine-global/homebrew-tap](https://git.quineglobal.com/quine-global/homebrew-tap)
(the canonical repo is on the forge, which is tailnet-only), mirrored to [github.com/quine-global/homebrew-tap](https://github.com/quine-global/homebrew-tap).

```sh
brew tap quine/tap https://git.quineglobal.com/quine-global/homebrew-tap.git
brew trust quine/tap
brew install --cask quintodrome
brew install --cask quine-hyper
```

| Cask | App | Source |
|------|-----|--------|
| `quintodrome` | Quintodrome (Navidrome desktop app) | [git.quineglobal.com](https://git.quineglobal.com/quine-global/quintodrome) |
| `quine-hyper` | Hyper terminal, Quine fork | [GitHub](https://github.com/quine-global/hyper) |

`quine-hyper` works on macOS and on Homebrew on Linux (x86_64 and arm64, as an
AppImage). On macOS it installs `Hyper.app` and the `hyper` command, like the
official `hyper` cask, so only one of the two can be installed there.
`quintodrome` is macOS only.

The URL is required: without one, `brew tap` assumes a GitHub repo. Homebrew
refuses to load casks from a tap you haven't trusted, hence `brew trust`.

If you tapped it from the old address (`forge.quinefoundation.com`), point it
at the new one:

```sh
brew tap --custom-remote quine/tap https://git.quineglobal.com/quine-global/homebrew-tap.git
```

If you tapped it under an older name, switch over:

```sh
brew untap quine/quintodrome   # or quine-global/tap
brew tap quine/tap https://git.quineglobal.com/quine-global/homebrew-tap.git
```

Both casks are updated automatically by their app's release workflow:
[Quintodrome](https://git.quineglobal.com/quine-global/quintodrome) on
Forgejo, [Hyper](https://github.com/quine-global/hyper) on GitHub.
