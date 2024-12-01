using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ProjectBeforeBD
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DateTime selectedDate = DateTime.Now;
        int currentWindow = 0;


        public MainWindow()
        {
            InitializeComponent();
            FirstPage firstPage = new FirstPage();
            RegistrationWindow registrationWindow = new RegistrationWindow();
            Authorization authorizationWindow = new Authorization();
            RaceChoose racePage = new RaceChoose();
            PayPage payPage = new PayPage();
            Common.TheMainWindow = this;
            Common.firstPage = firstPage;
            Common.registrationWindow = registrationWindow;
            Common.authorizationWindow = authorizationWindow;
            Common.racePage = racePage;
            Common.payPage = payPage;
            changeWindow(1);
        }

        public void changeWindow(int toPage)
        {
            switch (currentWindow)
            {
                case 1:
                    Common.firstPage.hideMe();
                    break;
                case 2:
                    Common.registrationWindow.hideMe();
                    break;
                case 3:
                    Common.authorizationWindow.hideMe();
                    break;
                case 4:
                    Common.racePage.hideMe();
                    break;
                case 5:
                    Common.payPage.hideMe();
                    break;
                default:
                    break;
            }

            switch (toPage)
            {
                case 1:
                    this.Content = Common.firstPage;
                    Common.firstPage.showMe();
                    break;
                case 2:
                    this.Content = Common.registrationWindow;
                    Common.registrationWindow.showMe();
                    break;
                case 3:
                    this.Content = Common.authorizationWindow;
                    Common.authorizationWindow.showMe();
                    break;
                case 4:
                    this.Content = Common.racePage;
                    Common.racePage.showMe();
                    break;
                case 5:
                    this.Content = Common.payPage;
                    Common.payPage.showMe();
                    break;
                default:
                    break;
            }
            currentWindow = toPage;
        }
        //---------------------------------------------------НАЧАЛО ОПИСАНИЯ ЭЛЕМЕНТОВ---------------------------------------------
        
    }
}