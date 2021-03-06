﻿namespace Appleseed.DesktopModules.CoreModules.Evolutility_Wizard
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using Evolutility.SideBar;
    using Evolutility.ExportWizard;
    using Evolutility.DataServer;
    using Evolutility;
    using Framework.Site.Configuration;
    /// <summary>
    /// Existing control listing page
    /// </summary>
    public partial class Evolutility_Wizard1 : System.Web.UI.Page
    {
        /// <summary>
        /// On page load set wizard mode by reading queary string value
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            var Settings = ModuleSettings.GetModuleSettings(Convert.ToInt32(Request.QueryString["mid"]));
            if (Settings.ContainsKey("DataConnection") && Settings["DataConnection"].Value != null && !string.IsNullOrEmpty(Settings["DataConnection"].Value.ToString()))
            {
                this.evoWizard.SqlConnection = Settings["DataConnection"].Value.ToString();
            }

            if (Settings.ContainsKey("Evol.Disco.Connection") && Settings["Evol.Disco.Connection"].Value != null && !string.IsNullOrEmpty(Settings["Evol.Disco.Connection"].Value.ToString()))
            {
                this.evoWizard.SqlConnectionDico = Settings["Evol.Disco.Connection"].Value.ToString();
            }
            //Check querystring value 
            if (Convert.ToString(Request["acn"]) == "script")
                evoWizard.WizardMode = Evolutility.Wizard.EvolWizardMode.Build;
            else
            {
                string formid = Request["WIZ"];
                if (String.IsNullOrEmpty(formid))
                {
                    formid = "catalog";
                }
                switch (formid)
                {
                    case "build":
                        evoWizard.WizardMode = Evolutility.Wizard.EvolWizardMode.Build;
                        break;
                    case "dbscan":
                        evoWizard.WizardMode = Evolutility.Wizard.EvolWizardMode.Map_DB;
                        break;
                    case "install":
                        evoWizard.WizardMode = Evolutility.Wizard.EvolWizardMode.Install;
                        break;
                    case "xml2db":
                        evoWizard.WizardMode = Evolutility.Wizard.EvolWizardMode.Import_XML;
                        break;
                    default:
                        evoWizard.WizardMode = Evolutility.Wizard.EvolWizardMode.Build;
                        break;
                }
            }
        }
    }
}