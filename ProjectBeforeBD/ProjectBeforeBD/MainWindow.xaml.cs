﻿using System.Text;
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
        int[] agesPassangers = [1, 0, 0];
        public void Preparations()
        {
            
        }

        public MainWindow()
        {
            InitializeComponent();
            FirstPage firstPage = new FirstPage();
            this.Content = firstPage;
            Preparations();
        }


        //---------------------------------------------------НАЧАЛО ОПИСАНИЯ ЭЛЕМЕНТОВ---------------------------------------------
        
    }
}