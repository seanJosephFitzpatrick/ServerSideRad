using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Category
/// </summary>
public class Category
{
    private string _categoryID;

    public string CategoryID
    {
        get { return _categoryID; }
        set { _categoryID = value; }
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