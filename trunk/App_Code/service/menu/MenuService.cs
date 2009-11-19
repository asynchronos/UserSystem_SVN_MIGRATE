using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using service.menu.model;
using log4net;

namespace service.menu
{
    // NOTE: If you change the class name "Menu" here, you must also update the reference to "Menu" in Web.config.
    public class MenuService : IMenuService
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public string getMainMenu(string roles, string delimeter, string appName,string urlPrefix)
        {
            MenuModelCollection mainMenus = this.getMainMenuFromDB(roles,delimeter,appName);
            StringBuilder builder = new StringBuilder();

            foreach (MenuModel mainMenu in mainMenus)
            {
                builder.Append(buildMainMenuString(mainMenu,urlPrefix));
            }
            
            return builder.ToString();
        }

        public string getSubMenu(string roles, string delimeter, string appName,string urlPrefix)
        {
            MenuModelCollection subMenus = this.getSubMenuFromDB(roles, delimeter, appName);
            StringBuilder builder = new StringBuilder();

            //distinct MENU_PARENT of subMenuRel
            List<string> menuParentRelList = new List<string>();

            int subMenusIndex = 0;

            menuParentRelList.Add(subMenus[subMenusIndex].menuParentRel);
            subMenusIndex++;

            for (; subMenusIndex < subMenus.Count; subMenusIndex++)
            {
                if (menuParentRelList[menuParentRelList.Count - 1] == subMenus[subMenusIndex].menuParentRel)
                {
                    continue;
                }
                else
                {
                    menuParentRelList.Add(subMenus[subMenusIndex].menuParentRel);
                }
            }
            //end distinct subMenuRel

            foreach (string menuParentRel in menuParentRelList)
            {
                builder.Append("<div id=\"" + menuParentRel + "\" class=\"dropmenudiv\">");
                foreach (MenuModel subMenu in subMenus)
                {
                    if (menuParentRel == subMenu.menuParentRel)
                    {
                        builder.Append(buildTagA(subMenu,urlPrefix));
                    }
                }
                builder.Append("</div>");
            }

            //add start script
            builder.Append("<script type=\"text/javascript\">cssdropdown.startchrome(\"chromemenu\");</script>");

            return builder.ToString();
        }

        protected MenuModelCollection getMainMenuFromDB(string roles, string delimeter, string appName)
        {
            MenuModelCollection result = null;
            
            using (SqlConnection conn = new SqlConnection(
                ConfigurationManager.ConnectionStrings["USERConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("P_GetMainMenu", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@roles", roles);
                cmd.Parameters.AddWithValue("@delimeter", delimeter);
                cmd.Parameters.AddWithValue("@appName", appName);

                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (null == result)
                        {
                            result = new MenuModelCollection();
                        }
                        result.Add(MenuModel.bindModel(reader,false));
                    }
                }
            }

            return result;
        }

        protected MenuModelCollection getSubMenuFromDB(string roles, string delimeter, string appName)
        {
            MenuModelCollection result = null;

            using (SqlConnection conn = new SqlConnection(
                ConfigurationManager.ConnectionStrings["USERConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("P_GetSubMenu", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@roles", roles);
                cmd.Parameters.AddWithValue("@delimeter", delimeter);
                cmd.Parameters.AddWithValue("@appName", appName);

                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (null == result)
                        {
                            result = new MenuModelCollection();
                        }
                        result.Add(MenuModel.bindModel(reader,true));
                    }
                }
            }

            return result;
        }

        protected string buildMainMenuString(MenuModel menu,string urlPrefix)
        {
            StringBuilder builder = new StringBuilder();

            builder.Append("<li id=\"" + "Menu_" + menu.menuKey.ToString() + "\" style=\"white-space: nowrap;\">");
            builder.Append(buildTagA(menu,urlPrefix));
            builder.Append("</li>");

            return builder.ToString();
        }

        protected string buildTagA(MenuModel menu,string urlPrefix)
        {
            StringBuilder builder = new StringBuilder();

            builder.Append("<a id=\"" + "Link_" + menu.menuKey.ToString() + "\" "
                    + "title=\"" + menu.menuTooltip + "\" ");
            if (menu.menuTarget == null)
            {
                builder.Append("rel=\"" + menu.menuRel + "\" ");
            }
            else
            {
                builder.Append("target=\"" + menu.menuTarget + "\" ");
            }
            //check ว่ามี popup หรือไม่
            if (menu.menuPopupOption != null)
            {
                builder.Append("onclick=\"openPopup('menu_" + menu.menuKey + "_Popup', '"
                                    + changeMenuPrefix(menu.menuUrl, urlPrefix) + "', false, '" + menu.menuPopupOption + "');\" ");
                builder.Append("href=\"" + MenuModel.defaultUrl + "\" ");
            }
            else
            {
                builder.Append("href=\"" + changeMenuPrefix(menu.menuUrl, urlPrefix) + "\" ");
            }

            builder.Append(">" + menu.menuTitle + "</a>");

            return builder.ToString();
        }

        protected string changeMenuPrefix(string oldUrl,string urlPrefix)
        {
            return oldUrl.Replace("~/", urlPrefix);
        }
    }
}
