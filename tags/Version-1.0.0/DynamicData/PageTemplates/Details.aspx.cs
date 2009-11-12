using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.DynamicData;

public partial class Details : System.Web.UI.Page {
    protected MetaTable table;

    protected void Page_Init(object sender, EventArgs e) {
        DynamicDataManager1.RegisterControl(DetailsView1);
    }

    protected void Page_Load(object sender, EventArgs e) {
        table = DetailsDataSource.GetTable();
        Title = table.DisplayName;
        DetailsDataSource.Include = table.ForeignKeyColumnsNames;
        ListHyperLink.NavigateUrl = table.ListActionPath;
    }

    protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e) {
        if (e.Exception == null || e.ExceptionHandled) {
            Response.Redirect(table.ListActionPath);
        }
    }

    #region Add by big(24 Aug 2009)
    //เพิ่ม  Visible='<%# IsDeleteAble(columnName) %>' ในปุ่ม delete ของ aspx ด้วย

    /// <summary>
    /// ไว้ใช้ซ่อนปุ่ม delete ถ้า table ไหนมี columnName ตรงกับที่ระบุใน aspx
    /// </summary>
    /// <param name="columnName"></param>
    /// <returns></returns>
    protected bool IsDeleteAble(string columnName)
    {
        bool result = true;

        MetaColumn outColumn;
        bool a = table.TryGetColumn(columnName, out outColumn);

        //ถ้ามี column ตรงตามที่ระบุ return false เพื่อไม่ให้ delete ได้
        if (outColumn != null)
        {
            result = false;
        }

        return result;
    }

    #endregion
}
