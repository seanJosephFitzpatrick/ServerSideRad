<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to the Watch Shop!
    </h2>
    <p>
        Have a look on some of the top watch brands in the world, like Rolex, Armani, Diesel and in different styles.
    </p>
    <p>
        <a href="/ServerSideRadProject/Products.aspx" title="Products">Click here</a> to search a watch.
    </p>
    
</asp:Content>