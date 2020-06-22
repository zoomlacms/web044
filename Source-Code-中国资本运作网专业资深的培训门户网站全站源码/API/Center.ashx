<%@ WebHandler Language="C#" Class="Center" %>

using NetDimension.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.BLL.Helper;
using ZoomLa.Model;
using ZoomLa.SQLDAL;

public class Center : IHttpHandler {
    M_Ucenter ucMod = null;
    M_APIResult result = new M_APIResult();
    B_Ucenter ucBll = new B_Ucenter();
    B_Content conBll = new B_Content();
    B_Favorite favBll = new B_Favorite();
    private string Action { get { return HttpContext.Current.Request["Action"]; } }
    private string Key { get { return HttpContext.Current.Request["Key"]; } }
    private int PSize { get { return DataConvert.CLng(HttpContext.Current.Request["psize"]); } }
    private int CPage { get { return DataConvert.CLng(HttpContext.Current.Request["cpage"]); } }
    //如有传值,则为JsonP
    private string CallBackFunc { get { return HttpContext.Current.Request["callback"]; } }
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest req = context.Request; HttpResponse rep = context.Response;
        result.callback = CallBackFunc;
        try
        {
            switch (Action)
            {
                case "GetTops":
                    result = GetTops(DataConvert.CLng(req["nid"]));
                    break;
                case "GetArticles":
                    result = GetArticles(Convert.ToInt32(req["nid"]), PSize, CPage);
                    break;
                case "GetContent":
                    result = GetContent(Convert.ToInt32(req["gid"]));
                    break;
                case "AddFavour":
                    result = AddFavour(Key, Convert.ToInt32(req["gid"]), Convert.ToInt32(req["uid"]));
                    break;
                case "SelFavour":
                    result = SelFavour(Key, Convert.ToInt32(req["uid"]), PSize, CPage);
                    break;
                default:
                    result.retcode = -1;
                    result.retmsg = Action + "不是有效的参数";
                    break;
            }
        }
        catch (Exception ex) { result.retcode = -1; result.retmsg = ex.Message; }
        HttpContext.Current.Response.Write(result.ToString());
        HttpContext.Current.Response.Flush();
        HttpContext.Current.Response.End();
    }
    //用于首页幻灯片,获取最新的6个推荐
    //0取全局,否则取指定节点
    public M_APIResult GetTops(int nid) 
    {
        int count = 0;
        string fields = "A.generalid,A.title,A.nodeid,A.itemid,A.inputer,A.createtime,B.pic AS topimg,B.author,B.synopsis";//全小写兼容Java
        string tbname = "ZL_C_Article";
        try
        {
            string where = "A.Status=99 AND EliteLevel=1 ";
            if (nid > 0) { where += "AND A.NodeID="+nid; }
            DataTable dt = PageHelper.SelPage(6, 1, out count, "A.GeneralID", fields, "ZL_CommonModel", tbname, "A.ItemID=B.ID", "A.Status=99 AND EliteLevel=1", "Order BY A.CreateTime DESC", null);
            dt.Columns.Add(new DataColumn("url", typeof(string)));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                dr["url"] = "/Class_2/NodeNews.aspx?id=" + dr["GeneralID"];
                dr["topimg"] = GetImgUrl(dr["topimg"]);
            }
            result.result = JsonConvert.SerializeObject(dt);
            result.addon = result.AddJson("count", count);
        }
        catch (Exception) { result.retcode = -1; result.retmsg = "数据读取错误,可能是节点有误或模型不正确"; }
        return result;
    }
    /// <summary>
    /// 获取节点文章,返回Json数据,目标节点最好只绑定一种模型,一张表
    /// </summary>
    /// <param name="nodeid">节点ID</param>
    /// <param name="psize">数量</param>
    /// <param name="cpage">页码</param>
    /// <example>http://m.hbncw.net/API/Center.ashx?Action=GetArticles&nid=1&psize=10&cpage=1</example>
    /// <returns>文章Json</returns>
    public M_APIResult GetArticles(int nodeid, int psize, int cpage)
    {
        //CheckKey(key);
        int count = 0;
        string fields = "A.generalid,A.title,A.nodeid,A.itemid,A.inputer,A.createtime,B.pic AS topimg,B.author,B.synopsis";//全小写兼容Java
        string tbname = conBll.GetTbNameByNid(nodeid);
        if (string.IsNullOrEmpty(tbname))
        {
            result.retcode = -1;
            result.retmsg = "节点不存在,取值失败";
            return result;
        }
        try
        {
            DataTable dt = PageHelper.SelPage(psize, cpage, out count, "A.GeneralID", fields, "ZL_CommonModel", tbname, "A.ItemID=B.ID", "A.NodeID=" + nodeid + " AND A.Status=99", "Order BY A.CreateTime DESC", null);
            dt.Columns.Add(new DataColumn("url", typeof(string)));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                dr["url"] = "/Class_2/NodeNews.aspx?id=" + dr["GeneralID"];
                dr["topimg"] = GetImgUrl(dr["topimg"]);
            }
            result.result = JsonConvert.SerializeObject(dt);
            result.addon = result.AddJson("count", count);
        }
        catch (Exception) { result.retcode = -1; result.retmsg = "数据读取错误,可能是节点有误或模型不正确"; }
        return result;
    }
    public M_APIResult GetContent(int gid)
    {
        string fields = "A.generalid,A.title,A.nodeid,A.inputer,A.createtime,A.url='',B.pic AS topimg,B.content,B.synopsis";
        string tbname = conBll.SelReturnModel(gid).TableName;
        DataTable dt = SqlHelper.JoinQuery(fields, "ZL_CommonModel", tbname, "A.ItemID=B.ID", "A.GeneralID=" + gid);
        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        //    DataRow dr = dt.Rows[i];
        //    dr["url"] = "/Class_2/NodeNews.aspx?id="+dr["GeneralID"];
        //}
        result.result = JsonConvert.SerializeObject(dt);
        return result;
    }
    //添加收藏
    public M_APIResult AddFavour(string key, int gid, int uid)
    {
        CheckKey(key);
        M_Favorite favMod = new M_Favorite();
        M_CommonData model = conBll.SelReturnModel(gid);
        favMod.InfoID = gid;
        //favMod.FavItemID = gid;
        favMod.Title = model.Title;
        favMod.Owner = uid;
        favMod.FavUrl = "";
        favMod.FavoriType = 1;//需检测是否重复
        favMod.AddDate = DateTime.Now;
        if (SqlHelper.ExecuteTable(CommandType.Text, "SELECT Top 1 FavoriteID From ZL_Favorite WHERE InfoID=" + gid + " AND Owner=" + uid + " AND FavoriType=1", null).Rows.Count>0)
        {
            result.retcode = -1;
            result.retmsg = "你已收藏过该文章";
        }
        else { favBll.insert(favMod); }
        return result;
    }
    //获取收藏
    public M_APIResult SelFavour(string key, int uid, int psize, int cpage)
    {
        CheckKey(key);
        M_Favorite favMod = new M_Favorite();
        int count = 0;
        DataTable dt = PageHelper.SelPage(psize, cpage, out count, favMod.PK, "*", favMod.TbName, "Owner=" + uid);
        result.result = JsonConvert.SerializeObject(dt);
        result.addon = result.AddJson("count", count);
        return result;
    }
    private string GetImgUrl(object topimg)
    {
        string imgurl = topimg == DBNull.Value ? "" : topimg.ToString().ToLower();
        if (imgurl.StartsWith("/uploadfiles/")) { imgurl = imgurl.Replace("/uploadfiles/", ""); }
        imgurl = string.IsNullOrEmpty(imgurl) ? "" : ("/UploadFiles/" + imgurl).Replace("//", "/");
        return imgurl;
    }
    //稍后转入
    private M_Ucenter CheckKey(string key)
    {
        ucMod = ucBll.SelByKey(key);
        if (ucMod == null)
        {
            result = new M_APIResult() { retcode = -1, retmsg = "Key验证失败" };
            HttpContext.Current.Response.Write(result.ToString()); HttpContext.Current.Response.Flush(); HttpContext.Current.Response.End();
        }
        return ucMod;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}