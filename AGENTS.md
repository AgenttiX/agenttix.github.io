# AGENTS.md

## Project description
This is the personal website of Mika "AgenttiX" Mäki.
The website is built with Jekyll using the "Deploy from a branch" feature of GitHub Pages
and hosted on GitHub Pages at https://agx.fi.
The GitHub Actions workflow at `./.github/workflows/jekyll.yml` is therefore disabled.

The validity of the external links is checked with [lychee](https://github.com/lycheeverse/lychee)
by the workflow `./.github/workflows/linkcheck.yml` (weekly and on changes to the pages),
and locally with `./linkcheck.sh`. Both use the settings in `./lychee.toml`,
and URL patterns to skip are listed in `./.lycheeignore`.

## Project structure
- `./.github` contains GitHub Actions workflows.
- `./_includes` contains `.html` files that are included on each page.
- `./it` contains pages on information technology.
- `./js` contains JavaScript snippets.
- `./media` contains pages on books, movies, games and other media.
- `./misc` contains miscellaneous pages.
- `./physics` contains pages on physics.
- `./travel` contains pages on traveling.
- `./linkcheck.sh` checks the external links, see above.
