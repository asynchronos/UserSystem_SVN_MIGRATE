using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Collections;
using model;
using log4net;

namespace service.authen
{
    // NOTE: If you change the class name "AuthenUser" here, you must also update the reference to "AuthenUser" in Web.config.
    public class AuthenUser : IAuthenUser
    {
        //private static readonly ILog log = LogManager.GetLogger(typeof(AuthenUser).Name);
        //same result as above
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        #region IAuthenUser Members

        public UserModel Authenticate(string username, string password, string applicationName)
        {
            if (isDebugEnabled)
            {
                log.Debug("Start Authenticate");
            }

            UserModel userM = null;

            using(UserSystemDataClasses.UserSystemDataClassesDataContext userDB 
                = new UserSystemDataClasses.UserSystemDataClassesDataContext())
            {
                var queryUser = from user in userDB.TB_AUTHO_USERs
                                where user.EMP_ID == username
                                && user.PASSWD == password
                                && user.EXPIRE_DATE >= DateTime.Now
                                && user.DEL_FLAG == false
                                select user;

                if (!(queryUser.FirstOrDefault<UserSystemDataClasses.TB_AUTHO_USER>() == null))
                {
                    if (isDebugEnabled)
                    {
                        log.Debug("Authenticate Success");
                    }

                    userM = new UserModel(queryUser.FirstOrDefault<UserSystemDataClasses.TB_AUTHO_USER>());
                    userM.RoleList = this.getRoles(username,applicationName);

                    if (isDebugEnabled)
                    {
                        log.Debug(userM.EMP_ID + "[" + userM.GetFullNameThai() + "]" + " has " + userM.RoleList.Count + " role(s).");
                    }

                    //update last sign on date
                    queryUser.FirstOrDefault<UserSystemDataClasses.TB_AUTHO_USER>().LAST_SIGN_ON_DATE = DateTime.Now;
                    //summitChange
                    userDB.SubmitChanges();
                }
            }

            ////Entity Sample
            //using (UserSystemModel.UserSystemEntities userEDM = new UserSystemModel.UserSystemEntities())
            //{
            //    System.Data.Objects.ObjectQuery<UserSystemModel.TB_AUTHO_USER> tbUser = userEDM.TB_AUTHO_USER;
            //    System.Data.Objects.ObjectQuery<UserSystemModel.TB_RELA_ROLE_EMP> tbRoleInEmp = userEDM.TB_RELA_ROLE_EMP;
            //    System.Data.Objects.ObjectQuery<UserSystemModel.TB_AUTHO_ROLE> tbRole = userEDM.TB_AUTHO_ROLE;
            //    System.Data.Objects.ObjectQuery<UserSystemModel.TB_AUTHO_ROLE_CATEGORY> tbRoleCategory = userEDM.TB_AUTHO_ROLE_CATEGORY;

            //    var queryUser =
            //                    from user in tbUser
            //                    where user.EMP_ID == username
            //                    && user.PASSWD == password
            //                    && user.EXPIRE_DATE >= DateTime.Now
            //                    && user.DEL_FLAG == false
            //                    select user;

            //    var queryRoleList =
            //                        from user in tbUser
            //                        join roleInEmp in tbRoleInEmp
            //                            on user.EMP_ID equals roleInEmp.TB_AUTHO_USER.EMP_ID
            //                        join role in tbRole
            //                            on roleInEmp.TB_AUTHO_ROLE.ROLE_KEY equals role.ROLE_KEY
            //                        join category in tbRoleCategory
            //                            on role.TB_AUTHO_ROLE_CATEGORY.ROLE_CATEGORY_KEY equals category.ROLE_CATEGORY_KEY
            //                        where user.EMP_ID == username
            //                        && user.PASSWD == password
            //                        && user.EXPIRE_DATE >= DateTime.Now
            //                        && user.DEL_FLAG == false
            //                        && roleInEmp.DEL_FLAG == false
            //                        select new 
            //                        {
            //                            ROLE_KEY = role.ROLE_KEY,
            //                            ROLE_DESC = role.ROLE_DESC,
            //                            ROLE_VALUE = role.ROLE_VALUE,
            //                            ROLE_CATEGORY_KEY = category.ROLE_CATEGORY_KEY,
            //                            ROLE_PRIORITY = role.PRIORITY,
            //                            ROLE_DEL_FLAG = role.DEL_FLAG,

            //                            ROLE_CATEGORY_DESC = category.ROLE_CATEGORY_DESC,
            //                            ROLE_CATEGORY_PRIORITY = category.PRIORITY,
            //                            ROLE_CATEGORY_DEL_FLAG = category.DEL_FLAG,
            //                        };

            //    if (!(queryUser.FirstOrDefault<UserSystemModel.TB_AUTHO_USER>() == null))
            //    {
            //        if (isDebugEnabled)
            //        {
            //            log.Debug("Authenticate Success");
            //        }

            //        userM = new UserModel(queryUser.FirstOrDefault<UserSystemModel.TB_AUTHO_USER>());

            //        List<RoleModel> roleList = new List<RoleModel>();
            //        RoleModel roleM = null;
            //        foreach (var role in queryRoleList)
            //        {
            //            roleM = new RoleModel();

            //            roleM.ROLE_KEY = role.ROLE_KEY;
            //            roleM.ROLE_DESC = role.ROLE_DESC;
            //            roleM.ROLE_VALUE = role.ROLE_VALUE;

            //            RoleCategoryModel cate = new RoleCategoryModel();

            //            cate.ROLE_CATEGORY_KEY = role.ROLE_CATEGORY_KEY;
            //            cate.ROLE_CATEGORY_DESC = role.ROLE_CATEGORY_DESC;
            //            cate.PRIORITY = role.ROLE_CATEGORY_PRIORITY;
            //            cate.DEL_FLAG = role.ROLE_CATEGORY_DEL_FLAG;

            //            roleM.RoleCategory = cate;
            //            roleM.PRIORITY = role.ROLE_PRIORITY;
            //            roleM.DEL_FLAG = role.ROLE_DEL_FLAG;

            //            roleList.Add(roleM);
            //        }

            //        userM.RoleList = roleList;
            //        if (isDebugEnabled)
            //        {
            //            log.Debug(userM.EMP_ID + "[" + userM.GetFullNameThai() + "]" + " has " + roleList.Count + " role(s).");
            //        }
            //    }

            //    //List<UserSystemModel.TB_AUTHO_ROLE> roleList = queryRoleList.ToList<UserSystemModel.TB_AUTHO_ROLE>();
            //    //System.Diagnostics.Debug.WriteLine("Count : " + queryRoleList.GetType().ToString());
            //}

            if (isDebugEnabled)
            {
                log.Debug("End Authenticate");
            }

            return userM;
        }

