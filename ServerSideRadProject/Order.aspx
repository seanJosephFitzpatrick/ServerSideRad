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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WatchesConnectionString %>" 
            SelectCommand="SELECT [ProductID], [UnitPrice], [CaseWidth(mm)] AS column1, [Packaging], [Guarantee(months)] AS column2, [CaseDepth(mm)] AS column3, [DialColor], [CaseMaterial], [StrapType], [StrapColor], [WaterResistancy], [DateDisplay], [ClaspType], [Movement], [Chronograph], [AnalogueDigital] FROM [Products]">
        </asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ProductID" 
            DataSourceID="SqlDataSource2">
            <AlternatingItemTemplate>
                <span style="background-color: #FAFAD2;color: #284775;">ProductID:
                <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                <br />
                UnitPrice:
                <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                <br />
                column1:
                <asp:Label ID="column1Label" runat="server" Text='<%# Eval("column1") %>' />
                <br />
                Packaging:
                <asp:Label ID="PackagingLabel" runat="server" Text='<%# Eval("Packaging") %>' />
                <br />
                column2:
                <asp:Label ID="column2Label" runat="server" Text='<%# Eval("column2") %>' />
                <br />
                column3:
                <asp:Label ID="column3Label" runat="server" Text='<%# Eval("column3") %>' />
                <br />
                DialColor:
                <asp:Label ID="DialColorLabel" runat="server" Text='<%# Eval("DialColor") %>' />
                <br />
                CaseMaterial:
                <asp:Label ID="CaseMaterialLabel" runat="server" 
                    Text='<%# Eval("CaseMaterial") %>' />
                <br />
                StrapType:
                <asp:Label ID="StrapTypeLabel" runat="server" Text='<%# Eval("StrapType") %>' />
                <br />
                StrapColor:
                <asp:Label ID="StrapColorLabel" runat="server" 
                    Text='<%# Eval("StrapColor") %>' />
                <br />
                WaterResistancy:
                <asp:Label ID="WaterResistancyLabel" runat="server" 
                    Text='<%# Eval("WaterResistancy") %>' />
                <br />
                DateDisplay:
                <asp:Label ID="DateDisplayLabel" runat="server" 
                    Text='<%# Eval("DateDisplay") %>' />
                <br />
                ClaspType:
                <asp:Label ID="ClaspTypeLabel" runat="server" Text='<%# Eval("ClaspType") %>' />
                <br />
                Movement:
                <asp:Label ID="MovementLabel" runat="server" Text='<%# Eval("Movement") %>' />
                <br />
                Chronograph:
                <asp:Label ID="ChronographLabel" runat="server" 
                    Text='<%# Eval("Chronograph") %>' />
                <br />
                AnalogueDigital:
                <asp:Label ID="AnalogueDigitalLabel" runat="server" 
                    Text='<%# Eval("AnalogueDigital") %>' />
                <br />
