using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspx.manage
{
    public partial class EditRole : MyPageClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (this.hasQueryString("mode"))
                {
                    if (this.getQueryString("mode") == "create")
                    {
                        Role_FV.ChangeMode(FormViewMode.Insert);
                    }
                    else if (this.getQueryString("mode") == "edit")
                    {
                        Role_FV.ChangeMode(FormViewMode.Edit);
                    }
                    else
                    {
                        Role_FV.ChangeMode(FormViewMode.ReadOnly);
                    }
                }
            }
        }

        protected void Role_LinqDS_Inserted(object sender, LinqDataSourceStatusEventArgs e)
        {
            Response.Redirect(Page.ResolveUrl("~/aspx/manage/editRole.aspx") + "?roleKey=" + ((TextBox)Role_FV.FindControl("ROLE_KEYTextBox")).Text);
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            //if don't have roleKey in query string
            if (!this.hasQueryString("roleKey")){
                Response.Redirect(Page.ResolveUrl("~/aspx/manage/manageRoles.aspx"));
            }
        }
    }
}