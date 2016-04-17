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
                        ConnectionString="<%$ ConnectionStrings:WatchesConnectionString2 %>" 
                        
                        SelectCommand="SELECT [ProductID], [UnitPrice], [LongDescription], [BrandID], [ImageFile] FROM [Products]" 
                        onselecting="SqlDataSource1_Selecting">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:WatchesConnectionString2 %>" 
                        SelectCommand="SELECT [ProductID], [Packaging], [Guarantee(months)] AS column1, [CaseDepth(mm)] AS column2, [CaseWidth(mm)] AS column3, [AnalogueDigital], [Movement], [ClaspType], [Chronograph], [DateDisplay], [WaterResistancy], [StrapType], [CaseMaterial], [DialColor], [StrapColor] FROM [Products] WHERE ([ProductID] = @ProductID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProducts" Name="ProductID" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="orderStyle3">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                    <asp:DetailsView ID="infoView" runat="server" AutoGenerateRows="False" 
                        DataKeyNames="ProductID" DataSourceID="SqlDataSource2" GridLines="Horizontal" 
                        Height="50px" Width="500px" CellSpacing="5" HeaderText="Informations">
                        <Fields>
                            <asp:BoundField DataField="Packaging" HeaderText="Packaging" 
                                SortExpression="Packaging" />
                            <asp:BoundField DataField="AnalogueDigital" HeaderText="AnalogueDigital" 
                                SortExpression="AnalogueDigital" />
                            <asp:BoundField DataField="Movement" HeaderText="Movement" 
                                SortExpression="Movement" />
                            <asp:BoundField DataField="ClaspType" HeaderText="ClaspType" 
                                SortExpression="ClaspType" />
                            <asp:BoundField DataField="Chronograph" HeaderText="Chronograph" 
                                SortExpression="Chronograph" />
                            <asp:BoundField DataField="DateDisplay" HeaderText="DateDisplay" 
                                SortExpression="DateDisplay" />
                            <asp:BoundField DataField="WaterResistancy" HeaderText="WaterResistancy" 
                                SortExpression="WaterResistancy" />
                            <asp:BoundField DataField="StrapType" HeaderText="StrapType" 
                                SortExpression="StrapType" />
                            <asp:BoundField DataField="CaseMaterial" HeaderText="CaseMaterial" 
                                SortExpression="CaseMaterial" />
                            <asp:BoundField DataField="DialColor" HeaderText="DialColor" 
                                SortExpression="DialColor" />
                            <asp:BoundField DataField="StrapColor" HeaderText="StrapColor" 
                                SortExpression="StrapColor" />
                        </Fields>
                        <HeaderStyle Font-Bold="True" />
                    </asp:DetailsView>
                </td>
            </tr>
            <tr>
                <td class="orderStyle3" >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="orderStyle2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblPrice" runat="server" Text="Price" Font-Bold="True" Font-Size="20pt"></asp:Label>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="orderStyle2">
                    &nbsp;</td>
                <td>
                    <asp:FormView ID="FormView1" runat="server">
                        <PagerTemplate>
                            <table class="masterTable">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBrandID" runat="server" Text="Name"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblLong" runat="server" Text="Description"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DetailsView ID="infoView" runat="server" AutoGenerateRows="False" 
                                            CellSpacing="5" DataKeyNames="ProductID" DataSourceID="SqlDataSource2" 
                                            GridLines="Horizontal" HeaderText="Informations" Height="50px" Width="500px">
                                            <Fields>
                                                <asp:BoundField DataField="Packaging" HeaderText="Packaging" 
                                                    SortExpression="Packaging" />
                                                <asp:BoundField DataField="AnalogueDigital" HeaderText="AnalogueDigital" 
                                                    SortExpression="AnalogueDigital" />
                                                <asp:BoundField DataField="Movement" HeaderText="Movement" 
                                                    SortExpression="Movement" />
                                                <asp:BoundField DataField="ClaspType" HeaderText="ClaspType" 
                                                    SortExpression="ClaspType" />
                                                <asp:BoundField DataField="Chronograph" HeaderText="Chronograph" 
                                                    SortExpression="Chronograph" />
                                                <asp:BoundField DataField="DateDisplay" HeaderText="DateDisplay" 
                                                    SortExpression="DateDisplay" />
                                                <asp:BoundField DataField="WaterResistancy" HeaderText="WaterResistancy" 
                                                    SortExpression="WaterResistancy" />
                                                <asp:BoundField DataField="StrapType" HeaderText="StrapType" 
                                                    SortExpression="StrapType" />
                                                <asp:BoundField DataField="CaseMaterial" HeaderText="CaseMaterial" 
                                                    SortExpression="CaseMaterial" />
                                                <asp:BoundField DataField="DialColor" HeaderText="DialColor" 
                                                    SortExpression="DialColor" />
                                                <asp:BoundField DataField="StrapColor" HeaderText="StrapColor" 
                                                    SortExpression="StrapColor" />
                                            </Fields>
                                            <HeaderStyle Font-Bold="True" />
                                        </asp:DetailsView>
                                    </td>
                                    <td>
                                        <asp:Image ID="imgProduct" runat="server" Height="180px" Width="204px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DataPager ID="DataPager1" runat="server" 
                                            Visible='<%# Eval("ProductID") %>'>
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                <asp:NumericPagerField />
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </PagerTemplate>
                    </asp:FormView>
                </td>
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

