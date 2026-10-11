# homebrew-tap

Homebrew tap for Quine apps. Canonical repo:
[forge.quinefoundation.com/quine-global/homebrew-tap](https://forge.quinefoundation.com/quine-global/homebrew-tap),
mirrored to [github.com/quine-global/homebrew-tap](https://github.com/quine-global/homebrew-tap).

```sh
brew tap quine/tap https://forge.quinefoundation.com/quine-global/homebrew-tap.git
brew install --cask quintodrome
```

The URL is required: without one, `brew tap` assumes a GitHub repo.

If you tapped it under an older name, switch over:

```sh
brew untap quine/quintodrome   # or quine-global/tap
brew tap quine/tap https://forge.quinefoundation.com/quine-global/homebrew-tap.git
```

The Quintodrome cask is updated automatically by the
[Quintodrome](https://forge.quinefoundation.com/quine-global/quintodrome)
release workflow.
