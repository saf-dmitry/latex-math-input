
# LaTeX Math Input

## Motivation

I often need to type LaTeX math in LaTeX or Markdown documents. And while typing LaTeX is actually pretty easy, inputting a lot of LaTeX math on a regular basis can soon become a cumbersome and time-consuming task.

Inspired by this [blog post][castel-notes] I came up with the following set of abbreviations to speed up insertion of LaTeX math constructs. Typing a short abbreviation followed by pressing Tab give very rapid access to frequently used LaTeX commands and environment templates. For example, typing `/` followed by Tab will expand to `\frac{}{}` and position the cursor correctly inside the first pair of braces. Another Tab will move you from the first argument to the second.

The main goal is to create an easy-to-learn and scalable set of abbreviations. The system is designed mainly to support composing of LaTeX documents, but can be useful for writing in any format accepting LaTeX math input, like Markdown, reStructuredText, AsciiDoc, etc.

An [overview][abbr-md] of the defined abbreviations is available in Markdown format for reference.

**Note:** This is still pretty much work-in-progress and I expect some abbreviations will change in the future.

## General Principles

The following general rules hold in order to enter LaTeX math commands and environments:

- Many mathematical symbols and operators are obtained by "natural" key combinations. For instance, `+-` yields `\pm`, `<<` yields `\ll`, `o+` yields `\oplus`, `xx` yields `\times`, `/` yields `\frac{}{}`, etc.

- Greek letters can be obtained as "variants" of Latin letters using the `.` prefix. For instance, `.p` yields `\pi`. Variants are obtained by doubling up appropriate Latin letters. For instance, `.e` yields `\epsilon`, while `.ee` yields `\varepsilon`.

- Putting accents on mathematical characters uses key combinations with the quote character `'` as a prefix: For instance, `'~` yields `\tilde{}`.

- The prefix `!` is used for negation: For instance, `!=` yields `\neq`.

- Environment templates can be entered using the `:` prefix: For instance, `:eqn` expands to

    ```latex
    \begin{equation}
      |
    \end{equation}
    ```

- Font and style commands can be entered using the `&` prefix: For instance, `&fr` expands to `\mathfrac{}`.

- The `@` prefix is reserved for user-defined building blocks and expressions: For example, `@ddt` can be defined to yield the expression

    ```latex
    \frac{\partial}{\partial t}
    ```

- Some commands have aliases for semantic purposes or easy access on various country-specific keyboard layouts.

## Implementation

The set of abbreviations is implemented using [YASnippet][yasnippet-github] template system for GNU Emacs. YASnippet allows you to type an abbreviation and automatically expand it into function templates. For information about installation of YASnippet and its snippets, i.e. templates, please consult corresponding [GitHub page][yasnippet-doc] and [repository][yasnippet-github]. Following are some notes on installation and setup specific to snippets provided here.

## Installation

1. If not already done, load the YASnippet package and set the `yas-snippet-dirs` variable in your Emacs config file:

    ```elisp
    (require 'yasnippet)
    (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
    (yas-global-mode 1)
    ```

2. Copy the content of the `yasnippets` folder to one of the directories specified in the `yas-snippet-dirs` variable (in this case `~/.emacs.d/snippets`).

## Configuration

The snippets provided here are defined for the LaTeX major mode. If you want to use them in other modes, like Markdown mode or Org mode, you need to add `latex-mode` to the mode list of the corresponding `.yas-parents` file as described in the [YASnippets documentation][yasnippet-doc-org].

Most snippets, except for math environment delimiters like the `equation` environment, have the `condition` field set to `(yas-texmathp)`. The latter is intended to control expansion depending on the local context and can be defined as

```elisp
(defun yas-texmathp () (require 'texmathp) (texmathp))
```

This example uses the function `texmathp` defined in AUCTeX (autoloaded from [texmathp.el][texmathp]), which evaluates to `t` if the cursor is in math expression and to `nil` otherwise. The function is aware of all environments that AUCTeX knows of, and you can add more using the custom option `texmathp-tex-commands`.

[castel-notes]: https://castel.dev/post/lecture-notes-1/

[abbr-md]: ./abbreviations.md

[yasnippet-github]: https://github.com/joaotavora/yasnippet

[yasnippet-doc]: http://joaotavora.github.io/yasnippet/

[yasnippet-doc-org]: http://joaotavora.github.io/yasnippet/snippet-organization.html

[texmathp]: http://git.savannah.gnu.org/cgit/auctex.git/tree/texmathp.el

