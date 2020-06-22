<%@ page language="C#" autoeventwireup="true" inherits="User_PrintServer_ImageList, App_Web_t543ueky" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的作品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="u_ban page_ban">
<div class="container">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 u_ban_l text-center">
<i class="fa fa-paint-brush"></i> 
</div>
<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 u_ban_r">
 
</div>
</div>
</div> 
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a title="我的作品" href="<%=Request.RawUrl %>"> 我的作品</a></li>
		<div class="clearfix"></div>
    </ol>
    </div>
    <div class="container u_cnt">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
        class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"
        OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href='ShowImage.aspx?PID=<%#Eval("P_ID") %>'><img src='<%#DataBinder.Eval(Container.DataItem, "P_PrintUrl")%>' style="width:160px;"/></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
</div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>