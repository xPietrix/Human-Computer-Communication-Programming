using System.Windows;
using System.Windows.Controls;

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
            TabControl.SelectedIndex = 3;

            //MessageBoxResult result = MessageBox.Show("Za chwilę nastąpi uruchomienie aplikacji...\n\nAutorzy:\nMateusz Kubicki (210238)\nPiotr Wasiak (210346)", "Otwieranie", MessageBoxButton.OK);

            OpenApplication();
            AutorzyListView.ItemsSource = Biblioteka.Autorzy;
            KsiążkiListView.ItemsSource = Biblioteka.Książki;
            OpisListView.ItemsSource = Biblioteka.OpisDokumentu;
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

        //    /*Biblioteka.ListaOsóbList.FirstOrDefault().OsobaList.Add(new Osoba()
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
        //    */
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
