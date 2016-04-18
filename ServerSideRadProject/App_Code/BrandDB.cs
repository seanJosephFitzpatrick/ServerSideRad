using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for BrandDB
/// </summary>
/// 
namespace ProductsData
{

    public class BrandDB
    {
	    public static List<Brand> GetBrandList()
        {

            List<Brand> BrandsList = new List<Brand>();

            SqlConnection connection = ConnectDB.GetConnection();

            string selectStatement =
                "SELECT * " +
                " FROM Brands " +
                " ORDER BY BrandID ";


            SqlCommand selectCommand = new SqlCommand(selectStatement, connection);

            try
            {
                connection.Open();
                SqlDataReader reader = selectCommand.ExecuteReader();

                while (reader.Read())
                {
                    Brand Brand = new Brand();

                    Brand.BrandID = reader["BrandID"].ToString();
                    Brand.ShortName = reader["ShortName"].ToString();
                    Brand.LongName = reader["LongName"].ToString();

                    BrandsList.Add(Brand);
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
            return BrandsList;
        }

        public static Brand getBrandByName(string name)
        {
            Brand brand = GetBrandList().Where(c => c.ShortName.Equals(name) || c.LongName.Equals(name)).FirstOrDefault() as Brand;
            return brand;
        }

        
    }
}