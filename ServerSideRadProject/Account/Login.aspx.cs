using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProductsData;

public partial class Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
    }

    protected void loggedIn(object sender, EventArgs e)
    {
        Session["Customer"] = CustomerDB.getCustomerByUserName(LoginUser.UserName);
    }

    protected void AuthUser(object sender, AuthenticateEventArgs e)
    {
        Customer customer = new Customer();
        customer.Email = LoginUser.UserName;

        bool Authenticated = false;
        Authenticated = AuthenticationMethod(LoginUser.UserName, LoginUser.Password);

        e.Authenticated = Authenticated;
        //return null;
    }

   

    protected bool AuthenticationMethod(string username, string password)
    {
        Customer customer = CustomerDB.getCustomerByUserName(username);
        if (customer == null)
            return false;
        if (!customer.Password.Equals(password))
            return false;
        return true;
    }
}
