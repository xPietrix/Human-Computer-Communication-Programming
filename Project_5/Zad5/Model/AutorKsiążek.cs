using System.Xml.Serialization;

namespace DomowaBiblioteka
{
    [XmlRoot("Autor", Namespace = "http://www.example.org/typy")]
    public class AutorKsiążki
    {
        [XmlAttribute("Id")]
        public string ID { get; set; }

        [XmlElement("Imię", Namespace = "http://www.example.org/typy")]
        public string Imię { get; set; }

        [XmlElement("Nazwisko", Namespace = "http://www.example.org/typy")]
        public string Nazwisko { get; set; }

        [XmlElement("DataUrodzenia", Namespace = "http://www.example.org/typy")]
        public string DataUrodzenia { get; set; }

        [XmlElement("MiejsceUrodzenia", Namespace = "http://www.example.org/typy")]
        public string MiejsceUrodzenia { get; set; }
    }
}