<br /></span>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="background-color: #FFCC66;color: #000080;">ProductID:
                <asp:Label ID="ProductIDLabel1" runat="server" 
                    Text='<%# Eval("ProductID") %>' />
                <br />
                UnitPrice:
                <asp:TextBox ID="UnitPriceTextBox" runat="server" 
                    Text='<%# Bind("UnitPrice") %>' />
                <br />
                column1:
                <asp:TextBox ID="column1TextBox" runat="server" Text='<%# Bind("column1") %>' />
                <br />
                Packaging:
                <asp:TextBox ID="PackagingTextBox" runat="server" 
                    Text='<%# Bind("Packaging") %>' />
                <br />
                column2:
                <asp:TextBox ID="column2TextBox" runat="server" Text='<%# Bind("column2") %>' />
                <br />
                column3:
                <asp:TextBox ID="column3TextBox" runat="server" Text='<%# Bind("column3") %>' />
                <br />
                DialColor:
                <asp:TextBox ID="DialColorTextBox" runat="server" 
                    Text='<%# Bind("DialColor") %>' />
                <br />
                CaseMaterial:
                <asp:TextBox ID="CaseMaterialTextBox" runat="server" 
                    Text='<%# Bind("CaseMaterial") %>' />
                <br />
                StrapType:
                <asp:TextBox ID="StrapTypeTextBox" runat="server" 
                    Text='<%# Bind("StrapType") %>' />
                <br />
                StrapColor:
                <asp:TextBox ID="StrapColorTextBox" runat="server" 
                    Text='<%# Bind("StrapColor") %>' />
                <br />
                WaterResistancy:
                <asp:TextBox ID="WaterResistancyTextBox" runat="server" 
                    Text='<%# Bind("WaterResistancy") %>' />
                <br />
                DateDisplay:
                <asp:TextBox ID="DateDisplayTextBox" runat="server" 
                    Text='<%# Bind("DateDisplay") %>' />
                <br />
                ClaspType:
                <asp:TextBox ID="ClaspTypeTextBox" runat="server" 
                    Text='<%# Bind("ClaspType") %>' />
                <br />
                Movement:
                <asp:TextBox ID="MovementTextBox" runat="server" 
                    Text='<%# Bind("Movement") %>' />
                <br />
                Chronograph:
                <asp:TextBox ID="ChronographTextBox" runat="server" 
                    Text='<%# Bind("Chronograph") %>' />
                <br />
                AnalogueDigital:
                <asp:TextBox ID="AnalogueDigitalTextBox" runat="server" 
                    Text='<%# Bind("AnalogueDigital") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                    Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Cancel" />
                <br /><br /></span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">ProductID:
                <asp:TextBox ID="ProductIDTextBox" runat="server" 
                    Text='<%# Bind("ProductID") %>' />
                <br />UnitPrice:
                <asp:TextBox ID="UnitPriceTextBox" runat="server" 
                    Text='<%# Bind("UnitPrice") %>' />
                <br />column1:
                <asp:TextBox ID="column1TextBox" runat="server" Text='<%# Bind("column1") %>' />
                <br />Packaging:
                <asp:TextBox ID="PackagingTextBox" runat="server" 
                    Text='<%# Bind("Packaging") %>' />
                <br />column2:
                <asp:TextBox ID="column2TextBox" runat="server" Text='<%# Bind("column2") %>' />
                <br />column3:
                <asp:TextBox ID="column3TextBox" runat="server" Text='<%# Bind("column3") %>' />
                <br />DialColor:
                <asp:TextBox ID="DialColorTextBox" runat="server" 
                    Text='<%# Bind("DialColor") %>' />
                <br />CaseMaterial:
                <asp:TextBox ID="CaseMaterialTextBox" runat="server" 
                    Text='<%# Bind("CaseMaterial") %>' />
                <br />StrapType:
                <asp:TextBox ID="StrapTypeTextBox" runat="server" 
                    Text='<%# Bind("StrapType") %>' />
                <br />StrapColor:
                <asp:TextBox ID="StrapColorTextBox" runat="server" 
                    Text='<%# Bind("StrapColor") %>' />
                <br />WaterResistancy:
                <asp:TextBox ID="WaterResistancyTextBox" runat="server" 
                    Text='<%# Bind("WaterResistancy") %>' />
                <br />DateDisplay:
                <asp:TextBox ID="DateDisplayTextBox" runat="server" 
                    Text='<%# Bind("DateDisplay") %>' />
                <br />ClaspType:
                <asp:TextBox ID="ClaspTypeTextBox" runat="server" 
                    Text='<%# Bind("ClaspType") %>' />
                <br />Movement:
                <asp:TextBox ID="MovementTextBox" runat="server" 
                    Text='<%# Bind("Movement") %>' />
                <br />Chronograph:
                <asp:TextBox ID="ChronographTextBox" runat="server" 
                    Text='<%# Bind("Chronograph") %>' />
                <br />AnalogueDigital:
                <asp:TextBox ID="AnalogueDigitalTextBox" runat="server" 
                    Text='<%# Bind("AnalogueDigital") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Clear" />
                <br /><br /></span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="background-color: #FFFBD6;color: #333333;">ProductID:
                <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                <br />
                UnitPrice:
                <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                <br />
                column1:
                <asp:Label ID="column1Label" runat="server" Text='<%# Eval("column1") %>' />
                <br />
                Packaging:
                <asp:Label ID="PackagingLabel" runat="server" Text='<%# Eval("Packaging") %>' />
                <br />
                column2:
                <asp:Label ID="column2Label" runat="server" Text='<%# Eval("column2") %>' />
                <br />
                column3:
                <asp:Label ID="column3Label" runat="server" Text='<%# Eval("column3") %>' />
                <br />
                DialColor:
                <asp:Label ID="DialColorLabel" runat="server" Text='<%# Eval("DialColor") %>' />
                <br />
                CaseMaterial:
                <asp:Label ID="CaseMaterialLabel" runat="server" 
                    Text='<%# Eval("CaseMaterial") %>' />
                <br />
                StrapType:
                <asp:Label ID="StrapTypeLabel" runat="server" Text='<%# Eval("StrapType") %>' />
                <br />
                StrapColor:
                <asp:Label ID="StrapColorLabel" runat="server" 
                    Text='<%# Eval("StrapColor") %>' />
                <br />
                WaterResistancy:
                <asp:Label ID="WaterResistancyLabel" runat="server" 
                    Text='<%# Eval("WaterResistancy") %>' />
                <br />
                DateDisplay:
                <asp:Label ID="DateDisplayLabel" runat="server" 
                    Text='<%# Eval("DateDisplay") %>' />
                <br />
                ClaspType:
                <asp:Label ID="ClaspTypeLabel" runat="server" Text='<%# Eval("ClaspType") %>' />
                <br />
                Movement:
                <asp:Label ID="MovementLabel" runat="server" Text='<%# Eval("Movement") %>' />
                <br />
                Chronograph:
                <asp:Label ID="ChronographLabel" runat="server" 
                    Text='<%# Eval("Chronograph") %>' />
                <br />
                AnalogueDigital:
                <asp:Label ID="AnalogueDigitalLabel" runat="server" 
                    Text='<%# Eval("AnalogueDigital") %>' />
                <br />
