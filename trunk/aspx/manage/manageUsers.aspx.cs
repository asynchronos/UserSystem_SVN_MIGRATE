using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspx.manage
{
    public partial class ManageUsers : MyPageClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void UsersSqlDS_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

            if (SearchByDropDown.SelectedValue == "NAME")
            {
                UsersSqlDS.SelectCommand = "P_GetUsersByNameFilter";
            }
            else
            {
                UsersSqlDS.SelectCommand = "P_GetUsersByEmpIdFilter";
            }

            if (null != e.Command.Parameters["@filterValue"].Value)
            {
                e.Command.Parameters["@filterValue"].Value = e.Command.Parameters["@filterValue"].Value.ToString().Replace('*', '%').Replace('?', '_');
            }

        }
        protected void All_LinkButt_Click(object sender, EventArgs e)
        {
            UsersGV.DataSourceID = AllUserSqlDS.ID;
            UsersGV.DataBind();
        }
        protected void FindButton_Click(object sender, EventArgs e)
        {
            UsersGV.DataSourceID = UsersSqlDS.ID;
            UsersGV.DataBind();
        }
    }
}