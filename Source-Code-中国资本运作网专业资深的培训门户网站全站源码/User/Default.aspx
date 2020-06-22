<%@ page language="C#" autoeventwireup="true" inherits="User_Default, App_Web_aku3fss2" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>会员中心</title>
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="/dist/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="/App_Themes/User.css" />
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<link href="/Template/Capital/style/global.css" rel="stylesheet" type="text/css">
<style>
.search { height:auto; padding-left:0; width:auto;}
</style>
</head>
<body>
<%Call.Label("{ZL.Label id=\"全站头部\"/}");%>
<form id="form1" runat="server">
<div class="user_mimenu user_home_mimenu hidden">
<div class="navbar navbar-fixed-top" role="navigation">
<button type="button" class="btn btn-default" id="mimenu_btn">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<div class="user_mimenu_left">
<ul class="list-unstyled">
<li> <a href="/" target="_blank">首页</a></li>
<li> <a href="/Home" target="_blank">能力</a></li>
<li> <a href="/Index" target="_blank">社区</a></li>
<li> <a href="/Ask" target="_blank">问答</a></li>
<li> <a href="/Guest" target="_blank">留言</a></li>
<li> <a href="/Baike" target="_blank">百科</a></li>
<li> <a href="/Office" target="_blank">OA</a></li>
</ul>
</div>
<div class="navbar-header">
<button class="navbar-toggle in" type="button" data-toggle="collapse" data-target=".navbar-collapse">
<span class="sr-only">移动下拉</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
</div>
</div> 
</div>
<!--左侧头部min菜单-->
<div class="navbar-fixed-top u_fixed hidden">
<div class="u_top">
<div class="container">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
<a href="/" target="_blank"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
</div>
<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 u_search">
<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12"> 
<div class="input-group">
<input type="text" name="key" id="key" class="form-control" placeholder="快速搜索" onKeyDown="return IsEnter(this);">
<span class="input-group-btn">
<button class="btn btn-default" id="sub_btn" type="button"><i class="glyphicon glyphicon-search"></i></button>
</span>
</div> 
</div>
<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
<div class="u_top_btn">
<ul class="list-inline text-center">
<li><i class="fa fa-user"></i><asp:Label ID="uName" runat="server"></asp:Label></li>
<li><a href="/User/Info/UserBase.aspx"><i class="glyphicon glyphicon-cog"></i></a></li>
<li><a href="/User/LogOut.aspx">退出</a></li>
</ul>
</div>
</div>
</div>
</div>
</div>
<div class="u_nav">
<nav class="navbar navbar-default">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand visible-xs" href="#">快速导航</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/User/">首页</a></li>
        <li><a href="/User/Content/MyContent.aspx">内容</a></li>
        <li><a href="/User/UserShop/">商城</a></li>
        <li><a href="/User/Questions/MyCoruse.aspx">教育</a></li>
        <li><a href="/Index">社区</a></li>
        <li><a href="/Space/SpaceManage.aspx">聚合</a></li>
        <li><a href="/User/Pages/Default.aspx">黄页</a></li>
        <li><a href="/User/CloudManage.aspx?Type=file">云盘</a></li>
        <li><a href="/Office">办公</a></li>
        <li><a href="/Home">能力</a></li>
      </ul>
    </div>
  </div>
