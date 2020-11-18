<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AirtableViewer.ascx.cs" Inherits="Appleseed.DesktopModules.CoreModules.Airtable.AirtableViewer" %>

<style>
    .tbl-list{width: 100%;}
    .tbl-list td, .tbl-list th { border: 1px solid #656b70 !important; padding: 7px !important; }
    .tbl-list th { background-color: #2c3e50; color: #fff; }
    .tr-alt-row{background-color: #f8f8f8 !important;}
</style>

<h3>Managed Service Monthly Subscription</h3>
<asp:Repeater ID="rptManagedServiceMonthlySubscription" runat="server">
    <HeaderTemplate>
        <table id="tblMgdSrvMnSub" class="tbl-list">
            <tr>
                <th>Status</th>
                <th>Project</th>
                <th>SOW Expiration</th>
                <th>Engagement Type</th>
                <th>Monthly Subscription Cost</th>
                <th>Last Updated</th>
                <th>Engagement Manager</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr class="tr-row">
            <td><%# Eval("Fields.Status") %></td>
            <td><%# Eval("Fields.Project") %></td>
            <td><%# Eval("Fields.SOWExpiration") %></td>
            <td><%# Eval("Fields.EngagementType") %></td>
            <td><%# Eval("Fields.MonthlySubscriptionCost") %></td>
            <td><%# Eval("Fields.Field22", "{0: MM/dd/yyyy}") %></td>
            <td><%# Eval("Fields.EngagementManager.Name") %></td>
        </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <tr class="tr-alt-row">
            <td><%# Eval("Fields.Status") %></td>
            <td><%# Eval("Fields.Project") %></td>
            <td><%# Eval("Fields.SOWExpiration") %></td>
            <td><%# Eval("Fields.EngagementType") %></td>
            <td><%# Eval("Fields.MonthlySubscriptionCost") %></td>
            <td><%# Eval("Fields.Field22", "{0: MM/dd/yyyy}") %></td>
            <td><%# Eval("Fields.EngagementManager.Name") %></td>
        </tr>
    </AlternatingItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>

<h3>On Demand Service</h3>
<asp:Repeater ID="rptOnDemandService" runat="server">
    <HeaderTemplate>
        <table class="tbl-list">
            <tr>
                <th>Status</th>
                <th>Project</th>
                <th>SOW Expiration</th>
                <th>Engagement Type</th>
                <th>Hours Used for Current Month</th>
                <th>Last Updated</th>
                <th>Engagement Manager</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr class="tr-row">
            <td><%# Eval("Fields.Status") %></td>
            <td><%# Eval("Fields.Project") %></td>
            <td><%# Eval("Fields.SOWExpiration") %></td>
            <td><%# Eval("Fields.EngagementType") %></td>
            <td><%# Eval("Fields.HoursUsedForCurrentMonth") %></td>
            <td><%# Eval("Fields.Field22", "{0: MM/dd/yyyy}") %></td>
            <td><%# Eval("Fields.EngagementManager.Name") %></td>
        </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <tr class="tr-alt-row">
            <td><%# Eval("Fields.Status") %></td>
            <td><%# Eval("Fields.Project") %></td>
            <td><%# Eval("Fields.SOWExpiration") %></td>
            <td><%# Eval("Fields.EngagementType") %></td>
            <td><%# Eval("Fields.HoursUsedForCurrentMonth") %></td>
            <td><%# Eval("Fields.Field22", "{0: MM/dd/yyyy}") %></td>
            <td><%# Eval("Fields.EngagementManager.Name") %></td>
        </tr>
    </AlternatingItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>

<h3>Hour Retainer</h3>
<asp:Repeater ID="rptHourRetainer" runat="server">
    <HeaderTemplate>
        <table class="tbl-list">
            <tr>
                <th>Status</th>
                <th>Project</th>
                <th>SOW Expiration</th>
                <th>Engagement Type</th>
                <th>Retainer Total Hours</th>
                <th>Retainer Hours Used</th>
                <th>Retainer Hours Remaining</th>
                <th>Last Updated</th>
                <th>Engagement Manager</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr class="tr-row">
            <td><%# Eval("Fields.Status") %></td>
            <td><%# Eval("Fields.Project") %></td>
            <td><%# Eval("Fields.SOWExpiration") %></td>
            <td><%# Eval("Fields.EngagementType") %></td>
            <td><%# Eval("Fields.RetainerTotal") %></td>
            <td><%# Eval("Fields.RetainerHoursUsed") %></td>
            <td><%# Eval("Fields.RetainerHoursReminaing") %></td>
            <td><%# Eval("Fields.Field22", "{0: MM/dd/yyyy}") %></td>
            <td><%# Eval("Fields.EngagementManager.Name") %></td>
        </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <tr class="tr-alt-row">
            <td><%# Eval("Fields.Status") %></td>
            <td><%# Eval("Fields.Project") %></td>
            <td><%# Eval("Fields.SOWExpiration") %></td>
            <td><%# Eval("Fields.EngagementType") %></td>
            <td><%# Eval("Fields.RetainerTotal") %></td>
            <td><%# Eval("Fields.RetainerHours") %></td>
            <td><%# Eval("Fields.RetainerHoursReminaing") %></td>
            <td><%# Eval("Fields.Field22", "{0: MM/dd/yyyy}") %></td>
            <td><%# Eval("Fields.EngagementManager.Name") %></td>
        </tr>
    </AlternatingItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>

<h3>Support Services: Monthly Budget Subscription
Status</h3>
<asp:Repeater ID="rptSupportServicesMonthlyBudgetSubscriptionStatus" runat="server">
    <HeaderTemplate>
        <table class="tbl-list">
            <tr>
                <th>Status</th>
                <th>Project</th>
                <th>SOW Expiration</th>
                <th>Engagement Type</th>
                <th>Monthly Subscription Cost Current</th>
                <th>Current Month Starting Budget</th>
                <th>Budget Used</th>
                <th>Budget Remaining</th>
                <th>Last Updated</th>
                <th>Engagement Manager</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr class="tr-row">
            <td><%# Eval("Fields.Status") %></td>
            <td><%# Eval("Fields.Project") %></td>
            <td><%# Eval("Fields.SOWExpiration") %></td>
            <td><%# Eval("Fields.EngagementType") %></td>
            <td><%# Eval("Fields.MonthlySubscriptionCost") %></td>
            <td><%# Eval("Fields.CurrentMonthStartingBudget") %></td>
            <td><%# Eval("Fields.BudgetUsed") %></td>
            <td><%# Eval("Fields.BudgetRemaining") %></td>
            <td><%# Eval("Fields.Field22", "{0: MM/dd/yyyy}") %></td>
            <td><%# Eval("Fields.EngagementManager.Name") %></td>
        </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <tr class="tr-alt-row">
            <td><%# Eval("Fields.Status") %></td>
            <td><%# Eval("Fields.Project") %></td>
            <td><%# Eval("Fields.SOWExpiration") %></td>
            <td><%# Eval("Fields.EngagementType") %></td>
            <td><%# Eval("Fields.MonthlySubscriptionCost") %></td>
            <td><%# Eval("Fields.CurrentMonthStartingBudget") %></td>
            <td><%# Eval("Fields.BudgetUsed") %></td>
            <td><%# Eval("Fields.BudgetRemaining") %></td>
            <td><%# Eval("Fields.Field22", "{0: MM/dd/yyyy}") %></td>
            <td><%# Eval("Fields.EngagementManager.Name") %></td>
        </tr>
    </AlternatingItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>

<h3>Support Services: Monthly Hour Subscription</h3>
<asp:Repeater ID="rptSupportServicesMonthlyHourSubscription" runat="server">
    <HeaderTemplate>
        <table class="tbl-list">
            <tr>
                <th>Status</th>
                <th>Project</th>
                <th>SOW Expiration</th>
                <th>Engagement Type</th>
                <th>Monthly Subscription Cost</th>
                <th>Monthly Hour Allowance</th>
                <th>Current Month Subscription
Hour Starting Balance</th>
                <th>Hours Used This Month</th>
                <th>Hours Remaining</th>
                <th>Last Updated</th>
                <th>Engagement Manager</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr class="tr-row">
            <td><%# Eval("Fields.Status") %></td>
            <td><%# Eval("Fields.Project") %></td>
            <td><%# Eval("Fields.SOWExpiration") %></td>
            <td><%# Eval("Fields.EngagementType") %></td>
            <td><%# Eval("Fields.MonthlySubscriptionCost") %></td>
            <td><%# Eval("Fields.MonthlyHourAllowance") %></td>
            <td><%# Eval("Fields.CurrentMonthStartingBalance") %></td>
            <td><%# Eval("Fields.HoursUsedThisMonth") %></td>
            <td><%# Eval("Fields.HoursRemaining") %></td>
            <td><%# Eval("Fields.Field22", "{0: MM/dd/yyyy}") %></td>
            <td><%# Eval("Fields.EngagementManager.Name") %></td>
        </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <tr class="tr-alt-row">
            <td><%# Eval("Fields.Status") %></td>
            <td><%# Eval("Fields.Project") %></td>
            <td><%# Eval("Fields.SOWExpiration") %></td>
            <td><%# Eval("Fields.EngagementType") %></td>
            <td><%# Eval("Fields.MonthlySubscriptionCost") %></td>
            <td><%# Eval("Fields.MonthlyHourAllowance") %></td>
            <td><%# Eval("Fields.CurrentMonthStartingBalance") %></td>
            <td><%# Eval("Fields.HoursUsedThisMonth") %></td>
            <td><%# Eval("Fields.HoursRemaining") %></td>
            <td><%# Eval("Fields.Field22", "{0: MM/dd/yyyy}") %></td>
            <td><%# Eval("Fields.EngagementManager.Name") %></td>
        </tr>
    </AlternatingItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>

<p>&nbsp;</p>