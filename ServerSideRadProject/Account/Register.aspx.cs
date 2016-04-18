using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProductsData;

public partial class Account_Register : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
    }

    protected void RegisterUser_CreatingUser(object sender, LoginCancelEventArgs e)
    { 

        if(CustomerDB.getCustomerByUserName(RegisterUser.UserName) != null)
        {
            TopErrorMessage.Text = "This username has already been chosen. Please type another one";
           
            e.Cancel = true;
            // RegisterUser.UnknownErrorMessage
        }
        if (CustomerDB.getCustomerByEmail(RegisterUser.Email) != null)
        {
            TopErrorMessage.Text = "This email has already been chosen. Please type another one";
           
            e.Cancel = true;
        }
    }

    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {
        //FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);
       // FormsAuthentication.

        Customer customer = new Customer();
        customer.UserName = RegisterUser.UserName;
        customer.Email = RegisterUser.Email;
        customer.Password = RegisterUser.Password;
        CustomerDB.Save(customer);
        Session["Customer"] = customer.Email;
        //customer.UserName = RegisterUser.UserName;

        string continueUrl = RegisterUser.ContinueDestinationPageUrl;
        if (String.IsNullOrEmpty(continueUrl))
        {
            continueUrl = "~/";
        }
        Response.Redirect(continueUrl);
    }

}
