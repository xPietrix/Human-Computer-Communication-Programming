using System;
using System.Xml.Serialization;

namespace DomowaBiblioteka 
{
    [XmlRoot("RodzajOkładki")]
    public class RodzajOkładki
    {
        [XmlAttribute("Rodzaj")]
        public string Okładka { get; set; }
    }
}