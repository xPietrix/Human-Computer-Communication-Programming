<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="@* | node()" />
    
    <xsl:template match="*">
        <xsl:apply-templates select="@TEXT | node()"/>
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:text>RAPORT W FORMACIE SVG &#xA;</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>