<br /></span>
            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" 
                    style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                ProductID:
                <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                <br />
                UnitPrice:
                <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                <br />
                column1:
                <asp:Label ID="column1Label" runat="server" Text='<%# Eval("column1") %>' />
                <br />
                Packaging:
                <asp:Label ID="PackagingLabel" runat="server" Text='<%# Eval("Packaging") %>' />
                <br />
                column2:
                <asp:Label ID="column2Label" runat="server" Text='<%# Eval("column2") %>' />
                <br />
                column3:
                <asp:Label ID="column3Label" runat="server" Text='<%# Eval("column3") %>' />
                <br />
                DialColor:
                <asp:Label ID="DialColorLabel" runat="server" Text='<%# Eval("DialColor") %>' />
                <br />
                CaseMaterial:
                <asp:Label ID="CaseMaterialLabel" runat="server" 
                    Text='<%# Eval("CaseMaterial") %>' />
                <br />
                StrapType:
                <asp:Label ID="StrapTypeLabel" runat="server" Text='<%# Eval("StrapType") %>' />
                <br />
                StrapColor:
                <asp:Label ID="StrapColorLabel" runat="server" 
                    Text='<%# Eval("StrapColor") %>' />
                <br />
                WaterResistancy:
                <asp:Label ID="WaterResistancyLabel" runat="server" 
                    Text='<%# Eval("WaterResistancy") %>' />
                <br />
                DateDisplay:
                <asp:Label ID="DateDisplayLabel" runat="server" 
                    Text='<%# Eval("DateDisplay") %>' />
                <br />
                ClaspType:
                <asp:Label ID="ClaspTypeLabel" runat="server" Text='<%# Eval("ClaspType") %>' />
                <br />
                Movement:
                <asp:Label ID="MovementLabel" runat="server" Text='<%# Eval("Movement") %>' />
                <br />
                Chronograph:
                <asp:Label ID="ChronographLabel" runat="server" 
                    Text='<%# Eval("Chronograph") %>' />
                <br />
                AnalogueDigital:
                <asp:Label ID="AnalogueDigitalLabel" runat="server" 
                    Text='<%# Eval("AnalogueDigital") %>' />
                <br />
<br /></span>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <br />
    
    </div>
</asp:Content>

