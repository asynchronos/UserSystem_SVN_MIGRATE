using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using log4net;
using System.Web.Security;

/// <summary>
/// Summary description for MyPageClass
/// </summary>

namespace aspx
{
    public abstract class MyPageClass : System.Web.UI.Page
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public MyPageClass()
        {
            //
            // TODO: Add constructor logic here
            //

        }

        public bool hasQueryString(String name)
        {
            bool result = false;

            if (null != Request.QueryString[name])
            {
                result = true;
            }

            return result;
        }

        public String getQueryString(String name)
        {
            String result = null;

            if (hasQueryString(name))
            {
                result = Request.QueryString[name];
            }

            return result;
        }

        public FormsAuthenticationTicket getAuthTicket()
        {
            HttpCookie authCookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];
            FormsAuthenticationTicket authTicket = null;
            try
            {
                authTicket = FormsAuthentication.Decrypt(authCookie.Value);
            }
            catch (ArgumentException argEx)
            {
                log.Error(argEx.Message, argEx);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message, ex);
            }

            return authTicket;
        }
    }
}