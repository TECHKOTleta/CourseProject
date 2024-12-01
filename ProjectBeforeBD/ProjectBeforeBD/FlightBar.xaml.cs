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
using System.Windows.Media.Media3D;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ProjectBeforeBD
{
    /// <summary>
    /// Логика взаимодействия для FlightBar.xaml
    /// </summary>
    public partial class FlightBar : UserControl
    {
        public int global_index = -1;
        int local_index = -1;
        public int price = -1;
        public FlightBar(int global_index, int local_index, int price)
        {
            InitializeComponent();
            this.global_index = global_index;
            this.local_index = local_index;
            this.price = price;
            CostBlock.Text = price.ToString()+"руб";
        }

        private void SelectBut_Click(object sender, RoutedEventArgs e)
        {
            System.Diagnostics.Trace.WriteLine($"(Локальный индекс: {local_index})");
            Common.racePage.reselect(local_index);
            SelectBut.Content = "Выбран";
            Background.Fill = new SolidColorBrush(Color.FromArgb(100, 121, 187, 74));
        }
    }
}
