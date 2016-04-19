// Fabio Lelis

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace ProductsData
{
    public static class ProductsDB
    { 
        
        // GetProductsList here 
        public static List<Product> GetProductsList()
        {
            List<Product> procuctsList = new List<Product>();

            SqlConnection connection = ConnectDB.GetConnection();

            string selectStatement =
                "SELECT * " +
                " FROM Products " +
                " ORDER BY ProductID ";


            SqlCommand selectCommand = new SqlCommand(selectStatement, connection);

            try
            {
                connection.Open();
                SqlDataReader reader = selectCommand.ExecuteReader();

                while (reader.Read())
                {
                    Product product = new Product();

                    product.ProductID = reader["ProductID"].ToString();
                    product.BrandID = reader["BrandID"].ToString();
                    product.UnitPrice = Convert.ToDecimal(reader["UnitPrice"]);
                    product.Packaging = reader["Packaging"].ToString();
                    product.Guarantee = Convert.ToInt32(reader["Guarantee"]);
                    product.CaseWidth = Convert.ToInt32(reader["CaseWidth"]);
                    product.CaseDepth = Convert.ToInt32(reader["CaseDepth"]);
                    product.CategoryID = reader["CategoryID"].ToString();
                    product.DialColor = reader["DialColor"].ToString();
                    product.CaseMaterial = reader["CategoryID"].ToString();
                    product.StrapColor = reader["StrapColor"].ToString();
                    product.StrapType = reader["StrapType"].ToString();
                    product.WaterResistancy = Convert.ToInt32(reader["WaterResistancy"]);
                    product.DateDisplay = reader["CategoryID"].ToString();

                    product.ClaspType = reader["ClaspType"].ToString();
                    product.Movement = reader["Movement"].ToString();
                    product.Chronograph = reader["Chronograph"].ToString();
                    product.AnalogueDigital = reader["AnalogueDigital"].ToString();
                    product.ImageFile = reader["ImageFile"].ToString();
                    procuctsList.Add(product);
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
            return procuctsList;
        }
        /*
        // AddProducts here 
        public static int AddProducts(Product product)
        {
            SqlConnection connection = ConnectDB.GetConnection();

            string insertStatement =
                "INSERT Products " +
                  "( Description, Category, Price, OnHand )" +
                "VALUES ( @Description, @Category, @Price, @OnHand )";

            SqlCommand insertCommand = new SqlCommand(insertStatement, connection);

            insertCommand.Parameters.AddWithValue("@Description", product.Description);
            insertCommand.Parameters.AddWithValue("@Category", product.Category);
            insertCommand.Parameters.AddWithValue("@Price", product.Price);
            insertCommand.Parameters.AddWithValue("@OnHand", product.OnHand);

            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();

                string selectStatement =
                          "SELECT IDENT_CURRENT('tblProducts') FROM tblProducts";

                SqlCommand selectCommand = new SqlCommand(selectStatement, connection);

                int productId = Convert.ToInt32(selectCommand.ExecuteScalar());

                return productId;
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
        public static bool UpdateProducts(Products oldProducts, Products newProducts, bool optConcurrency)
        {
            SqlConnection connection = ConnectDB.GetConnection();

            string updateStatement =
                "UPDATE tblProducts SET " +
                   "Description = @NewDescription, " +
                   "Category = @NewCategory, " +
                   "Price = @NewPrice, " +
                   "OnHand = @NewOnHand " +
               "WHERE ProductId = @OldProductId ";

            if (optConcurrency)
            {
                updateStatement += "AND Description   = @OldDescription " +
                                  "AND Category   = @OldCategory " +
                                  "AND Price   = @OldPrice " +
                                  "AND OnHand = @OldOnHand ";
            }

            SqlCommand updateCommand = new SqlCommand(updateStatement, connection);

            updateCommand.Parameters.AddWithValue("@NewDescription", newProducts.Description);
            updateCommand.Parameters.AddWithValue("@NewCategory", newProducts.Category);
            updateCommand.Parameters.AddWithValue("@NewPrice", newProducts.Price);
            updateCommand.Parameters.AddWithValue("@NewOnHand", newProducts.OnHand);

            updateCommand.Parameters.AddWithValue("@OldDescription", oldProducts.Description);
            updateCommand.Parameters.AddWithValue("@OldCategory", oldProducts.Category);
            updateCommand.Parameters.AddWithValue("@OldPrice", oldProducts.Price);
            updateCommand.Parameters.AddWithValue("@OldOnHand", oldProducts.OnHand);

            updateCommand.Parameters.AddWithValue("@OldProductId", oldProducts.ProductId);

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
  
        // DeleteProducts here 
        public static bool DeleteProducts(Products products, bool optConcurrency)
        {
            SqlConnection connection = ConnectDB.GetConnection();

            string deleteStatement =
                "DELETE tblProducts " +
                "WHERE ProductId = @ProductId ";

            if (optConcurrency)
            {
                deleteStatement += "AND Description   = @OldDescription " +
                                  "AND Category   = @OldCategory " +
                                  "AND Price   = @OldPrice " +
                                  "AND OnHand = @OldOnHand ";
            }

            SqlCommand deleteCommand = new SqlCommand(deleteStatement, connection);
            deleteCommand.Parameters.AddWithValue("@OldDescription", products.Description);
            deleteCommand.Parameters.AddWithValue("@OldCategory", products.Category);
            deleteCommand.Parameters.AddWithValue("@OldPrice", products.Price);
            deleteCommand.Parameters.AddWithValue("@OldOnHand", products.OnHand);

            deleteCommand.Parameters.AddWithValue("@ProductId", products.ProductId);

            try
            {
                connection.Open();
                int count = deleteCommand.ExecuteNonQuery();
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
   
        // DeleteProductsSP here 
       
        public static bool DeleteProductsSp(Products products)
        {
           
            SqlConnection connection = ConnectDB.GetConnection();
            SqlCommand deleteCommand = new SqlCommand();
            deleteCommand.Connection = connection;
            deleteCommand.CommandText = "spDeleteProducts";
            deleteCommand.CommandType = CommandType.StoredProcedure;

            deleteCommand.Parameters.AddWithValue("@ProductId", products.ProductId);

            try
            {
                connection.Open();
                int count = deleteCommand.ExecuteNonQuery();
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
        */

        public static Product GetProduct(string productID)
        {
            Product product = GetProductsList().Where(p => p.ProductID.Equals(productID)).FirstOrDefault() as Product;
            return product;
        }

        public static List<Product> GetProductsListByBrandName(string brandName)
        {
            Brand brand = BrandDB.getBrandByName(brandName);
            return GetProductsList().Where(p => p.BrandID.Equals(brand.BrandID)).ToList<Product>();
        }

        public static List<Product> GetProductsByGender(string gender)
        {
            Category category = CategoryDB.getCategoryByName(gender);
            return GetProductsList().Where(p => p.CategoryID == category.CategoryID).ToList<Product>();
        }
  
    }
}
