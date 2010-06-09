using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using service.user;
using model;

namespace aspx.test
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserService client = new UserService();
            //client.Authenticate("249888", "249888");
            //List<UserSystemModel.TB_AUTHO_USER> user = (List<UserSystemModel.TB_AUTHO_USER>)client.Authenticate("249888", "249888");

            UserModel result = client.Authenticate("249888", "249888","USER_SYSTEM");

            if (result == null)
            {
                Response.Write("Authenticate fail : Invalid username or password");
            }
            else
            {
                Response.Write(result.EMP_NAME);
                Response.Write("<br />");

                if (result.RoleList.Count > 0)
                {
                    foreach (RoleModel role in result.RoleList)
                    {
                        Response.Write("<br />");

                        Response.Write(role.ROLE_KEY);
                        Response.Write("<br />");
                        Response.Write(role.RoleCategory.ROLE_CATEGORY_DESC);
                        Response.Write("<br />");
                    }
                }
                else
                {
                    Response.Write("Authorize fail : Invalid roles");
                }


                //ist<UserSystemModel.TB_RELA_ROLE_EMP> rolesInEmp = result.TB_RELA_ROLE_EMP.ToList<UserSystemModel.TB_RELA_ROLE_EMP>();

                //Response.Write(rolesInEmp.Count);

                //foreach (UserSystemModel.TB_RELA_ROLE_EMP role in result.TB_RELA_ROLE_EMP.ToList<UserSystemModel.TB_RELA_ROLE_EMP>())
                //{
                //    Response.Write(role.TB_AUTHO_ROLE.ROLE_DESC);
                //}
            }

            //foreach (UserSystemModel.TB_RELA_ROLE_EMP role in user.)
            //{
            //    Response.Write(role.ID);
            //    Response.Write(role.TB_AUTHO_ROLE.PRIORITY);
            //    Response.Write("<br />");
            //}

            //Response.Write("Test : "+client.test());
        }
    }
}
