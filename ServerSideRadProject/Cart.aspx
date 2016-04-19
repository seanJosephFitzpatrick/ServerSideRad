<%@ Page Title="Cart Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" 
    CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="Styles/Site.css" rel="stylesheet" type="test/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
        <table class="cartStyle1">
            <tr>
                <td class="cartStyle3">
                    Your Shopping Cart:<br />
                </td>
                <td class="cartStyle2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="cartStyle3">
                    <asp:ListBox ID="lstProducts" runat="server" Width="368px"></asp:ListBox>
                </td>
                <td class="cartStyle2">
                    <asp:Button ID="btnRemove" runat="server" Text="Remove Item" 
                        onclick="btnRemove_Click" />
                    <br />
                    <br />
                    <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" Width="139px" 
                        onclick="btnEmpty_Click" />
                </td>
            </tr>
            <tr>
                <td class="cartStyle3">
                    &nbsp;</td>
                <td class="cartStyle2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="cartStyle3">
                    <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" 
                        PostBackUrl="~/Products.aspx" style="text-align: left" />
                </td>
                <td class="cartStyle2">
                    <asp:Button ID="btnCheckOut" runat="server" onclick="btnCheckOut_Click" 
                        Text="Check Out" Width="135px" />
                </td>
            </tr>
        </table>
    <div>
    </div>
</asp:Content>

