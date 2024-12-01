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
    /// Логика взаимодействия для PayPage.xaml
    /// </summary>
    public partial class PayPage : UserControl
    {
        public void hideMe()
        {
            Common.FancyChange(MainCanvas, 1);
        }

        public void showMe()
        {
            Common.FancyChange(MainCanvas);
            SumText.Content = Common.itogPrice.ToString();
        }
        public PayPage()
        {
            InitializeComponent();
        }

        private void CardNumberText_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if(!char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void DateCardText_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void CVVText_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void PAYMENTBUTTON_Click(object sender, RoutedEventArgs e)
        {
            if(CardNumberText.Text.Length != 16 || DateCardText.Text.Length != 5 || CVVText.Text.Length != 3)
            {
                ErrorText.Text = "Неверный формат данных!";
            }
            else
            {
                int month = Convert.ToInt32(DateCardText.Text.Split('/')[0]);
                int year = 2000 + Convert.ToInt32(DateCardText.Text.Split('/')[1]);
                if(month > 12)
                {
                    ErrorText.Text = "Введён некорректный месяц!";
                }
                else if(new DateTime(year, month, 1) < DateTime.Now)
                {
                    ErrorText.Text = "Введена карта с истёкшим сроком пользования!";
                }
                else
                {
                    ErrorText.Text = "Спасибо за покупку, будем ждать вас снова!";
                }
            }
            
        }

        private void DateCardText_TextChanged(object sender, TextChangedEventArgs e)
        {
            if(DateCardText.Text.Length == 2)
            {
                DateCardText.Text += '/';
                DateCardText.SelectionStart = DateCardText.Text.Length;
                DateCardText.SelectionLength = 0;
            }
        }
    }
}
