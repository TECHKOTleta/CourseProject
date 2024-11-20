using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
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
    /// Логика взаимодействия для RegistrationWindow.xaml
    /// </summary>
    public partial class RegistrationWindow : UserControl
    {
        DateTime selectedDate = DateTime.Now;
        string name = "";
        string surName = "";
        string thirdName = "";
        string FIO = "";
        int age = -1;
        string gender = "";
        string passportSer = "";
        string passportNum = "";
        string email = "";
        string password = "";
        //string errorReg = "";

        public void Preparations()                              //действия при инициализации
        {
            DateGrid.Visibility = Visibility.Hidden;
            CalendarSettings();
            Common.FancyChange(MainCanvas);
        }

        public void CalendarSettings(int monthAdd = 0, int yearAdd = 0)        //первичные и повторные настройки календаря
        {
            selectedDate = selectedDate.AddMonths(monthAdd);
            selectedDate = selectedDate.AddYears(yearAdd);
            //System.Diagnostics.Trace.WriteLine(selectedDate.ToString());
            DateTime startOfTheMonth = new DateTime(selectedDate.Year, selectedDate.Month, 1);
            int days = DateTime.DaysInMonth(selectedDate.Year, selectedDate.Month);
            int dayOfTheWeek = Convert.ToInt32(startOfTheMonth.DayOfWeek.ToString("d")) + 1;
            //System.Diagnostics.Trace.WriteLine(dayOfTheWeek);

            YearLabl.Text = selectedDate.Year.ToString();
            MonthLabl.Text = selectedDate.ToString("MMMM");
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
                if (i > DateTime.Now.Day && selectedDate.Month == DateTime.Now.Month && selectedDate.Year == DateTime.Now.Year || selectedDate.Month > DateTime.Now.Month && selectedDate.Year == DateTime.Now.Year || selectedDate.Year > DateTime.Now.Year)
                {
                    TextDate.IsEnabled = false;
                }
                CalenPanel.Children.Add(TextDate);
            }
        }

        public void checkAll()  //проверка всех параметров
        {
            string pattern = @"\P{IsCyrillic}";
            if (new[] {name, surName, thirdName, gender, email, password, passportSer, passportNum }.Any(x => x == "") || age == -1)
            {
                ErrorText.Text = "Заполните все поля!";
            }
            else if (!(!Regex.IsMatch(name, pattern) && !Regex.IsMatch(surName, pattern) && !Regex.IsMatch(thirdName, pattern)))
            {
                ErrorText.Text = "Имя, Фамилия и Отчество должны состоять только из кириллических букв!";
            }
            else if (selectedDate >= DateTime.Now.AddYears(-18)) {
                ErrorText.Text = "Создать аккаунт могут только лица старше 18 лет!";
            }
            else if (passportSer.Length != 4 || passportNum.Length != 6 || new[] {passportSer, passportNum}.Any(x => !Regex.IsMatch(x, @"^\d+$")))
            {
                ErrorText.Text = "Введите кооректные пасспортные данные!";
            }
            else if (!Regex.IsMatch(email, @"^[a-zA-Z0-9_.-]+@[a-zA-Z]+?\.[a-zA-Z]{2,6}"))
            {
                ErrorText.Text = "Введите корректную почту!";
            }
            else if (DataBase.IsAlreadyExists(email))
            {
                ErrorText.Text = "Пользователь с такой почтой уже существует. Проверьте правильность написания или войдите по кнопке выше.";
            }
            else if (!Regex.IsMatch(password, @"^(?=.*[A-Z])(?=.*\d)[a-zA-Z0-9!@#№$%^&*()_=+:;/\\-]{6,25}$"))
            {
                ErrorText.Text = "Пароль может состоять только из латинских букв, цифр и спецсимволов, должен иметь одну заглавную букву и одну цифру и быть от 6 до 25 символов";
            }
            else if(password != PasswordAgainText.Text)
            {
                ErrorText.Text = "Пароли должны совпадать!";
            }
            else
            {
                ErrorText.Text = "Норм. Пойдёт.";
                //FIO = reformText.ToTitleCase(surName) + " " + reformText.ToTitleCase(name) + " " + reformText.ToTitleCase(thirdName);
                DataBase.InsertUser(new string[] {name, surName, thirdName, selectedDate.ToString("yyyy-MM-dd"), gender, passportSer, passportNum, email, password});
                Common.userName = name;
                Common.firstPage.AccountEntered();
                Common.TheMainWindow.changeWindow(1);
            }
        }

        public void hideMe()
        {
            Common.FancyChange(MainCanvas, 1);
        }

        public void showMe()
        {
            Common.FancyChange(MainCanvas);
        }

        public RegistrationWindow()
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

        private void BackYearBut_Click(object sender, RoutedEventArgs e)
        {
            CalendarSettings(0, -1);
        }

        private void NextYearBut_Click(object sender, RoutedEventArgs e)
        {
            CalendarSettings(0, 1);
        }

        public void MonthDayClick(object sender, RoutedEventArgs e)    //сгенерированная кнопка календаря
        {
            Button thisBut = (Button)sender;
            selectedDate = selectedDate.AddDays(Convert.ToInt32(thisBut.Content) - selectedDate.Day);
            DateBut.Content = selectedDate.Date.ToString("dd/MM/yyyy");
            DateGrid.Visibility = Visibility.Hidden;

        }

        private void CreateAccBut_Click(object sender, RoutedEventArgs e)
        {
            TextInfo reformText = CultureInfo.CurrentCulture.TextInfo;
            name = reformText.ToTitleCase(NameText.Text);
            surName = reformText.ToTitleCase(SurnameText.Text);
            thirdName = reformText.ToTitleCase(ThirdnameText.Text);
            age = DateTime.Now.Year - selectedDate.Year;
            if (FemaleBut.IsChecked == true)
            {
                gender = "Женский";
            }
            else
            {
                gender = "Мужской";
            }
            passportSer = PassportSerText.Text;
            passportNum = PassportNumText.Text;
            email = EmailText.Text;
            password = PasswordText.Text; 
            checkAll();

            
        }

        private void LogInBut_Click(object sender, RoutedEventArgs e)
        {
            Common.TheMainWindow.changeWindow(3);
        }
    }
}
