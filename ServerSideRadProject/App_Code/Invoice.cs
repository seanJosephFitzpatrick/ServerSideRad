using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer
/// </summary>
public class Invoice
{
    public int InvoiceNumber;
    public string CustEmail;
    public DateTime OrderDate;
    public double Subtotal;
    public string ShipMethod;
    public double Shipping;
    public double SalesTax;
    public double Total;
    public string CreditCardType;
    public string CardNumber;
    public int ExpirationMonth;
    public int ExpirationYear;

}