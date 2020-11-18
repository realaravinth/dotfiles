# Java Helper Scripts
..to ease CSE 2001 pain

The following scripts are supposed to be ran from package root.

## [init.sh](./init.sh):

Generates boilerplate code for .java files"

#### Configuration:

Please set `COPYRIGHT` within source file. Default value:

```
COPYRIGHT="// (c) Aravinth T.M <aravinth.19bce7415@vitap.ac.in>"
```

#### Usage: "

```
init.sh <filename> <package-name(optional)>
```

when package name is not specified, current directory name is assumed to be the package name

## [gen_markdown.sh](./gen_markdown.sh):

Generates Markdown file with the contents of all Java source files

#### Configuration:

Please set the `AUTHOR` and `REG_NO`. Default values:

```
AUTHOR="Aravinth T M"
REG_NO="19BCE7415"
```

#### Usage:

```
gen_marksown.sh
gen_marksown.sh -h to display help
```

This generates a markdown file in the package root. Near the end of the
file, you'll find:
```
### Output
```bash
```

Please compile and run your program and paste the output into the
markdown file before running [gen_pdf](./gen_pdf.sh).

## [gen_pdf](./gen_pdf.sh):

Generates PDF files from all markdown files in current directory

#### Dependencies:

- [pandoc](pandoc.org)

##### Usage:

```
gen_pdf.sh
gen_pdf.sh -h to display this help
```
