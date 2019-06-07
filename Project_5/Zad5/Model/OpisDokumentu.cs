using System.Collections.Generic;
using System.Xml.Serialization;

namespace DomowaBiblioteka
{
    [XmlRoot("OpisDokumentu", Namespace = "http://www.example.org/typy")]
    public class OpisDokumentu
    {
        [XmlElement("TytułDokumentu", Namespace = "http://www.example.org/typy")]
        public string Tytuł { get; set; }

        [XmlArray("Autorzy", Namespace = "http://www.example.org/typy")]
        [XmlArrayItem("AutorDokumentu", Namespace = "http://www.example.org/typy")]
        public List<AutorDokumentu> Autorzy { get; set; }
    }
}