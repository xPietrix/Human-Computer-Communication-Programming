using System.Xml.Serialization;

namespace DomowaBiblioteka
{
    [XmlRoot("Książka", Namespace = "http://www.example.org/typy")]
    public class Książka
    {
        [XmlAttribute("Autor")]
        public string Autor { get; set; }

        [XmlAttribute("Gatunek")]
        public string Gatunek { get; set; }

        [XmlAttribute("IdKsiążki")]
        public string IdKsiążki { get; set; }

        [XmlElement("Tytuł", Namespace = "http://www.example.org/typy")]
        public string Tytuł { get; set; }

        [XmlElement("DataWydania", Namespace = "http://www.example.org/typy")]
        public string DataWydania { get; set; }

        [XmlElement("Cena", Namespace = "http://www.example.org/typy")]
        public string Cena { get; set; }

        [XmlAttribute("Waluta")]
        public string Waluta { get; set; }

        [XmlElement("RodzajOkładki", Namespace = "http://www.example.org/typy")]
        public string RodzajOkładki { get; set; }
    }
}