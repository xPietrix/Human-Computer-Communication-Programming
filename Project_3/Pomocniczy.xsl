<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="@* | node()" />

	<xsl:template match="*">
		<xsl:apply-templates select="@TEXT | node()"/>
	</xsl:template>

	<xsl:key use="@Id" name="AutorKey" match="//AutorzyKsiążek/Autor" />

	<xsl:template match="/Biblioteka">
	  <xsl:apply-templates />
	</xsl:template>

	<xsl:template match="/">
		<xsl:element name="Biblioteka">
			<xsl:apply-templates />
			<Podsumowanie>
				<Ilość_Autorów_Dokumentów>
					<xsl:value-of select="count(/Biblioteka/OpisDokumentu/Autorzy/AutorDokumentu)" />
				</Ilość_Autorów_Dokumentów>
			</Podsumowanie>
		</xsl:element>
	</xsl:template>


	<xsl:template match="//OpisDokumentu">
		<xsl:element name="OpisDokumentu">
			<xsl:element name="TytułDokumentu">
				<xsl:value-of select="TytułDokumentu" />
		</xsl:element>
			<xsl:apply-templates select="Autorzy" />
		</xsl:element>
	</xsl:template>

	<xsl:template match="//Autorzy">
		<xsl:element name="Autorzy">
			<xsl:apply-templates select="AutorDokumentu" />
		</xsl:element>
	</xsl:template>

	<xsl:template match="//AutorDokumentu">
		<xsl:element name="AutorDokumentu">
			<xsl:element name="Indeks">
				<xsl:value-of select="./@Indeks" />
			</xsl:element>
			<xsl:element name="Imię">
				<xsl:value-of select="./ImięAutora" />
			</xsl:element>
			<xsl:element name="Nazwisko">
				<xsl:value-of select="./NazwiskoAutora" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="//AutorzyKsiążek">
		<xsl:element name="AutorzyKsiążek">
			<xsl:apply-templates select="Autor" />
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="//Autor">
		<xsl:element name="Autor">
			<xsl:element name="Imię">
				<xsl:value-of select="./Imię" />
			</xsl:element>
			<xsl:element name="Nazwisko">
				<xsl:value-of select="./Nazwisko" />
			</xsl:element>
			<xsl:element name="DataUrodzenia">
				<xsl:value-of select="./DataUrodzenia" />
			</xsl:element>
			<xsl:element name="MiejsceUrodzenia">
				<xsl:value-of select="./MiejsceUrodzenia" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="//ListaKsiążek">
		<xsl:element name="ListaKsiążek">
			<xsl:apply-templates select="Książka" />
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="//Książka">
		<xsl:element name="Książka">
			<xsl:element name="Tytuł">
				<xsl:value-of select="Tytuł" />
			</xsl:element>
			<xsl:variable name="AutorKsiążki" select="key('AutorKey', @Autor)" /> 
			<xsl:element name="AutorKsiążki">
				<xsl:value-of select="concat($AutorKsiążki/Imię, ' ', $AutorKsiążki/Nazwisko)" />
			</xsl:element>
			<xsl:element name="DataWydania">
				<xsl:value-of select="DataWydania" />
			</xsl:element>
			<xsl:element name="Cena">
				<xsl:value-of select="Cena" />
			</xsl:element>
			<xsl:element name="RodzajOkładki">
				<xsl:value-of select="RodzajOkładki" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
			
</xsl:stylesheet>