"""
Sphinx extension: inject a "last edited by" badge on opt-in pages.

To enable on a page, add to the top of the RST file (before the title)::

    :show_git_badge: true

Or in MyST Markdown front matter::

    ---
    show_git_badge: true
    ---
"""
import subprocess
from pathlib import Path

from docutils import nodes
from sphinx.application import Sphinx


def _get_git_info(filepath: str, srcdir: str):
    result = subprocess.run(
        ["git", "log", "-1", "--pretty=format:%an|%cd", "--date=short", "--", filepath],
        capture_output=True,
        text=True,
        cwd=srcdir,
    )
    if result.returncode == 0 and "|" in result.stdout:
        author, date = result.stdout.split("|", 1)
        return author.strip(), date.strip()
    return None, None


def _inject_badge(app: Sphinx, doctree, docname: str):
    if not app.env.metadata.get(docname, {}).get("show_git_badge"):
        return

    srcdir = Path(app.srcdir)
    filepath = None
    for ext in (".rst", ".md"):
        candidate = srcdir / (docname + ext)
        if candidate.exists():
            filepath = str(candidate)
            break
    if filepath is None:
        return

    author, date = _get_git_info(filepath, str(srcdir))
    if not author:
        return

    html = (
        '<div class="git-last-modified">'
        '<span class="git-badge">'
        f'<i class="fa-solid fa-clock" aria-hidden="true"></i>'
        f" Last edited by <strong>{author}</strong> &middot; {date}"
        "</span>"
        "</div>"
    )
    raw_node = nodes.raw("", html, format="html")

    # Insert after the first section title so it appears below the page heading.
    for section in doctree.traverse(nodes.section):
        if section.children and isinstance(section.children[0], nodes.title):
            section.insert(1, raw_node)
        break


def setup(app: Sphinx):
    app.connect("doctree-resolved", _inject_badge)
    return {"version": "0.1", "parallel_read_safe": True}
