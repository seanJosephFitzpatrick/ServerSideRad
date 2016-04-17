<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="masterTable">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Greiner3@bymmatweb.com"></asp:Label>
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WatchesConnectionString2 %>" SelectCommand="SELECT * FROM [Invoices] WHERE ([CustEmail] = @CustEmail)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="CustEmail" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" DataKeyNames="InvoiceNumber" DataSourceID="SqlDataSource2" Height="50px" Width="499px">
                    <Fields>
                        <asp:BoundField DataField="InvoiceNumber" HeaderText="InvoiceNumber" InsertVisible="False" ReadOnly="True" SortExpression="InvoiceNumber" />
                        <asp:BoundField DataField="CustEmail" HeaderText="CustEmail" SortExpression="CustEmail" />
                        <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                        <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" />
                        <asp:BoundField DataField="ShipMethod" HeaderText="ShipMethod" SortExpression="ShipMethod" />
                        <asp:BoundField DataField="Shipping" HeaderText="Shipping" SortExpression="Shipping" />
                        <asp:BoundField DataField="SalesTax" HeaderText="SalesTax" SortExpression="SalesTax" />
                        <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                        <asp:BoundField DataField="CreditCardType" HeaderText="CreditCardType" SortExpression="CreditCardType" />
                        <asp:BoundField DataField="CardNumber" HeaderText="CardNumber" SortExpression="CardNumber" />
                        <asp:BoundField DataField="ExpirationMonth" HeaderText="ExpirationMonth" SortExpression="ExpirationMonth" />
                        <asp:BoundField DataField="ExpirationYear" HeaderText="ExpirationYear" SortExpression="ExpirationYear" />
                    </Fields>
                </asp:DetailsView>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

