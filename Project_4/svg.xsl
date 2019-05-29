<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" version="1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink">
    
    <xsl:output method="xml" media-type="image/svg" encoding="utf-8"  doctype-public="-//W3C//DTD SVG 1.1//EN"
        doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>
    
    <xsl:template match="@* | node()" />
    
    <xsl:template match="*">
        <xsl:apply-templates select="@TEXT | node()"/>
    </xsl:template>
    
    <xsl:template match="/">
        <svg:svg width="1280" height="610" font-family="Tahoma">
            <svg:desc>Zestawienie książek z domowej biblioteki </svg:desc>
            <svg:title><xsl:value-of select="nagłówek"/></svg:title>
            <defs>
                <linearGradient id="grad1" x1="0%" y1="0%" x2="0%" y2="100%">
                    <stop offset="0%" style="stop-color:rgb(98, 142, 214);stop-opacity:1" />
                    <stop offset="100%" style="stop-color:rgb(32, 93, 193);stop-opacity:1" />                    
                </linearGradient>
            </defs>
            
            <svg:rect x="3" y="3" width="1274" height="604" fill="url(#grad1)" stroke="black" stroke-width="3"/> 
            
            <svg:text x="50%" y="40" font-size="30" fill="#1eea2f" font-weight="bold" text-anchor="middle">
                ZESTAWIENIE KSIĄŻEK Z DOMOWEJ BIBLIOTEKI
            </svg:text>
            
            <a xlink:href="https://www.empik.com/" target="_blank">
                <svg:g class="btn" cursor="pointer">
                    <svg:rect x="30" y="570" width="110" height="30" fill="#123672" stroke="black"/>
                    <svg:text x="40" y="590" fill="white" font-size="16">KUP WIĘCEJ</svg:text>
                </svg:g>
            </a>
            
            <script type="text/ecmascript"> 
                <![CDATA[
                    function onClickAutorzy(evt) {
                        var students = document.getElementById("students");
                        var visibility = students.getAttribute("visibility");
                        if(visibility==="visible"){
                            students.setAttribute("visibility", "hidden");
                        }else{
                            students.setAttribute("visibility", "visible");
                        }
                    }
                    ]]>
            </script>
            
            <script type="text/ecmascript"> 
                <![CDATA[
                    function onMouseOverLiczebnosc(evt) {
                        var numbers = document.getElementById("numbers");
                        numbers.setAttribute("visibility", "visible");
                    }]]>
            </script>
            
            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOutLiczebnosc(evt) {
                        var numbers = document.getElementById("numbers");
                        numbers.setAttribute("visibility", "hidden");
                    }]]>
            </script>
            
            <style>
                g.btn:hover
                {
                opacity:0.7;
                }
            </style>
            
            <xsl:apply-templates/>
        </svg:svg>
    </xsl:template>
    
    <xsl:template match="Autorzy" >
        <svg:g id="authors" class="btn" width="70" height="20" onclick="onClickAutorzy(evt)" cursor="pointer">
            <svg:rect x="100" y="70" width="150" height="30" fill="#123672" stroke="black"/>
            <svg:text x="120" y="90" fill="white" font-size="16" >Pokaż autorów:</svg:text>
        </svg:g>
        <svg:g id="students" visibility="hidden">
            <svg:rect x="300" y="70" width="475" height="30" fill="#123672" stroke="black"/>
            <xsl:apply-templates/>
        </svg:g>
    </xsl:template>
    
    <xsl:template match="AutorDokumentu">
        <xsl:element name="svg:text">
            <xsl:attribute name="x">
                <xsl:variable name="długość" select="position()*(string-length(concat(Imię,' ',Nazwisko,' (',Indeks,')')))"/>
                <xsl:value-of select="(4.5*$długość)+120"/>
            </xsl:attribute>
            <xsl:attribute name="y">
                <xsl:text>92</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="fill">
                <xsl:text>#fff</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="font-size">
                <xsl:text>19</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="concat(Imię,' ',Nazwisko,' (',Indeks,')')"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Podsumowanie">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="LiczebnośćKsiążek">
        <svg:g id="rect" width="600" height="150" onmouseover="onMouseOverLiczebnosc(evt)" onmouseout="onMouseOutLiczebnosc(evt)">
            <svg:rect x="30" y="150" width="630" height="400" fill="#123672" stroke="black"/>
        </svg:g> 
        
        <svg:text x="27%" y="180" font-size="16" fill="#fff" font-weight="bold" text-anchor="middle">GATUNKI</svg:text>
        <svg:text x="5%"  y="500" font-size="16" fill="#fff" font-weight="bold">Wszystkie</svg:text>
        <svg:text x="15%" y="500" font-size="16" fill="#fff" font-weight="bold">Fantasy</svg:text>
        <svg:text x="23%" y="500" font-size="16" fill="#fff" font-weight="bold">Kryminalne</svg:text>
        <svg:text x="33%" y="500" font-size="16" fill="#fff" font-weight="bold">Obyczajowe</svg:text>
        <svg:text x="42%" y="500" font-size="16" fill="#fff" font-weight="bold">Historyczne</svg:text>
        
        <svg:g id="numbers" visibility="hidden">
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="0"/>
                    <xsl:value-of select="(125*$poz)+90"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="WszystkichKsiążek"/>
                    <xsl:value-of select="632-$ile*5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>#fff</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="WszystkichKsiążek"/>
            </xsl:element>
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="1"/>
                    <xsl:value-of select="(125*$poz)+100"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="KsiążekFantasy"/>
                    <xsl:value-of select="562-$ile*5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>#fff</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="KsiążekFantasy"/>
            </xsl:element>
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="2"/>
                    <xsl:value-of select="(125*$poz)+90"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="KsiążekKryminalnych"/>
                    <xsl:value-of select="551-$ile*5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>#fff</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="KsiążekKryminalnych"/>
            </xsl:element>
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="3"/>
                    <xsl:value-of select="(125*$poz)+90"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="KsiążekObyczajowych"/>
                    <xsl:value-of select="561-$ile*5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>#fff</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="KsiążekObyczajowych"/>
            </xsl:element>
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="4"/>
                    <xsl:value-of select="(125*$poz)+85"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="KsiążekHistorycznych"/>
                    <xsl:value-of select="552-$ile*5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>#fff</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="KsiążekHistorycznych"/>
            </xsl:element>
        </svg:g>
        
        <line x1="60" y1="463" x2="640" y2="463" style="stroke:rgb(0,0,0);stroke-width:3" />
        <line x1="60" y1="200" x2="60" y2="463" style="stroke:rgb(0,0,0);stroke-width:3" />
        <line x1="60" y1="200" x2="70" y2="210" style="stroke:rgb(0,0,0);stroke-width:3" />
        <line x1="60" y1="200" x2="50" y2="210" style="stroke:rgb(0,0,0);stroke-width:3" />
        <line x1="640" y1="463" x2="630" y2="453" style="stroke:rgb(0,0,0);stroke-width:3" />
        <line x1="640" y1="463" x2="630" y2="473" style="stroke:rgb(0,0,0);stroke-width:3" />
        
        <xsl:for-each select="*">
            <xsl:element name="svg:rect">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="position()-1.3"/>
                    <xsl:value-of select="(120*$poz)+120"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    <xsl:text>50</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>#1eea2f</xsl:text>
                </xsl:attribute>
                <xsl:variable name="ile" select="."/>
                <svg:animate attributeName="y" from="460" to="{460-$ile*10}" dur="5s" fill="freeze"/>
                <svg:animate attributeName="height" from="1" to="{$ile*10}" dur="5s" fill="freeze"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="SumaWydanychPieniędzy">
        <svg:rect x="700" y="150" width="550" height="400" fill="#123672" stroke="black"/>
        <svg:text x="77%" y="180" font-size="16" fill="white" font-weight="bold" text-anchor="middle">WYDANE PIENIĄDZE</svg:text>
        <svg:text x="800" y="500" font-size="16" fill="white" font-weight="bold">PLN</svg:text>
        <svg:text x="950" y="500" font-size="16" fill="white" font-weight="bold">USD</svg:text>
        <svg:text x="1100" y="500" font-size="16" fill="white" font-weight="bold">EUR</svg:text>
        
        <svg:rect x="750" y="220" width="450" height="250" fill="none" stroke="black" stroke-width="1"/>
        <line x1="750" y1="245" x2="1200" y2="245" style="stroke:rgb(0,0,0);stroke-width:1" />
        <line x1="750" y1="270" x2="1200" y2="270" style="stroke:rgb(0,0,0);stroke-width:1" />
        <line x1="750" y1="295" x2="1200" y2="295" style="stroke:rgb(0,0,0);stroke-width:1" />
        <line x1="750" y1="320" x2="1200" y2="320" style="stroke:rgb(0,0,0);stroke-width:1" />
        <line x1="750" y1="345" x2="1200" y2="345" style="stroke:rgb(0,0,0);stroke-width:1" />
        <line x1="750" y1="370" x2="1200" y2="370" style="stroke:rgb(0,0,0);stroke-width:1" />
        <line x1="750" y1="395" x2="1200" y2="395" style="stroke:rgb(0,0,0);stroke-width:1" />
        <line x1="750" y1="420" x2="1200" y2="420" style="stroke:rgb(0,0,0);stroke-width:1" />
        <line x1="750" y1="445" x2="1200" y2="445" style="stroke:rgb(0,0,0);stroke-width:1" />
        <line x1="750" y1="470" x2="1200" y2="470" style="stroke:rgb(0,0,0);stroke-width:1" />
        
        <svg:text x="725" y="222" font-size="12" fill="white">250</svg:text>
        <svg:text x="725" y="248" font-size="12" fill="white">225</svg:text>
        <svg:text x="725" y="274" font-size="12" fill="white">200</svg:text>
        <svg:text x="725" y="300" font-size="12" fill="white">175</svg:text>
        <svg:text x="725" y="324" font-size="12" fill="white">150</svg:text>
        <svg:text x="725" y="350" font-size="12" fill="white">125</svg:text>
        <svg:text x="725" y="374" font-size="12" fill="white">100</svg:text>
        <svg:text x="725" y="398" font-size="12" fill="white">75</svg:text>
        <svg:text x="725" y="424" font-size="12" fill="white">50</svg:text>
        <svg:text x="725" y="448" font-size="12" fill="white">25</svg:text>
        <svg:text x="725" y="474" font-size="12" fill="white">0</svg:text>
        
        <xsl:variable name="pln" select="PLN/."/>
        <xsl:variable name="usd" select="USD/."/>
        <xsl:variable name="eur" select="EUR/."/>
        <xsl:variable name="ile1" select="6175-(25*$pln)"/>
        <xsl:variable name="ile2" select="2935-(25*$usd)"/>
        <xsl:variable name="ile3" select="1870-(25*$eur)"/>
        
        <xsl:element name="path">
            <xsl:attribute name="stroke">#1eea2f</xsl:attribute>
            <xsl:attribute name="stroke-width">3</xsl:attribute>
            <xsl:attribute name="fill">none</xsl:attribute>
            <xsl:attribute name="d">
                <xsl:value-of select="concat('M 800 ',$ile1,' L 970 ',$ile2,' L 1120 ',$ile3)"/>
            </xsl:attribute>
        </xsl:element>
        
    </xsl:template>
</xsl:stylesheet>