using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;
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
    }
}

