using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for CartItem
/// </summary>
public class CartItem
{
    public Product Product;
    public int Quantity;

    public string Display()
    {
        string displayString = 
            Product.BrandID + " (" + Quantity.ToString()
            + " at " + Product.UnitPrice.ToString("c") + " each)";

        return displayString;
    }
    
}
