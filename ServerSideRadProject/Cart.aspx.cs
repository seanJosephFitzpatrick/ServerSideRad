using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Collections;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;


public partial class Cart : System.Web.UI.Page
{
    private SortedList cart;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.GetCart();
        if (!IsPostBack)
            this.DisplayCart();
    }

    private void GetCart()
    {
        if (Session["Cart"] == null)
        {
            //if (Trace.IsEnabled)
             //   Trace.Write("GetCart", "New cart created");
            Session.Add("Cart", new SortedList());
        }
        cart = (SortedList)Session["Cart"];
    }

    private void DisplayCart()
    {
        lstProducts.Items.Clear();
        CartItem item;
        foreach (DictionaryEntry entry in cart)
        {
            item = (CartItem)entry.Value;
            lstProducts.Items.Add(item.Display());
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (cart.Count > 0 && lstProducts.SelectedIndex > -1)
        {
            cart.RemoveAt(lstProducts.SelectedIndex);
            this.DisplayCart();
        }
    }
    protected void btnEmpty_Click(object sender, EventArgs e)
    {
        cart.Clear();
        lstProducts.Items.Clear();
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckOut.aspx");
    }
}