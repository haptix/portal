using Appleseed.Framework;
using Appleseed.Framework.DataTypes;
using Appleseed.Framework.Web.UI.WebControls;
using Newtonsoft.Json;
using NuGet;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Appleseed.DesktopModules.CoreModules.Airtable
{
    public partial class AirtableViewer : PortalModuleControl
    {
        private TableRecords<OnDemandServicesRow> onDemandServices;
        private TableRecords<HourRetainersRow> hourRetainers;
        private TableRecords<ManagedServicesSubscriptionRow> managedServicesSubscription;
        private TableRecords<SupportServicesSubscriptionHoursRow> supportServicesSubscriptionHours;
        private TableRecords<SupportServicesSubscriptionBudgetRow> supportServicesSubscriptionBudget;
        private TableRecords<StaticInfoForClientPageRow> staticInfoForClientPage;

        private System.Net.Http.HttpClient httpClient = new System.Net.Http.HttpClient();

        public AirtableViewer()
        {
            var group = SettingItemGroup.MODULE_SPECIAL_SETTINGS;
            var groupOrderBase = (int)SettingItemGroup.MODULE_SPECIAL_SETTINGS;

            var appKey = new SettingItem<string, TextBox>(new BaseDataType<string, TextBox>())
            {
                Order = (int)groupOrderBase + 1,
                Group = group,
                EnglishName = "Airtable App Key",
                Description = ""
            };

            this.BaseSettings.Add("AIRTABLE_APP_KEY", appKey);

            var baseId = new SettingItem<string, TextBox>(new BaseDataType<string, TextBox>())
            {
                Order = (int)groupOrderBase + 1,
                Group = group,
                EnglishName = "Airtable Base Id",
                Description = ""
            };

            this.BaseSettings.Add("AIRTABLE_BASE_ID", baseId);

        }

        /// <summary>
        /// GUID of module (mandatory)
        /// </summary>
        /// <value></value>
        public override Guid GuidID
        {
            get { return new Guid("{E6339F54-40BC-4510-85F8-FE2072E595CD}"); }
        }

        private string AppKey
        {
            get
            {
                string val = string.Empty;
                if (this.Settings.ContainsKey("AIRTABLE_APP_KEY") && this.Settings["AIRTABLE_APP_KEY"].Value != null && !string.IsNullOrEmpty(this.Settings["AIRTABLE_APP_KEY"].Value.ToString()))
                {
                    val = this.Settings["AIRTABLE_APP_KEY"].Value.ToString();
                }

                return val;
            }
        }

        private string BaseId
        {
            get
            {
                string val = string.Empty;
                if (this.Settings.ContainsKey("AIRTABLE_BASE_ID") && this.Settings["AIRTABLE_BASE_ID"].Value != null && !string.IsNullOrEmpty(this.Settings["AIRTABLE_BASE_ID"].Value.ToString()))
                {
                    val = this.Settings["AIRTABLE_BASE_ID"].Value.ToString();
                }

                return val;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(AppKey) || string.IsNullOrEmpty(BaseId))
            {
                //show error mesage that missing congurations
            }
            else
            {
                httpClient.BaseAddress = new Uri("https://api.airtable.com");
                httpClient.DefaultRequestHeaders.Add("authorization", "Bearer " + AppKey);

                rptManagedServiceMonthlySubscription.DataSource = GetManagedServicesSubscription().Records;
                rptManagedServiceMonthlySubscription.DataBind();

                rptOnDemandService.DataSource = GetOnDemandServices().Records;
                rptOnDemandService.DataBind();

                rptHourRetainer.DataSource = GetHourRetainers().Records;
                rptHourRetainer.DataBind();

                rptSupportServicesMonthlyHourSubscription.DataSource = GetSupportServicesSubscriptionHours().Records;
                rptSupportServicesMonthlyHourSubscription.DataBind();

                rptSupportServicesMonthlyBudgetSubscriptionStatus.DataSource = GetSupportServicesSubscriptionBudget().Records;
                rptSupportServicesMonthlyBudgetSubscriptionStatus.DataBind();
            }
        }
        private TableRecords<OnDemandServicesRow> GetOnDemandServices()
        {
            string result = GetTableResults("/v0/" + BaseId + "/On Demand Services");
            var tableRecords = JsonConvert.DeserializeObject<TableRecords<OnDemandServicesRow>>(result);

            if (!Appleseed.Framework.Security.UserProfile.CurrentUser.HasAdminAccess() && !Appleseed.Framework.Security.UserProfile.CurrentUser.HasPortalAdminAccess())
            {
                tableRecords.Records = tableRecords.Records.Where(item => item.Fields.EngagementManager.Email.ToLower() != Appleseed.Framework.Security.UserProfile.CurrentUser.UserInfo.Email.ToLower()).ToList();
            }

            return tableRecords;
        }
        private TableRecords<HourRetainersRow> GetHourRetainers()
        {
            string result = GetTableResults("/v0/" + BaseId + "/Hour Retainers");
            var tableRecords = JsonConvert.DeserializeObject<TableRecords<HourRetainersRow>>(result);
            if (!Appleseed.Framework.Security.UserProfile.CurrentUser.HasAdminAccess() && !Appleseed.Framework.Security.UserProfile.CurrentUser.HasPortalAdminAccess())
            {
                tableRecords.Records = tableRecords.Records.Where(item => item.Fields.EngagementManager.Email.ToLower() != Appleseed.Framework.Security.UserProfile.CurrentUser.UserInfo.Email.ToLower()).ToList();
            }
            return tableRecords;
        }
        private TableRecords<ManagedServicesSubscriptionRow> GetManagedServicesSubscription()
        {
            string result = GetTableResults("/v0/" + BaseId + "/Managed Services Subscription");
            var tableRecords = JsonConvert.DeserializeObject<TableRecords<ManagedServicesSubscriptionRow>>(result);
            if (!Appleseed.Framework.Security.UserProfile.CurrentUser.HasAdminAccess() && !Appleseed.Framework.Security.UserProfile.CurrentUser.HasPortalAdminAccess())
            {
                tableRecords.Records = tableRecords.Records.Where(item => item.Fields.EngagementManager.Email.ToLower() != Appleseed.Framework.Security.UserProfile.CurrentUser.UserInfo.Email.ToLower()).ToList();
            }
            return tableRecords;
        }
        private TableRecords<SupportServicesSubscriptionHoursRow> GetSupportServicesSubscriptionHours()
        {
            string result = GetTableResults("/v0/" + BaseId + "/Support Services Subscription: Hours");
            var tableRecords = JsonConvert.DeserializeObject<TableRecords<SupportServicesSubscriptionHoursRow>>(result);
            if (!Appleseed.Framework.Security.UserProfile.CurrentUser.HasAdminAccess() && !Appleseed.Framework.Security.UserProfile.CurrentUser.HasPortalAdminAccess())
            {
                tableRecords.Records = tableRecords.Records.Where(item => item.Fields.EngagementManager.Email.ToLower() != Appleseed.Framework.Security.UserProfile.CurrentUser.UserInfo.Email.ToLower()).ToList();
            }
            return tableRecords;
        }
        private TableRecords<SupportServicesSubscriptionBudgetRow> GetSupportServicesSubscriptionBudget()
        {
            string result = GetTableResults("/v0/" + BaseId + "/Support Services Subscription: Budget");
            var tableRecords = JsonConvert.DeserializeObject<TableRecords<SupportServicesSubscriptionBudgetRow>>(result);
            if (!Appleseed.Framework.Security.UserProfile.CurrentUser.HasAdminAccess() && !Appleseed.Framework.Security.UserProfile.CurrentUser.HasPortalAdminAccess())
            {
                tableRecords.Records = tableRecords.Records.Where(item => item.Fields.EngagementManager.Email.ToLower() != Appleseed.Framework.Security.UserProfile.CurrentUser.UserInfo.Email.ToLower()).ToList();
            }
            return tableRecords;
        }

        private string GetTableResults(string endpoint)
        {
            var response = httpClient.GetAsync(endpoint).GetAwaiter().GetResult();
            string result = response.Content.ReadAsStringAsync().GetAwaiter().GetResult();
            return result;
        }
    }
}