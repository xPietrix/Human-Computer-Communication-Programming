<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="xml" version="1.0" indent="yes" />
    
    <xsl:template match="Biblioteka">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master page-height="297mm" page-width="210mm" margin="0mm 25mm 5mm 25mm" master-name="PageMaster">
                    <fo:region-body margin="20mm 0mm 20mm 0mm"/>
                    <fo:region-after extent="2%"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="PageMaster" font-family="Tahoma" text-align="center">
                
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center"  font-size="20px">
                        <xsl:text>[&#x20;Strona&#x20;</xsl:text>
                        <fo:page-number />
                        <xsl:text>&#x20;]</xsl:text>
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates select="OpisDokumentu"/>
                    <fo:block margin-top="50px" font-size="20pt">Autorzy książek</fo:block>
                    <xsl:apply-templates select="AutorzyKsiążek"/>
                    <fo:block margin-top="50px" font-size="20pt">Książki</fo:block>
                    <xsl:apply-templates select="ListaKsiążek"/>
                    <fo:block margin-top="50px" font-size="20pt">Podsumowanie</fo:block>
                    <xsl:apply-templates select="Podsumowanie"/>
                </fo:flow>
                
            </fo:page-sequence>
        </fo:root>
    </xsl:template>  
    
    <xsl:template match="OpisDokumentu">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="TytułDokumentu">
        <fo:block text-align="center" font-weight="bold" font-size="20pt">
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
        <fo:table>
            <fo:table-column column-number="1" />
            <fo:table-column column-number="2"  column-width="25%"/>
            <fo:table-column column-number="3"  column-width="25%"/>
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Imię i nazwisko</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Miejsce urodzenia</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Data urodzenia</fo:block></fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:for-each select="Autor">
                    <fo:table-row>
                        <fo:table-cell border="solid black">
                            <fo:block>
                                <xsl:value-of select="concat(Imię,' ', Nazwisko)"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block><xsl:value-of select="MiejsceUrodzenia"/></fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block><xsl:value-of select="DataUrodzenia"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template match="ListaKsiążek">
        <fo:table>
            <fo:table-column column-number="1" />
            <fo:table-column column-number="2" />
            <fo:table-column column-number="3"  column-width="15%"/>
            <fo:table-column column-number="4"  column-width="15%"/>
            <fo:table-column column-number="5"  column-width="10%"/>
            <fo:table-column column-number="6"  column-width="12%"/>
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold" >Tytuł</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Autor</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Data wydania</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Gatunek</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Cena</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Rodzaj okładki</fo:block></fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:for-each select="Książka">
                    <fo:table-row>
                        <fo:table-cell border="solid black"><fo:block><xsl:value-of select="Tytuł"/></fo:block></fo:table-cell>
                        <fo:table-cell border="solid black"><fo:block><xsl:value-of select="Autor"/></fo:block></fo:table-cell>
                        <fo:table-cell border="solid black"><fo:block><xsl:value-of select="DataWydania"/></fo:block></fo:table-cell>
                        <fo:table-cell border="solid black"><fo:block><xsl:value-of select="Gatunek"/></fo:block></fo:table-cell>
                        <fo:table-cell border="solid black"><fo:block><xsl:value-of select="Cena"/></fo:block></fo:table-cell>
                        <fo:table-cell border="solid black"><fo:block><xsl:value-of select="RodzajOkładki"/></fo:block></fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template match="Podsumowanie">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="LiczebnośćKsiążek">
        <fo:block margin-top="10px" text-align="center">Liczebność książek</fo:block>
        <fo:table>
            <fo:table-column column-number="1"  column-width="20%" />
            <fo:table-column column-number="2"  />
            <fo:table-column column-number="3"  />
            <fo:table-column column-number="4"  />
            <fo:table-column column-number="5"  />
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Wszystkich Książek</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Książek Fantasy</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Książek Kryminalnych</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Książek Obyczajowych</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">Książek Historycznych</fo:block></fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell border="solid black"><fo:block><xsl:value-of select="WszystkichKsiążek"/></fo:block></fo:table-cell>
                    <fo:table-cell border="solid black"><fo:block><xsl:value-of select="KsiążekFantasy"/></fo:block></fo:table-cell>
                    <fo:table-cell border="solid black"><fo:block><xsl:value-of select="KsiążekKryminalnych"/></fo:block></fo:table-cell>
                    <fo:table-cell border="solid black"><fo:block><xsl:value-of select="KsiążekObyczajowych"/></fo:block></fo:table-cell>
                    <fo:table-cell border="solid black"><fo:block><xsl:value-of select="KsiążekHistorycznych"/></fo:block></fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template match="SumaWydanychPieniędzy">
        <fo:block margin-top="10px">Suma wydanych pieniędzy</fo:block>
        <fo:table>
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">PLN</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">USD</fo:block></fo:table-cell>
                    <fo:table-cell border="thick solid black"><fo:block font-weight="bold">EUR</fo:block></fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell border="solid black"><fo:block><xsl:value-of select="PLN"/></fo:block></fo:table-cell>
                    <fo:table-cell border="solid black"><fo:block><xsl:value-of select="USD"/></fo:block></fo:table-cell>
                    <fo:table-cell border="solid black"><fo:block><xsl:value-of select="EUR"/></fo:block></fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template match="DataWygenerowaniaRaportu">
        <fo:block margin-top="10px" >Data wygenerowania raportu</fo:block>
        <fo:block border="solid black" text-align="center">
            <fo:block><xsl:value-of select="concat(Data, ' ', Czas)"/></fo:block>
        </fo:block>
    </xsl:template>
    
</xsl:stylesheet >