<%@ Page Title="CheckOut Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" 
    CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="Styles/Site.css" rel="stylesheet" type="test/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <table class="checkOutStyle1">
            <tr>
                <td class="checkOutStyle2">
                    Enter following info:</td>
                <td class="checkOutStyle3">
                    &nbsp;</td>
                <td class="checkOutStyle4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    First Name</td>
                <td class="checkOutStyle3">
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </td>
                <td class="checkOutStyle4">
                    <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator1" 
                        ControlToValidate="txtFirstName"
                        runat="server" ErrorMessage="First name required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="checkOutStyle2">
                    Last Name</td>
                <td class="checkOutStyle3">
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
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

