
# LaTeX Math Input

## Motivation

I often need to type LaTeX math in LaTeX or Markdown documents, interactive notebooks, presentation slides, diagrams, drawings, emails, discussion forums, on-line collaborative writing tools, etc. using different environments like a text editor, an email client, or a web browser. And while typing LaTeX is actually pretty easy, inputting a lot of LaTeX math on a regular basis can soon become a cumbersome and time-consuming task.

Admittedly, many dedicated LaTeX writing environments include graphical aids, which help you with entering math symbols and constructs by choosing them from math palettes. While this works well, it's very slow if you need to enter many mathematical expressions.

Inspired by this [blog post][castel-notes] I came up with the following set of abbreviations to speed up insertion of LaTeX math constructs. Typing a short abbreviation followed by pressing Tab give very rapid access to frequently used LaTeX commands and environment templates. For example, typing `/` followed by Tab will expand to `\frac{}{}` and position the cursor correctly inside the first pair of braces.

The main goal is to create an easy-to-learn, scalable, and essentially implementation-agnostic set of abbreviations, which can be implemented in a wide variety of text expansion utilities working either at the OS level or within an application.

## What Can I Do With It?

Just some typical use cases:

-   Taking notes in real-time during scientific or technical lectures and presentations

-   Authoring and publishing scientific or technical documents and books

-   Participating in discussions on STEM-related forums

-   Doing scientific or technical homework as fast as with pen and paper

The system is designed mainly to support composing of LaTeX documents, but can be useful for writing in any format accepting LaTeX math input, like most Markdown dialects, reStructuredText, AsciiDoc, Jupyther Notebooks, etc.

## General Principles

The following general rules hold in order to enter LaTeX math commands and environments:

-   Many mathematical symbols and operators are obtained by "natural" key combinations. For instance, `+-` yields `\pm`, `<<` yields `\ll`, `o+` yields `\oplus`, `""` yields `\text{}`, `/` yields `\frac{}{}`, etc.

-   Greek letters can be obtained as "variants" of Latin letters using the `.` prefix. For instance, `.p` yields `\pi`. Variants are obtained by doubling up appropriate Latin letters. For instance, `.e` yields `\epsilon`, while `.ee` yields `\varepsilon`.

-   Putting accents on mathematical characters uses key combinations with the quote character `'` as a prefix: For instance, `'~` yields `\tilde{}`.

-   The prefix `!` is used for negation: For instance, `!=` yields `\neq`.

-   Environment templates can be entered using the `:` prefix: For instance, `:eqn` expands to

    ```latex
    \begin{equation}
      |
    \end{equation}
    ```

-   Font and style commands can be entered using the `&` prefix: For instance, `&fr` expands to `\mathfrac{}`.

-   The `@` prefix is reserved for definition of complex building blocks and expressions: For example, `@enum` can be defined to yield the expression

    ```latex
    e = \lim_{n \to \infty} \left( 1 + \frac{1}{n} \right)^n
    ```

-   Some commands have aliases for semantic purposes or easy access on various country-specific keyboard layouts.

Note: This is still pretty much work-in-progress and I expect some abbreviations will change in the future.

## Implementation Using Emacs YASnippet Plugin

[YASnippet][yasnippet-github] is a template system for GNU Emacs. It allows you to type an abbreviation and automatically expand it into function templates. For information about installation of YASnippet and its snippets, i.e. templates, please consult corresponding [GiHub page][yasnippet-doc] and [repository][yasnippet-github]. Following are some notes on configuration and setup specific to snippets provided here.

Most snippets have the `condition` field set to `(yas-texmathp)`. The latter is defined as

```elisp
(defun yas-texmathp () (require 'texmathp) (texmathp))
```

and uses the function `texmathp` defined in AUCTeX (autoloaded from [texmathp.el][texmathp]), which evaluates to `t` if the cursor is in math and to `nil` otherwise. It is aware of all environments that AUCTeX knows of, and you can add more using the custom option `texmathp-tex-commands`.

## Implementation In Other Environments

Below are some tips for implementing the snippets in other text expansion utilities:

-   The abbreviations are expanded only when preceded by a space. This should be the default option.

-   Abbreviation expansion is triggered preferably with the Tab key. Again, the Tab key can be used to jump to the points in the template where additional text has to be inserted. For example, Tab will expand `/` to `\frac{}{}` and position the cursor correctly inside the first pair of braces. Another Tab will move you from the first argument to the second.

-   In text expansion applications you have to choose expanding at delimiter and select Tab as the only delimiter, which should be discarded after expansion. Some applications do not allow you to select a delimiter. The recommended workaround here would be to add _two_ spaces at the end of each abbreviation (or set it on a per-group basis), which will play the role of "expansion trigger".

-   To eliminate possible conflicts with other snippet abbreviations, it is recommended to use commas or semicolons as a prefix for other frequently used snippets like `,btw`. More complex snippets can be organized using logical groups separated by a dot like `me.email` and `me.phone`.

## List Of Abbreviations

The list of defined abbreviations can be downloaded in [Markdown][abbr-md] or [HTML][abbr-html] format.

[castel-notes]: https://castel.dev/post/lecture-notes-1/

[yasnippet-github]: https://github.com/joaotavora/yasnippet

[yasnippet-doc]: http://joaotavora.github.io/yasnippet/

[texmathp]: http://git.savannah.gnu.org/cgit/auctex.git/tree/texmathp.el

[abbr-md]: ./abbreviations.md

[abbr-html]: ./abbreviations.html

