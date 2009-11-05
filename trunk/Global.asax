<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Web.DynamicData" %>
<%@ Import Namespace="System.Web.SessionState" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="log4net" %>

<script RunAt="server">
    private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
    private static readonly bool isDebugEnabled = log.IsDebugEnabled;
    
    public static void RegisterRoutes(RouteCollection routes)
    {
        MetaModel model = new MetaModel();

        // IMPORTANT: DATA MODEL REGISTRATION 
        // Uncomment this line to register LINQ to SQL classes or an ADO.NET Entity Data
        // model for ASP.NET Dynamic Data. Set ScaffoldAllTables = true only if you are sure 
        // that you want all tables in the data model to support a scaffold (i.e. templates) 
        // view. To control scaffolding for individual tables, create a partial class for 
        // the table and apply the [Scaffold(true)] attribute to the partial class.
        // Note: Make sure that you change "YourDataContextType" to the name of the data context
        // class in your application.
        //model.RegisterContext(typeof(YourDataContextType), new ContextConfiguration() { ScaffoldAllTables = false });
        model.RegisterContext(typeof(UserSystemModel.UserSystemEntities), new ContextConfiguration() { ScaffoldAllTables = true });

        // only TB_AUTHO_ROLE_CATEGORY use ListDetails
        routes.Add(new DynamicDataRoute("TB_AUTHO_ROLE_CATEGORY/{action}.aspx")
        {
            ViewName = "ListDetails",
            Table = "TB_AUTHO_ROLE_CATEGORY",
            Model = model
        });

        // The following statement supports separate-page mode, where the List, Detail, Insert, and 
        // Update tasks are performed by using separate pages. To enable this mode, uncomment the following 
        // route definition, and comment out the route definitions in the combined-page mode section that follows.
        routes.Add(new DynamicDataRoute("{table}/{action}.aspx")
        {
            Constraints = new RouteValueDictionary(new { action = "List|Details|Edit|Insert" }),
            Model = model
        });

        // The following statements support combined-page mode, where the List, Detail, Insert, and
        // Update tasks are performed by using the same page. To enable this mode, uncomment the
        // following routes and comment out the route definition in the separate-page mode section above.
        //routes.Add(new DynamicDataRoute("{table}/ListDetails.aspx") {
        //    Action = PageAction.List,
        //    ViewName = "ListDetails",
        //    Model = model
        //});

        //routes.Add(new DynamicDataRoute("{table}/ListDetails.aspx") {
        //    Action = PageAction.Details,
        //    ViewName = "ListDetails",
        //    Model = model
        //});
    }

    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);

        //load log4net config(start once only)
        log4net.Config.XmlConfigurator.Configure();
    }

    void Application_Error(object sender, EventArgs e)
    {
        Exception err = Server.GetLastError();

        //Creation of event log if it does not exist
        String EventLogName = "UserSystem";
        if (!EventLog.SourceExists(EventLogName))
        {
            EventLog.CreateEventSource(EventLogName, EventLogName);
        }

        //Inserting into event log
        EventLog Log = new EventLog();
        Log.Source = EventLogName;
        Log.WriteEntry(err.ToString(), EventLogEntryType.Error);

        //Insert log by log4net
        log.Error(err.Message, err);
        
        //send mail
        //System.Web.Mail.MailMessage mail = new System.Web.Mail.MailMessage();
        //String ErrorMessage = "The error description is as follows : " + ErrorDescription;
        //mail.To = "mail@domail.com";
        //mail.Subject = "Error in the " + EventLogName + "site";
        //mail.Priority = System.Web.Mail.MailPriority.High;
        //mail.BodyFormat = System.Web.Mail.MailFormat.Text;
        //mail.Body = ErrorMessage;
        //System.Web.Mail.SmtpMail.Send(mail);

        //redirect to error page
        if (err.GetType().Equals(typeof(System.Security.SecurityException)))
        {
            Response.Redirect("~/aspx/error/unauthorized.aspx?page=" + Server.UrlEncode(Request.RawUrl));
        }
    }

    protected void Application_AuthenticateRequest(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated)
        {
            //Extract the forms authentication cookie
            HttpCookie authCookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];

            if (null != authCookie)
            {
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

                //When the ticket was created, 
                //the UserData property was assigned a pipe delimited string of role names.
                string[] rolesArray = authTicket.UserData.Split('|');
                
                //Create an Identity Object
                FormsIdentity id = new FormsIdentity(authTicket);
                //This principal will flow throughout the request.
                System.Security.Principal.GenericPrincipal princ =
                    new System.Security.Principal.GenericPrincipal(id,rolesArray);
                
                //Attach the new principal object to the current HttpContext object
                Context.User = princ;
                
                //add new Expires to cookie
                authCookie.Expires.AddMinutes(30);
            }
            else
            {
                log.Error("authCookie is null");
            }
        }
    }
</script>

