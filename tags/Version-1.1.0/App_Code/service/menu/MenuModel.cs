using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace service.menu.model
{
    /// <summary>
    /// Summary description for MenuModel
    /// </summary>
    public class MenuModel
    {
        //constructor
        public MenuModel()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        //constructor
        public MenuModel(int key, string title, string url, string option, string rel, string target, string tooltip, int priority, bool delFlag, int parentKey, string parentRel, int roleKey)
        {
            this.menuKey = key;
            this.menuTitle = title;
            this.menuUrl = url;
            this.menuPopupOption = option;
            this.menuRel = rel;
            this.menuTarget = target;
            this.menuTooltip = tooltip;
            this.menuPriority = priority;
            this.menuDelFlag = delFlag;
            this.menuParentKey = parentKey;
            this.menuParentRel = parentRel;
            this.roleKey = roleKey;
        }

        public const string defaultTitle = "undefined";
        public const string defaultUrl = "javascript:void(0);";

        private int _menuKey;
        private string _menuTitle = defaultTitle;
        private string _menuUrl = defaultUrl;
        private string _menuPopupOption;
        private string _menuRel;
        private string _menuTarget;
        private string _menuTooltip;
        private int _menuPriority;
        private bool _menuDelFlag;
        private int _menuParentKey;
        private string _menuParentRel;
        private int _roleKey;

        public int menuKey { get { return this._menuKey; } set { this._menuKey = value; } }
        public string menuTitle { get { return this._menuTitle; } set { this._menuTitle = value; } }
        public string menuUrl { get { return this._menuUrl; } set { this._menuUrl = value; } }
        public string menuPopupOption { get { return this._menuPopupOption; } set { this._menuPopupOption = value; } }
        public string menuRel { get { return this._menuRel; } set { this._menuRel = value; } }
        public string menuTarget { get { return this._menuTarget; } set { this._menuTarget = value; } }
        public string menuTooltip { get { return this._menuTooltip; } set { this._menuTooltip = value; } }
        public int menuPriority { get { return this._menuPriority; } set { this._menuPriority = value; } }
        public bool menuDelFlag { get { return this._menuDelFlag; } set { this._menuDelFlag = value; } }
        public int menuParentKey { get { return this._menuParentKey; } set { this._menuParentKey = value; } }
        public string menuParentRel { get { return this._menuParentRel; } set { this._menuParentRel = value; } }
        public int roleKey { get { return this._roleKey; } set { this._roleKey = value; } }

        protected static Object getDbValue(System.Data.SqlClient.SqlDataReader reader, string columnName)
        {
            Object result = null;
            
            result = reader[columnName];

            return result;
        }

        public static MenuModel bindModel(System.Data.SqlClient.SqlDataReader reader,bool isSubMenu)
        {
            MenuModel menu = new MenuModel();

            if (reader["MENU_KEY"] != null)
            {
                menu.menuKey = (int)getDbValue(reader, "MENU_KEY");
            }
            if (reader["MENU_TITLE"] != null
                && reader["MENU_TITLE"].ToString().Trim().Length > 0)
            {
                menu.menuTitle = (string)getDbValue(reader, "MENU_TITLE");
            }
            if (reader["MENU_URL"] != null
                && reader["MENU_URL"].ToString().Trim().Length > 0)
            {
                menu.menuUrl = (string)getDbValue(reader, "MENU_URL");
            }
            if (reader["MENU_POPUP_OPT"] != null
                && reader["MENU_POPUP_OPT"].ToString().Trim().Length > 0)
            {
                menu.menuPopupOption = (string)getDbValue(reader, "MENU_POPUP_OPT");
            }
            if (reader["MENU_REL"] != null
                && reader["MENU_REL"].ToString().Trim().Length > 0)
            {
                menu.menuRel = (string)getDbValue(reader, "MENU_REL");
            }

            if (menu.menuRel == null)
            {
                menu.menuTarget = "_self";
            }
            
            if (reader["MENU_TOOLTIP"] != null
                && reader["MENU_TOOLTIP"].ToString().Trim().Length > 0)
            {
                menu.menuTooltip = (string)getDbValue(reader, "MENU_TOOLTIP");
            }
            if (reader["MENU_PRIORITY"] != null)
            {
                menu.menuPriority = (int)getDbValue(reader, "MENU_PRIORITY");
            }
            if (reader["MENU_DEL_FLAG"] != null)
            {
                menu.menuDelFlag = (bool)getDbValue(reader, "MENU_DEL_FLAG");
            }
            if (reader["MENU_PARENT_KEY"] != null
                && reader["MENU_PARENT_KEY"].ToString().Trim().Length > 0)
            {
                menu.menuParentKey = (int)getDbValue(reader, "MENU_PARENT_KEY");
            }

            if (isSubMenu)
            {
                if (reader["MENU_PARENT_REL"] != null
                    && reader["MENU_PARENT_REL"].ToString().Trim().Length > 0)
                {
                    menu.menuParentRel = (string)getDbValue(reader, "MENU_PARENT_REL");
                }
            }
            
            if (reader["ROLE_KEY"] != null)
            {
                menu.roleKey = (int)getDbValue(reader, "ROLE_KEY");
            }

            
            return menu;
        }
    }
}