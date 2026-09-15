# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Project Is

BadGradWiki is a [Sphinx](https://www.sphinx-doc.org/)-based documentation site — the community knowledge base for UC Berkeley Astronomy graduate students. There is no application code; all content is reStructuredText (`.rst`) or Markdown (`.md`) files processed by Sphinx into HTML. The live site is published at [badgrads.github.io/BadGradWiki](https://badgrads.github.io/BadGradWiki/).

## Environment Setup

```bash
# First-time or refreshing dependencies
./source_env.sh              # creates/updates .venv and installs requirements.txt

# Activate the virtual environment manually if needed
source .venv/bin/activate
```

`source_env.sh` accepts `--python /path/to/python` if `python3` is not the right executable.

## Building the Docs

All build commands run from the `wiki/` directory:

```bash
cd wiki
make html        # build HTML output → wiki/build/html/index.html
make clean       # remove build artifacts
make help        # list all available Sphinx builders
```

Open `wiki/build/html/index.html` in a browser to preview. Builds must complete with **no errors or warnings** before a PR is submitted.

Pushes to `main` trigger `.github/workflows/build_documentation.yml`, which builds with `sphinx-build -b html wiki/source wiki/_build/html` and deploys the result to the `gh-pages` branch. This is the same content as `make html`, just a different build directory — deployment is automatic and never needs to be triggered by hand.

## Commit Messages

Messages should follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/):

```
docs: add new section on grad life housing
fix: correct broken link in teaching index
chore: update sphinx dependency version
```

Pre-commit hooks also run `typos` (spell checker) and standard file hygiene checks (`check-merge-conflict`, `check-yaml`, `check-toml`, `end-of-file-fixer`, `trailing-whitespace`). If a hook auto-fixes files, re-stage and commit again.

## Content Structure

Source files live under `wiki/source/`. The top-level content sections each have their own subdirectory:

| Directory | Content |
|---|---|
| `grad_jobs/` | Grad-run departmental roles and responsibilities |
| `teaching/` | GSI/teaching resources |
| `grad_life/` | Housing, healthcare, daily life in Berkeley |
| `program/` | PhD program navigation (prelims, quals, milestones) |
| `science/` | Computing resources, remote observing, and other technical guides |

New pages should live in the appropriate subdirectory (not the root). Sub-sections get their own nested subdirectory (e.g., `grad_jobs/outreach/`, `grad_jobs/previous_years/`). Each section has an `index.rst` that controls its toctree, typically built with `sphinx-design` grid/card directives.

`_people.rst` is a shared partial (pulled in via `.. include::`) for listing people with photo/name/link markup; it is prefixed with `_` and not linked directly from public pages.

## File Format

Pages are primarily `.rst` (reStructuredText). The `myst_parser` extension also supports `.md` files — either format works. Sphinx extensions in use worth knowing:

- **sphinx-design** — cards, grids, buttons (used heavily on the home page and section indexes)
- **myst_parser** — enables Markdown alongside RST
- **sphinxcontrib.bibtex** — BibTeX references via `docs_bib.bib` in `wiki/source/`
- **sphinx.ext.mathjax** — LaTeX math with `:math:` role and `.. math::` directive
- **sphinx.ext.intersphinx** — cross-links to Python, NumPy, Matplotlib, Astropy, and other external Sphinx docs
- **sphinx-last-updated-by-git** — auto-stamps pages with their last git commit date
- **`_ext/git_last_modified`** — a local extension (`wiki/source/_ext/git_last_modified.py`) that renders a "Last edited by \<author\> · \<date\>" badge below the page title. Opt in per-page by adding `:show_git_badge: true` near the top of an `.rst` file (or `show_git_badge: true` in MyST front matter of a `.md` file).
