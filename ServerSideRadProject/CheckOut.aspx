<%@ Page Title="CheckOut Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" 
    CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="Styles/Site.css" rel="stylesheet" type="test/css" />
<style type="text/css">
    .style1
    {
        width: 193px;
        height: 21px;
    }
    .style2
    {
        width: 263px;
        height: 21px;
    }
    .style3
    {
        width: 785px;
        height: 21px;
    }
    .style4
    {
        text-decoration: underline;
    }
</style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <table class="checkOutStyle1">
            <tr>
                <td class="checkOutStyle2">
                    Enter Details:</td>
                <td class="checkOutStyle3">
                    &nbsp;</td>
                <td class="checkOutStyle4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    <span class="style4">F</span>irst Name</td>
                <td class="checkOutStyle3">
                    <asp:TextBox ID="txtFirstName" runat="server" AccessKey="F"></asp:TextBox>
                </td>
                <td class="checkOutStyle4">
                    <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator1" 
                        ControlToValidate="txtFirstName"
                        runat="server" ErrorMessage="First name required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    <span class="style4">L</span>ast Name</td>
                <td class="checkOutStyle3">
                    <asp:TextBox ID="txtLastName" runat="server" AccessKey="L"></asp:TextBox>
                </td>
                <td class="checkOutStyle4">
                    <asp:RequiredFieldValidator ID="LastnameRequiredFieldValidator2" runat="server" 
                       ControlToValidate="txtLastName"
                       ErrorMessage="Last name reqired" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    Email</td>
                <td class="checkOutStyle3">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td class="checkOutStyle4">
                    <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email address required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ValidatorEmail" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Valid Email Required" 
                        ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    Phone:</td>
                <td class="checkOutStyle3">
                    <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                </td>
                <td class="checkOutStyle4">
                    <asp:RequiredFieldValidator ID="PhoneNumberRequiredFieldValidator1" 
                        runat="server" ControlToValidate="txtPhoneNumber" 
                        ErrorMessage="Phone Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    &nbsp;</td>
                <td class="checkOutStyle3">
                    &nbsp;</td>
                <td class="checkOutStyle4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    Billing Address:</td>
                <td class="checkOutStyle3">
                    &nbsp;</td>
                <td class="checkOutStyle4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    Address:</td>
                <td class="checkOutStyle3">
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </td>
                <td class="checkOutStyle4">
                    <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtAddress" ErrorMessage="Address Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    City:</td>
                <td class="checkOutStyle3">
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                </td>
                <td class="checkOutStyle4">
                    <asp:RequiredFieldValidator ID="CityRequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtCity" ErrorMessage="City Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Country:</td>
                <td class="style2">
                    <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:WatchesConnectionString %>" 
                        SelectCommand="SELECT [CountryName] FROM [Country] ORDER BY [CountryName]">
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="ddlCountry" runat="server" 
                        DataSourceID="SqlDataSourceCountry" DataTextField="CountryName" 
                        DataValueField="CountryName">
                        <asp:ListItem Selected="True" Value="Select Country">Select Country</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="CountryRequiredFieldValidator" runat="server" 
                        ControlToValidate="ddlCountry" ErrorMessage="Country Required" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    &nbsp;</td>
                <td class="checkOutStyle3">
                    &nbsp;</td>
                <td class="checkOutStyle4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    Payment:</td>
                <td class="checkOutStyle3">
                    &nbsp;</td>
                <td class="checkOutStyle4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    Credit Card:</td>
                <td class="checkOutStyle3">
                    <asp:DropDownList ID="ddlCreditCard" runat="server" 
                        DataValueField="Select Card">
                        <asp:ListItem>Visa</asp:ListItem>
                        <asp:ListItem>Master Card</asp:ListItem>
                        <asp:ListItem>American Express</asp:ListItem>
                        <asp:ListItem Selected="True">Select Card</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="checkOutStyle4">
                    <asp:RequiredFieldValidator ID="CreditCardRequiredFieldValidator" 
                        runat="server" ControlToValidate="ddlCreditCard" 
                        ErrorMessage="Credit Card Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    Card Number:</td>
                <td class="checkOutStyle3">
                    <asp:TextBox ID="txtCardNumber" runat="server"></asp:TextBox>
                </td>
                <td class="checkOutStyle4">
                    <asp:RequiredFieldValidator ID="CardNumberRequiredFieldValidator" 
                        runat="server" ControlToValidate="txtCardNumber" 
                        ErrorMessage="Card Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    Expiration Month:</td>
                <td class="checkOutStyle3">
                    <asp:DropDownList ID="ddlMonth" runat="server">
                        <asp:ListItem Selected="True">Select Month</asp:ListItem>
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="checkOutStyle4">
                    <asp:RequiredFieldValidator ID="ExpMonthRequiredFieldValidator" runat="server" 
                        ControlToValidate="ddlMonth" ErrorMessage="Month Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    Expiration Year:</td>
                <td class="checkOutStyle3">
                    <asp:DropDownList ID="ddlYear" runat="server">
                        <asp:ListItem Selected="True">Select Year</asp:ListItem>
                        <asp:ListItem>2016</asp:ListItem>
                        <asp:ListItem>2017</asp:ListItem>
                        <asp:ListItem>2018</asp:ListItem>
                        <asp:ListItem>2019</asp:ListItem>
                        <asp:ListItem>2020</asp:ListItem>
                        <asp:ListItem>2021</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="checkOutStyle4">
                    <asp:RequiredFieldValidator ID="ExpYearRequiredFieldValidator" runat="server" 
                        ControlToValidate="ddlYear" ErrorMessage="Year Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    &nbsp;</td>
                <td class="checkOutStyle3">
                    &nbsp;</td>
                <td class="checkOutStyle4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    &nbsp;</td>
                <td class="checkOutStyle3">
                    &nbsp;</td>
                <td class="checkOutStyle4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" 
                        onclick="btnContinue_Click" />
                </td>
                <td class="checkOutStyle3">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" 
                        CausesValidation="False" onclick="btnCancel_Click" />
                </td>
                <td class="checkOutStyle4">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>

