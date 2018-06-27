<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" media-type="text/turtle" encoding="UTF-8"/>
<!--xsl:strip-space elements="*"/-->
<xsl:template match="/">
<xsl:apply-templates select="osm"/>
</xsl:template>
<xsl:key name="nodes" match="node" use="@id"/>
<xsl:template match="osm">
<xsl:variable name="double_quote"><xsl:text>"</xsl:text></xsl:variable>
<xsl:variable name="apos"><xsl:text>'</xsl:text></xsl:variable>
<xsl:for-each select="way">
<xsl:variable name="id" select="@id"/>
<xsl:variable name="tagHighway" select="tag[@k='highway' and @v!='footway' and @v!='bridleway' and @v!='steps' and @v!='path' and @v!='cicleway']"/>
<xsl:variable name="hasTwoWay" select="tag[@k='oneway' and @v!='yes']"/>
<xsl:variable name="doesntHaveTwoWay" select="tag[@k='oneway' and @v!='no']"/>
<xsl:if test="$id > 0 and $tagHighway">
<xsl:variable name="raw_linestring" >
<xsl:for-each select="nd">
<xsl:variable name="node_ref" select="@ref"/>
<xsl:variable name="node_key" select="key('nodes',$node_ref)"/>
<xsl:variable name="lon" select="$node_key/@lon"/>
<xsl:variable name="lat" select="$node_key/@lat"/>
<xsl:value-of select="$lon"/><xsl:text>_</xsl:text><xsl:value-of select="$lat"/>,
</xsl:for-each>
</xsl:variable>
<xsl:variable name="nowhitespace_linestring" select="translate($raw_linestring,'&#10;&#32;','')"/>
<xsl:variable name="nounderscore_linestring" select="translate($nowhitespace_linestring,'&#95;',' ')"/>
<xsl:variable name="linestring" select="substring($nounderscore_linestring,1,string-length($nounderscore_linestring)-1)"/>
<xsl:choose>
<xsl:when test="$hasTwoWay">
<xsl:value-of select="$id"/>-LineString((<xsl:value-of select="$linestring"/>))-True
</xsl:when>
<xsl:when test="$doesntHaveTwoWay">
<xsl:value-of select="$id"/>-LineString((<xsl:value-of select="$linestring"/>))-True
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$id"/>-LineString((<xsl:value-of select="$linestring"/>))-False
</xsl:otherwise>
</xsl:choose>
</xsl:if>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
