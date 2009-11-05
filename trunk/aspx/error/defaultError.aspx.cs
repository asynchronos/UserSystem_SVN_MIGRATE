using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspx.error
{
    public partial class defaultError : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Literal_Error.Text = "Error:please contact administrator.";
        }
    }
}
