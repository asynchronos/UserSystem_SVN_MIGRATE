using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace model
{
    /// <summary>
    /// Summary description for RoleModel
    /// </summary>
    [System.Runtime.Serialization.DataContractAttribute(IsReference = false)]
    [System.Serializable]
    public class RoleModel : UserSystemDataClasses.TB_AUTHO_ROLE
    {
        //constructor
        public RoleModel()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        //constructor
        public RoleModel(UserSystemDataClasses.TB_AUTHO_ROLE role)
        {
            this.ROLE_KEY = role.ROLE_KEY;
            this.ROLE_DESC = role.ROLE_DESC;
            this.ROLE_VALUE = role.ROLE_VALUE;
        }

        private RoleCategoryModel _roleCategory;
        [System.Runtime.Serialization.DataMemberAttribute()]
        public RoleCategoryModel RoleCategory
        {
            get
            {
                return this._roleCategory;
            }
            set
            {
                //if (_roleCategory.Equals(null))
                //{
                //    _roleCategory = new RoleCategoryModel();
                //}
                this._roleCategory = value;
            }
        }
    }
}
