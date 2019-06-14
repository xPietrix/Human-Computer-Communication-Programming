using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;

namespace DomowaBiblioteka
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public Biblioteka Biblioteka { get; set; }
        public XmlManager XML { get; set; }
        public List<string> MożliweWaluty = new List<string>() { "PLN", "USD", "EUR" };
        public List<string> MożliweGatunkiKsiążek = new List<string>() { "Fantasy", "Kryminał", "Obyczajowa", "Historyczna", "Biografia", "Dla dzieci" };
        public List<string> MożliweRodzajeOkładek = new List<string>() { "Twarda", "Miękka" };
        public List<string> MożliwiAutorzy = new List<string>();

        public MainWindow()
        {
            InitializeComponent();
            Biblioteka = new Biblioteka();
            XML = new XmlManager(@"../../Data/biblioteka.xml", @"../../Data/biblioteka.xsd", @"../../Data/txt.xsl", @"../../Data/txt.txt");

            TabControl.SelectedIndex = 3;

            OpenApplication();
        }

        private void OpenApplication()
        {
            if (!XML.XmlFile.Exists)
            {
                MessageBox.Show("Plik " + XML.XmlFile.FullName.ToString() + " nie istnieje. \nDanych nie załadowano", "Wczytywanie danych");
                TabControl.SelectedIndex = 3;
            }
            else
            {
                Biblioteka = XML.LoadData();

                AutorzyListView.ItemsSource = Biblioteka.Autorzy;
                KsiążkiListView.ItemsSource = Biblioteka.Książki;

                TytułDokumentuTextBox.Text = Biblioteka.OpisDokumentu.Tytuł;
                OpisListView.ItemsSource = Biblioteka.OpisDokumentu.Autorzy;
                XmlFileTextBox.Text = XML.XmlFile.FullName;
                XmlSchemaFileTextBox.Text = XML.SchemaFile.FullName;
                XsltFileTextBox.Text = XML.XsltFile.FullName;
                TxtFileTextBox.Text = XML.TxtFile.FullName;

                foreach (AutorKsiążki a in Biblioteka.Autorzy) MożliwiAutorzy.Add(a.ID);
                WypełnijComboBox(DodajKsiążkęRodzajOkładkiComboBox, MożliweRodzajeOkładek);
                WypełnijComboBox(EdytujKsiążkęRodzajZakładkiComboBox, MożliweRodzajeOkładek);
                WypełnijComboBox(DodajKsiążkęGatunekComboBox, MożliweGatunkiKsiążek);
                WypełnijComboBox(EdytujKsiążkęGatunekComboBox, MożliweGatunkiKsiążek);
                WypełnijComboBox(DodajKsiążkęWalutaComboBox, MożliweWaluty);
                WypełnijComboBox(EdytujKsiążkęWalutaComboBox, MożliweWaluty);
                WypełnijComboBox(DodajKsiążkęIdAutoraComboBox, MożliwiAutorzy);
                WypełnijComboBox(EdytujKsiążkęIdAutoraComboBox, MożliwiAutorzy);

                MessageBox.Show("Pomyślnie wczytano plik " + XML.XmlFile.Name + ". \nDane zostały załadowane");
            }
        }

        private void WypełnijComboBox(ComboBox c, List<string> l)
        {
            foreach (string s in l) c.Items.Add(s);
        }

        private void KsiążkiListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
        #region AutorPrzyciski

        private void DodajAutoraButton_Click(object sender, RoutedEventArgs e)
        {
            if(EdytujAutoraPopup.IsOpen) EdytujAutoraPopup.IsOpen = false;
            if(!DodajAutoraPopup.IsOpen)
            {
                DodajAutoraPopup.IsOpen = false;
                DodajAutoraPopup.PlacementTarget = sender as UIElement;
                DodajAutoraPopup.Placement = PlacementMode.Right;
                DodajAutoraPopup.AllowsTransparency = true;
                DodajAutoraPopup.PopupAnimation = PopupAnimation.Fade;

                DodajAutoraIdTextBox.Text = 'a' + (int.Parse(Biblioteka.Autorzy[Biblioteka.Autorzy.Count - 1].ID.Substring(1)) + 1).ToString();
                DodajAutoraPopup.IsOpen = true;
            }
        }

        private void AnulujDodajAutoraButton_Click(object sender, RoutedEventArgs e)
        {
            DodajAutoraPopup.IsOpen = false;
        }

        private void DodajDodajAutoraButton_Click(object sender, RoutedEventArgs e)
        {
            this.Biblioteka.Autorzy.Add(new AutorKsiążki
            {
                ID = DodajAutoraIdTextBox.Text,
                Imię = DodajAutoraImięTextBox.Text,
                Nazwisko = DodajAutoraNazwiskoTextBox.Text,
                DataUrodzenia = DodajAutoraDataUrodzinDataPicker.SelectedDate.Value.ToString("yyyy-MM-dd"),
                MiejsceUrodzenia = DodajAutoraMiejsceUrodzeniaTextBox.Text
            });

            if (XML.ValidateXmlSchema(Biblioteka))
            {
                DodajAutoraPopup.IsOpen = false;
                DodajAutoraIdTextBox.Text = "";
                DodajAutoraImięTextBox.Text = "";
                DodajAutoraNazwiskoTextBox.Text = "";
                DodajAutoraDataUrodzinDataPicker.SelectedDate = null;
                DodajAutoraMiejsceUrodzeniaTextBox.Text = "";

                XML.SaveData(Biblioteka);
                Biblioteka = XML.LoadData();
                AutorzyListView.ItemsSource = Biblioteka.Autorzy;

                MożliwiAutorzy = new List<string>();
                foreach (AutorKsiążki a in Biblioteka.Autorzy) MożliwiAutorzy.Add(a.ID);
            }
            else
            {
                MessageBox.Show("Dane niezgodne z XML Schema!", "Błąd!");
                Biblioteka = XML.LoadData();
            }
        }

        private void EdytujAutoraButton_Click(object sender, RoutedEventArgs e)
        {
            if (AutorzyListView.SelectedItem == null) return;
            if (DodajAutoraPopup.IsOpen) DodajAutoraPopup.IsOpen = false;
            if(!EdytujAutoraPopup.IsOpen && AutorzyListView.SelectedItem != null)
            {
                AutorKsiążki autor = (AutorKsiążki)AutorzyListView.SelectedItem;
                EdytujAutoraPopup.IsOpen = false;
                EdytujAutoraPopup.PlacementTarget = sender as UIElement;
                EdytujAutoraPopup.Placement = PlacementMode.Right;
                EdytujAutoraPopup.AllowsTransparency = true;
                EdytujAutoraPopup.PopupAnimation = PopupAnimation.Fade;
                EdytujAutoraPopup.IsOpen = true;

                EdytujAutoraIdTextBox.Text = autor.ID;
                EdytujAutoraImięTextBox.Text = autor.Imię;
                EdytujAutoraNazwiskoTextBox.Text = autor.Nazwisko;
                EdytujAutoraDataUrodzeniaDatePicker.SelectedDate = DateTime.Parse(autor.DataUrodzenia);
                EdytujAutoraMiejsceUrodzeniaTextBox.Text = autor.MiejsceUrodzenia;
            }
        }

        private void AnulujEdytujAutoraButton_Click(object sender, RoutedEventArgs e)
        {
            EdytujAutoraPopup.IsOpen = false;
        }

        private void ZastosujEdytujAutoraButton_Click(object sender, RoutedEventArgs e)
        {
            AutorKsiążki WybranyAutor = (AutorKsiążki)AutorzyListView.SelectedItem;
            AutorKsiążki autorKsiążki = Biblioteka.Autorzy.Find(a => a.ID == WybranyAutor.ID);
            autorKsiążki.ID = EdytujAutoraIdTextBox.Text;
            autorKsiążki.Imię = EdytujAutoraImięTextBox.Text;
            autorKsiążki.Nazwisko = EdytujAutoraNazwiskoTextBox.Text;
            autorKsiążki.DataUrodzenia = EdytujAutoraDataUrodzeniaDatePicker.SelectedDate.Value.ToString("yyyy-MM-dd");
            autorKsiążki.MiejsceUrodzenia = EdytujAutoraMiejsceUrodzeniaTextBox.Text;

            if (XML.ValidateXmlSchema(Biblioteka))
            {
                EdytujAutoraPopup.IsOpen = false;
                EdytujAutoraIdTextBox.Text = "";
                EdytujAutoraImięTextBox.Text = "";
                EdytujAutoraNazwiskoTextBox.Text = "";
                EdytujAutoraDataUrodzeniaDatePicker.SelectedDate = null;
                EdytujAutoraMiejsceUrodzeniaTextBox.Text = "";

                XML.SaveData(Biblioteka);
                Biblioteka = XML.LoadData();
                AutorzyListView.ItemsSource = Biblioteka.Autorzy;

                MożliwiAutorzy = new List<string>();
                foreach (AutorKsiążki a in Biblioteka.Autorzy) MożliwiAutorzy.Add(a.ID);
            }
            else
            {
                MessageBox.Show("Dane niezgodne z XML Schema!", "Błąd!");
                Biblioteka = XML.LoadData();
            }
        }

        private void UsuńAutoraButton_Click(object sender, RoutedEventArgs e)
        {
            AutorKsiążki autor = (AutorKsiążki)AutorzyListView.SelectedItem;
            if (Biblioteka.Książki.Exists(k => k.Autor == autor.ID)) { MessageBox.Show("Nie można usunąć autora, ponieważ dokument nadal posiada książki tego autora. Usuń najpierw jego książki.", "Błąd"); return; }

            MessageBoxResult result = MessageBox.Show("Czy na pewno chcesz usunąć autora " + autor.Imię + " " + autor.Nazwisko +"?", "Usuwanie", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                Biblioteka.Autorzy.RemoveAll(x => x.ID == autor.ID);
                if (XML.ValidateXmlSchema(Biblioteka))
                {
                    Biblioteka.Autorzy.Remove(autor);

                    XML.SaveData(Biblioteka);
                    Biblioteka = XML.LoadData();
                    AutorzyListView.ItemsSource = Biblioteka.Autorzy;

                    MożliwiAutorzy = new List<string>();
                    foreach (AutorKsiążki a in Biblioteka.Autorzy) MożliwiAutorzy.Add(a.ID);

                }
                else
                {
                    MessageBox.Show("Edycja danych niezgodna z XML Schema!", "Błąd!");
                    Biblioteka = XML.LoadData();
                }
            }
        }

        #endregion
        #region KsiążkaPrzyciski

        private void DodajKsiążkęButton_Click(object sender, RoutedEventArgs e)
        {
            if (EdytujKsiążkęPopup.IsOpen) EdytujKsiążkęPopup.IsOpen = false;
            if (!DodajKsiążkęPopup.IsOpen)
            {
                DodajKsiążkęPopup.IsOpen = false;
                DodajKsiążkęPopup.PlacementTarget = sender as UIElement;
                DodajKsiążkęPopup.Placement = PlacementMode.Right;
                DodajKsiążkęPopup.AllowsTransparency = true;
                DodajKsiążkęPopup.PopupAnimation = PopupAnimation.Fade;

                DodajKsiążkęIdTextBox.Text = 'k' + (int.Parse(Biblioteka.Książki[Biblioteka.Książki.Count - 1].IdKsiążki.Substring(1))+1).ToString();

                DodajKsiążkęPopup.IsOpen = true;
            }
        }

        private void AnulujDodajKsiążkęButton_Click(object sender, RoutedEventArgs e)
        {
            DodajKsiążkęPopup.IsOpen = false;
        }

        private void DodajDodajKsiążkęButton_Click(object sender, RoutedEventArgs e)
        {
            this.Biblioteka.Książki.Add(new Książka
            {
                IdKsiążki = DodajKsiążkęIdTextBox.Text,
                Tytuł = DodajKsiążkęTytułTextBox.Text,
                Autor = DodajKsiążkęIdAutoraComboBox.Text,
                Gatunek = DodajKsiążkęGatunekComboBox.Text,
                DataWydania = DodajKsiążkęDataWydaniaDatePicker.SelectedDate.Value.ToString("yyyy-MM-dd"),
                Okładka = new RodzajOkładki() { Okładka = DodajKsiążkęRodzajOkładkiComboBox.Text },
                KosztKsiążki = new Zad5.Model.Cena
                {
                    Wartość = DodajKsiążkęCenaTextBox.Text,
                    Waluta = DodajKsiążkęWalutaComboBox.Text
                }
            });

            if (XML.ValidateXmlSchema(Biblioteka))
            {
                DodajKsiążkęPopup.IsOpen = false;

                XML.SaveData(Biblioteka);
                Biblioteka = XML.LoadData();
                KsiążkiListView.ItemsSource = Biblioteka.Książki;
            }
            else
            {
                MessageBox.Show("Dane niezgodne z XML Schema!", "Błąd!");
                Biblioteka = XML.LoadData();
            }
        }

        private void EdytujKsiążkęButton_Click(object sender, RoutedEventArgs e)
        {
            if (DodajKsiążkęPopup.IsOpen) DodajKsiążkęPopup.IsOpen = false;
            if (!EdytujKsiążkęPopup.IsOpen && KsiążkiListView.SelectedItem != null)
            {
                EdytujKsiążkęPopup.IsOpen = false;
                EdytujKsiążkęPopup.PlacementTarget = sender as UIElement;
                EdytujKsiążkęPopup.Placement = PlacementMode.Right;
                EdytujKsiążkęPopup.AllowsTransparency = true;
                EdytujKsiążkęPopup.PopupAnimation = PopupAnimation.Fade;
                EdytujKsiążkęPopup.IsOpen = true;
            }
        }

        private void AnulujEdytujKsiążkęButton_Click(object sender, RoutedEventArgs e)
        {
            EdytujKsiążkęPopup.IsOpen = false;
        }

        private void ZastosujEdytujKsiążkęButton_Click(object sender, RoutedEventArgs e)
        {
            Książka WybranaKsiążka = (Książka)KsiążkiListView.SelectedItem;
            Książka książka = Biblioteka.Książki.Find(k => k.IdKsiążki == WybranaKsiążka.IdKsiążki);

            książka.IdKsiążki = EdytujKsiążkęIdTextBox.Text;
            książka.Tytuł = EdytujKsiążkęTytułTextBox.Text;
            książka.Autor = EdytujKsiążkęIdAutoraComboBox.Text;
            książka.Gatunek = EdytujKsiążkęGatunekComboBox.Text;
            książka.DataWydania = EdytujKsiążkęDataWydaniaDatePicker.SelectedDate.Value.ToString("yyyy-MM-dd");
            książka.Okładka.Okładka = EdytujKsiążkęRodzajZakładkiComboBox.Text;
            książka.KosztKsiążki = new Zad5.Model.Cena
            {
                Wartość = EdytujKsiążkęCenaTextBox.Text,
                Waluta = EdytujKsiążkęWalutaComboBox.Text
            };

            if (XML.ValidateXmlSchema(Biblioteka))
            {
                EdytujAutoraPopup.IsOpen = false;
                EdytujAutoraIdTextBox.Text = "";
                EdytujAutoraImięTextBox.Text = "";
                EdytujAutoraNazwiskoTextBox.Text = "";
                EdytujAutoraDataUrodzeniaDatePicker.SelectedDate = null;
                EdytujAutoraMiejsceUrodzeniaTextBox.Text = "";

                XML.SaveData(Biblioteka);
                Biblioteka = XML.LoadData();
                KsiążkiListView.ItemsSource = Biblioteka.Książki;
            }
            else
            {
                MessageBox.Show("Dane niezgodne z XML Schema!", "Błąd!");
                Biblioteka = XML.LoadData();
            }
        }

        private void UsuńKsiążkęButton_Click(object sender, RoutedEventArgs e)
        {
            Książka książka = (Książka)KsiążkiListView.SelectedItem;
            MessageBoxResult result = MessageBox.Show("Czy na pewno chcesz usunąć książkę " + książka.Tytuł + "?", "Usuwanie", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                Biblioteka.Książki.RemoveAll(x => x.IdKsiążki == książka.IdKsiążki);
                if (XML.ValidateXmlSchema(Biblioteka))
                {
                    Biblioteka.Książki.Remove(książka);

                    XML.SaveData(Biblioteka);
                    Biblioteka = XML.LoadData();
                    KsiążkiListView.ItemsSource = Biblioteka.Książki;
                }
                else
                {
                    MessageBox.Show("Edycja danych niezgodna z XML Schema!", "Błąd!");
                    Biblioteka = XML.LoadData();
                }
            }
        }

        #endregion

        #region Wczytywanie i zapisywanie
        private void ZaładujXMLButton_Click(object sender, RoutedEventArgs e)
        {
            XML.XmlFile = new System.IO.FileInfo(XmlFileTextBox.Text);
            OpenApplication();
        }

        private void ZapiszXMLButton_Click(object sender, RoutedEventArgs e)
        {
            XML.XmlFile = new System.IO.FileInfo(XmlFileTextBox.Text);
            XML.SaveData(Biblioteka);
            MessageBox.Show("Dane zostały zapisane pomyślnie w pliku " + XML.XmlFile.Name + ".");
        }

        private void WalidujXmlButton_Click(object sender, RoutedEventArgs e)
        {
            XML.XmlFile = new System.IO.FileInfo(XmlFileTextBox.Text);
            XML.SchemaFile = new System.IO.FileInfo(XmlSchemaFileTextBox.Text);
            XML.LoadData();
            if(XML.ValidateXmlSchema(Biblioteka)) MessageBox.Show("Weryfikacja danych przebiegła pomyślnie. \nDane są zgodne z XML Schema.");
            else MessageBox.Show("Dane niezgodne z XML Schema!", "Błąd!");
        }

        private void TransformujDoTxtButton_Click(object sender, RoutedEventArgs e)
        {
            XML.XsltFile = new System.IO.FileInfo(XsltFileTextBox.Text);
            XML.TxtFile = new System.IO.FileInfo(TxtFileTextBox.Text);
            XML.TransformXmlToTxt();
            MessageBox.Show("Transformacja została zakonćzona.");
        }
        #endregion

    }
}
