using System.Xml.Serialization;

namespace DomowaBiblioteka
{
    [XmlRoot("AutorDokumentu")]
    public class AutorDokumentu
    {
        [XmlAttribute]
        public string Indeks { get; set; }
        public string ImięAutora { get; set; }
        public string NazwiskoAutora { get; set; }
    }
}