using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace service.menu
{
    // NOTE: If you change the interface name "IMenu" here, you must also update the reference to "IMenu" in Web.config.
    [ServiceContract]
    public interface IMenuService
    {
        [OperationContract]
        string getMainMenu(string roles, string delimeter, string appName, string urlPrefix);

        [OperationContract]
        string getSubMenu(string roles, string delimeter, string appName, string urlPrefix);
    }
}