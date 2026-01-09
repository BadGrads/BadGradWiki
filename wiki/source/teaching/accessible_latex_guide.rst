.. include:: ../_people.rst

.. _latex_accessibility:
===========================================
Writing Accessible LaTex Documents
===========================================
- |ElizaDiggins| `Eliza Diggins <github.com/eliza-diggins>`__, Written 01/08/26.


Effective as of April 2026, UC Berkeley now requires all instructors to meet certain accessibility
standards for course materials, including LaTeX documents. This guide provides an overview of best
practices and tools to help you create accessible LaTeX documents for your courses.

From the Vice Provost for Education (1/8/26):

    The updated requirements of the ADA require that digital course materials provided to students,
    even materials inside password-protected course sites like bCourses, will need to comply with
    accessibility standards (Web Content Accessibility Guidelines (WCAG) 2.1 Level AA).

As it turns out, LaTeX documents are not inherently accessible and require quite a bit of effort to be made
accessible natively. New work from the LaTeX community is making strides in this area, for example, this
post on `tagging documents <https://www.latex-project.org/news/2024/07/08/tagging/>`__, but AS OF JAN 2025,
there do not appear to be any mature solutions for creating fully accessible LaTeX documents.

.. hint::

    For anyone interested in a deep dive on why this is so hard, Overleaf appears to be sick of hearing about it
    and has a good post on the topic:
    `here <https://www.overleaf.com/learn/latex/An_introduction_to_tagged_PDF_files%3A_internals_and_the_challenges_of_accessibility>`__.

.. important::

    This appears likely to change. There are some bugs remaining in the bleeding-edge implementation of the
    tagging features in LaTeX, and the LaTeX community is actively working on improving accessibility
    support. Keep an eye on the LaTeX Project news page for updates.


Pandoc
------

The solution which seems to be easiest at the moment is to **retain your original LaTeX source files** and instead
convert them directly to PDF using `Pandoc <https://pandoc.org/>`__, which has built-in support for generating tagged,
accessible PDFs. You can then simply print to PDF from the Pandoc-generated PDF viewer to get a final PDF file.

To install Pandoc, follow the instructions on the `Pandoc installation page <https://pandoc.org/installing.html>`__.

For those on MacOS using Homebrew, you can install Pandoc with the following command:

.. code-block:: bash

    brew install pandoc

To convert a LaTeX document to an accessible PDF using Pandoc, use the following command in your terminal:

.. code-block:: bash

    pandoc homework.tex -s --mathjax -o homework.html

When uploaded to bCourses, this results in a 100% accessible document without any additional work. It is likely that
images in the document will need alt text added manually in bCourses, but the rest of the document should be
accessible. There are also native LaTeX packages for adding alt text to images.
