using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using log4net;
using System.Web.Security;

namespace aspx
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Init(object sender, EventArgs e)
        {
            addHeaderLinkAt(0, "~/control/webMenu/chrometheme/chromestyle2.css");
            addHeaderScriptAt(1, "~/control/webMenu/chromejs/chrome.js");
            addHeaderScriptAt(2, "~/js/common.js");
        }

        protected void addHeaderLinkAt(int index, String href)
        {
            head.Controls.AddAt(index, new LiteralControl("<link type='text/css' rel='stylesheet' href='" + Page.ResolveUrl(href) + "'/>"));
        }

        protected void addHeaderScriptAt(int index, String src)
        {
            head.Controls.AddAt(index, new LiteralControl("<script type='text/javascript' src='" + Page.ResolveUrl(src) + "'></script>"));
        }

    }
}
