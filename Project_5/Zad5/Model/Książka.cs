using System.Xml.Serialization;
using Zad5.Model;

namespace DomowaBiblioteka
{
    [XmlRoot("Książka", Namespace = "http://www.example.org/typy")]
    public class Książka
    {
        [XmlAttribute("IdKsiążki")]
        public string IdKsiążki { get; set; }

        [XmlElement("Tytuł", Namespace = "http://www.example.org/typy")]
        public string Tytuł { get; set; }

        [XmlAttribute("Autor")]
        public string Autor { get; set; }

        [XmlIgnore]
        public AutorKsiążki AutorKsiążki { get; set; }

        [XmlAttribute("Gatunek")]
        public string Gatunek { get; set; }

        [XmlElement("DataWydania", Namespace = "http://www.example.org/typy")]
        public string DataWydania { get; set; }

        [XmlElement("Cena", Namespace = "http://www.example.org/typy")]
        public Cena KosztKsiążki { get; set; }

        [XmlElement("RodzajOkładki", Namespace = "http://www.example.org/typy")]
        public RodzajOkładki Okładka { get; set; }

        //public enum Gatunki { Fantasy, Kryminał, Obyczajowa, Historyczna, Biografia, Dla_dzieci };
    }
}