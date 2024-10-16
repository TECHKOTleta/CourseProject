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
        public void Preparations()
        {
            DateGrid.Visibility = Visibility.Hidden;
            CalendarSettings();
        }

        public void CalendarSettings()
        {
            DateTime now = DateTime.Now;
            DateTime startOfTheMonth = new DateTime(now.Year, now.Month, 1);
            int days = DateTime.DaysInMonth(now.Year, now.Month);
            int dayOfTheWeek = Convert.ToInt32(startOfTheMonth.DayOfWeek.ToString("d"))+1;
            
            
            for (int i = 1; i < dayOfTheWeek; i++)
            {
                Rectangle blank = new Rectangle();
                blank.Width = 22.5;
                blank.Height = 18.755;
                CalenPanel.Children.Add(blank);
            }

            for (int i = 1; i < days; i++)
            {
                Button TextDate = new Button();
                TextDate.Width = 22.5;
                TextDate.Height = 18.755;
                TextDate.Content = i.ToString();
                CalenPanel.Children.Add(TextDate);
            }
        }
        public MainWindow()
        {
            InitializeComponent();
            Preparations();
        }


        //---------------------------------------------------НАЧАЛО ОПИСАНИЯ ЭЛЕМЕНТОВ---------------------------------------------
        private void DateBut_Click(object sender, RoutedEventArgs e)
        {
            DateGrid.Visibility = (DateGrid.Visibility == Visibility.Visible) ? Visibility.Hidden : Visibility.Visible;
        }
    }
}