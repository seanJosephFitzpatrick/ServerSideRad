using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer
/// </summary>
public class Customer
{
    private String email;
    private String firstName;
    private String lastName;
    private String address;
    private String city;
    private String countryName;
    private String phoneNumber;
    private String userName;
    private String password;

    public String Email
    {
        get
        {
            return email;
        }

        set
        {
            email = value;
        }
    }

    public String FirstName
    {
        get
        {
            return firstName;
        }

        set
        {
            firstName = value;
        }
    }

    public String LastName
    {
        get
        {
            return lastName;
        }

        set
        {
            lastName = value;
        }
    }

    public String Address
    {
        get
        {
            return address;
        }

        set
        {
            address = value;
        }
    }

    public String City
    {
        get
        {
            return city;
        }

        set
        {
            city = value;
        }
    }

    public String CountryName
    {
        get
        {
            return countryName;
        }

        set
        {
            countryName = value;
        }
    }

    public String PhoneNumber
    {
        get
        {
            return phoneNumber;
        }

        set
        {
            phoneNumber = value;
        }
    }

    public String UserName
    {
        get
        {
            return userName;
        }

        set
        {
            userName = value;
        }
    }

    public String Password
    {
        get
        {
            return password;
        }

        set
        {
            password = value;
        }
    }

    public Customer()
	{

        this.email = null;
        this.firstName = null;
        this.lastName = null;
        this.address = null;
        this.city = null;
        this.countryName = null;
        this.phoneNumber = null;
        this.userName = null;
        this.password = null;
    }

}