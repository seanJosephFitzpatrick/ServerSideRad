using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for LineItemDB
/// </summary>
/// 
namespace ProductsData
{
    
    public class LineItemDB
    {
        
	    public static List<LineItem> GetLineItemList()
        {

            List<LineItem> LineItemsList = new List<LineItem>();

            SqlConnection connection = ConnectDB.GetConnection();

            string selectStatement =
                "SELECT * " +
                " FROM LineItems " +
                " ORDER BY LineItemNumber, ProductID ";


            SqlCommand selectCommand = new SqlCommand(selectStatement, connection);

            try
            {
                connection.Open();
                SqlDataReader reader = selectCommand.ExecuteReader();

                while (reader.Read())
                {
                    LineItem LineItem = new LineItem();

                    LineItem.InvoiceNumber = Convert.ToInt32(reader["InvoiceNumber"]);
                    LineItem.ProductID = reader["ProductID"].ToString();
                    LineItem.UnitPrice = Convert.ToDouble(reader["UnitPrice"]);
                    LineItem.Quantity = Convert.ToInt32(reader["Quantity"]);
                    LineItem.Extension = Convert.ToDouble(reader["Extension"]);
                    
                    LineItemsList.Add(LineItem);
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
            return LineItemsList;
        }

        public static LineItem getLineItemByInvoiceNumber(int number)
        {
            LineItem LineItem = GetLineItemList().Where(li => li.InvoiceNumber.Equals(number)).FirstOrDefault() as LineItem;
            return LineItem;
        }

        public static LineItem Save(LineItem LineItem)
        {
            SqlConnection connection = ConnectDB.GetConnection();

            string insertStatement =
                "INSERT LineItems " +
                 "(InvoiceNumber, ProductID, UnitPrice, Quantity)" +
                  "VALUES (@InvoiceNumber, @ProductID, @UnitPrice, @Quantity) ";

            SqlCommand insertCommand = new SqlCommand(insertStatement, connection);

            insertCommand.Parameters.AddWithValue("@InvoiceNumber", LineItem.InvoiceNumber);
            insertCommand.Parameters.AddWithValue("@ProductID", LineItem.ProductID);
            insertCommand.Parameters.AddWithValue("@UnitPrice", LineItem.UnitPrice);
            insertCommand.Parameters.AddWithValue("@Quantity", LineItem.Quantity);
           // insertCommand.Parameters.AddWithValue("@Extension", LineItem.Extension);
           
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();

                return LineItem;
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