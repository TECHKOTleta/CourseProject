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
    /// Логика взаимодействия для RaceChoose.xaml
    /// </summary>
    public partial class RaceChoose : UserControl
    {
        int globalSelectedIndex = -1;
        int selectedRaceInd = -1;
        int basicPrice = -1;
        int payingPassangers = -1;
        float luggageMultiplier = -1f;
        int vegetableMultiplier = -1;
        int itogPrice = -1;
        float classMultiplier = -1;
        public void hideMe()
        {
            Common.FancyChange(MainCanvas, 1);
        }

        public void showMe()
        {
            Common.FancyChange(MainCanvas);
            DataBase.InsertRaces(Common.fromPlace, Common.toPlace);
            payingPassangers = Common.agesPassangers[0] + Common.agesPassangers[1];
            PassangersCountText.Text = $"Пассажиров с местом: {payingPassangers}";
            SelectedRoyalty.Text = $"Выбранный класс: {Common.ticketType}";
            luggageMultiplier = 1f;
            vegetableMultiplier = 0;
            Dictionary<string, float> classPrice = new Dictionary<string, float>() { { "Эконом", 1f }, { "Комфорт", 1.3f }, { "Бизнес", 1.7f }, { "Первый класс", 2.5f }};
            classMultiplier = classPrice[Common.ticketType.ToString()];
        }

        public void recheckPrice()
        {
            if(selectedRaceInd != -1)
            {
                FlightBar selectedRace = RacesPanel.Children[selectedRaceInd] as FlightBar;
                basicPrice = selectedRace.price;
                itogPrice = Convert.ToInt32(basicPrice * payingPassangers * luggageMultiplier * classMultiplier + 500 * vegetableMultiplier * payingPassangers);
                CostText.Text = $"{itogPrice}рублей";
            }
        }

        public void reselect(int selectedIndex)
        {
            SolidColorBrush defaultColor = new SolidColorBrush(Color.FromArgb(100, 137, 246, 255));
            foreach (FlightBar item in RacesPanel.Children)
            {
                item.Background.Fill = defaultColor;
                item.SelectBut.Content = "Выбрать";
            }
            selectedRaceInd = selectedIndex;
            recheckPrice();
        }

        public RaceChoose()
        {
            InitializeComponent();
            
        }

        private void LuggageNone_Checked(object sender, RoutedEventArgs e)
        {
            luggageMultiplier = 1f;
            recheckPrice();
        }

        private void LuggageNorm_Checked(object sender, RoutedEventArgs e)
        {
            luggageMultiplier = 1.3f;
            recheckPrice();
        }

        private void LuggageFull_Checked(object sender, RoutedEventArgs e)
        {
            luggageMultiplier = 1.5f;
            recheckPrice();
        }

        private void VegeterianMenu_Checked(object sender, RoutedEventArgs e)
        {
            vegetableMultiplier = 1;
            recheckPrice();
        }

        private void VegeterianMenu_Unchecked(object sender, RoutedEventArgs e)
        {
            vegetableMultiplier = 0;
            recheckPrice();
        }

        private void ToPayBut_Click(object sender, RoutedEventArgs e)
        {
            if (selectedRaceInd == -1)
            {
                ErrorText.Text = "Выберите рейс!";
            }
            else
            {
                Common.itogFlightIndex = globalSelectedIndex;
                Common.itogPrice = itogPrice;
                Common.TheMainWindow.changeWindow(5);
            }
        }
    }
}
