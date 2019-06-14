using System;
using System.IO;
using System.Net;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using System.Xml.XPath;
using System.Xml.Xsl;

namespace DomowaBiblioteka
{
    public class XmlManager
    {
        public FileInfo XmlFile { get; set; }
        public FileInfo SchemaFile { get; set; }
        public FileInfo XsltFile { get; set; }
        public FileInfo TxtFile { get; set; }
        private XmlSerializer Serializer { get; set; }

        public XmlManager(string xmlFile, string schemaFile, string xsltFile, string txtFile)
        {
            XmlFile = new FileInfo(xmlFile);
            SchemaFile = new FileInfo(schemaFile);
            XsltFile = new FileInfo(xsltFile);
            TxtFile = new FileInfo(txtFile);
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

        public void SaveData(Biblioteka biblioteka)
        {
            if (XmlFile.Exists) XmlFile.Delete();

            Stream stream = new FileStream(XmlFile.FullName, FileMode.Create);
            Serializer.Serialize(stream, biblioteka);
            stream.Close();
        }

        public void SaveCopy(Biblioteka biblioteka)
        {
            FileInfo tmp = new FileInfo("copy.xml");

            if (tmp.Exists) tmp.Delete();

            Stream stream = new FileStream(tmp.FullName, FileMode.Create);
            Serializer.Serialize(stream, biblioteka);
            stream.Close();
        }

        public bool ValidateXmlSchema(Biblioteka biblioteka)
        {
            try
            {
                SaveCopy(biblioteka);

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

        public void TransformXmlToTxt()
        {
            // reading source and transformation file
            XmlDocument sourceXmlDocument = new XmlDocument();
            sourceXmlDocument.Load(XmlFile.FullName);
            string test = "";
            using (TextReader textReader = new StreamReader(XsltFile.FullName))
            {
                test = textReader.ReadToEnd();
            }

            XmlUrlResolver resolver = new XmlUrlResolver();
            resolver.Credentials = CredentialCache.DefaultCredentials;

            XslCompiledTransform transformer = new XslCompiledTransform();
            transformer.Load(new XPathDocument(XsltFile.FullName), XsltSettings.Default, resolver);


            MemoryStream outputStream = new MemoryStream();
            XmlWriter xmlWriter = XmlWriter.Create(outputStream, transformer.OutputSettings);
            transformer.Transform(sourceXmlDocument, null, xmlWriter);
            outputStream.Position = 0;
            StreamReader streamReader = new StreamReader(outputStream);
            using (TextWriter textWriter = new StreamWriter(TxtFile.FullName))
            {
                textWriter.Write(streamReader.ReadToEnd());
            }
        }
    }
}
