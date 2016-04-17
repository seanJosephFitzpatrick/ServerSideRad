using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sport : System.Web.UI.Page
{
    List<Product> products = new List<Product>();
    int pageCounter;

    protected void Page_Load(object sender, EventArgs e)
    {
        products = this.getProducts();
        pageCounter = 0;
        Session["Counter"] = 0;
        this.populate();
    }


    public Control FindControlRecursive(Control control, string id)
    {
        foreach (Control ctl in control.Controls)
        {
            if (ctl.ID == id)
                return ctl;

            Control child = FindControlRecursive(ctl, id);
            if (child != null)
                return child;
        }
        return null;
    }

    private void populate()
    {
        int productNumber = this.pageCounter * 4;

        for (int i = productNumber; i < (productNumber + 4); i++)
        {
            try
            {
                Control myControl1 = FindControlRecursive(this, "ImageButton" + ((i - productNumber) + 1));
                Image img = (Image)myControl1;
                img.ImageUrl = "Images/Products/" + products[i].ImageFile;

                myControl1 = FindControlRecursive(this, "Label" + (((i - productNumber) * 3) + 1));
                Label lblBrandID = (Label)myControl1;
                lblBrandID.Text = products[i].BrandID;

                myControl1 = FindControlRecursive(this, "Label" + (((i - productNumber) * 3) + 2));
                Label lblLong = (Label)myControl1;
                lblLong.Text = products[i].LongDescription;

                myControl1 = FindControlRecursive(this, "Label" + (((i - productNumber) * 3) + 3));
                Label lblPrice = (Label)myControl1;
                lblPrice.Text = products[i].UnitPrice.ToString("c");
            }
            catch
            {
                Control myControl1 = FindControlRecursive(this, "ImageButton" + ((i - productNumber) + 1));
                Image img = (Image)myControl1;
                img.Visible = false;

                myControl1 = FindControlRecursive(this, "Label" + (((i - productNumber) * 3) + 1));
                Label lblBrandID = (Label)myControl1;
                lblBrandID.Visible = false;

                myControl1 = FindControlRecursive(this, "Label" + (((i - productNumber) * 3) + 2));
                Label lblLong = (Label)myControl1;
                lblLong.Visible = false;

                myControl1 = FindControlRecursive(this, "Label" + (((i - productNumber) * 3) + 3));
                Label lblPrice = (Label)myControl1;
                lblPrice.Visible = false;
            }
        }
    }

    private List<Product> getProducts()
    {
        List<Product> productsList = new List<Product>();
        string connectionString =
                "Data Source=localhost\\SqlExpress;Initial Catalog=Watches;" +
                "Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);
        string selectStatement =
            "SELECT *" +
            "FROM Products " +
            "WHERE CategoryID = @CategoryID";
        SqlCommand selectCommand = new SqlCommand(selectStatement, connection);
        selectCommand.Parameters.AddWithValue("@CategoryID", "Sport");
        try
        {
            connection.Open();
            SqlDataReader reader = selectCommand.ExecuteReader();
            while (reader.Read())
            {
                Product product = new Product();
                product.ProductID = reader["ProductId"].ToString();
                product.BrandID = reader["BrandID"].ToString();
                product.LongDescription = reader["LongDescription"].ToString();
                product.UnitPrice = (decimal)reader["UnitPrice"];
                product.ImageFile = reader["ImageFile"].ToString();
                productsList.Add(product);
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
        return productsList;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.pageCounter = Convert.ToInt32(Session["Counter"]);
        if (this.pageCounter > 0)
        {
            this.pageCounter--;
            Session["Counter"] = this.pageCounter;
            this.populate();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        this.pageCounter = Convert.ToInt32(Session["Counter"]);
        if ((this.pageCounter + 1) * 4 < this.products.Count)
        {
            this.pageCounter++;
            Session["Counter"] = this.pageCounter;
            this.populate();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session["Product"] = products[this.pageCounter * 4].ProductID;
        Response.Redirect("Order.aspx");

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Session["Product"] = products[(this.pageCounter * 4) + 1].ProductID;
        Response.Redirect("Order.aspx");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Session["Product"] = products[(this.pageCounter * 4) + 2].ProductID;
        Response.Redirect("Order.aspx");
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Session["Product"] = products[(this.pageCounter * 4) + 3].ProductID;
        Response.Redirect("Order.aspx");
    }
}