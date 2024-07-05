<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="../utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:c="urn:X-Crane"
                exclude-result-prefixes="xs xsd c"
                xpath-default-namespace="http://www.w3.org/2000/svg"
                version="2.0">

<xs:doc info="$Id$"
        filename="review2burn.xsl" vocabulary="DocBook">
  <xs:title>Burst a Crane SVG design file into individual SVG burn files</xs:title>
  <para>
    This stylesheet is taking a collection of sets of layers and creating
    individual SVG files with only the layers in the given set. At the same
    time, any strokes that are magenta in colour are indicated to have a stroke
    width of 0.001in for the cutter to recognize as a cut instead of an etch.
    A set of Inkscape action files is created and the invocation of Inkscape
    for these files.
  </para>
  <programlisting>
BSD 3-Clause License

Copyright (c) 2023, Crane Softwrights Ltd.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    
  </programlisting>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file has layers with layer titles that name the output SVG file
    dedicated to that layer's content.
  </para>
</xs:doc>
  
<xs:output>
  <para>The output is a script to be executed in the operating system</para>
</xs:output>
<xsl:output method="text"/>
  
<xs:param>
  <para>
    The path in which to put the SVG XML files and action text files.
  </para>
</xs:param>
<xsl:param name="path2svg" as="xsd:string" required="yes"/>

<xs:param>
  <para>
    The path in which to put the result PNG files
  </para>
</xs:param>
<xsl:param name="path2png" as="xsd:string" required="yes"/>

<xs:param>
  <para>
    The path in which to put the result PDF files
  </para>
</xs:param>
<xsl:param name="path2pdf" as="xsd:string" required="yes"/>

<xs:param>
  <para>
    The suffix to use for the names of the files generated.
  </para>
</xs:param>
<xsl:param name="name-suffix" as="xsd:string" required="yes"/>

<xs:variable>
  <para>Need to remember the input context for key() to work</para>
</xs:variable>
<xsl:variable name="c:top" as="document-node()" select="/"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Convert all identified layers</xs:title>
</xs:doc>

<xs:key>
  <para>Find all layers that are building blocks</para>
</xs:key>
<xsl:key name="c:build" match="g[matches(@inkscape:label,':[^\*]')]"
         use="'__all__',
              for $each in tokenize(@inkscape:label,'\s+')[matches(.,':[^\*]')]
              return substring-before($each,':')"/>

<xs:key>
  <para>Find all layers that are assembled building blocks</para>
</xs:key>
<xsl:key name="c:assemble" use="'__all__',tokenize(@inkscape:label,'\s+')[1]"
         match="/*/g[tokenize(@inkscape:label,'\s+')[starts-with(.,'=')]]"/>

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
<xsl:template match="/svg" priority="1">
  <xsl:for-each select="key('c:assemble','__all__',$c:top)">
    <xsl:variable name="c:thisGroup" select="."/>
    <!--determine (and assume) umique identifier for each-->
    <xsl:variable name="c:tokens" select="tokenize(@inkscape:label,'\s+')"/>
    <xsl:variable name="c:id" select="$c:tokens[1]"/>
    <xsl:variable name="c:directive" select="$c:tokens[2]"/>
    <!--create the SVG file for the target layer-->
    <xsl:result-document href="{$path2svg}{$c:id}{$name-suffix}.svg"
                         method="xml" indent="no">
      <xsl:for-each select="/*">
        <xsl:copy>
          <!--preserve document element-->
          <xsl:copy-of select="@*"/>
          <!--preserve everything other than groups-->
          <xsl:copy-of select="* except g"/>
          <!--put out the one group only, turning on visibility-->
          <xsl:for-each select="$c:thisGroup">
            <xsl:copy>
              <xsl:copy-of select="@*"/>
              <xsl:attribute name="id" select="$c:id"/>
              <xsl:attribute name="style"
                             select="'display:inline;',
                                     replace(@style,'display:.+?;?','')"/>
              <xsl:call-template name="c:addReferencedLayers">
                <xsl:with-param name="c:layer" select="."/>
              </xsl:call-template>
            </xsl:copy>
          </xsl:for-each>
        </xsl:copy>
      </xsl:for-each>
    </xsl:result-document>
    <!--create the Inkscape actions file for the target layer-->
    <xsl:result-document href="{$path2svg}{$c:id}{$name-suffix}.svg.txt"
                         method="text">
<xsl:text/>select-by-id:<xsl:value-of 
                                  select="$c:id"/>;object-to-path;select-clear;
<xsl:text/>
      <xsl:choose>
        <xsl:when test="$c:directive='=#'"><!--this is a collage-->
          <xsl:for-each select="$c:tokens[starts-with(.,'#')]">
<xsl:text/>select-by-id:<xsl:value-of select="replace(.,'^#?(.+?):.*$','$1')"
                                         />;page-fit-to-selection;select-clear;  
