pandoc -f markdown -t html | tidy -asxml --add-meta-charset yes --output-xml yes --numeric-entities yes | java -jar utilities/saxon9he/saxon9he.jar -xsl:build/md2xhtml.xsl -s:-
