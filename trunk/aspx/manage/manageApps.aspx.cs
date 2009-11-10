using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspx.manage
{
    public partial class ManageApps : MyPageClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AppsSqlDS_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (null != e.Command.Parameters["@filterValue"].Value)
            {
                e.Command.Parameters["@filterValue"].Value = e.Command.Parameters["@filterValue"].Value.ToString().Replace('*', '%').Replace('?', '_');
            }
        }
        protected void All_LinkButt_Click(object sender, EventArgs e)
        {
            AppsGV.DataSourceID = AllAppSqlDS.ID;
            AppsGV.DataBind();
        }
        protected void FindButton_Click(object sender, EventArgs e)
        {
            AppsGV.DataSourceID = AppsSqlDS.ID;

            if (SearchByDropDown.SelectedValue == "APP DESC")
            {
                AppsSqlDS.SelectCommand = "P_GetApplicationByDescFilter";
            }
            else
            {
                AppsSqlDS.SelectCommand = "P_GetApplicationByKeyFilter";
            }

            AppsGV.DataBind();
        }
    }
}