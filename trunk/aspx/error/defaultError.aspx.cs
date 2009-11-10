using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspx.error
{
    public partial class defaultError : MyPageClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Error_Label.Text = "Error : Please contact administrator.<br />"
                + "Page : " + getQueryString("page")+"<br />"
                + "Message : " + getQueryString("msg") + "<br />";
        }
    }
}
