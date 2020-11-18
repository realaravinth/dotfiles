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

## [gen_payload.sh](./gen_payload.sh):

Generates Markdown and PDF file with the contents of all Java source files.

The script compiles all source files and runs the program that contains
the main function to generate output.

**NOTE: Please verify the contents of the PDF file before submitting.**

#### Dependencies:

- [pandoc](pandoc.org)



#### Configuration:

Please set the `AUTHOR` and `REG_NO`. Default values:

```
AUTHOR="Aravinth T M"
REG_NO="19BCE7415"
```

#### Usage:

```
gen_payload.sh
gen_payload.sh -h to display help
```
