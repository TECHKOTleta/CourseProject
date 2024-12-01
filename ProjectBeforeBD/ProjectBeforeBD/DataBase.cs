using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Media.Animation;
using MySql.Data.MySqlClient;
//using MySqlConnector;

namespace ProjectBeforeBD
{
    static class DataBase
    {
        static string host = "localhost"; // Имя хоста
        static string database = "airport"; // Имя базы данных
        static string user = "airport_code"; // Имя пользователя
        static string password = "Beast_of_gevaudan_is2scary"; // Пароль пользователя   

        static string connectionString = $"Server={host};Database={database};User ID={user};Password={password};";

        public static bool IsAlreadyExists(string email)
        {
            using (MySqlConnection mysqlConnection = new MySqlConnection(connectionString))
            {
                try     //запрос
                {
                    mysqlConnection.Open();
                    string query = $"SELECT ID_client from clients where `Mail` = '{email}';";
                    int check = 0;
                    using (MySqlCommand mysqlQuery = new MySqlCommand(query, mysqlConnection))
                    using (MySqlDataReader mysqlResult = mysqlQuery.ExecuteReader())
                    {
                        while(mysqlResult.Read())
                        check = Convert.ToInt32(mysqlResult.GetValue(0));
                        System.Diagnostics.Trace.WriteLine($"Существующий клиент: {check}");
                    }
                    return check != 0;
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine($"Произошла ошибка: {ex.Message}");
                    return false;
                }
            }
        }

        public static void InsertUser(string[] datas)
        {
            using (MySqlConnection mysqlConnection = new MySqlConnection(connectionString))
            {
                try     //запрос
                {
                    mysqlConnection.Open();
                    string query = $"INSERT INTO `clients` (`Name`, `Surname`, `Thirdname`, `Birthdate`, `Gender`, `Passport_ser`, `Passport_num`, `Mail`, `Password`) VALUE ('{datas[0]}', '{datas[1]}', '{datas[2]}', '{datas[3]}', '{datas[4]}', '{datas[5]}', '{datas[6]}', '{datas[7]}', '{datas[8]}');";

                    using (MySqlCommand mysqlQuery = new MySqlCommand(query, mysqlConnection))
                    {
                        mysqlQuery.ExecuteNonQuery();           
                    }
                    Common.currentEmail = datas[7];
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine($"Произошла ошибка: {ex.Message}");
                }
            }
        }

        public static string TryAuthorise(string email, string password)
        {
            using (MySqlConnection mysqlConnection = new MySqlConnection(connectionString))
            {
                try     //запрос
                {
                    mysqlConnection.Open();
                    string query = $"SELECT Name from clients where `Mail` = '{email}' and `Password` = '{password}';";
                    string check = "-1";
                    using (MySqlCommand mysqlQuery = new MySqlCommand(query, mysqlConnection))
                    using (MySqlDataReader mysqlResult = mysqlQuery.ExecuteReader())
                    {
                        while (mysqlResult.Read())
                            check = mysqlResult.GetValue(0).ToString();
                        System.Diagnostics.Trace.WriteLine($"Существующий клиент: {check}");
                    }
                    return check;
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine($"Произошла ошибка: {ex.Message}");
                    return "Error";
                }
            }
        }

        public static ObservableCollection<string> InsertAirports(string country, string exception)
        {
            System.Diagnostics.Trace.WriteLine($"Кроме: {exception}");
            ObservableCollection<string> ComboBoxItems = [];
            using (MySqlConnection mysqlConnection = new MySqlConnection(connectionString))
            {
                try     //запрос
                {
                    string ID = "", portName = "";
                    mysqlConnection.Open();
                    string query = $"SELECT `ID_place`, `Name` from `Places` where `Country` = '{country}';";
                    using (MySqlCommand mysqlQuery = new MySqlCommand(query, mysqlConnection))
                    using (MySqlDataReader mysqlResult = mysqlQuery.ExecuteReader())
                    {
                        while (mysqlResult.Read())
                        {
                            ID = mysqlResult.GetValue(0).ToString();
                            portName = mysqlResult.GetValue(1).ToString();
                            if($"({ID}) {portName}" != exception)
                            {
                                ComboBoxItems.Add($"({ID}) {portName}");
                            }
                            //System.Diagnostics.Trace.WriteLine($"({ID}) {portName}");
                        }
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine($"Произошла ошибка: {ex.Message}");
                }
            }
            return ComboBoxItems;
        }
        public static void InsertRaces(string fromPort_unr, string toPort_unr)
        {
            Common.racePage.RacesPanel.Children.Clear();
            using (MySqlConnection mysqlConnection = new MySqlConnection(connectionString))
            {
                try     //запрос
                {
                    mysqlConnection.Open();
                    Match match = Regex.Match(fromPort_unr, @"\((.*?)\)");
                    string fromPort = match.Groups[1].Value;
                    match = Regex.Match(toPort_unr, @"\((.*?)\)");
                    string toPort = match.Groups[1].Value;
                    


                    string query = $"SELECT `Date`, `Time`, `Duration`, `Price`, `ID_race` from `Races` where `FROM_place` = '{fromPort}' and `TO_place` = '{toPort}' and `TypeRace` = 'Пассажирский'";
                    if(Common.selectedDate.Date != DateTime.Now.Date)
                    {
                        System.Diagnostics.Trace.WriteLine(Common.selectedDate.ToString());
                        string[] partsOfDate = Common.selectedDate.ToString().Split(' ')[0].Split('.');
                        string reformedDate = $"{partsOfDate[2]}:{partsOfDate[1]}:{partsOfDate[0]}";
                        query += $" and `Date` = '{reformedDate}';";
                    }
                    else
                    {
                        query += ';';
                    }
                    using (MySqlCommand mysqlQuery = new MySqlCommand(query, mysqlConnection))
                    using (MySqlDataReader mysqlResult = mysqlQuery.ExecuteReader())
                    {
                        int index = 0;
                        while (mysqlResult.Read())
                        {
                            FlightBar flight = new FlightBar(Convert.ToInt32(mysqlResult.GetValue(4)), index, Convert.ToInt32(mysqlResult.GetValue(3)));
                            flight.FromBlock.Text = fromPort;
                            flight.ToBlock.Text = toPort;
                            match = Regex.Match(mysqlResult.GetValue(0).ToString(), @"^([^ ]+)");
                            flight.DateBlock.Text = match.Groups[1].Value;
                            match = Regex.Match(mysqlResult.GetValue(1).ToString(), @"^([^:]+:[^:]+)");
                            flight.TimeBlock.Text = match.Groups[1].Value;
                            flight.DurationBlock.Text = mysqlResult.GetValue(2).ToString() + " минут в полёте";
                            Common.racePage.RacesPanel.Children.Add( flight );
                            System.Diagnostics.Trace.WriteLine($"({flight.FromBlock.Text})");
                            index++;
                        }
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine($"Произошла ошибка: {ex.Message}");
                }
            }
        }
    }
}

