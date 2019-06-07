using System;
using System.Collections.Generic;
using System.Xml.Serialization;

namespace DomowaBiblioteka
{
    [XmlRoot("Biblioteka", Namespace = "http://www.example.org/typy")]
    public class Biblioteka
    {
        [XmlElement("OpisDokumentu", Namespace = "http://www.example.org/typy")]
        public OpisDokumentu OpisDokumentu { get; set; }

        [XmlArray("AutorzyKsiążek", Namespace = "http://www.example.org/typy")]
        [XmlArrayItem("Autor", Namespace = "http://www.example.org/typy")]
        public List<AutorKsiążki> Autorzy { get; set; }

        [XmlArray("ListaKsiążek", Namespace = "http://www.example.org/typy")]
        [XmlArrayItem("Książka", Namespace = "http://www.example.org/typy")]
        public List<Książka> Książki { get; set; }
    }
}
