using System.Xml.Serialization;

namespace DomowaBiblioteka
{
    [XmlRoot("AutorDokumentu", Namespace = "http://www.example.org/typy")]
    public class AutorDokumentu
    {
        [XmlAttribute]
        public string Indeks { get; set; }
        public string ImięAutora { get; set; }
        public string NazwiskoAutora { get; set; }
    }
}