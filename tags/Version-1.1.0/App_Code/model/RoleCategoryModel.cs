using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace model
{

    /// <summary>
    /// Summary description for RoleCategoryModel
    /// </summary>
    public class RoleCategoryModel : UserSystemDataClasses.TB_AUTHO_ROLE_CATEGORY
    {
        public RoleCategoryModel()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public RoleCategoryModel(UserSystemDataClasses.TB_AUTHO_ROLE_CATEGORY cate)
        {
            this.ROLE_CATEGORY_KEY = cate.ROLE_CATEGORY_KEY;
            this.ROLE_CATEGORY_DESC = cate.ROLE_CATEGORY_DESC;
            this.PRIORITY = cate.PRIORITY;
            this.DEL_FLAG = cate.DEL_FLAG;
        }
    }
}
