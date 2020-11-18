using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Appleseed.DesktopModules.CoreModules.Airtable
{
    public class TableRecords<T>
    {
        public List<Record<T>> Records { get; set; }
    }

    public class Record<T>
    {
        public string Id { get; set; }
        public T Fields { get; set; }
        public DateTime Created { get; set; }

    }

    [Serializable]
    public class Field
    {
        [JsonProperty("customerId")]
        public int CustomerId { get; set; }
    }

    public class OnDemandServicesRow
    {
        [JsonProperty("SOW Expiration")]
        public string SOWExpiration { get; set; }
        [JsonProperty("Project")]
        public string Project { get; set; }
        [JsonProperty("Project Contact Email")]
        public string ProjectContactEmail { get; set; }
        [JsonProperty("Engagement Type")]
        public string EngagementType { get; set; }
        [JsonProperty("Project Contact LastName")]
        public string ProjectContactLastName { get; set; }
        [JsonProperty("Engagement Manager")]
        public NameDetail EngagementManager { get; set; }
        [JsonProperty("Project Contact FirstName")]
        public string ProjectContactFirstName { get; set; }
        [JsonProperty("Client / Company")]
        public string ClientCompany { get; set; }
        [JsonProperty("Status")]
        public string Status { get; set; }
        [JsonProperty("Field 21")]
        public NameDetail Field21 { get; set; }
        [JsonProperty("Field 22")]
        public DateTime Field22 { get; set; }
        [JsonProperty("Hours Used for Current Month")]
        public string HoursUsedForCurrentMonth { get; set; }
    }

    public class HourRetainersRow
    {
        [JsonProperty("Project Contact Email")]
        public string ProjectContactEmail { get; set; }
        [JsonProperty("Engagement Type")]
        public string EngagementType { get; set; }
        [JsonProperty("Retainer Hours")]
        public string RetainerHours { get; set; }
        [JsonProperty("Project Contact LastName")]
        public string ProjectContactLastName { get; set; }
        [JsonProperty("Engagement Manager")]
        public NameDetail EngagementManager { get; set; }
        [JsonProperty("Project Contact FirstName")]
        public string ProjectContactFirstName { get; set; }
        [JsonProperty("Retainer Total")]
        public string RetainerTotal { get; set; }
        [JsonProperty("Client / Company")]
        public string ClientCompany { get; set; }
        [JsonProperty("Status")]
        public string Status { get; set; }
        [JsonProperty("SOW Expiration")]
        public string SOWExpiration { get; set; }
        [JsonProperty("Project")]
        public string Project { get; set; }
        [JsonProperty("Retainer Hours Reminaing")]
        public string RetainerHoursReminaing { get; set; }
        [JsonProperty("Retainer Hours Used")]
        public string RetainerHoursUsed { get; set; }
        [JsonProperty("Field 21")]
        public NameDetail Field21 { get; set; }
        [JsonProperty("Field 22")]
        public DateTime Field22 { get; set; }
    }
    public class ManagedServicesSubscriptionRow
    {
        [JsonProperty("Engagement Type")]
        public string EngagementType { get; set; }
        [JsonProperty("Project Contact LastName")]
        public string ProjectContactLastName { get; set; }
        [JsonProperty("Engagement Manager")]
        public NameDetail EngagementManager { get; set; }
        [JsonProperty("Project Contact FirstName")]
        public string ProjectContactFirstName { get; set; }
        [JsonProperty("Status")]
        public string Status { get; set; }
        [JsonProperty("SOW Expiration")]
        public string SOWExpiration { get; set; }
        [JsonProperty("Project")]
        public string Project { get; set; }
        [JsonProperty("Monthly Subscription Cost")]
        public string MonthlySubscriptionCost { get; set; }
        [JsonProperty("Project Contact Email")]
        public string ProjectContactEmail { get; set; }
        [JsonProperty("Client / Company")]
        public string ClientCompany { get; set; }
        [JsonProperty("Field 21")]
        public NameDetail Field21 { get; set; }
        [JsonProperty("Field 22")]
        public DateTime Field22 { get; set; }
    }
    public class SupportServicesSubscriptionHoursRow
    {
        [JsonProperty("Current Month Starting Balance")]
        public string CurrentMonthStartingBalance { get; set; }
        [JsonProperty("Project")]
        public string Project { get; set; }
        [JsonProperty("Monthly Subscription Cost")]
        public string MonthlySubscriptionCost { get; set; }
        [JsonProperty("Project Contact Email")]
        public string ProjectContactEmail { get; set; }
        [JsonProperty("Monthly Hour Allowance")]
        public string MonthlyHourAllowance { get; set; }
        [JsonProperty("Engagement Type")]
        public string EngagementType { get; set; }
        [JsonProperty("Project Contact LastName")]
        public string ProjectContactLastName { get; set; }
        [JsonProperty("Engagement Manager")]
        public NameDetail EngagementManager { get; set; }
        [JsonProperty("Project Contact FirstName")]
        public string ProjectContactFirstName { get; set; }
        [JsonProperty("Client / Company")]
        public string ClientCompany { get; set; }
        [JsonProperty("Status")]
        public string Status { get; set; }
        [JsonProperty("Hours Used This Month")]
        public string HoursUsedThisMonth { get; set; }
        [JsonProperty("SOW Expiration")]
        public string SOWExpiration { get; set; }

        [JsonProperty("Hours Remaining")]
        public string HoursRemaining { get; set; }

        [JsonProperty("Field 21")]
        public NameDetail Field21 { get; set; }
        [JsonProperty("Field 22")]
        public DateTime Field22 { get; set; }
    }

    public class SupportServicesSubscriptionBudgetRow
    {
        [JsonProperty("SOW Expiration")]
        public string SOWExpiration { get; set; }
        [JsonProperty("Project")]
        public string Project { get; set; }
        [JsonProperty("Monthly Subscription Cost")]
        public string MonthlySubscriptionCost { get; set; }
        [JsonProperty("Budget Used")]
        public string BudgetUsed { get; set; }
        [JsonProperty("Engagement Type")]
        public string EngagementType { get; set; }
        [JsonProperty("Project Contact LastName")]
        public string ProjectContactLastName { get; set; }
        [JsonProperty("Engagement Manager")]
        public NameDetail EngagementManager { get; set; }
        [JsonProperty("Project Contact FirstName")]
        public string ProjectContactFirstName { get; set; }
        [JsonProperty("Client / Company")]
        public string ClientCompany { get; set; }
        [JsonProperty("Status")]
        public string Status { get; set; }
        [JsonProperty("Field 21")]
        public NameDetail Field21 { get; set; }
        [JsonProperty("Field 22")]
        public DateTime Field22 { get; set; }
        [JsonProperty("Current Month Starting Budget")]
        public string CurrentMonthStartingBudget { get; set; }
        [JsonProperty("Budget Remaining")]
        public string BudgetRemaining { get; set; }
    }

    public class StaticInfoForClientPageRow
    {
        [JsonProperty("text")]
        public string Text { get; set; }

        [JsonProperty("Name")]
        public string Name { get; set; }

        [JsonProperty("Notes")]
        public string Notes { get; set; }
    }

    public class NameDetail
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("Name")]
        public string Name { get; set; }

        [JsonProperty("Email")]
        public string Email { get; set; }
    }
}
