using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace model
{
    /// <summary>
    /// Summary description for UserModel
    /// </summary>
    [System.Runtime.Serialization.DataContractAttribute(IsReference = false)]
    [System.Serializable]
    public class UserModel : UserSystemDataClasses.TB_AUTHO_USER
    {
        public const string DELIMITER = "|";

        //constructor
        public UserModel()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        //constructor
        public UserModel(UserSystemDataClasses.TB_AUTHO_USER user)
        {
            this.EMP_ID = user.EMP_ID;
            this.EMP_TITLE = user.EMP_TITLE;
            this.EMP_NAME = user.EMP_NAME;
            this.EMP_SURNAME = user.EMP_SURNAME;
            this.EMP_TITLE_E = user.EMP_TITLE_E;
            this.EMP_NAME_E = user.EMP_NAME_E;
            this.EMP_SURNAME_E = user.EMP_SURNAME_E;
            this.PASSWD = user.PASSWD;
            this.CREATE_DATE = user.CREATE_DATE;
            this.EXPIRE_DATE = user.EXPIRE_DATE;
            this.UPDATE_DATE = user.UPDATE_DATE;
            this.LAST_SIGN_ON_DATE = user.LAST_SIGN_ON_DATE;
            this.LAST_CHANGE_PASS_DATE = user.LAST_CHANGE_PASS_DATE;
            this.DEL_FLAG = user.DEL_FLAG;
        }

        private List<RoleModel> _roleList;
        [System.Runtime.Serialization.DataMemberAttribute()]
        public List<RoleModel> RoleList
        {
            get
            {
                return this._roleList;
            }
            set
            {
                this._roleList = value;
            }
        }

        public String GetFullNameThai()
        {

            return this.EMP_TITLE + this.EMP_NAME + " " + this.EMP_SURNAME;

        }

        public String GetFullNameEng
        {
            get
            {
                return this.EMP_TITLE_E + this.EMP_NAME_E + " " + this.EMP_SURNAME_E;
            }
        }

        public bool isInRole(int roleKey)
        {
            bool result = false;

            foreach (RoleModel role in this.RoleList)
            {
                if (roleKey == role.ROLE_KEY)
                {
                    result = true;
                    break;
                }
            }

            return result;
        }

        public bool isInRole(string roleDesc)
        {
            bool result = false;

            foreach (RoleModel role in this.RoleList)
            {
                if (roleDesc == role.ROLE_DESC)
                {
                    result = true;
                    break;
                }
            }

            return result;
        }

        public bool isInRoleByValue(string roleValue)
        {
            bool result = false;

            foreach (RoleModel role in this.RoleList)
            {
                if (roleValue == role.ROLE_VALUE)
                {
                    result = true;
                    break;
                }
            }

            return result;
        }

        public bool isNullRoleList()
        {
            bool result = true;

            if (null != this.RoleList)
            {
                result = false;
            }

            return result;
        }

        /// <summary>
        /// เอา ROLE_KEY ทั้งหมดของ User นี้มาต่อกันโดยคั่นด้วย |
        /// </summary>
        /// <returns>ROLE_KEY1|ROLE_KEY2|...|ROLE_KEYn</returns>
        public string getConcatRoleList()
        {
            string result = string.Empty;

            foreach (RoleModel role in this.RoleList)
            {
                result = result + DELIMITER + role.ROLE_KEY;
            }

            //ตัด | ตัวแรกออก
            result = result.Substring(1);

            return result;
        }

        public override string ToString()
        {
            return this.EMP_ID + ":" + this.GetFullNameEng + ":" + this.getConcatRoleList();
        }
    }
}
