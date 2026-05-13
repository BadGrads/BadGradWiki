# BadGradWiki

> **The community knowledge base for UC Berkeley Astronomy graduate students.**

[![Build Status](https://github.com/BadGrads/BadGradWiki/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/BadGrads/BadGradWiki/actions)

**Live site:** [badgrads.github.io/BadGradWiki](https://badgrads.github.io/BadGradWiki/)

BadGradWiki is a [Sphinx](https://www.sphinx-doc.org/)-based documentation site maintained by
graduate students in the UC Berkeley Astronomy Department. It collects practical knowledge,
shared experience, and institutional memory to help grads navigate the department, the PhD
program, and life in Berkeley.

> [!NOTE]
> This wiki is maintained by graduate students, for graduate students. It does **not** represent
> official department or university policy.

---

## What's Inside

| Section | Description | Link |
|---|---|---|
| **Department Roles** | Grad-run service jobs — who does what, expectations, and advice from past holders | [Explore Roles →](https://badgrads.github.io/BadGradWiki/grad_jobs/index.html) |
| **Teaching & GSI Resources** | Resources for GSIs: course logistics, pedagogy advice, and shared materials | [Teaching Resources →](https://badgrads.github.io/BadGradWiki/teaching/index.html) |
| **Life in Berkeley** | Housing, healthcare, transportation, finances, and daily life as a Berkeley grad | [Grad Life →](https://badgrads.github.io/BadGradWiki/grad_life/index.html) |
| **The PhD Program** | Prelims, quals, milestones, advising, pay, and navigating the program | [Program Resources →](https://badgrads.github.io/BadGradWiki/program/index.html) |
| **Science & Computing** | Computing resources, remote observing, and technical guides | [Science & Computing →](https://badgrads.github.io/BadGradWiki/science/index.html) |

---

## Local Development

### Prerequisites

- Python 3.8+
- Git

### Setup

Clone the repository and run the setup script from the repo root:

```bash
git clone git@github.com:BadGrads/BadGradWiki.git
cd BadGradWiki
./source_env.sh
```

This creates (or updates) a `.venv` virtual environment and installs all dependencies from
`requirements.txt`. If `python3` is not the right executable on your system:

```bash
./source_env.sh --python /path/to/python
```

### Building the Docs

All build commands run from the `wiki/` directory:

```bash
cd wiki
make html          # build → wiki/build/html/index.html
make clean         # remove build artifacts
make help          # list all available builders
```

Open `wiki/build/html/index.html` in a browser to preview. The build must complete with
**no errors or warnings** before a PR is submitted.

---

## Contributing

BadGradWiki is a community effort — its usefulness depends entirely on contributions from
current and former graduate students. Contributions of any size are welcome, from fixing a
typo to adding a whole new section.

The short version:

1. Fork the repo (or clone directly and create a branch)
2. Run `./source_env.sh` to set up your environment
3. Make your changes in `wiki/source/`
4. Build locally with `make html` and verify there are no warnings
5. Commit using [Conventional Commits](https://www.conventionalcommits.org/) — this is enforced by a pre-commit hook
6. Open a pull request against `main`

For the full workflow, see the **[Contributing Guide](https://badgrads.github.io/BadGradWiki/contributing.html)**
on the live site.

### Commit Message Format

Commits are enforced by [Commitizen](https://commitizen-tools.github.io/commitizen/) via a
pre-commit hook. Messages must follow Conventional Commits:

```
docs: add new section on grad life housing
fix: correct broken link in teaching index
chore: update sphinx dependency version
```

### Pre-commit Hooks

The repo uses [pre-commit](https://pre-commit.com/) for automated checks on every commit:

| Hook | Purpose |
|---|---|
| `check-merge-conflict` | Catches unresolved merge conflicts |
| `check-yaml` / `check-toml` | Validates config file syntax |
| `end-of-file-fixer` | Ensures files end with a newline |
| `trailing-whitespace` | Strips trailing whitespace |
| `typos` | Spell-checks source files |
| `commitizen` | Enforces Conventional Commits format |

Most hooks auto-fix issues — if a commit is rejected, re-stage the modified files and try again.

---

## Tech Stack

| Tool | Role |
|---|---|
| [Sphinx](https://www.sphinx-doc.org/) | Documentation engine |
| [pydata-sphinx-theme](https://pydata-sphinx-theme.readthedocs.io/) | Site theme |
| [sphinx-design](https://sphinx-design.readthedocs.io/) | Cards, grids, and UI components |
| [MyST Parser](https://myst-parser.readthedocs.io/) | Markdown support alongside RST |
| [sphinxcontrib-bibtex](https://sphinxcontrib-bibtex.readthedocs.io/) | BibTeX references |
| [sphinx-last-updated-by-git](https://github.com/mgeier/sphinx-last-updated-by-git) | Auto git-commit timestamps on pages |
| [pre-commit](https://pre-commit.com/) + [Commitizen](https://commitizen-tools.github.io/commitizen/) | Commit quality hooks |

---

## Questions?

Reach out to the current **BadGradWiki administrators** (listed on the
[Department Roles](https://badgrads.github.io/BadGradWiki/grad_jobs/index.html) page), or
open an [issue](https://github.com/BadGrads/BadGradWiki/issues) on GitHub.
