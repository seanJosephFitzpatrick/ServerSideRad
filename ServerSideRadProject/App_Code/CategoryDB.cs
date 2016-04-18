using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CategoryDB
/// </summary>
/// 
namespace ProductsData
{

    public class CategoryDB
    {
	    public static List<Category> GetCategoryList()
        {

            List<Category> categoriesList = new List<Category>();

            SqlConnection connection = ConnectDB.GetConnection();

            string selectStatement =
                "SELECT * " +
                " FROM Categories " +
                " ORDER BY CategoryID ";


            SqlCommand selectCommand = new SqlCommand(selectStatement, connection);

            try
            {
                connection.Open();
                SqlDataReader reader = selectCommand.ExecuteReader();

                while (reader.Read())
                {
                    Category Category = new Category();

                    Category.CategoryID = reader["CategoryID"].ToString();
                    Category.ShortName = reader["ShortName"].ToString();
                    Category.LongName = reader["LongName"].ToString();

                    categoriesList.Add(Category);
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
            return categoriesList;
        }

        public static Category getCategoryByName(string name)
        {
            Category category = GetCategoryList().Where(c => c.ShortName.Equals(name) || c.LongName.Equals(name)).FirstOrDefault() as Category;
            return category;
        }

        
    }
}