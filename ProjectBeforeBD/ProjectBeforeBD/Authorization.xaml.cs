using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : UserControl
    {
        string email = "";
        string password = "";

        public void hideMe()
        {
            Common.FancyChange(MainCanvas, 1);
        }

        public void showMe()
        {
            ErrorText.Text = "";
            Common.FancyChange(MainCanvas);
        }

        public Authorization() //основная функция---------------------------------------
        {
            InitializeComponent();
        }

        private void CreateAccBut_Click(object sender, RoutedEventArgs e)
        {
            email = EmailText.Text;
            password = PasswordText.Text;
            if(email == "" || password == "")
            {
                ErrorText.Text = "Заполните все поля!";
            }
            else
            {
                string testName = DataBase.TryAuthorise(email, password);
                if (testName == "-1")
                {
                    ErrorText.Text = "Неверное имя пользователя или пароль!";
                }
                else if(testName == "Error")
                {
                    ErrorText.Text = "Ошибка работы сервера, приносим свои извинения.";
                }
                else
                {
                    Common.userName = testName;
                    Common.currentEmail = email;
                    Common.firstPage.AccountEntered();
                    Common.TheMainWindow.changeWindow(1);
                }

            }
        }

        private void RegBut_Click(object sender, RoutedEventArgs e)
        {
            Common.TheMainWindow.changeWindow(2);
        }
    }
}
