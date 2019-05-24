<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="xml" version="1.0" indent="yes" />
    
    <xsl:template match="Biblioteka">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master page-height="297mm" page-width="210mm"
                    margin="5mm 25mm 5mm 25mm" master-name="PageMaster">
                    <fo:region-body margin="20mm 0mm 20mm 0mm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="PageMaster">
                <fo:flow flow-name="xsl-region-body" >
                    <fo:block>
                        <xsl:apply-templates select="OpisDokumentu"/>
                    </fo:block>
                    <fo:table>
                        <xsl:apply-templates select="AutorzyKsiążek"/>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
    
    
    <xsl:template match="OpisDokumentu">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="TytułDokumentu">
        <fo:block text-align="center" font-weight="bold">
            <xsl:apply-templates />
        </fo:block>
    </xsl:template>
    
    <xsl:template match="Autorzy">
        <xsl:for-each select="AutorDokumentu">
            <fo:block text-align="right">
                <fo:inline><xsl:value-of select="Imię"/></fo:inline>
                <fo:inline><xsl:value-of select="Nazwisko"/></fo:inline>
                <fo:inline><xsl:value-of select="Indeks"/></fo:inline>
            </fo:block>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="AutorzyKsiążek">
        <fo:table-header>
            <fo:table-row>
                <fo:table-cell border="solid black"><fo:block>Imię i nazwisko</fo:block></fo:table-cell>
                <fo:table-cell border="solid black"><fo:block>Kraj pochodzenia</fo:block></fo:table-cell>
                <fo:table-cell border="solid black"><fo:block>Miejsce urodzenia</fo:block></fo:table-cell>
            </fo:table-row>
        </fo:table-header>
        <fo:table-body>
            <xsl:for-each select="Autor">
                <fo:table-row>
                    <fo:table-cell border="solid black">
                        <fo:block><xsl:value-of select="//Autor/Imię, //Autor/Nazwisko"/></fo:block>
                    </fo:table-cell>
                    <fo:table-cell border="solid black">
                        <fo:block><xsl:value-of select="//Autor/MiejsceUrodzenia"/></fo:block>
                    </fo:table-cell>
                    <fo:table-cell border="solid black">
                        <fo:block><xsl:value-of select="//Autor/DataUrodzenia"/></fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </xsl:for-each>
        </fo:table-body>
    </xsl:template>
    
</xsl:stylesheet >