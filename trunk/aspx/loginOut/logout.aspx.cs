using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using log4net;

namespace aspx.loginOut
{
    public partial class Logout : MyPageClass
    {
        private static readonly ILog log = LogManager.GetLogger(
                System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            string username = string.Empty;
            FormsAuthenticationTicket authTicket = this.getAuthTicket();

            if (null != authTicket)
            {
                username = authTicket.Name;

                FormsAuthentication.SignOut();
                Session.Clear();
                Session.Abandon();
                Context.Request.Cookies.Clear();

                log.Info(username + " logout.");
            }

            Response.Redirect(FormsAuthentication.LoginUrl);
        }
    }
}