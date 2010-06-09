using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace aspx
{
    public partial class Popup : System.Web.UI.MasterPage
    {

        protected void Page_Init(object sender, EventArgs e)
        {

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

