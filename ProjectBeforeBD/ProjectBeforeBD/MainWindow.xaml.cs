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
        DateTime now = DateTime.Now;
        public void Preparations()
        {
            DateGrid.Visibility = Visibility.Hidden;
            CalendarSettings();
        }

        public void CalendarSettings(int monthAdd = 0)
        {    
            now = now.AddMonths(monthAdd);
            System.Diagnostics.Trace.WriteLine(now.ToString());
            DateTime startOfTheMonth = new DateTime(now.Year, now.Month, 1);
            int days = DateTime.DaysInMonth(now.Year, now.Month);
            int dayOfTheWeek = Convert.ToInt32(startOfTheMonth.DayOfWeek.ToString("d"))+1;
            System.Diagnostics.Trace.WriteLine(dayOfTheWeek);

            MonthLabl.Text = now.ToString("MMMM");
            CalenPanel.Children.Clear();

            for (int i = 1; i < dayOfTheWeek; i++)
            {
                Rectangle blank = new Rectangle();
                blank.Width = 22.0;
                blank.Height = 18.755;
                CalenPanel.Children.Add(blank);
            }

            for (int i = 1; i <= days; i++)
            {
                Button TextDate = new Button();
                TextDate.Width = 22.0;
                TextDate.Height = 18.755;
                TextDate.Content = i.ToString();
                TextDate.Click += MonthDayClick;
                if(i < DateTime.Now.Day && now.Month == DateTime.Now.Month ||  now.Month < DateTime.Now.Month)
                {
                    TextDate.IsEnabled = false;
                }
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

        private void BackMonthBut_Click(object sender, RoutedEventArgs e)
        {
            CalendarSettings(-1);
        }

        private void NextMonthBut_Click(object sender, RoutedEventArgs e)
        {
            CalendarSettings(+1);
        }

        public void MonthDayClick(object sender, RoutedEventArgs e)
        {
            Button thisBut = (Button)sender;
            now = now.AddDays(Convert.ToInt32(thisBut.Content)-now.Day);
            DateBut.Content = now.Date.ToString("dd/MM/yyyy");
            DateGrid.Visibility = Visibility.Hidden;
        }
    }
}