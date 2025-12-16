.. _contributing:

==============================
Contributing to BadGradWiki
==============================

So, you’re a ✨ **BADDIE** ✨ and you’ve decided to contribute to **BadGradWiki** — awesome!
We welcome contributions from **all current and former UC Berkeley Astronomy graduate students**.

Before getting started, please read through this page to familiarize yourself with the various aspects of
contributing to the wiki. This page is meant to make contributing feel **approachable, not intimidating**.

.. contents:: Table of Contents
    :depth: 3

.. important::

   Not all shared information belongs in the wiki.
   If you have **software**, **code-heavy tools**, or a **large standalone project**, it may be better
   suited to its own repository within the BadGrads GitHub organization.
   The wiki administrators can help you decide what belongs where.

----

What is BadGradWiki
---------------------------

BadGradWiki exists to preserve **institutional knowledge** that is often passed down informally
(or not at all).

Its goals are to:

- Help new and continuing grads navigate the department and the PhD program
- Share practical advice from lived experience
- Reduce repeated confusion, stress, and guesswork
- Make the grad experience a little more humane... But not too humane!

.. note::

   This wiki is maintained by graduate students, for graduate students. It does **not**
   represent official department or university policy. For authoritative guidance,
   please consult departmental or UC Berkeley resources.

Administration of the Wiki & Organization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each year, a small number of graduate students serve as **BadGradWiki administrators** as part of
their graduate student service roles.

Administrators are responsible for:

- Maintaining the wiki infrastructure
- Reviewing and merging contributions
- Helping contributors decide whether content belongs in the wiki or a separate repository
- Ensuring content remains reasonably up to date

They are also the primary point of contact for questions or issues related to the wiki.

.. hint::

   If she’s still a BADDIE, you can also reach out to **Eliza Diggins**
   (eliza.diggins@berkeley.edu), who originally built the wiki, for technical questions.

Content Structure
^^^^^^^^^^^^^^^^^

Most content in BadGradWiki lives under a small number of core areas:

- **Department Roles** — grad-run jobs, responsibilities, and tips
- **Teaching & GSI Resources** — teaching-related guidance and materials
- **Life in Berkeley** — healthcare, housing, transportation, and daily life
- **The PhD Program** — prelims, quals, milestones, and program navigation

Pages should generally live under one of these sections. Each section has its own directory
in the source code repository. For example, teaching-related content lives in ``wiki/source/teaching/``.

If your content doesn’t fit cleanly into an existing category, that’s okay:

- You may create a standalone page, or
- Reach out to the wiki administrators to discuss creating a new category!

.. important::

    When creating new content on the wiki, its important that things are organized logically. Keep
    sub-pages in subdirectories, and avoid creating a flat structure with many pages in the root
    directory, etc.

----

Guidelines for Contributions
----------------------------

Like most community-maintained projects, BadGradWiki follows a small set of guidelines to help
keep content useful, consistent, and easy to maintain over time.

These aren’t meant to be restrictive — just a shared baseline that makes contributing smoother
for everyone.

General Guidelines
^^^^^^^^^^^^^^^^^^

- Be thoughtful about what you contribute. Ask yourself:

  - Is this information useful to other graduate students?
  - Does this content belong in the wiki, or would it be better suited elsewhere?

- Write with **future students** in mind.
- Aim for **clarity over completeness**.
- It’s okay if something isn’t perfect — documentation improves iteratively.
- Group related changes into a single pull request rather than submitting one per small commit.
- Ensure that the documentation **builds cleanly** before submitting a pull request.

Small contributions; such as fixing typos, clarifying language, or adding brief notes; are just
as valuable as larger additions.

Public vs. Private Materials
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Please remember that the **compiled BadGradWiki is publicly accessible** on the internet.

Do **not** include content in wiki pages that:

- Contains private or sensitive personal information
- Is intended only for internal departmental use
- Includes confidential discussions, evaluations, or complaints
- You would not be comfortable sharing with future students or the public

Sensitive materials may be stored in the repository **without being linked from public pages**,
but should only be added after consulting with the wiki administrators.

When in doubt, assume content is public and ask an administrator before contributing.

----

Contribution Process
--------------------

