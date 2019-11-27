<%@ Control AutoEventWireup="false" Inherits="Appleseed.Content.Web.Modules.Recycler"
    Language="c#" CodeBehind="Recycler.ascx.cs" %>

<style type="text/css">
    .module_Body table td{
        padding:5px !important;
    }
    .NormalBold {
        font-weight: bold;
    color: white;
    background-color: #2c2626;
    }
    .NormalBold tb{
        vertical-align:middle;
    }

        .NormalBold A {
            padding-right: 20px;
            padding-left: 3px;
            padding-bottom: 0px;
            color: #ffffff;
            padding-top: 0px;
            text-decoration: none;
        }

            .NormalBold A:hover {
                text-decoration: underline;
            }

    .gridHeaderSortASC A {
        background: url(/images/SortOrderAsc.png) no-repeat 100% 50%;
        background-size: 15px;
    }

    .gridHeaderSortDESC A {
        background: url(/images/SortOrderDesc.png) no-repeat 100% 50%;
        background-size: 15px;
    }
    .altRow{
        background-color: #eeeeee;
    color: #000 !important;
    }
    .itmRow{
        background-color: #ccc;
    color: #000 !important;
    }
</style>

<h3>Modules</h3>
<asp:DataGrid ID="DataGrid1" runat="server" AllowSorting="true" ItemStyle-CssClass="itmRow" AlternatingItemStyle-CssClass="altRow"
    AutoGenerateColumns="False" CssClass="Normal" HorizontalAlign="Center" Width="95%">
    <HeaderStyle CssClass="NormalBold" />
    <Columns>
        <rbfwebui:TemplateColumn SortExpression="ModuleTitle">
            <HeaderTemplate>
                <rbfwebui:LinkButton ID="linkButton1" runat="server" CommandName="Sort" CommandArgument="ModuleTitle">Module Name</rbfwebui:LinkButton>
            </HeaderTemplate>
            <ItemTemplate>
                <rbfwebui:HyperLink ID="Hyperlink2" NavigateUrl='<%# Appleseed.Framework.HttpUrlBuilder.BuildUrl("~/DesktopModules/CoreModules/Recycler/view.aspx","mid=" + DataBinder.Eval(Container.DataItem,"ModuleID")) %>'
                    runat="server">
					<%#DataBinder.Eval(Container.DataItem,"ModuleTitle")%>
                </rbfwebui:HyperLink>
            </ItemTemplate>
        </rbfwebui:TemplateColumn>
        <rbfwebui:BoundColumn DataField="DateDeleted" DataFormatString="{0:MM/dd/yy}" HeaderText="Date Deleted"
            SortExpression="DateDeleted" HeaderStyle-CssClass="gridHeaderSortDESC">
        </rbfwebui:BoundColumn>
        <rbfwebui:BoundColumn DataField="DeletedBy" HeaderText="Deleted By" SortExpression="DeletedBy">
        </rbfwebui:BoundColumn>
        <rbfwebui:BoundColumn DataField="OriginalPageName" HeaderText="Original Page" SortExpression="OriginalPageName">
        </rbfwebui:BoundColumn>
    </Columns>
</asp:DataGrid>
<br />
<br />
<h3>Pages</h3>
<asp:DataGrid ID="dtgPages" runat="server" AllowSorting="true" ItemStyle-CssClass="itmRow" AlternatingItemStyle-CssClass="altRow" OnSortCommand="dtgPages_SortCommand"
    AutoGenerateColumns="False" CssClass="Normal" HorizontalAlign="Center" Width="95%">
    <HeaderStyle CssClass="NormalBold" />
    <Columns>
        <rbfwebui:TemplateColumn SortExpression="PageName">
            <HeaderTemplate>
                <rbfwebui:LinkButton ID="linkButton2" runat="server" CommandName="Sort" CommandArgument="PageName">Page Name</rbfwebui:LinkButton>
            </HeaderTemplate>
            <ItemTemplate>
                <rbfwebui:HyperLink ID="Hyperlink1" NavigateUrl='<%# Appleseed.Framework.HttpUrlBuilder.BuildUrl("~/DesktopModules/CoreModules/Recycler/view.aspx","pID=" + DataBinder.Eval(Container.DataItem,"ModuleID")+"&prid="+ DataBinder.Eval(Container.DataItem,"OriginalTab") ) %>'
                    runat="server">
					<%#DataBinder.Eval(Container.DataItem,"PageName")%>
                </rbfwebui:HyperLink>
            </ItemTemplate>
        </rbfwebui:TemplateColumn>
        <rbfwebui:BoundColumn DataField="DateDeleted" DataFormatString="{0:MM/dd/yy}" HeaderText="Date Deleted"
            SortExpression="DateDeleted" HeaderStyle-CssClass="gridHeaderSortDESC">
        </rbfwebui:BoundColumn>
        <rbfwebui:BoundColumn DataField="DeletedBy" HeaderText="Deleted By" SortExpression="DeletedBy">
        </rbfwebui:BoundColumn>
        <%--<rbfwebui:boundcolumn datafield="OriginalPageName" headertext="Original Page" sortexpression="PageName">
        </rbfwebui:boundcolumn>--%>
    </Columns>
</asp:DataGrid>