        public List<RoleModel> getRoles(string username, string applicationName)
        {
            List<RoleModel> result = new List<RoleModel>();;

            using (UserSystemDataClasses.UserSystemDataClassesDataContext userDB 
                = new UserSystemDataClasses.UserSystemDataClassesDataContext())
            {
                var queryRoleList =
                                    from user in userDB.TB_AUTHO_USERs
                                    join roleInEmp in userDB.V_RoleInEmp_Mappings
                                        on user.EMP_ID equals roleInEmp.EMP_ID
                                    join role in userDB.TB_AUTHO_ROLEs
                                        on roleInEmp.ROLE_KEY equals role.ROLE_KEY
                                    join category in userDB.TB_AUTHO_ROLE_CATEGORies
                                        on role.TB_AUTHO_ROLE_CATEGORY.ROLE_CATEGORY_KEY equals category.ROLE_CATEGORY_KEY
                                    join roleInApp in userDB.V_RoleInApp_Mappings
                                        on role.ROLE_KEY equals roleInApp.ROLE_KEY
                                    join app in userDB.TB_APPLICATIONs
                                        on roleInApp.APP_KEY equals app.APP_KEY
                                    where user.EMP_ID == username
                                    && user.EXPIRE_DATE >= DateTime.Now
                                    && app.APP_DESC == applicationName
                                    && user.DEL_FLAG == false
                                    && roleInEmp.DEL_FLAG == false
                                    && role.DEL_FLAG == false
                                    && category.DEL_FLAG == false
                                    && roleInApp.DEL_FLAG == false
                                    && app.DEL_FLAG == false
                                    select new UserSystemDataClasses.ROLE
                                    {
                                        ROLE_KEY = role.ROLE_KEY,
                                        ROLE_DESC = role.ROLE_DESC,
                                        ROLE_VALUE = role.ROLE_VALUE,
                                        ROLE_CATEGORY_KEY = category.ROLE_CATEGORY_KEY,
                                        PRIORITY = role.PRIORITY,
                                        DEL_FLAG = role.DEL_FLAG,

                                        ROLE_CATEGORY_DESC = category.ROLE_CATEGORY_DESC,
                                        ROLE_CATEGORY_PRIORITY = category.PRIORITY,
                                        ROLE_CATEGORY_DEL_FLAG = category.DEL_FLAG,
                                    };

                    RoleModel roleM = null;
                    foreach (var role in queryRoleList)
                    {
                        roleM = new RoleModel();

                        roleM.ROLE_KEY = role.ROLE_KEY;
                        roleM.ROLE_DESC = role.ROLE_DESC;
                        roleM.ROLE_VALUE = role.ROLE_VALUE;

                        RoleCategoryModel cate = new RoleCategoryModel();

                        cate.ROLE_CATEGORY_KEY = role.ROLE_CATEGORY_KEY;
                        cate.ROLE_CATEGORY_DESC = role.ROLE_CATEGORY_DESC;
                        cate.PRIORITY = role.ROLE_CATEGORY_PRIORITY;
                        cate.DEL_FLAG = role.ROLE_CATEGORY_DEL_FLAG;

                        roleM.RoleCategory = cate;
                        roleM.PRIORITY = role.PRIORITY;
                        roleM.DEL_FLAG = role.DEL_FLAG;
                        
                        result.Add(roleM);
                    }
            }

            return result;
        }

