using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using model;

namespace service.user
{
    // NOTE: If you change the interface name "IAuthenUser" here, you must also update the reference to "IAuthenUser" in Web.config.
    [ServiceContract]
    public interface IUserService
    {
        [OperationContract(Name = "Authenticate")]
        UserModel Authenticate(string username, string password, string applicationName);

        [OperationContract]
        List<RoleModel> getRoles(string username, string applicationName);

        [OperationContract(Name = "isInRoleByKey")]
        bool isInRole(string username, int roleKey);

        [OperationContract(Name = "isInRoleByValue")]
        bool isInRole(string username, string roleValue);

        [OperationContract]
        bool isInRoleByDesc(string username, string roleDesc);

        [OperationContract]
        int updateUserActivity(string empId, int appKey, string activity, DateTime activityDate);

    }
}
