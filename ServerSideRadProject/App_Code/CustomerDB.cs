using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CustomerDB
/// </summary>
/// 
namespace ProductsData
{
    
    public class CustomerDB
    {
        
	    public static List<Customer> GetCustomerList()
        {

            List<Customer> CustomersList = new List<Customer>();

            SqlConnection connection = ConnectDB.GetConnection();

            string selectStatement =
                "SELECT * " +
                " FROM Customers " +
                " ORDER BY LastName ";


            SqlCommand selectCommand = new SqlCommand(selectStatement, connection);

            try
            {
                connection.Open();
                SqlDataReader reader = selectCommand.ExecuteReader();

                while (reader.Read())
                {
                    Customer customer = new Customer();

                    customer.Email = reader["Email"].ToString();
                    customer.FirstName = reader["FirstName"].ToString();
                    customer.LastName = reader["LastName"].ToString();
                    customer.Address = reader["Address"].ToString();
                    customer.City = reader["City"].ToString();
                    customer.CountryName = reader["CountryName"].ToString();
                    customer.PhoneNumber = reader["PhoneNumber"].ToString();
                    customer.UserName = reader["UserName"].ToString();
                    customer.Password = reader["Password"].ToString();


                    CustomersList.Add(customer);
                }
                reader.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
            return CustomersList;
        }

        public static Customer getCustomerByUserName(string username)
        {
            Customer customer = GetCustomerList().Where(c => c.UserName.Equals(username)).FirstOrDefault() as Customer;
            return customer;
        }

        public static Customer getCustomerByEmail(string email)
        {
            Customer customer = GetCustomerList().Where(c => c.Email.Equals(email)).FirstOrDefault() as Customer;
            return customer;
        }

        public static Customer Save(Customer customer)
        {
            SqlConnection connection = ConnectDB.GetConnection();

            string insertStatement =
                "INSERT Customers " +
                  "( Email, LastName, FirstName, Address, City, CountryName, PhoneNumber, UserName, Password)" +
                "VALUES ( @Email, @LastName, @FirstName, @Address, @City, @CountryName, @PhoneNumber, @UserName, @Password)";

            SqlCommand insertCommand = new SqlCommand(insertStatement, connection);

            insertCommand.Parameters.AddWithValue("@Email", customer.Email);
            insertCommand.Parameters.AddWithValue("@LastName", customer.LastName == null ? "" : customer.LastName);
            insertCommand.Parameters.AddWithValue("@FirstName", customer.FirstName == null ? "" : customer.FirstName);
            insertCommand.Parameters.AddWithValue("@Address", customer.Address == null ? "" : customer.Address);
            insertCommand.Parameters.AddWithValue("@City", customer.City == null ? "" : customer.City);
            insertCommand.Parameters.AddWithValue("@CountryName", customer.CountryName == null ? "Ireland" : customer.CountryName);
            insertCommand.Parameters.AddWithValue("@PhoneNumber", customer.PhoneNumber == null ? "" : customer.PhoneNumber);
            insertCommand.Parameters.AddWithValue("@UserName", customer.UserName);
            insertCommand.Parameters.AddWithValue("@Password", customer.Password);

            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();

                return customer;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

       
        
    }
}