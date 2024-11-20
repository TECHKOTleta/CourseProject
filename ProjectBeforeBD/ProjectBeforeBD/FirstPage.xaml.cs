using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ProjectBeforeBD
{
    /// <summary>
    /// Логика взаимодействия для FirstPage.xaml
    /// </summary>
    public partial class FirstPage : UserControl
    {
        DateTime selectedDate = DateTime.Now;
        int[] agesPassangers = [1, 0, 0];
        public void Preparations()                              //действия при инициализации
        {
            DateGrid.Visibility = Visibility.Hidden;
            CalendarSettings();
            AgeGrid.Visibility = Visibility.Hidden;
            Common.FancyChange(MainCanvas);
        }

        public void CalendarSettings(int monthAdd = 0)        //первичные и повторные настройки календаря
        {
            selectedDate = selectedDate.AddMonths(monthAdd);
            //System.Diagnostics.Trace.WriteLine(selectedDate.ToString());
            DateTime startOfTheMonth = new DateTime(selectedDate.Year, selectedDate.Month, 1);
            int days = DateTime.DaysInMonth(selectedDate.Year, selectedDate.Month);
            int dayOfTheWeek = Convert.ToInt32(startOfTheMonth.DayOfWeek.ToString("d")) + 1;
            //System.Diagnostics.Trace.WriteLine(dayOfTheWeek);

            MonthLabl.Text = selectedDate.ToString("MMMM") + " " + selectedDate.Year;
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
                if ((i < DateTime.Now.Day && selectedDate.Month == DateTime.Now.Month && selectedDate.Year == DateTime.Now.Year) || (selectedDate.Month < DateTime.Now.Month && selectedDate.Year == DateTime.Now.Year) || selectedDate.Year < DateTime.Now.Year || selectedDate.Month - DateTime.Now.Month + (selectedDate.Year-DateTime.Now.Year)*12 > 6)
                {
                    TextDate.IsEnabled = false;
                }
                CalenPanel.Children.Add(TextDate);
            }
        }

        private void saveResoults()
        {
            Common.fromPlace = Convert.ToString(FromBox.SelectionBoxItem);
            Common.toPlace = Convert.ToString(ToBox.SelectionBoxItem);
            Common.ticketType = Convert.ToString(PassagerBox.SelectionBoxItem);
            Common.selectedDate = selectedDate;
        }

        public void hideMe()
        {
            Common.FancyChange(MainCanvas, 1);
        }

        public void showMe()
        {
            Common.FancyChange(MainCanvas);
        }

        public void AccountEntered()
        {
            AuthBut.Visibility = Visibility.Hidden;
            RegBut.Visibility = Visibility.Hidden;
            AuthLabel.Content = $"Вы вошли в аккаунт!\nЗдравствуйте, {Common.userName}";
        }

        public FirstPage()
        {
            InitializeComponent();
            Preparations();
        }

        //---------------------------------------------------НАЧАЛО ОПИСАНИЯ ЭЛЕМЕНТОВ---------------------------------------------
        private void DateBut_Click(object sender, RoutedEventArgs e)     //появление календаря
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

        public void MonthDayClick(object sender, RoutedEventArgs e)    //сгенерированная кнопка календаря
        {
            Button thisBut = (Button)sender;
            selectedDate = selectedDate.AddDays(Convert.ToInt32(thisBut.Content) - selectedDate.Day);
            Common.selectedDate = selectedDate;
            DateBut.Content = selectedDate.Date.ToString("dd/MM/yyyy");
            DateGrid.Visibility = Visibility.Hidden;

        }

        private void AgeBut_Click(object sender, RoutedEventArgs e)     //появление билетов по возрастам
        {
            AgeGrid.Visibility = Visibility.Visible;
        }

        //кнопки возрастов----------------------------->
        private void LButAdult_Click(object sender, RoutedEventArgs e)
        {
            if (CountAdult.Text != "1")
            {
                CountAdult.Text = (Convert.ToInt32(CountAdult.Text) - 1).ToString();
            }

        }

        private void RButAdult_Click(object sender, RoutedEventArgs e)
        {
            CountAdult.Text = (Convert.ToInt32(CountAdult.Text) + 1).ToString();
        }

        private void LButChild_Click(object sender, RoutedEventArgs e)
        {
            if (CountChild.Text != "0")
            {
                CountChild.Text = (Convert.ToInt32(CountChild.Text) - 1).ToString();
            }
        }

        private void RButChild_Click(object sender, RoutedEventArgs e)
        {
            CountChild.Text = (Convert.ToInt32(CountChild.Text) + 1).ToString();
        }

        private void LButToddler_Click(object sender, RoutedEventArgs e)
        {
            if (CountToddler.Text != "0")
            {
                CountToddler.Text = (Convert.ToInt32(CountToddler.Text) - 1).ToString();
            }
        }

        private void RButToddler_Click(object sender, RoutedEventArgs e)
        {
            CountToddler.Text = (Convert.ToInt32(CountToddler.Text) + 1).ToString();
        }
        //<-------------------------------------конец кнопок возрастов

        private void SubmitAgeBut_Click(object sender, RoutedEventArgs e)
        {
            agesPassangers = [Convert.ToInt32(CountAdult.Text), Convert.ToInt32(CountChild.Text), Convert.ToInt32(CountToddler.Text)];
            AgeGrid.Visibility = Visibility.Hidden;
            string ageContent = "";
            if (agesPassangers.Count(i => i == 0) == 0)
            {
                ageContent = $"Взр: {agesPassangers[0]}, Дети: {agesPassangers[1]}, Млд: {agesPassangers[2]}";
            }
            else if (agesPassangers.Count(i => i == 0) == 2)
            {
                ageContent = $"Взрослые: {agesPassangers[0]}";
            }
            else if (agesPassangers[1] == 0)
            {
                ageContent = $"Взрос: {agesPassangers[0]}, Младен: {agesPassangers[2]}";
            }
            else
            {
                ageContent = $"Взрослые: {agesPassangers[0]}, Дети: {agesPassangers[1]}";
            }
            AgeBut.Content = ageContent;
            Common.agesPassangers = agesPassangers;
        }


        private void ToSecondWindowBut_Click(object sender, RoutedEventArgs e)
        {
            saveResoults();
            //Common.FancyChange(FirstCanvas, 1);
        }

        private void RegBut_Click(object sender, RoutedEventArgs e)
        {
            saveResoults();
            Common.TheMainWindow.changeWindow(2);
        }

        private void AuthBut_Click(object sender, RoutedEventArgs e)
        {
            saveResoults();
            Common.TheMainWindow.changeWindow(3);
        }
    }
}
