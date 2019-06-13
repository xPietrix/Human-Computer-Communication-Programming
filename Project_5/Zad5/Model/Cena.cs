using System.Xml.Serialization;

namespace Zad5.Model
{
    [XmlRoot("Cena")]
    public class Cena
    {
        [XmlAttribute("Waluta")]
        public string Waluta { get; set; }

        [XmlText]
        public string Wartość { get; set; }
    }
}
