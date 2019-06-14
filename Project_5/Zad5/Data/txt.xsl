<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="@* | node()" />

	<xsl:template match="*">
		<xsl:apply-templates select="@TEXT | node()"/>
	</xsl:template>

	<xsl:template match="/">
		<xsl:text>RAPORT W FORMACIE TXT &#xA;</xsl:text>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="TytułDokumentu">
		<xsl:text>&#xA;Zestawienie książek z domowej biblioteki &#xA; &#xA;</xsl:text>
	</xsl:template>
	
	<xsl:template match="Autorzy">
		<xsl:text>AUTORZY DOKUMENTU: &#xA; &#xA;</xsl:text>
		<xsl:apply-templates select="AutorDokumentu"/>
	</xsl:template>
	
	<xsl:template match="AutorDokumentu">
		<xsl:value-of select="concat(./ImięAutora,'&#x20;')"/>
		<xsl:value-of select="concat(./NazwiskoAutora,'&#x20;')"/>
		<xsl:value-of select="concat(./@Indeks,'&#xA;')"/>
	</xsl:template>
	
	<xsl:template match="AutorzyKsiążek">
		<xsl:text>&#xA; &#xA;AUTORZY KSIĄŻEK:&#xA;&#xA;</xsl:text>
		<xsl:apply-templates select="Autor"/>
	</xsl:template>
	
	<xsl:template match="Autor">
		<xsl:value-of select="concat('Imię: &#x9; &#x9; &#x9; &#x9;',./Imię,'&#xA;')"/>
		<xsl:value-of select="concat('Nazwisko: &#x9; &#x9; &#x9;',./Nazwisko,'&#xA;')"/>
		<xsl:value-of select="concat('Data urodzenia: &#x9;',./DataUrodzenia,'&#xA;')"/>
		<xsl:value-of select="concat('Miejsce urodzenia: &#x9;',./MiejsceUrodzenia,'&#xA; &#xA;')"/>
	</xsl:template>
	
	<xsl:template match="ListaKsiążek">
		<xsl:text>LISTA KSIĄŻEK: &#xA; &#xA;</xsl:text>
		<xsl:apply-templates select="Książka"/>
	</xsl:template>
	
	<xsl:template match="Książka">
		<xsl:value-of select="concat('Tytuł: &#x9; &#x9; &#x9; &#x9; ', ./Tytuł,'&#xA;')"/>
		<xsl:value-of select="concat('Autor: &#x9; &#x9; &#x9; &#x9; ', ./@Autor,'&#xA;')"/>
		<xsl:value-of select="concat('Data wydania: &#x9; &#x9;',./DataWydania,'&#xA;')"/>
		<xsl:value-of select="concat('Gatunek: &#x9; &#x9; &#x9; ', ./@Gatunek,'&#xA;')"/>
		<xsl:value-of select="concat('Cena: &#x9; &#x9; &#x9; &#x9;',./Cena,'&#xA;')"/>
		<xsl:value-of select="concat('Rodzaj okładki: &#x9; ', ./RodzajOkładki/@Rodzaj,'&#xA;&#xA; &#xA;')"/>
	</xsl:template>	
	
</xsl:stylesheet>