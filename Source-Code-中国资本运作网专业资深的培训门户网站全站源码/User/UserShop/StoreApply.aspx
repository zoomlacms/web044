<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_StoreApply, App_Web_yxfagal4" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的店铺</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="u_blank"></div>
<div class="u_shop"> 
<div class="container">
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 u_shop_l">
<div class="u_shop_logo">
<ul class="list-unstyled text-center">
<li><img src="/Images/nopic.gif" class="center-block img-responsive" id="shop_logo" alt="" /></li>
<li><h3 id="shop_name" runat="server">店铺名称</h3></li>
<li>[<asp:Label ID="Label2" runat="server" Text=""></asp:Label>]</li>
</ul>
</div>
<div class="u_shop_mimenu">
<ul class="list-unstyled text-left">
<li><a href="/User/Shop/">店铺首页</a></li>
<li><a href="/User/UserShop/ProductList.aspx">商品管理</a></li>
<li><a href="/User/UserShop/Orderlist.aspx">订单管理</a></li>
<li><a href="/User/UserShop/StockList.aspx">库存管理</a></li>
<li><a href="/User/UserShop/OrderList.aspx?ordertype=10">代购订单</a></li>
<li><a href="/User/UserShop/Salelist.aspx">明细记录</a></li>
<li><a href="/User/UserShop/ProductSaleList.aspx">销售记录</a></li>
<li><a href="/User/UserShop/ChangeManage.aspx">交换商品</a></li>
<li><a href="/User/UserShop/ApplicationManage.aspx">申请商品处理</a></li>
<li><a href="/User/UserShop/FloGoodsManage.aspx">运货方式管理</a></li>
<li><a href="/User/UserShop/DeliverUserManage.aspx">送货员管理</a></li>
</ul>
</div>
</div>
<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
<div class="u_shop_r">
<ul class="list-unstyled text-center">
<li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/Shop/"><i class="fa fa-home"></i>店铺主页</a></li>
<li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/UserShop/ProductList.aspx"><i class="fa fa-cubes"></i>商品管理</a></li>
<li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/UserShop/Orderlist.aspx"><i class="glyphicon glyphicon-shopping-cart"></i>订单管理</a></li>
<li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/UserShop/ProductSaleList.aspx"><i class="glyphicon glyphicon-option-horizontal"></i>销售记录</a></li>
</ul>
<div class="clearfix"></div>
</div>
<div class="u_site margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">店铺申请</li>
        <div class="clearfix"></div>
    </ol>
</div>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="text-center">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="text-center">商铺名称</td>
            <td>
                <asp:TextBox ID="Nametxt" runat="server" Text='' CssClass="form-control m715-50"></asp:TextBox>
                <span><font color="red">*</font></span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Nametxt">名称必填</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-center">商铺类型</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control m715-50"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                <span><font color="red">*</font></span>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DropDownList1">类型必填</asp:RequiredFieldValidator>
            </td>
        </tr>
        <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="EBtnSubmit" Text="信息提交" runat="server" CssClass="btn btn-primary" OnClick="EBtnSubmit_Click" />
                <input id="Button1" type="button" value="返回 " class="btn btn-primary" onclick="javascript: history.go(-1)" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript" src="/js/ZL_Content.js"></script>

    <script type="text/javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
        $().ready(function () {
            $("input[type=text]").addClass("form-control");
        })
    </script>
</asp:Content>
