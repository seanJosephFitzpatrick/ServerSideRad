using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InvoiceView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Customer"] == null)
        {
            //go login
             Response.Redirect("Account/Login.aspx");
        }
     /*   else
        {

            string email = (Session["Customer"] as Customer).Email.ToString();
            this.Label1.Text = email;
            //SqlDataSource2.DataBind();
            //DetailsView1.DataBind();
           
        }*/
    }
}