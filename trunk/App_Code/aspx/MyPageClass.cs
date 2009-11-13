using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using log4net;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

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

        protected bool hasQueryString(String name)
        {
            bool result = false;

            if (null != Request.QueryString[name])
            {
                result = true;
            }

            return result;
        }

        protected String getQueryString(String name)
        {
            String result = null;

            if (this.hasQueryString(name))
            {
                result = Request.QueryString[name];
            }

            return result;
        }

        protected FormsAuthenticationTicket getAuthTicket()
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

        protected void logActivity(String action)
        {
            //Only proceed if the user is authenticated
            if (Request.IsAuthenticated)
            {
                //Get information about the currently logged on user
                if (null != User)
                {
                    //Call the P_UpdateUsersCurrentActivity
                    using(SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["USERConnectionString"].ConnectionString))
                    {
                        SqlCommand myCommand = new SqlCommand("P_UpdateUsersCurrentActivity", myConn);
                        myCommand.CommandType = System.Data.CommandType.StoredProcedure;

                        myCommand.Parameters.AddWithValue("@empId", User.Identity.Name);
                        myCommand.Parameters.AddWithValue("@appKey", ConfigurationManager.AppSettings["APPLICATION_NAME"]);
                        myCommand.Parameters.AddWithValue("@activity", action);
                        myCommand.Parameters.AddWithValue("@activityDate", DateTime.Now);
                        //myCommand.Parameters.AddWithValue("@activityDate", DateTime.UtcNow);

                        myConn.Open();
                        myCommand.ExecuteNonQuery();
                        myConn.Close();
                    }//end using
                }
            }
        }
    }
}