<xsl:text/>
          </xsl:for-each>
          <xsl:for-each select="$c:tokens[position()>2 and
                                          not(starts-with(.,'#'))]">
            <xsl:variable name="c:rotation"
           select="if( position() mod 2 = 0 ) then 'ccw;' else 'cw;'"/>
            <xsl:variable name="c:horizontal"
           select="if( position() mod 2 = 0 ) then 'object-align:right page;'
                                              else 'object-align:left page;'"/>
            <xsl:variable name="c:vertical"
           select="if( position() = ( 1,2 ) ) then 'object-align:top page;'
              else if( position() > last()-2 ) then 'object-align:bottom page;'
              else 'object-align:vcenter page;'"/>
<xsl:text/>select-by-id:<xsl:value-of select="
    concat(replace(.,'^#?(.+?):.*$','$1'),
    ';object-rotate-90-',$c:rotation,$c:vertical,$c:horizontal)"/>select-clear;
<xsl:text/>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="$c:directive='=!'"><!--this page is trimmed-->
<xsl:text/>page-fit-to-selection;
<xsl:text/>
        </xsl:when>
        <xsl:otherwise>
<xsl:text/>select-by-id:<xsl:value-of
       select="$c:id"/>;object-rotate-90-cw;page-fit-to-selection;select-clear;
<xsl:text/>
        </xsl:otherwise>
      </xsl:choose>
<xsl:text/>export-filename:<xsl:value-of
             select='concat($path2svg,$c:id,$name-suffix,".svg")'/>;export-do;
<xsl:text/>
<xsl:text/>export-filename:<xsl:value-of
             select='concat($path2png,$c:id,$name-suffix,".png")'/>;export-do;
<xsl:text/>
<xsl:text/>export-filename:<xsl:value-of
             select='concat($path2pdf,$c:id,$name-suffix,".pdf")'/>;export-do;
<xsl:text/>

    </xsl:result-document>
  </xsl:for-each>
  <!--put out the script that invokes inkscape to the standard output-->
  <xsl:for-each select="key('c:assemble','__all__',$c:top)">
    <xsl:variable name="c:id" select="tokenize(@inkscape:label,'\s+')[1]"/>
echo Remaining files to be processed: <xsl:value-of select="last()-position()+1"/>
inkscape "<xsl:value-of select='concat($path2svg,$c:id,$name-suffix,".svg""",
        " --batch-process --actions-file=""",
        $path2svg,$c:id,$name-suffix,".svg.txt""&#xa;")'/>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>Recursively copy in referenced groups, checking for loops</para>
  <xs:param name="c:layer">
    <para>The layer making the references</para>
  </xs:param>
  <xs:param name="c:pastLayers">
    <para>A history of layers to prevent infinite loops and visibility</para>
  </xs:param>
</xs:template>
<xsl:template name="c:addReferencedLayers">
  <xsl:param name="c:layer" as="element(g)" required="yes"/>
  <xsl:param name="c:pastLayers" as="element(g)*"/>
  <xsl:variable name="c:refs" 
                select="tokenize($c:layer/@inkscape:label,'\s+')"/>
  <!--the output layer uses the given name-->
    <xsl:for-each select="reverse($c:refs[contains(.,':')])">
      <xsl:variable name="c:ref"
                    select="replace(.,'^#?(.+?):.*$','$1')"/>
      <g inkscape:label="{$c:ref}" id="{$c:ref}">
        <xsl:choose>
          <xsl:when test="some $c:past in $c:pastLayers
                          satisfies $c:past is $c:layer">
            <!--this is an infinite loop-->
            <xsl:message terminate="yes">
              <xsl:text>An infinite loop detected with:&#xa;</xsl:text>
              <xsl:for-each select="$c:pastLayers">
                <xsl:value-of select="@inkscape:label,'&#xa;'"/>
              </xsl:for-each>
            </xsl:message>
          </xsl:when>
          <xsl:when test="exists(key('c:assemble',$c:ref,$c:top))">
            <xsl:call-template name="c:addReferencedLayers">
              <xsl:with-param name="c:layer"
                              select="key('c:assemble',$c:ref,$c:top)"/>
              <xsl:with-param name="c:pastLayers"
                              select="$c:pastLayers,$c:layer"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="empty(key('c:build',$c:ref,$c:top))">
            <!--something is amiss-->
            <xsl:message>
              <xsl:text>Missing a definition for the reference: </xsl:text>
              <xsl:value-of select="$c:ref"/>
            </xsl:message>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select="key('c:build',$c:ref,$c:top)">
              <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:attribute name="style"
                               select="'display:inline;',
                                       replace(@style,'display:.+?;?','')"/>
                <xsl:apply-templates/>
              </xsl:copy>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </g>
    </xsl:for-each>
</xsl:template>

<xs:template>
  <para>
    Convert magenta lines to .001in.
  </para>
</xs:template>
<xsl:template match="@style[contains(.,'stroke:#ff00ff')]">
  <xsl:attribute name="style"
           select="replace(.,'stroke-width:[^;]*;?','stroke-width:.001in;')"/>
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