</nav>
</div>
</div>
<div class="u_info">
<div class="container">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 u_face">
<a href="/User/Info/UserInfo.aspx"><asp:Image ID="imgUserPic" AlternateText="" onerror="this.src='/images/userface/noface.gif'" runat="server" /></a>
</div>
<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 u_syn">
<ul class="list-unstyled">
<li><i class="glyphicon glyphicon-user"></i><span>会员名称：<asp:Label ID="UserNameLb" runat="server" Text=""></asp:Label></span><span>等级：<asp:Label ID="UserLvLb" runat="server" Text=""></asp:Label></span><span>加入时间：<asp:Label ID="UserRegTimeLb" runat="server" Text=""></asp:Label></span></li>
<li><i class="glyphicon glyphicon-map-marker"></i>地址：<asp:Label ID="UserAddressLb" runat="server" Text=""></asp:Label></li>
<li><i class="glyphicon glyphicon-edit"></i>个性签名：<asp:Label ID="UserSignLb" runat="server" Text=""></asp:Label></li>
<li><i class="glyphicon glyphicon-yen"></i><span><a href="/PayOnline/SelectPayPlat.aspx" target="_blank">余额：<asp:Label ID="UserYeLb" runat="server" Text=""></asp:Label></a></span><span>银币：<asp:Label ID="UserJbLb" runat="server" Text=""></asp:Label></span><span>积分：<asp:Label ID="UserJfLb" runat="server" Text=""></asp:Label></span></li>
</ul>
</div>
</div>
</div>
<div class="u_site margin_t5">
<div class="container">
<ol class="breadcrumb">
<li>您现在的位置：<a href="/">逐浪CMS</a></li>
<li><a href="/User/">会员中心</a></li>
</ol>
</div>
</div>
<div class="container"> 
<div class="u_menu">
    <asp:Literal ID="UserApp_Li" runat="server" EnableViewState="false"></asp:Literal>
<div class="clearfix"></div>
<div class="u_menu_more text-center">
<a href="javascript:;" id="more_btn"><i class="fa fa-angle-double-down"></i></a>
</div>
<div class="user_menu_sub"> 
    <ul class="list-inline text-center">
        <asp:Literal runat="server" ID="onther_lit" EnableViewState="false"></asp:Literal>
    </ul>
</div>  
</div>
<div class="clearfix"></div>
</div>
</form>
<%Call.Label("{ZL.Label id=\"全站底部\"/}");%>
</body>
</html>
<script>

//检测固顶事件
var IO=document.getElementById('scolls'),Y=IO,H=0,IE6;
IE6=window.ActiveXObject&&!window.XMLHttpRequest;
while(Y){H+=Y.offsetTop;Y=Y.offsetParent};
if(IE6)
    IO.style.cssText="position:absolute;top:expression(this.fix?(document"+
        ".documentElement.scrollTop-(this.javascript||"+H+")):0)";
window.onscroll=function (){
    var d=document,s=Math.max(d.documentElement.scrollTop,document.body.scrollTop);
     if(s>H&&IO.fix||s<=H&&!IO.fix)return;
    if(!IE6)IO.style.position=IO.fix?"":"fixed";        
    IO.fix=!IO.fix;
};
try{document.execCommand("BackgroundImageCache",false,true)}catch(e){};
 //]]>
$("#mimenu_btn").click(function(e) { 
	if($(".user_mimenu_left").width()>0){ 
 		$(".user_mimenu_left ul").fadeOut(100);
		$(".user_mimenu_left").animate({width:0},200); 	
	}
	else{ 
		$(".user_mimenu_left").animate({width:150},300); 
		$(".user_mimenu_left ul").fadeIn();
	}
});
//会员菜单更多显示/隐藏
$("#more_btn").click(function(e) {
	if($(".user_menu_sub").css("display")=="none"){
		$(".user_menu_sub").fadeIn();
		$(this).find("i").removeClass("fa-angle-double-down");
		$(this).find("i").addClass("fa-angle-double-up");
	}
    else{
		$(".user_menu_sub").fadeOut();
		$(this).find("i").removeClass("fa-angle-double-up");
		$(this).find("i").addClass("fa-angle-double-down");
	}
});
//会员搜索
$("#sub_btn").click(function(e) { 
    if($("#key").val()=="")
		alert("搜索关键字为空!");
	else
		window.location="/User/SearchResult.aspx?key="+escape($("#key").val());	
});
//搜索回车事件
function IsEnter(obj) {
	if (event.keyCode == 13) {
		$("#sub_btn").click(); return false;
	}
}
//判断div元素是否满屏，不满则自动补充高度，
$().ready(function(e) {
	if($(".u_footer").position().top+$(".u_footer").outerHeight()<window.innerHeight)
		$(".u_footer").height(window.innerHeight-$(".u_footer").position().top-3);//-3为减去div的border-top高度，否则出现滚动条
});
</script>