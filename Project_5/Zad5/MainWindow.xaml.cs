using System;
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


        public MainWindow()
        {
            InitializeComponent();
            Biblioteka = new Biblioteka();
            XML = new XmlManager(@"../../Data/biblioteka.xml", @"../../Data/biblioteka.xsd");
            TabControl.Visibility = Visibility.Hidden;
            TabControl.SelectedIndex = 4;

            //MessageBoxResult result = MessageBox.Show("Za chwilę nastąpi uruchomienie aplikacji...\n\nAutorzy:\nMateusz Kubicki (210238)\nPiotr Wasiak (210346)", "Otwieranie", MessageBoxButton.OK);

            OpenApplication();
            AutorzyListView.ItemsSource = Biblioteka.Autorzy;
            KsiążkiListView.ItemsSource = Biblioteka.Książki;
            OpisListView.ItemsSource = Biblioteka.OpisDokumentu.Autorzy;

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
                TabControl.Visibility = Visibility.Visible;
                MessageBox.Show("Pomyślnie wczytano plik " + XML.XmlFile.Name + ". \nDane zostały załadowane");
            }
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
                XML.SaveData(Biblioteka);
                AutorzyListView.ItemsSource = Biblioteka.Autorzy;
                DodajAutoraPopup.IsOpen = false;
                DodajAutoraIdTextBox.Text = "";
                DodajAutoraImięTextBox.Text = "";
                DodajAutoraNazwiskoTextBox.Text = "";
                DodajAutoraDataUrodzinDataPicker.SelectedDate = null;
                DodajAutoraMiejsceUrodzeniaTextBox.Text = "";
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

                DodajAutoraIdTextBox.Text = autor.ID;
                DodajAutoraImięTextBox.Text = autor.Imię;
                DodajAutoraNazwiskoTextBox.Text = autor.Nazwisko;
                DodajAutoraDataUrodzinDataPicker.SelectedDate = DateTime.Parse(autor.DataUrodzenia);
                DodajAutoraMiejsceUrodzeniaTextBox.Text = autor.MiejsceUrodzenia;
            }
        }

        private void AnulujEdytujAutoraButton_Click(object sender, RoutedEventArgs e)
        {
            EdytujAutoraPopup.IsOpen = false;
        }

        private void ZastosujEdytujAutoraButton_Click(object sender, RoutedEventArgs e)
        {
            //AutorKsiążki autorKsiążki = new AutorKsiążki
            //{
            //    ID = DodajAutoraIdTextBox.Text,
            //    Imię = DodajAutoraImięTextBox.Text,
            //    Nazwisko = DodajAutoraNazwiskoTextBox.Text,
            //    DataUrodzenia = DodajAutoraDataUrodzinDataPicker.SelectedDate.Value.ToString("yyyy-MM-dd"),
            //    MiejsceUrodzenia = DodajAutoraMiejsceUrodzeniaTextBox.Text
            //});

            //this.Biblioteka.Autorzy.Find(a => a.ID == DodajAutoraIdTextBox.Text) = new AutorKsiążki {
            //    ID = DodajAutoraIdTextBox.Text,
            //    Imię = DodajAutoraImięTextBox.Text,
            //    Nazwisko = DodajAutoraNazwiskoTextBox.Text,
            //    DataUrodzenia = DodajAutoraDataUrodzinDataPicker.SelectedDate.Value.ToString("yyyy-MM-dd"),
            //    MiejsceUrodzenia = DodajAutoraMiejsceUrodzeniaTextBox.Text
            //};

            //if (XML.ValidateXmlSchema(Biblioteka))
            //{
            //    XML.SaveData(Biblioteka);
            //    AutorzyListView.ItemsSource = Biblioteka.Autorzy;
            //    DodajAutoraPopup.IsOpen = false;
            //    DodajAutoraIdTextBox.Text = "";
            //    DodajAutoraImięTextBox.Text = "";
            //    DodajAutoraNazwiskoTextBox.Text = "";
            //    DodajAutoraDataUrodzinDataPicker.SelectedDate = null;
            //    DodajAutoraMiejsceUrodzeniaTextBox.Text = "";
            //}
            //else
            //{
            //    MessageBox.Show("Dane niezgodne z XML Schema!", "Błąd!");
            //    Biblioteka = XML.LoadData();
            //}
        }

        private void UsuńAutoraButton_Click(object sender, RoutedEventArgs e)
        {

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
                DodajKsiążkęPopup.IsOpen = true;
            }
        }

        private void AnulujDodajKsiążkęButton_Click(object sender, RoutedEventArgs e)
        {
            DodajKsiążkęPopup.IsOpen = false;
        }

        private void DodajDodajKsiążkęButton_Click(object sender, RoutedEventArgs e)
        {

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

        }

        private void UsuńKsiążkęButton_Click(object sender, RoutedEventArgs e)
        {

        }

        #endregion
        #region Wczytywanie i zapisywanie

        #endregion


        //private void Kliknięcie(object sender, MouseButtonEventArgs e)
        //{
        //    ListBox tmp = (ListBox)sender;
        //    Książka element = (Książka)tmp.SelectedItem;
        //    MessageBoxResult result = MessageBox.Show("Czy na pewno chcesz usunąć książkę " + element.Tytuł + "?", "Usuwanie", MessageBoxButton.YesNo);
        //    if (result == MessageBoxResult.Yes)
        //    {
        //        Biblioteka.Książki.RemoveAll(x => x.IdKsiążki == element.IdKsiążki);
        //        if (XML.ValidateXmlSchema(Biblioteka))
        //        {
        //            Biblioteka.Książki.Remove(element);
        //            XML.SaveData(Biblioteka);
        //        }
        //        else
        //        {
        //            MessageBox.Show("Edycja danych niezgodna z XML Schema!", "Błąd!");
        //            Biblioteka = XML.LoadData();
        //        }
        //    }
        //}

        //private void Dodawanie(object sender, RoutedEventArgs e)
        //{
        //    string login = string.Empty;

        //    try
        //    {
        //        //login = WalutaBox.Text.Substring(0, 2) + ImieBox.Text.Substring(0, 2).ToUpper() + NazwiskoBox.Text.Substring(0, 3).ToUpper();
        //    }
        //    catch
        //    {
        //        MessageBox.Show("Za krótkie imię lub nazwisko!", "Błąd!");
        //        return;

        //    }


        //    login = ProcessLogin(login);
        //    if (login == string.Empty) return;

        //    Biblioteka.ListaOsóbList.FirstOrDefault().OsobaList.Add(new Osoba()
        //    {
        //        Imie = ImieBox.Text,
        //        Nazwisko = NazwiskoBox.Text,
        //        Login = login
        //    });
        //    Zatrudnienie zatrudnienie = new Zatrudnienie()
        //    {
        //        IdOsoby = login,
        //        Imie = ImieBox.Text,
        //        Nazwisko = NazwiskoBox.Text
        //    };

        //    zatrudnienie.StanowiskoList = new List<string>();
        //    zatrudnienie.PlacaList = new List<Placa>();
        //    zatrudnienie.EtatList = new List<Etat>();
        //    zatrudnienie.DataZatrudnieniaList = new List<string>();

        //    zatrudnienie.StanowiskoList.Add(StanowiskoBox.Text);
        //    zatrudnienie.PlacaList.Add(new Placa() { Waluta = WalutaBox.Text, XValue = PlacaBox.Text });
        //    zatrudnienie.EtatList.Add(new Etat() { RodzajUmowy = UmowaBox.Text });
        //    zatrudnienie.DataZatrudnieniaList.Add(ZatrudnienieBox.Text);

        //    ZdefiniowanyDzial tmpDzial = (ZdefiniowanyDzial)DzialyBox.SelectedItem;
        //    Biblioteka.DziałList.FirstOrDefault(x => x.IdDzialu == tmpDzial.Id).ZatrudnienieList.Add(zatrudnienie);

        //    if (XML.ValidateXmlSchema(Biblioteka))
        //    {
        //        XML.SaveData(Biblioteka);
        //        Pracownicy = new ToolsUI.Pracownicy(Biblioteka);
        //        this.PracownicyListBox.DataContext = Pracownicy;
        //        ImieBox.Text = NazwiskoBox.Text = StanowiskoBox.Text = WalutaBox.Text = PlacaBox.Text = UmowaBox.Text = ZatrudnienieBox.Text = String.Empty;
        //    }
        //    else
        //    {
        //        MessageBox.Show("Edycja danych niezgodna z XML Schema!", "Błąd!");
        //        Biblioteka = XML.LoadData();
        //    }

        //}

        //private string ProcessLogin(string login)
        //{
        //    //if (Biblioteka.ListaOsóbList.FirstOrDefault().OsobaList.Any(element => element.Login == login))
        //    //{
        //    //    try
        //    //    {
        //    //        login = ProcessLogin(ChangeLogin(login));
        //    //    }
        //    //    catch (Exception)
        //    //    {
        //    //        MessageBox.Show("Nie można dodać pracownika.", "Błąd krytyczny");
        //    //        login = String.Empty;
        //    //    }
        //    //}
        //    return login;
        //}

        //private string ChangeLogin(string login)
        //{
        //    char last = login.Last();
        //    switch (last)
        //    {
        //        case '0':
        //            login = login.Substring(0, 6) + '1';
        //            break;
        //        case '1':
        //            login = login.Substring(0, 6) + '2';
        //            break;
        //        case '2':
        //            login = login.Substring(0, 6) + '3';
        //            break;
        //        case '3':
        //            login = login.Substring(0, 6) + '4';
        //            break;
        //        case '4':
        //            login = login.Substring(0, 6) + '5';
        //            break;
        //        case '5':
        //            login = login.Substring(0, 6) + '6';
        //            break;
        //        case '6':
        //            login = login.Substring(0, 6) + '7';
        //            break;
        //        case '7':
        //            login = login.Substring(0, 6) + '8';
        //            break;
        //        case '8':
        //            login = login.Substring(0, 6) + '9';
        //            break;
        //        case '9':
        //            throw new Exception();
        //        default:
        //            login = login.Substring(0, 6) + '0';
        //            break;
        //    }

        //    return login;
        //}
    }
}
