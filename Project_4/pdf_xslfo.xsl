<?xml version="1.0" encoding="UTF-8"?>
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
   <fo:layout-master-set>
      <fo:simple-page-master page-height="297mm"
                             page-width="210mm"
                             margin="0mm 25mm 5mm 25mm"
                             master-name="PageMaster">
         <fo:region-body margin="20mm 0mm 20mm 0mm"/>
         <fo:region-after extent="2%"/>
      </fo:simple-page-master>
   </fo:layout-master-set>
   <fo:page-sequence master-reference="PageMaster"
                     font-family="Tahoma"
                     text-align="center">
      <fo:static-content flow-name="xsl-region-after">
         <fo:block text-align="center" font-size="20px">[ Strona <fo:page-number/> ]</fo:block>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body">
         <fo:block text-align="center" font-weight="bold" font-size="20pt"> Dokument przedstawia zestawienie książek z domowej biblioteki </fo:block>
         <fo:block text-align="right">
            <fo:inline>Piotr</fo:inline>
            <fo:inline>Wasiak</fo:inline>
            <fo:inline>210346</fo:inline>
         </fo:block>
         <fo:block text-align="right">
            <fo:inline>Mateusz</fo:inline>
            <fo:inline>Kubicki</fo:inline>
            <fo:inline>210238</fo:inline>
         </fo:block>
         <fo:block margin-top="50px" font-size="20pt">Autorzy książek</fo:block>
         <fo:table>
            <fo:table-column column-number="1"/>
            <fo:table-column column-number="2" column-width="25%"/>
            <fo:table-column column-number="3" column-width="25%"/>
            <fo:table-header>
               <fo:table-row>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Imię i nazwisko</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Miejsce urodzenia</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Data urodzenia</fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-header>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Peter Brett</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>USA</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>1973-02-08</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Alexandre Dumas</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Francja</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 1802-07-24 </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Kennedy Elle</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Kanada</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>1982-01-19</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Camilla Lackberg</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Szwecja</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>1974-07-30</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Meghan March</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>USA</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 1983-04-15 </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Joyo Moyes</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Wielka Brytania</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 1969-08-04 </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Remigiusz Mróz</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Polska</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 1987-01-15 </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Jo Nesbo-Myślnikowy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Norwegia</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>1960-03-29</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Christopher Paolini Testowy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>USA</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>1983-11-17</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>J. K. Rowling</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Wielka Brytania</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>2004-01-31</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Henryk Sienkiewicz</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Polska</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 1846-05-05 </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Ewa Stachniak</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Polska</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 1952-11-27 </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block margin-top="50px" font-size="20pt">Książki</fo:block>
         <fo:table>
            <fo:table-column column-number="1"/>
            <fo:table-column column-number="2"/>
            <fo:table-column column-number="3" column-width="15%"/>
            <fo:table-column column-number="4" column-width="15%"/>
            <fo:table-column column-number="5" column-width="10%"/>
            <fo:table-column column-number="6" column-width="12%"/>
            <fo:table-header>
               <fo:table-row>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Tytuł</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Autor</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Data wydania</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Gatunek</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Cena</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Rodzaj okładki</fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-header>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Brisingr</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Christopher Paolini Testowy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2008-09-20 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Fantasy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 29.69 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Błąd</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Kennedy Elle</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2016-07-04 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Obyczajowa</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 12.89 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Eragon</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Christopher Paolini Testowy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2005-02-13 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Fantasy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 9.99 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Miękka</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Harry Potter I Czara Ognia</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>J. K. Rowling</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2000-07-08 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Fantasy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 12.89 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Harry Potter I Zakon Feniksa</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>J. K. Rowling</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2005-01-31 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Fantasy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 29.99 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Miękka</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Harry Potter i Czara Ognia</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Ewa Stachniak</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2013-04-17 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Historyczna</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 28.89 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Krzyżacy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Henryk Sienkiewicz</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2015-07-01 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Historyczna</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 28.79 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Miękka</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Król bez skrupułów</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Meghan March</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2018-02-12 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Obyczajowa</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 8.59 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Miękka</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Księżniczka Z Lodu</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Camilla Lackberg</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2011-09-07 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Kryminał</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 12.89 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Malowany Człowiek</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Peter Brett</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2008-09-01 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Fantasy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 42.49 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Pan Wołodyjowski</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Henryk Sienkiewicz</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2010-04-03 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Historyczna</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 23.88 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Miękka</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Pierwszy śnieg</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Jo Nesbo-Myślnikowy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2014-06-04 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Kryminał</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 13.89 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Miękka</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Pod tą maską</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Meghan March</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2014-09-23 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Obyczajowa</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 9.89 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Pościg</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Kennedy Elle</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2019-03-04 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Obyczajowa</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 11.79 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Pragnienie</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Jo Nesbo-Myślnikowy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2017-03-29 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Kryminał</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 34.00 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Pustynna Włócznia</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Peter Brett</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2010-03-27 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Fantasy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 12.89 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Srebrna Zatoka</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Joyo Moyes</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2019-01-16 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Obyczajowa</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 19.89 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Miękka</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Trzej muszkieterowie</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Alexandre Dumas</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2016-02-12 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Historyczna</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 11.39 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Umorzenie</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Remigiusz Mróz</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2019-03-13 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Kryminał</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 29.89 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Twarda</fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>Zanim się pojawiłeś</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Joyo Moyes</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 2016-11-09 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Obyczajowa</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block> 14.19 </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>Miękka</fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block margin-top="50px" font-size="20pt">Podsumowanie</fo:block>
         <fo:block margin-top="10px" text-align="center">Liczebność książek</fo:block>
         <fo:table>
            <fo:table-column column-number="1" column-width="20%"/>
            <fo:table-column column-number="2"/>
            <fo:table-column column-number="3"/>
            <fo:table-column column-number="4"/>
            <fo:table-column column-number="5"/>
            <fo:table-header>
               <fo:table-row>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Wszystkich Książek</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Książek Fantasy</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Książek Kryminalnych</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Książek Obyczajowych</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">Książek Historycznych</fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-header>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>20</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>6</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>4</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>6</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>4</fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block margin-top="10px">Suma wydanych pieniędzy</fo:block>
         <fo:table>
            <fo:table-header>
               <fo:table-row>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">PLN</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">USD</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="thick solid black">
                     <fo:block font-weight="bold">EUR</fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-header>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell border="solid black">
                     <fo:block>237.62</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>102.82</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black">
                     <fo:block>58.36</fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block margin-top="10px">Data wygenerowania raportu</fo:block>
         <fo:block border="solid black" text-align="center">
            <fo:block>29/05/2019 18:32, GMT+02:00</fo:block>
         </fo:block>
      </fo:flow>
   </fo:page-sequence>
</fo:root>