So you’d like to contribute to the wiki — excellent!
This section walks you through the steps needed to get set up and submit changes.

Obtaining the Source Code
^^^^^^^^^^^^^^^^^^^^^^^^^

The first step is to **obtain the source code** for BadGradWiki from GitHub.

Because the repository is private to the **BadGrads** organization, you must be a member of that
organization to access it. GitHub authentication is required for all git operations. Because GitHub requires secure
authentication for git access. If you haven’t already, you should set up an **SSH key** for your GitHub account.
Instructions are available on GitHub’s official documentation page:

`Generating a new SSH key and adding it to the ssh-agent <https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>`_

Using an SSH key allows you to interact with GitHub securely without repeatedly entering credentials.

Once you have the SSH key set up and have access to the BadGrads organization, follow these steps:

1. Fork the **BadGradWiki** repository to your own GitHub account
   (You must be a member of the BadGrads GitHub organization.) This is done by going to the wiki's repository
   page (`here <https://github.com/BadGrads/BadGradWiki>`_) and clicking the "Fork" button in the upper right corner.

2. Clone your fork locally:

   .. code-block:: bash

      git clone https://github.com/<your-username>/BadGradWiki.git
      cd BadGradWiki

   This creates a local copy of the repository on your machine that you can manipulate as you see fit.

3. Create a new branch for your changes:

   .. code-block:: bash

      git checkout -b docs/my-awesome-contribution

   .. important::

       The branch name should specify what you're working on. This makes it easier to manage multiple contributions.

Congrats! You've got the source code set up locally. Now you can start setting up the local environement and
get editing!

Setting Up the Environment
^^^^^^^^^^^^^^^^^^^^^^^^^^

The wiki is built using **Sphinx**, a popular documentation generator which converts documents into HTML automatically.
Sphinx is based on python, so you'll need Python 3.7+ installed on your machine. In addition, there are a couple of
extensions and tools that we use when working on the wiki that you'll need.

Fortunately, we've written scripts to take care of setting up the environment for you!

To set up the documentation environment, run the setup script from the repository root:

.. code-block:: bash

   ./setup_env.sh

Sometimes, you may not automatically have execution permissions for the script. If you get a "Permission denied" error,
you can add execution permissions with:

.. code-block:: bash

   chmod +x setup_env.sh
   ./setup_env.sh

If your Python executable is not ``python3``, you can specify it explicitly:

.. code-block:: bash

   ./setup_env.sh --python /path/to/python

This will:

- Create (or reuse) a virtual environment
- Install all required dependencies
- Prepare your system to build the docs

.. note::

    If you run into any issues during setup, please reach out to the wiki administrators for help.

Activate the virtual environment if needed:

.. code-block:: bash

   source .venv/bin/activate

You can verify everything is working by building the docs:

.. code-block:: bash

    cd wiki
    make html


Making Changes
^^^^^^^^^^^^^^

This is where the fun begins! You can now start making changes to the documentation. At this stage,
it's up to you what you want to contribute; however, this section does contain some information about how to
actually write the material and format things.

At its base, BadGradWiki is just a collection of text files written in **reStructuredText (reST)** format.
These files are then processed by Sphinx to generate the final HTML documentation. To get familiar with restructured
text, you can check out the `reStructuredText Primer <https://docutils.sourceforge.io/docs/user/rst/quickstart.html>`_.

Additionally, Sphinx has its own set of directives and roles that extend reST, which you can find in the
`Sphinx documentation <https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html>`_.

.. hint::

    A note from Eliza: ReST is basically markdown but a bit more powerful. If you're used to markdown,
    you'll pick it up quickly. If you're new to both, don't worry, the learning curve is pretty gentle.

    I've found over the years that its often easier to look at existing pages in the wiki / elsewhere
    and mimic their structure rather than trying to learn everything from scratch. Basically every major
    documentation project uses Sphinx, so there's lots of examples out there! I.e. the Python docs, NumPy docs,
    etc.

    Anything you see there can be done in Sphinx.

In addition to the "vanilla" Sphinx implementation, we've included a number of extensions that help with
various other tasks and allow even more functionality. You can find a list of the extensions we use
in the ``conf.py`` file located in the ``wiki/source/`` directory. A few that are worth mentioning:

