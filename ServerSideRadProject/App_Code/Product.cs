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
/// Summary description for Product
/// </summary>
public class Product
{
    public string ProductID;
    public string BrandID;
    public string ShortDescription;
    public string LongDescription;
    public decimal UnitPrice;
    public string ImageFile;
}
