using System;
using System.IO;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;

namespace DomowaBiblioteka
{
    public class XmlManager
    {
        public FileInfo XmlFile { get; set; }
        public FileInfo SchemaFile { get; set; }
        XmlSerializer Serializer { get; set; }

        public XmlManager(string xmlFile, string schemaFile)
        {
            XmlFile = new FileInfo(xmlFile);
            SchemaFile = new FileInfo(schemaFile);
            Serializer = new XmlSerializer(typeof(Biblioteka));
        }

        public Biblioteka LoadData()
        {
            Biblioteka biblioteka = null;
            if (XmlFile.Exists)
            {
                using (TextReader textReader = new StreamReader(XmlFile.FullName))
                {
                    biblioteka = (Biblioteka)Serializer.Deserialize(textReader);
                    textReader.Close();
                }
            }
            else throw new IOException();

            return biblioteka;
        }

        public void SaveData(Biblioteka firma)
        {
            if (XmlFile.Exists) XmlFile.Delete();

            Stream stream = new FileStream(XmlFile.FullName, FileMode.Create);
            Serializer.Serialize(stream, firma);
            stream.Close();
        }

        public void SaveCopy(Biblioteka firma)
        {
            FileInfo tmp = new FileInfo("copy.xml");

            if (tmp.Exists) tmp.Delete();

            Stream stream = new FileStream(tmp.FullName, FileMode.Create);
            Serializer.Serialize(stream, firma);
            stream.Close();
        }

        public bool ValidateXmlSchema(Biblioteka firma)
        {
            try
            {
                SaveCopy(firma);

                XmlDocument xmld = new XmlDocument();
                string xmlText = File.ReadAllText("copy.xml");
                xmld.LoadXml(xmlText);
                xmld.Schemas.Add("http://www.example.org/typy", SchemaFile.FullName);
                xmld.Validate(ValidationCallBack);
                return true;
            }
            catch
            {
                return false;
            }
        }

        private void ValidationCallBack(object sender, ValidationEventArgs e)
        {
            throw new Exception();
        }
    }
}
