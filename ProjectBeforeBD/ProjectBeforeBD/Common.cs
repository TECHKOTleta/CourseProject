using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Media.Animation;
using System.Windows;
using System.Security.Cryptography.Pkcs;

namespace ProjectBeforeBD
{
    internal static class Common
    {
        public static MainWindow TheMainWindow;
        public static FirstPage firstPage;
        public static RegistrationWindow registrationWindow;
        public static Authorization authorizationWindow;
        public static RaceChoose racePage;
        public static PayPage payPage;

        public static string fromPlace;
        public static string toPlace;
        public static DateTime selectedDate;
        public static string ticketType;
        public static int[] agesPassangers;

        public static string currentEmail;
        public static string userName;

        public static int itogFlightIndex;
        public static int itogPrice;
        static Common()
        {
            fromPlace = "testedFrom";
            toPlace = "testedTo";
            selectedDate = DateTime.Now;
            ticketType = "Эконом";
            agesPassangers = [1, 0, 0];
            currentEmail = "falseEmail";
        }

        public static void FancyChange(Grid canvas, int type = 0)                     //красивое появление элементов любой сетки
        {
            Storyboard everyOpacity = new Storyboard();
            DoubleAnimation opasityChange = new DoubleAnimation();
            
            opasityChange.From = 0.0 + type;
            opasityChange.To = 1.0-type;

            opasityChange.Duration = new Duration(TimeSpan.FromSeconds(3));
            opasityChange.AutoReverse = false;

            foreach (FrameworkElement item in canvas.Children)
            {
                Storyboard.SetTarget(opasityChange, item);
                Storyboard.SetTargetProperty(opasityChange, new PropertyPath(FrameworkElement.OpacityProperty));
                everyOpacity.Children.Add(opasityChange);
                everyOpacity.Begin(item);
            }
        }
    }
}