        public bool isInRole(string username, int roleKey)
        {
            bool result = false;

            using (UserSystemDataClasses.UserSystemDataClassesDataContext userDB
                = new UserSystemDataClasses.UserSystemDataClassesDataContext())
            {
                var queryRole =
                                from roleInEmp in userDB.V_RoleInEmp_Mappings
                                join role in userDB.TB_AUTHO_ROLEs
                                    on roleInEmp.ROLE_KEY equals role.ROLE_KEY
                                where roleInEmp.EMP_ID == username
                                && role.ROLE_KEY == roleKey
                                && roleInEmp.DEL_FLAG == false
                                && role.DEL_FLAG == false
                                select roleInEmp;

                //เช็คว่ามี return กลับมาหรือไม่
                if (queryRole.Count<UserSystemDataClasses.V_RoleInEmp_Mapping>() > 0)
                {
                    result = true;
                }
            }

            return result;
        }

        public bool isInRole(string username, string roleValue)
        {
            bool result = false;

            using (UserSystemDataClasses.UserSystemDataClassesDataContext userDB
                = new UserSystemDataClasses.UserSystemDataClassesDataContext())
            {
                var queryRole =
                                from roleInEmp in userDB.V_RoleInEmp_Mappings
                                join role in userDB.TB_AUTHO_ROLEs
                                    on roleInEmp.ROLE_KEY equals role.ROLE_KEY
                                where roleInEmp.EMP_ID == username
                                && role.ROLE_VALUE == roleValue
                                && roleInEmp.DEL_FLAG == false
                                && role.DEL_FLAG == false
                                select roleInEmp;

                //เช็คว่ามี return กลับมาหรือไม่
                if (queryRole.Count<UserSystemDataClasses.V_RoleInEmp_Mapping>() > 0)
                {
                    result = true;
                }
            }

            return result;
        }

        public bool isInRoleByDesc(string username, string roleDesc)
        {
            bool result = false;

            using (UserSystemDataClasses.UserSystemDataClassesDataContext userDB
                = new UserSystemDataClasses.UserSystemDataClassesDataContext())
            {
                var queryRole =
                                from roleInEmp in userDB.V_RoleInEmp_Mappings
                                join role in userDB.TB_AUTHO_ROLEs
                                    on roleInEmp.ROLE_KEY equals role.ROLE_KEY
                                where roleInEmp.EMP_ID == username
                                && role.ROLE_DESC == roleDesc
                                && roleInEmp.DEL_FLAG == false
                                && role.DEL_FLAG == false
                                select roleInEmp;

                //เช็คว่ามี return กลับมาหรือไม่
                if (queryRole.Count<UserSystemDataClasses.V_RoleInEmp_Mapping>() > 0)
                {
                    result = true;
                }
            }

            return result;
        }

        #endregion
    }
}