- ``sphinx.ext.intersphinx``: Allows linking to other Sphinx-based documentation projects. You can link to
  external docs like NumPy, SciPy, or Matplotlib easily.
- ``myst_parser``: Enables support for Markdown files in addition to reStructuredText. To do this instead of
  writing a ``.rst`` file, you can write a ``.md`` file and it will be processed correctly.
- ``sphinx.ext.mathjax``: Renders mathematical equations using MathJax. This is useful for displaying
  LaTeX-style math in your documentation.

  To include math in your docs, you can use the following syntax:

  .. code-block::rst

     Inline math: :math:`E = mc^2`

     Block math:

     .. math::

        \int_a^b f(x) \,dx = F(b) - F(a)

- ``sphinx_design``: This is the most important extension! It provides a set of design components
  (like cards, grids, buttons, etc.) that help make the documentation look nice and modern. You can read the
  `sphinx-design documentation <https://sphinx-design.readthedocs.io/en/latest/>`_ for more info on how to use
- ``sphinxcontrib.bibtex``: Supports bibliographic references using BibTeX.

Generating the Docs Locally
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As you make changes, you can build the documentation locally to see how your changes look. This is easy to
do using Sphinx's build system. From the ``wiki/`` directory, run:

.. code-block:: bash

   make html

This will generate the HTML files in the ``wiki/build/html/`` directory. You can open the ``index.html`` file
in your web browser to view the documentation.

.. important::

    Please ensure that anything you add builds cleanly without errors or warnings. If there are issues,
    they will be displayed in the terminal when you run the build command.

Committing Changes
^^^^^^^^^^^^^^^^^^

Once you’re happy with your changes, it’s time to commit them to your local git repository. To do so, you need to
first select which files you want to include in the commit (using ``git add``), and then create the commit itself
(using ``git commit``).

1. Stage your changes: To stage changes, you can use the ``git add`` command. For example, to stage all changes, you can run:

   .. code-block:: bash

      git add .

   Alternatively, you can stage individual files by specifying their paths:

   .. code-block:: bash

      git add wiki/source/teaching/new_page.rst

2. Commit your changes: After staging, you can create a commit with a descriptive message.

   .. code-block:: bash

      git commit -m "docs: add new teaching resource on grading policies"

This will commit your changes to the local repository.

.. important::

    In general, whenever using git, commits should be atomic and focused on a single change or related set of changes. It's
    okay to commit many times while working on a feature, but each commit should represent a logical unit of work. This makes
    it easier to identify specific changes later on.

Pre-Commit Checks & Commitizen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

In order to maintain high-quality documentation, we have a few automated checks that run
whenever you make a commit. These checks help ensure that the documentation is well-formatted,
free of typos, and builds correctly. These are handled using the ``pre-commit`` framework, which you can
read about `here <https://pre-commit.com/>`_.

When you commit using ``git commit -m 'my message'``, these checks will automatically run before the commit is finalized.
If any issues are found, the commit will be aborted, and you'll need to fix the issues before trying again. For example,








This repository uses **Commitizen** to enforce clear, consistent commit messages.

Commit messages should follow the Conventional Commits format, for example:

.. code-block:: text

   docs: add notes on prelim exam structure
   fix: correct broken teaching resource links

Pre-commit hooks are enabled to:
- Check formatting
- Catch typos
- Ensure the docs build cleanly

To commit your changes:

.. code-block:: bash

   git add .
   git commit

Follow the prompts if Commitizen asks for clarification.

----

Submitting a Pull Request
^^^^^^^^^^^^^^^^^^^^^^^^^

Once your changes are committed:

1. Push your branch to your fork:

   .. code-block:: bash

      git push origin docs/my-awesome-contribution

2. Open a pull request (PR) against the main BadGradWiki repository
3. Include a clear description of what you changed and why

Wiki administrators will review your PR and may:
- Ask clarifying questions
- Suggest edits
- Request small changes

Once approved, your contribution will be merged and go live 🎉

----

Thank you for contributing to BadGradWiki ❤️
This resource only works because grads like you take the time to improve it.
