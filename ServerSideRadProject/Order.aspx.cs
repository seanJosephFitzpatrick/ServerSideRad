using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;

public partial class Order : System.Web.UI.Page
{
    private Product selectedProduct;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           ddlProducts.DataBind();
           if(Session["Product"] != null){
               ddlProducts.SelectedValue = Session["Product"].ToString();
           }
           infoView.DataBind();
        }
        selectedProduct = this.GetSelectedProduct();
        lblBrandID.Text = selectedProduct.BrandID;
        lblLong.Text = selectedProduct.LongDescription;
        lblPrice.Text = selectedProduct.UnitPrice.ToString("c");
        imgProduct.ImageUrl = "Images/Products/" + selectedProduct.ImageFile;
    }

    private Product GetSelectedProduct()
    {
        DataView productsTable = (DataView)
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        productsTable.RowFilter = "ProductID = '" + ddlProducts.SelectedValue + "'";
        DataRowView row = (DataRowView)productsTable[0];

        Product p = new Product();
        p.ProductID = row["ProductID"].ToString();
        p.BrandID = row["BrandID"].ToString();
        p.LongDescription = row["LongDescription"].ToString();
        p.UnitPrice = (decimal)row["UnitPrice"];
        p.ImageFile = row["ImageFile"].ToString();
        return p;
    }
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            CartItem item = new CartItem();
            item.Product = selectedProduct;
            item.Quantity = 1;
            this.AddToCart(item);
            Response.Redirect("Cart.aspx");
        }
    }

    private void AddToCart(CartItem item)
    {
        SortedList cart = this.GetCart();
    
        string productID = selectedProduct.ProductID;
        if (cart.ContainsKey(productID))
        {
            CartItem existingItem = (CartItem)cart[productID];
            existingItem.Quantity += 1;
        }
        else
            cart.Add(productID, item);

        Session["Cart"] = cart;
    }

    private SortedList GetCart()
    {
        if (Session["Cart"] == null)
            Session.Add("Cart", new SortedList());
        return (SortedList)Session["Cart"];
    }


    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}