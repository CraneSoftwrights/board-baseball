<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="../xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:c="urn:X-Crane"
                exclude-result-prefixes="xs xsd c"
                xpath-default-namespace="svg"
                version="2.0">

<xs:doc info="$Id$"
        filename="design2review.xsl" vocabulary="DocBook">
  <xs:title>Convert a Crane SVG design file into a review file</xs:title>
  <para>
    This stylesheet is looking for cues that assemble Inkscape layers
    for review and modification for bursting into burn files.
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file has layers with layer titles that include layer tags
    of the form {name}:{distinction} that are combined into layers with titles
    that include the name of the output burst file, an equal sign, and tags of
    the form {name}:* that are combined into the output.    
  </para>
  <para>
    The output file has only the combination layers with the identified layers
    combined. This is suitable for review, for modification of objects to
    paths, then bursting into burn files.
  </para>
  <para>
    There are no invocation parameters.
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Convert all identified layers</xs:title>
</xs:doc>

<xs:key>
  <para>Find all layers that are building blocks</para>
</xs:key>
<xsl:key name="c:build" match="g[matches(@inkscape:label,':[^\*]')]"
         use="'all',
              for $each in tokenize(@inkscape:label,'\s+')[matches(.,':[^\*]')]
              return substring-before($each,':')"/>

<xs:key>
  <para>Find all layers that are assembled building blocks</para>
</xs:key>
<xsl:key name="c:assemble" match="g[tokenize(@inkscape:label,'\s+')='=']"
         use="'all',tokenize(@inkscape:label,'\s+')[1]"/>

<xs:template>
  <para>
    Can't get started
  </para>
</xs:template>
<xsl:template match="/*">
  <xsl:message terminate="yes"
               select="'Unexpected input document element:',name(.)"/>
</xsl:template>

<xs:template>
  <para>Get started</para>
</xs:template>
<xsl:template match="/svg:svg">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
  </xsl:copy>
</xsl:template>

<xs:template>
  <para>
    The identity template is used to copy all nodes not already being handled
    by other template rules.
  </para>
</xs:template>
<xsl:template match="@*|node()" mode="#all">
  <xsl:copy>
    <xsl:apply-templates mode="#current" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
