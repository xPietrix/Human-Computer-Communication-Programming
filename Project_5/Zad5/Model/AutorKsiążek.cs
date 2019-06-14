using System.Collections.Generic;
using System.Xml.Serialization;

namespace DomowaBiblioteka
{
    [XmlRoot("Autor")]
    public class AutorKsiążki
    {
        [XmlAttribute("Id")]
        public string ID { get; set; }

        [XmlElement("Imię")]
        public string Imię { get; set; }

        [XmlElement("Nazwisko")]
        public string Nazwisko { get; set; }

        [XmlElement("DataUrodzenia")]
        public string DataUrodzenia { get; set; }

        [XmlElement("MiejsceUrodzenia")]
        public string MiejsceUrodzenia { get; set; }

        [XmlIgnore]
        public List<Książka> Książki { get; set; }

        public AutorKsiążki()
        {
            Książki = new List<Książka>();
        }
    }
}
