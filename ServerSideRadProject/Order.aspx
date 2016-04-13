<%@ Page Title="Order Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" 
    CodeFile="Order.aspx.cs" Inherits="Order" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="Styles/Site.css" rel="stylesheet" type="test/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
    
        <asp:Image ID="Image1" runat="server" Height="70px" 
            ImageUrl="~/Images/MurachLogo.jpg" Width="491px" />
        <br />
        <table class="orderStyle1">
            <tr>
                <td class="orderStyle2">
    
        <asp:Label ID="Label1" runat="server" Text="Select a product"></asp:Label>
                    :
        <asp:DropDownList ID="ddlProducts" width="161px" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="ProductID" 
            DataValueField="ProductID" AutoPostBack="True">
        </asp:DropDownList>
    
                </td>
                <td>
    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:WatchesConnectionString %>" 
                        SelectCommand="SELECT [ProductID], [BrandID], [LongDescription], [UnitPrice], [ImageFile] FROM [Products]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="orderStyle3">
        <asp:Label ID="lblBrandID" runat="server" Text="Name"></asp:Label>
                </td>
                <td rowspan="4">
                    <asp:Image ID="imgProduct" runat="server" Height="180px" Width="204px" />
                </td>
            </tr>
            <tr>
                <td class="orderStyle2">
        <asp:Label ID="lblLong" runat="server" Text="Description"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="orderStyle2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="orderStyle3" >
        <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="orderStyle2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="orderStyle2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table class="masterTable">
            <tr>
                <td>
        <asp:Button ID="btnAddToCart" runat="server" onclick="btnAddToCart_Click" 
            Text="Add to Cart" />
                </td>
                <td>
        <asp:Button ID="btnGoToCart" runat="server" 
            PostBackUrl="~/Cart.aspx" Text="Go to Cart" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
    
    </div>
</asp:Content>

