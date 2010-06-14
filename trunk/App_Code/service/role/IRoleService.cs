using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace service.role
{
    // NOTE: If you change the interface name "IRoleService" here, you must also update the reference to "IRoleService" in Web.config.
    [ServiceContract]
    public interface IRoleService
    {
        [OperationContract]
        void DoWork();
    }
}