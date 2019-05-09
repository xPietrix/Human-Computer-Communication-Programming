<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="2.0">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"
doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" /> 
               
    <xsl:template match="/">
        <html>
            <head>
                <title> Zadanie 3 - XHTML </title>
                <link rel="stylesheet" type="text/css" href="xhtml.css" />
            </head> 
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="/Biblioteka" >
		<xsl:call-template name="OpisDokumentu"/>
		<xsl:call-template name="ListaKsiążek"/>
		<xsl:call-template name="AutorzyKsiążek"/>
		<xsl:call-template name="Podsumowanie"/>
    </xsl:template>
	
	<xsl:template name="OpisDokumentu" >
		<div>
			<h1 id="Tytuł">
				<xsl:value-of select="//TytułDokumentu"/>
			</h1>
			<table id="AutorzyDokumentu">
				<tr>
					<th>Autorzy dokumentu</th>
				</tr>
				<xsl:for-each select="//AutorDokumentu">
					<tr>
						<td>
							<xsl:value-of select="Imię, Nazwisko, Indeks"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</div>
    </xsl:template>
	
	<xsl:template name="ListaKsiążek" >
		<div id="Książki">
            <h2> Książki </h2>
            <table>
            	<tr>
					<th>Tytuł</th> 
                    <th>Autor</th>
                    <th>Data Wydania</th>
                    <th>Gatunek</th>
					<th>Cena</th>
                    <th>Rodzaj Okładki</th>         
                </tr>
				
				<xsl:for-each select="//Książka" >
                    <tr>
                        <td>
                            <xsl:value-of select="Tytuł" />
                        </td> 
                        <td>
                            <xsl:value-of select="Autor" />
                        </td>
                    	<td>
                    		<xsl:value-of select="DataWydania" />
                    	</td>
                    	<td>
                    		<xsl:value-of select="Gatunek" />
                    	</td>
                    	<td>
                    		<xsl:value-of select="Cena" />
                    	</td>
                    	<td>
                    		<xsl:value-of select="RodzajOkładki"/>
                    	</td>
                    </tr> 
                </xsl:for-each>
			</table>
        </div>
    </xsl:template>
	
	<xsl:template name="AutorzyKsiążek">
		<div id="Autorzy">
			<h2> Autorzy </h2>
			<table>
				<tr>
					<th>Imię</th>
					<th>Nazwisko</th>
					<th>Kraj pochodzenia</th>
					<th>Data urodzenia</th>
				</tr>
				<xsl:for-each select="//AutorzyKsiążek/Autor">
					<tr>
						<td>
							<xsl:value-of select="Imię" />
						</td>
						<td>
							<xsl:value-of select="Nazwisko" />
						</td>
						<td>
							<xsl:value-of select="MiejsceUrodzenia" />
						</td>
						<td>
							<xsl:value-of select="DataUrodzenia" />
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</div>
	</xsl:template>
	
	<xsl:template name="Podsumowanie">
		<div id="Podsumowanie">
			<h2>Podsumowanie</h2>
			<table>
				<caption>Liczebność książek</caption>
				<tr>
					<th>Wszystkich książek</th>
					<th>Książki fantasy</th>
					<th>Książki kryminalne</th>
					<th>Książki obyczajowe</th>
					<th>Książki historyczne</th>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="//WszystkichKsiążek" />
					</td>
					<td>
						<xsl:value-of select="//KsiążekFantasy" />
					</td>
					<td>
						<xsl:value-of select="//KsiążekKryminalnych" />
					</td>
					<td>
						<xsl:value-of select="//KsiążekObyczajowych" />
					</td>
					<td>
						<xsl:value-of select="//KsiążekHistorycznych" />
					</td>
				</tr>
			</table>
			
			<table>
				<caption>Suma wydanych pieniędzy</caption>
				<tr>
					<th>PLN</th>
					<th>USD</th>
					<th>EUR</th>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="//PLN"/>
					</td>
					<td>
						<xsl:value-of select="//USD"/>
					</td>
					<td>
						<xsl:value-of select="//EUR"/>
					</td>
				</tr>
			</table>
			<table>
				<caption>Data wygenerowania raportu</caption>
				<tr>
					<th>Data</th>
					<th>Czas</th>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="//Data"/>
					</td>
					<td>
						<xsl:value-of select="//Czas"/>
					</td>
				</tr>
			</table>
			
		</div>
	</xsl:template>
			
		
</xsl:stylesheet>