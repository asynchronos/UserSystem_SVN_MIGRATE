using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspx.manage
{
    public partial class ManageRoles : MyPageClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RoleSqlDS_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (null != e.Command.Parameters["@filterValue"].Value)
            {
                e.Command.Parameters["@filterValue"].Value = e.Command.Parameters["@filterValue"].Value.ToString().Replace('*', '%').Replace('?', '_');
            }
        }
        protected void All_LinkButt_Click(object sender, EventArgs e)
        {
            Roles_GV.DataSourceID = AllRolesSqlDS.ID;
            Roles_GV.DataBind();
        }
        protected void FindButton_Click(object sender, EventArgs e)
        {
            Roles_GV.DataSourceID = RoleSqlDS.ID;

            if (SearchByDropDown.SelectedValue == "ROLE VALUE")
            {
                RoleSqlDS.SelectCommand = "P_GetRolesByCategoryAndRoleValue";
            }
            else
            {
                RoleSqlDS.SelectCommand = "P_GetRolesByCategoryAndRoleDesc";
            }

            Roles_GV.DataBind();
        }
    }
}