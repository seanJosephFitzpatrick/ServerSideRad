using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for InvoiceDB
/// </summary>
/// 
namespace ProductsData
{
    
    public class InvoiceDB
    {
        
	    public static List<Invoice> GetInvoiceList()
        {

            List<Invoice> InvoicesList = new List<Invoice>();

            SqlConnection connection = ConnectDB.GetConnection();

            string selectStatement =
                "SELECT * " +
                " FROM Invoices " +
                " ORDER BY OrderDate ";


            SqlCommand selectCommand = new SqlCommand(selectStatement, connection);

            try
            {
                connection.Open();
                SqlDataReader reader = selectCommand.ExecuteReader();

                while (reader.Read())
                {
                    Invoice Invoice = new Invoice();

                    Invoice.InvoiceNumber = Convert.ToInt32(reader["InvoiceNumber"]);
                    Invoice.CustEmail = reader["CustEmail"].ToString();
                    Invoice.OrderDate = Convert.ToDateTime(reader["OrderDate"]);
                    Invoice.Subtotal = Convert.ToDouble(reader["InvoiceNumber"]);
                    Invoice.ShipMethod = reader["ShipMethod"].ToString();
                    Invoice.Shipping = Convert.ToDouble(reader["InvoiceNumber"]);
                    Invoice.SalesTax = Convert.ToDouble(reader["SalesTax"]);
                    Invoice.Total = Convert.ToDouble(reader["Total"]);
                    Invoice.CreditCardType = reader["CreditCardType"].ToString();
                    Invoice.CardNumber = reader["CardNumber"].ToString();
                    Invoice.ExpirationMonth = Convert.ToInt32(reader["ExpirationMonth"]);
                    Invoice.ExpirationYear = Convert.ToInt32(reader["ExpirationYear"]);


                    InvoicesList.Add(Invoice);
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
            return InvoicesList;
        }

        public static Invoice getInvoiceByUserEmail(string email)
        {
            Invoice Invoice = GetInvoiceList().Where(i => i.CustEmail.Equals(email)).FirstOrDefault() as Invoice;
            return Invoice;
        }

        public static int Save(Invoice Invoice)
        {
            SqlConnection connection = ConnectDB.GetConnection();

            string insertStatement =
                "INSERT Invoices " +
                 "(CustEmail, OrderDate, Subtotal, ShipMethod, Shipping, SalesTax, Total," +
                        "CreditCardType, CardNumber, ExpirationMonth, ExpirationYear)" +
                  "VALUES (@CustEmail, @OrderDate, @Subtotal, @ShipMethod, @Shipping, @SalesTax, @Total," +
                    "@CreditCardType, @CardNumber, @ExpirationMonth, @ExpirationYear)"; 
            SqlCommand insertCommand = new SqlCommand(insertStatement, connection);
            
            
            insertCommand.Parameters.AddWithValue("@CustEmail", Invoice.CustEmail);
            insertCommand.Parameters.AddWithValue("@OrderDate", Invoice.OrderDate == null ? DateTime.Now : Invoice.OrderDate);
           
            insertCommand.Parameters.AddWithValue("@Subtotal", Invoice.Subtotal);
            insertCommand.Parameters.AddWithValue("@ShipMethod", Invoice.ShipMethod == null ? "" : Invoice.ShipMethod);
            insertCommand.Parameters.AddWithValue("@Shipping", Invoice.Shipping);
            
            insertCommand.Parameters.AddWithValue("@SalesTax", Invoice.SalesTax);
            insertCommand.Parameters.AddWithValue("@Total", Invoice.Total);
            insertCommand.Parameters.AddWithValue("@CreditCardType", Invoice.CreditCardType == null ? "" : Invoice.CreditCardType);
           
            insertCommand.Parameters.AddWithValue("@CardNumber", Invoice.CardNumber == null ? "" : Invoice.CardNumber);
            insertCommand.Parameters.AddWithValue("@ExpirationMonth", Invoice.ExpirationMonth = Invoice.ExpirationMonth == null ? 1 : Invoice.ExpirationMonth);
            insertCommand.Parameters.AddWithValue("@ExpirationYear", Invoice.ExpirationYear =  Invoice.ExpirationYear == null ? 1 : Invoice.ExpirationYear);
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();

                int invoiceID = 0;

                string selectStatement =
                         "SELECT IDENT_CURRENT('Invoices') FROM Invoices";

                SqlCommand selectCommand = new SqlCommand(selectStatement, connection);

                invoiceID = Convert.ToInt32(selectCommand.ExecuteScalar());


                return invoiceID;
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

        // UpdateProducts here Description, Category, Price, OnHand
        public static bool Update(Invoice newInvoice)
        {
            SqlConnection connection = ConnectDB.GetConnection();

            string updateStatement =
                "UPDATE Invoices SET " +
                   "CustEmail = @CustEmail, " +
                   "OrderDate = @OrderDate, " +
                   "Subtotal = @Subtotal, " +
                  
                   "ShipMethod = @ShipMethod, " +
                   "Shipping = @Shipping, " +
                   "SalesTax = @SalesTax, " +
                   
                   "Total = @Total, " +
                   "CreditCardType = @CreditCardType, " +
                   "CardNumber = @CardNumber, " +
                   
                   "ExpirationMonth = @ExpirationMonth, " +
                   "ExpirationYear = @ExpirationYear " +

               "WHERE InvoiceNumber = @InvoiceNumber ";

          

            SqlCommand updateCommand = new SqlCommand(updateStatement, connection);

            updateCommand.Parameters.AddWithValue("@InvoiceNumber", newInvoice.InvoiceNumber);
            updateCommand.Parameters.AddWithValue("@CustEmail", newInvoice.CustEmail);
            updateCommand.Parameters.AddWithValue("@OrderDate", newInvoice.OrderDate == null ? DateTime.Now : newInvoice.OrderDate);

            updateCommand.Parameters.AddWithValue("@Subtotal", newInvoice.Subtotal);
            updateCommand.Parameters.AddWithValue("@ShipMethod", newInvoice.ShipMethod == null ? "" : newInvoice.ShipMethod);
            updateCommand.Parameters.AddWithValue("@Shipping", newInvoice.Shipping);

            updateCommand.Parameters.AddWithValue("@SalesTax", newInvoice.SalesTax);
            updateCommand.Parameters.AddWithValue("@Total", newInvoice.Total);
            updateCommand.Parameters.AddWithValue("@CreditCardType", newInvoice.CreditCardType == null ? "" : newInvoice.CreditCardType);

            updateCommand.Parameters.AddWithValue("@CardNumber", newInvoice.CardNumber == null ? "" : newInvoice.CardNumber);
            updateCommand.Parameters.AddWithValue("@ExpirationMonth", newInvoice.ExpirationMonth = newInvoice.ExpirationMonth == null ? 1 : newInvoice.ExpirationMonth);
            updateCommand.Parameters.AddWithValue("@ExpirationYear", newInvoice.ExpirationYear = newInvoice.ExpirationYear == null ? 1 : newInvoice.ExpirationYear);

            try
            {
                connection.Open();
                int count = updateCommand.ExecuteNonQuery();
                if (count > 0)
                    return true;
                else
                    return false;
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