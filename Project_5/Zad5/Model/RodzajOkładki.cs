using System.Xml.Serialization;

namespace DomowaBiblioteka
{
    [XmlRoot("RodzajOkładki")]
    public class RodzajOkładki
    {
        [XmlAttribute("Rodzaj")]
        public Rodzaj Okładka { get; set; }

        public enum Rodzaj { Twarda, Miękka }
    }
}