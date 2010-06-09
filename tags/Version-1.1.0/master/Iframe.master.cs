using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace aspx
{
    public partial class Iframe : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            //addHeaderLinkAt(0, "~/js/ext3.0/resources/css/ext-all.css")
            //addHeaderLinkAt(1, "~/theme/MyStyleSheet.css")

            //addHeaderScriptAt(2, "~/js/ext3.0/adapter/ext/ext-base.js")
            //addHeaderScriptAt(3, "~/js/ext3.0/ext-all.js")

            //addHeaderScriptAt(4, "~/js/jquery.js")
            //addHeaderScriptAt(5, "~/js/common.js")
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

