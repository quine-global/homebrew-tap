# homebrew-tap

Homebrew tap for Quine apps. Canonical repo:
[forge.quinefoundation.com/quine-global/homebrew-tap](https://forge.quinefoundation.com/quine-global/homebrew-tap),
mirrored to [github.com/quine-global/homebrew-tap](https://github.com/quine-global/homebrew-tap).

```sh
brew tap quine/tap https://forge.quinefoundation.com/quine-global/homebrew-tap.git
brew trust quine/tap
brew install --cask quintodrome
brew install --cask quine-hyper
```

| Cask | App | Source |
|------|-----|--------|
| `quintodrome` | Quintodrome (Navidrome desktop app) | [Forgejo](https://forge.quinefoundation.com/quine-global/quintodrome) |
| `quine-hyper` | Hyper terminal, Quine fork | [GitHub](https://github.com/quine-global/hyper) |

`quine-hyper` installs `Hyper.app` and the `hyper` command, like the official
`hyper` cask, so only one of the two can be installed.

The URL is required: without one, `brew tap` assumes a GitHub repo. Homebrew
refuses to load casks from a tap you haven't trusted, hence `brew trust`.

If you tapped it under an older name, switch over:

```sh
brew untap quine/quintodrome   # or quine-global/tap
brew tap quine/tap https://forge.quinefoundation.com/quine-global/homebrew-tap.git
```

Both casks are updated automatically by their app's release workflow:
[Quintodrome](https://forge.quinefoundation.com/quine-global/quintodrome) on
Forgejo, [Hyper](https://github.com/quine-global/hyper) on GitHub.
