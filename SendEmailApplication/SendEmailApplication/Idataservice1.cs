using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Web.Services;
using System.ServiceModel.Web;
namespace WebApplication2
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "Idataservice" in both code and config file together.
    [ServiceContract]
    [WebService(Namespace = "http://tempuri.org/")] 
    public interface Idataservice
    {
      

        [OperationContract]
        [WebGet(BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Xml, UriTemplate = "GetData?id={id}")]

        string GetData(string id);
    }
}