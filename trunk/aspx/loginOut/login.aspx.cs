using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using service.authen;
using model;
using System.Configuration;
using System.Web.Security;
using log4net;

namespace aspx.loginout
{
    public partial class Login : MyPageClass
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            AuthenUser client = new AuthenUser();
            UserModel result = client.Authenticate(UserName.Text, Password.Text,
                ConfigurationManager.AppSettings["APPLICATION_NAME"]);
            
            if (null == result)
            {
                FailureText.Text = "Authenticate fail : Invalid username or password";
            }
            else
            {
                if (result.RoleList.Count > 0)
                {
                    //Create the authentication ticket.
                    FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(
                        1, result.EMP_ID, DateTime.Now, DateTime.Now.AddDays(1), false,
                        result.getConcatRoleList());

                    //Now encrypt the ticket.
                    string encryptedTicket = FormsAuthentication.Encrypt(authTicket);

                    //Create a cookie and add the encrypted ticket to the cookie as data.
                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName,
                        encryptedTicket);
                    authCookie.Expires = DateTime.Now.AddDays(1);

                    //Add the cookie to the outgoing cookies collection.
                    Response.Cookies.Add(authCookie);

                    //Redirect the user to the originally requested page
                    Response.Redirect(FormsAuthentication.GetRedirectUrl(result.EMP_ID, false));

                    //Insert Log
                    if (isDebugEnabled)
                    {
                        log.Info(result.EMP_ID + " login.");
                    }

                }
                else
                {
                    FailureText.Text = "Authorize fail : Invalid roles";
                }
            }
        }
}
}
