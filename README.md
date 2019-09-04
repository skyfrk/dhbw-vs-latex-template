<div align=center>
<h1>DHBW-VS academic text LaTeX template</h1>

[![Travis (.org)](https://img.shields.io/travis/skyfrk/dhbw-vs-latex-template?style=flat&color=brightgreen)](https://travis-ci.org/skyfrk/dhbw-vs-latex-template) [![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/skyfrk/dhbw-vs-latex-template?color=brightgreen&label=version)](https://github.com/skyfrk/dhbw-vs-latex-template/releases) [![GitHub commits since latest release](https://img.shields.io/github/commits-since/skyfrk/dhbw-vs-latex-template/latest/develop?color=brightgreen)](https://github.com/skyfrk/dhbw-vs-latex-template/commits/master) [![GitHub All Releases](https://img.shields.io/github/downloads/skyfrk/dhbw-vs-latex-template/total?style=flat&color=brightgreen)](https://github.com/skyfrk/dhbw-vs-latex-template/releases) [![Docker Pulls](https://img.shields.io/docker/pulls/skyfrk/udhbwvst?color=brightgreen)](https://hub.docker.com/r/skyfrk/udhbwvst) [![GitHub](https://img.shields.io/github/license/skyfrk/dhbw-vs-latex-template?color=brightgreen)](https://github.com/skyfrk/dhbw-vs-latex-template/blob/master/LICENSE)
</div>

---

This is a unofficial LaTeX template for academic text assignments at the [DBHW-VS](https://www.dhbw-vs.de/), especially for business computer science students created along [the specifications](docs/dhbw-text-requirements-2017.md) by Mrs. Heinrich. Using this template **speeds up the writing process** as you only have to **focus on writing actual content**. All weird formatting requirements are met automatically! :beer::sunglasses::v:

Checkout [this example](./examples/full/full.pdf) featuring all the magic of this template!

>If you're looking for a [Citavi](https://www.citavi.com/) template checkout [stabiloBOSS96/ZitationsstilDHBW-VS-WI](https://github.com/stabiloBOSS96/ZitationsstilDHBW-VS-WI).

## :fire: Get started

1. Download the [latest release](https://github.com/skyfrk/dhbw-vs-latex-template/releases/latest).
2. Run through the [setup instructions](./docs/setup.md).
3. Get the [recommended starter template](./examples/starter-recommended), apply [necessary patches](./docs/patches.md), start writing your text and read the [docs](./docs/writing.md)!

### [:open_book: Documentation](./docs/writing.md)

### :file_folder: Minimal working example

The code below is enough to generate a title page, a non-disclosure notice, a table of contents, a list of acronyms, a list of figures, a list of tables, a list of code listings, a bibliography and an independence notice. :smile:

```tex
\documentclass{udhbwvst}

\dhbwSetup{%
    author          = Max Mustermann,
    faculty         = Wirtschaft,
    field of study  = Wirtschaftsinformatik,
    academic year   = 1990,
    course          = B,
    title           = Eine Arbeit,
    text type       = Projektarbeit 2,
    company name    = SpaceX,
    lecturer        = Prof. Dr. Frank Staab
}

\begin{document}

% your text could be here!

\end{document}
```

## :blush: Contribute

Feel free to open an [issue](https://github.com/skyfrk/dhbw-vs-latex-template/issues) or submit a pull request if you discovered a bug or if there are new specifications! :books:

> Everything except the output of this template should be written in english for better accessibility!

### :mag: Resources

* General documentation: [CTAN (The Comprehensive TeX Archive Network)](https://www.ctan.org/)
* BibLaTeX documentation: [BibLaTeX manual](https://www.ctan.org/pkg/biblatex)
* Q&A community: [tex.stackexchange.com](https://tex.stackexchange.com/)

### :heart: Contributors

* [moewe](https://tex.stackexchange.com/users/35864/moewe) for the bibliography style.
* [Audrey](https://tex.stackexchange.com/users/4483/audrey) for the custom nymdt sorting style.
* [robingenz](https://github.com/robingenz) for general improvements.
* [MrcoSchrnr](https://github.com/MrcoSchrnr) for useful hints.
* [bluecoder24](https://github.com/bluecoder24) for updating the page margins.
* [faltfe](https://github.com/faltfe) for [inspiration](https://github.com/faltfe/iodhbwm) for version 3.

## :page_facing_up: License

Licensed under the [MIT](https://opensource.org/licenses/mit-license.php) license.
