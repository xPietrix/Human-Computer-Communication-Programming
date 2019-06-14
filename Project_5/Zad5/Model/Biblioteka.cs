using System;
using System.Collections.Generic;
using System.Xml.Serialization;

namespace DomowaBiblioteka
{
    [XmlRoot("Biblioteka", Namespace = "http://www.example.org/typy")]
    public class Biblioteka
    {
        [XmlElement("OpisDokumentu")]
        public OpisDokumentu OpisDokumentu { get; set; }

        [XmlArray("AutorzyKsiążek")]
        [XmlArrayItem("Autor")]
        public List<AutorKsiążki> Autorzy { get; set; }

        [XmlArray("ListaKsiążek")]
        [XmlArrayItem("Książka")]
        public List<Książka> Książki { get; set; }
    }
}
