using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckOut : System.Web.UI.Page
{
    private Customer customer;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            customer = (Customer)Session["Customer"];
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
        Session["Customer"] = customer;
        Response.Redirect("Order.aspx");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("Cart");
        Session.Remove("Customer");
        Response.Redirect("Order.aspx");
    }
}