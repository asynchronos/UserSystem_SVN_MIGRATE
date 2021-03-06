using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspx.manage
{
    public partial class EditUser : MyPageClass
    {
        #region My Code For Move ListBox

        protected string getListBoxValues(ListBox listBoxControl)
        {
            string result = null;

            foreach (ListItem item in listBoxControl.Items)
            {
                result = result + item.Value + ";";
            }

            return result;
        }
        protected void moveSelectedItem(ListBox sourceListBox, ListBox destinationListBox)
        {
            int sourceItemIndex = 0;

            //Reset SelectedIndex ฝั่ง destination
            foreach (ListItem item in destinationListBox.Items)
            {
                item.Selected = false;
            }

            while (sourceItemIndex < sourceListBox.Items.Count)
            {
                ListItem item = sourceListBox.Items[sourceItemIndex];
                if (item.Selected)
                {
                    destinationListBox.Items.Add(item);
                    sourceListBox.Items.RemoveAt(sourceItemIndex);
                }
                else
                {
                    sourceItemIndex++;
                }
            }
        }
        #endregion

        #region Get Control DropdownList
        protected DropDownList DDL_RoleCategory()
        {
            return (DropDownList)Role_FV.FindControl("DDL_RoleCategory");
        }
        #endregion

        #region Get Control Button
        protected Button Butt_CancelEdit()
        {
            return (Button)Role_FV.FindControl("Butt_CancelEdit");
        }

        protected Button Butt_SaveRole()
        {
            return (Button)Role_FV.FindControl("Butt_SaveRole");
        }

        protected Button Butt_CancelRole()
        {
            return (Button)Role_FV.FindControl("Butt_CancelRole");
        }
        #endregion

        #region "Get Control ListBox"
        protected ListBox ListBox_NotSelectedRole()
        {
            return (ListBox)Role_FV.FindControl("ListBox_NotSelectedRole");
        }
        protected ListBox ListBox_SelectedRole()
        {
            return (ListBox)Role_FV.FindControl("ListBox_SelectedRole");
        }
        #endregion

        #region Get Control Datasource
        protected SqlDataSource DS_SelectedRole()
        {
            return (SqlDataSource)Role_FV.FindControl("DS_SelectedRole");
        }
        #endregion

        #region Mode For List Box
        protected void RolesEditMode()
        {
            DDL_RoleCategory().Enabled = false;

            Butt_CancelEdit().Visible = false;
            Butt_SaveRole().Visible = true;
            Butt_CancelRole().Visible = true;
        }

        protected void RolesReadMode()
        {
            DDL_RoleCategory().Enabled = true;

            Butt_CancelEdit().Visible = true;
            Butt_SaveRole().Visible = false;
            Butt_CancelRole().Visible = false;
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (hasQueryString("mode"))
                {
                    if (getQueryString("mode") == "create")
                    {
                        User_FV.ChangeMode(FormViewMode.Insert);
                    }
                    else if (getQueryString("mode") == "edit")
                    {
                        User_FV.ChangeMode(FormViewMode.Edit);
                    }
                    else
                    {
                        User_FV.ChangeMode(FormViewMode.ReadOnly);
                    }
                }
            }
        }
        protected void Butt_SaveRole_Click(object sender, EventArgs e)
        {
            RolesReadMode();
            DS_SelectedRole().Update();
        }
        protected void Butt_CancelRole_Click(object sender, EventArgs e)
        {
            RolesReadMode();
            ListBox_NotSelectedRole().DataBind();
            ListBox_SelectedRole().DataBind();
        }
        protected void Butt_ToRight_Click(object sender, EventArgs e)
        {
            RolesEditMode();
            moveSelectedItem(ListBox_NotSelectedRole(), ListBox_SelectedRole());
        }
        protected void Butt_ToLeft_Click(object sender, EventArgs e)
        {
            RolesEditMode();
            moveSelectedItem(ListBox_SelectedRole(), ListBox_NotSelectedRole());
        }
        protected void DS_SelectedRole_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@empId"].Value = ((HiddenField)Role_FV.FindControl("EMP_ID_HF")).Value;
            e.Command.Parameters["@roles"].Value = getListBoxValues(ListBox_SelectedRole());
            e.Command.Parameters["@categoryKey"].Value = DDL_RoleCategory().SelectedValue;
        }

        protected void User_LinqDS_Inserting(object sender, LinqDataSourceInsertEventArgs e)
        {
            UserSystemDataClasses.TB_AUTHO_USER newObj = (UserSystemDataClasses.TB_AUTHO_USER)e.NewObject;

            newObj.CREATE_DATE = DateTime.Now;
            newObj.LAST_SIGN_ON_DATE = null;
            newObj.LAST_CHANGE_PASS_DATE = null;
            newObj.UPDATE_DATE = DateTime.Now;
        }
        protected void User_LinqDS_Inserted(object sender, LinqDataSourceStatusEventArgs e)
        {
            Response.Redirect(Page.ResolveUrl("~/aspx/manage/editUser.aspx") + "?empId=" + ((TextBox)User_FV.FindControl("EMP_IDTextBox")).Text);
        }
        protected void User_LinqDS_Updating(object sender, LinqDataSourceUpdateEventArgs e)
        {
            UserSystemDataClasses.TB_AUTHO_USER newObj = (UserSystemDataClasses.TB_AUTHO_USER)e.NewObject;
            UserSystemDataClasses.TB_AUTHO_USER orgObj = (UserSystemDataClasses.TB_AUTHO_USER)e.OriginalObject;

            newObj.UPDATE_DATE = DateTime.Now;

            if (newObj.PASSWD != orgObj.PASSWD)
            {
                newObj.LAST_CHANGE_PASS_DATE = DateTime.Now;
            }
            else
            {
                newObj.LAST_CHANGE_PASS_DATE = null;
            }
        }
    }
}