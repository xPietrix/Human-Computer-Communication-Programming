using System.Collections.Generic;
using System.Xml.Serialization;

namespace DomowaBiblioteka
{
    [XmlRoot("OpisDokumentu")]
    public class OpisDokumentu
    {
        [XmlElement("TytułDokumentu")]
        public string Tytuł { get; set; }

        [XmlArray("Autorzy")]
        [XmlArrayItem("AutorDokumentu")]
        public List<AutorDokumentu> Autorzy { get; set; }
    }
}