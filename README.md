# DHBW-VS academic text LaTeX template

This is a LaTeX template for academic text assignments at the [DBHW-VS](https://www.dhbw-vs.de/), especially for business computer science students created along [the specifications](template/dhbw-text-requirements.md) written by Mrs. Heinrich. Using this template **speeds up the writing process** as you only have to **focus on writing actual content**. All weird formatting requirements are met automatically! :beer::sunglasses::v:

>If you're looking for a [Citavi](https://www.citavi.com/) template checkout [stabiloBOSS96/ZitationsstilDHBW-VS-WI](https://github.com/stabiloBOSS96/ZitationsstilDHBW-VS-WI).

Example academic text assignment using this template: [skyfrk/dhbw-vs-smart-home-report](https://github.com/skyfrk/dhbw-vs-smart-home-report)

## :fire: Get started

1. Make sure your system meets all [prerequisites](./docs/prerequisites.md).
2. Download the [latest release](https://github.com/skyfrk/dhbw-vs-latex-template/releases) of the template.
3. Customize `content/misc/config.tex` to your needs.
4. Start writing your text in `content/text.tex` guided by the [documentation](./docs/writing.md) of this template!

### [:open_book: Documentation](./docs/writing.md)

### :file_folder: Important files and folders

```text
├── content                             | All content related to text assignment.
│   ├── assets                          | Folder for binary assets.
│   ├── misc                            | Folder for miscellaneous files.
│   │   ├── acronyms.tex                | List of acronyms.
│   │   ├── config.tex                  | Configuration of the template.
│   │   └── literature.bib              | Bibliography.
│   └── text.tex                        | Actual text.
├── root.tex                            | The root TeX file which glues all parts together.
└── template                            | Template related files. Normally not to be touched.
    ├── dhbw-bibstyle.tex               | Bibliography style definitions.
    ├── dhbw-citestyle.tex              | Citing command definitions.
    ├── header.tex                      | Preamble of the document.
    ├── independence-notice.tex         | Independence notice found at the end of the document.
    ├── non-disclosure-notice.tex       | Non-disclosure notice found after the title page.
    └── title.tex                       | The title page.
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

## :page_facing_up: License

Licensed under the [MIT](https://opensource.org/licenses/mit-license.php) license.
