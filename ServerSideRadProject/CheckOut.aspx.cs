using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProductsData;
using System.Collections;

public partial class CheckOut : System.Web.UI.Page
{
    private Customer customer;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Customer"] == null)
        {
            //go login
            Response.Redirect("Account/Login.aspx");
        }

        if (!IsPostBack)
        {
            customer = (Customer)CustomerDB.getCustomerByEmail(Session["Customer"].ToString());
            if (customer != null)
            {
                txtLastName.Text = customer.LastName;
                txtFirstName.Text = customer.FirstName;
                txtEmail.Text = customer.Email;
            }
        }
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        if (customer == null)
        {
            customer = new Customer();
        }
        customer.LastName = txtLastName.Text;
        customer.FirstName = txtFirstName.Text;
        customer.Email = txtEmail.Text;
        Session["Customer"] = customer.Email;

        
        Invoice invoice = new Invoice();

        SortedList cart = (SortedList)Session["Cart"];

        invoice.CustEmail = Session["Customer"].ToString();
        invoice.OrderDate = DateTime.Now;
        //************ PUT HERE payment info ***********


        int invoiceID = InvoiceDB.Save(invoice);
        
        
        //CreateLine items from Carts and put invoice.InvoiceNumber on them:
        double totalPrice = 0;
        foreach (CartItem ci in cart.Values)
        {
            LineItem li = new LineItem();
            li.InvoiceNumber = invoiceID;
            li.ProductID = ci.Product.ProductID;
            li.Quantity = ci.Quantity;
            li.UnitPrice = (double)ci.Product.UnitPrice;
            totalPrice += (li.UnitPrice * li.Quantity);
            LineItemDB.Save(li);
        }

        //********* SUM on total price shipping etc) ******
        invoice.Subtotal = invoice.Total = totalPrice;
        invoice.InvoiceNumber = invoiceID;
        InvoiceDB.Update(invoice);
        
        Response.Redirect("Order.aspx");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("Cart");
        Session.Remove("Customer");
        Response.Redirect("Order.aspx");
    }
}