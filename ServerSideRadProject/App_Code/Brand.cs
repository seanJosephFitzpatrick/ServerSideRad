using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Brand
/// </summary>
public class Brand
{
    private string _BrandID;

    public string BrandID
    {
        get { return _BrandID; }
        set { _BrandID = value; }
    }
    private string _shortName;

    public string ShortName
    {
        get { return _shortName; }
        set { _shortName = value; }
    }
    private string _longName;

    public string LongName
    {
        get { return _longName; }
        set { _longName = value; }
    }


}