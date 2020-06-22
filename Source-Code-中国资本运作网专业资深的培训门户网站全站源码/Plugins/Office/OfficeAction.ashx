<%@ WebHandler Language="C#" Class="OfficeAction" %>

using System;
using System.Web;
using System.Web.SessionState;
using ZoomLa.Model;
using ZoomLa.BLL;
using ZoomLa.Common;
public class OfficeAction : IHttpHandler, IRequiresSessionState
{
    OACommon oacom = new OACommon();
    B_OA_Document oaBll = new B_OA_Document();
    B_User buser = new B_User();
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest Request = context.Request;
        HttpResponse Response = context.Response;
        string action = Request["action"];
        switch (action)
        {
            case "getword"://返回Word二进制文件
                {
                    Response.Clear();
                    Response.ContentType = "Application/msword";
                    string fname = HttpUtility.UrlDecode(Request["fname"]);
                    int appid = DataConverter.CLng(Request["appid"]);
                    string vpath = "";
                    if (appid > 0)
                    {
                        M_OA_Document oaMod = oaBll.SelReturnModel(appid);
                        M_UserInfo mu = buser.SelReturnModel(oaMod.UserID);
                        vpath = oacom.GetMyDir(mu) +  HttpUtility.UrlDecode(oaMod.PrivateAttach);
                    }
                    else
                    {
                        M_UserInfo mu = buser.GetLogin();
                        vpath = oacom.GetMyDir(mu) + fname;
                    }
                    B_Site_Log.Insert("GetWord",vpath);
                    Response.BinaryWrite(SafeSC.ReadFileByte(vpath));   //读取二进制的文件
                    Response.Flush(); Response.End();
                }
                break;
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}