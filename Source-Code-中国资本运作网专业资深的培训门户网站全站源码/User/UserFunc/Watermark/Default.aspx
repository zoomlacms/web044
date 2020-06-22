<%@ page language="C#" autoeventwireup="true" inherits="User_UserFunc_Watermark_Default, App_Web_xbel31qz" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>授权证书生成</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="u_ban page_ban">
    <div class="container">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 u_ban_l text-center">
        <i class="glyphicon glyphicon-barcode"></i> 
        </div>
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 u_ban_r">
        <ul class="list-unstyled text-center">
        <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/Content/ECharts/AddChart.aspx"><i class="fa fa-comments"></i><br/>我的空间</a></li>  
        <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/Content/ECharts/AddChart.aspx"><i class="glyphicon glyphicon-th"></i><br/>社区交友</a></li>  
        <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/Content/ECharts/AddChart.aspx"><i class="fa fa-comments"></i><br/>问卷投票</a></li>  
        <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/Magazine/AddMagazine.aspx"><i class="glyphicon glyphicon-th"></i><br/>电子杂志</a></li>  
        <div class="clearfix"></div>
        </ul>
        </div>
    </div>
    </div>
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a href="/" title="网站首页"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">授权证书生成</li> 
    </ol>
</div>
<div class="container u_cnt">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="text-center" title="姓名">姓名：</td>
            <td><asp:TextBox CssClass="form-control" data-state="edit" runat="server" ID="Name" /></td>
            <td class="text-center" title="微信号码">微信号码：</td>
            <td><asp:TextBox CssClass="form-control" data-state="edit" runat="server" ID="VName" /></td>
            <td class="text-center" title="授权人">授权人：</td>
            <td><asp:TextBox CssClass="form-control" data-state="edit" runat="server" ID="GiveMan" /></td>
        </tr>
        <tr>
            <td class="text-center" title="品牌">品牌：</td>
            <td><asp:TextBox data-state="edit" CssClass="form-control" runat="server" ID="CardName" /></td>
            <td class="text-center" title="授权时间">授权时间：</td>
            <td><asp:TextBox CssClass="form-control" data-state="edit" onclick="WdatePicker();" runat="server" ID="StartDate" /></td>
            <td class="text-center" title="到期时间">到期时间： </td>
            <td><asp:TextBox CssClass="form-control" data-state="edit" onclick="WdatePicker();" runat="server" ID="EndDate" /></td>
        </tr>
        <tr>
            <td class="text-center" title="标题">标题：</td>
            <td><asp:TextBox CssClass="form-control" data-state="edit" runat="server" ID="Title_T" /></td>
            <td class="text-center" title="授权编号">授权编号：</td>
            <td><asp:TextBox CssClass="form-control" data-state="edit" runat="server" ID="Auth_Code_T" /></td>
            <td class="text-center" title="授权企业">授权企业：</td>
            <td><asp:TextBox CssClass="form-control" data-state="edit" runat="server" ID="Auth_Name_T" /></td>
        </tr>
        <tr><td colspan="6" class="text-center">
            <input type="button" class="btn btn-primary" value="确定生成" onclick="EditImage()" />
            <a href="javascript:ClearData()" class="btn btn-primary">重置参数</a>
            </td></tr>
    </table>
    </div>
    <div>
        
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
    function EditImage() {
        if ($("#Name").val() != "" && $("#Auth_Code_T").val()!="") {
            var url = "HtmlToJpg.aspx?Name=" + $("#Name").val() + "&VName=" + $("#VName").val() + "&GiveMan=" + $("#GiveMan").val() + "&CardName=" + $("#CardName").val() + "&StartDate=" + $("#StartDate").val() + "&EndDate=" + $("#EndDate").val() + "&Title=" + $("#Title_T").val() + "&Auth_Code=" + $("#Auth_Code_T").val() + "&Auth_Name=" + $("#Auth_Name_T").val();
            window.open(url);
        } else {
            alert("证书名和授权编号不能为空！");
        }
        
    }
    function ClearData() {
        $("[data-state=edit]").val("");
    }
</script>
</asp:Content>