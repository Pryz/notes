**Build the man.**

    a2x -v --doctype manpage --format manpage manpage.txt

**Read the man.**

    man -l applicationname.1

**Man example.**

raskiidoc(1) ============ :doctype: manpage NAME \\---- raskiidoc - rakefile for asciidoc SYNOPSIS \\-------- \*raskiidoc\* ['-hdo'] ['-f filename'] ['-t type'] DESCRIPTION \\----------- \*raskiidoc\* Rakefile to simplify generation of asciidoc documents. Asciidoc generation can use complex arguments hard to remember, and could be document specific. This rakefile (and parameters files) is an attempt to identify options to use during generation. OPTIONS \\------- Options must come before the other command line arguments. \*-h\*:: Show some help. \*-f filename\*:: Build only the specified file. \*-o\*:: Force rebuild. \*-d\*:: Debug mode. \*-t\*:: Type to build. One of [pdf|html|slidy|slidy2|deckjs]. SEE ALSO \\-------- https://github.com/llicour/raskiidoc AUTHOR \\------ Laurent Licour (https://github.com/llicour) DATE \\---- 2013-09-30

