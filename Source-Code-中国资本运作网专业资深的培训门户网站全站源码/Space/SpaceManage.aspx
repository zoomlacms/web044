<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="Space_SpaceManage, App_Web_key14cjz" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="Head" runat="Server">
    <title>我的聚合页</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div class="u_ban page_ban">
        <div class="container">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 u_ban_l text-center">
        <i class="glyphicon glyphicon-grain"></i>
        </div>
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 u_ban_r"  >
        <ul class="list-unstyled text-center">
        <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/Space/Default.aspx?id=1"><i class="fa fa-home"></i><br/>聚合首页</a></li>
        <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/Space/SpaceManage.aspx"><i class="glyphicon glyphicon-education"></i><br/>我的聚合</a></li>
        <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/Space/list.aspx?id=1"><i class="glyphicon glyphicon-th"></i><br/>聚合列表</a></li>
        <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/Space/About.aspx?id=1"><i class="fa fa-file-text-o"></i><br/>聚合内容</a></li>
        <div class="clearfix"></div>
        </ul>
        </div>
        </div>
    </div>
    <div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的聚合</li> 
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 

    <div class="clearfix"> </div>
  </div> 
  <div class="container">
  <ZL:ExGridView ID="EGV" runat="server" AllowPaging="true" class="table table-bordered table-hover table-striped" OnPageIndexChanging="EGV_PageIndexChanging" AutoGenerateColumns="False" DataKeyNames="GeneralID" PageSize="10" OnRowCommand="Lnk_Click" GridLines="None" OnRowDataBound="Egv_RowDataBound"  >
    <Columns>
    <asp:TemplateField HeaderText="选择">
      <HeaderStyle Width="6%" />
      <ItemTemplate>
        <asp:CheckBox ID="chkSel" runat="server" />
      </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:BoundField DataField="GeneralID" HeaderText="ID">
      <HeaderStyle Width="6%" />
      <ItemStyle HorizontalAlign="Center" />
    </asp:BoundField>
    <asp:TemplateField HeaderText="标题">
      <HeaderStyle Width="40%" />
      <ItemTemplate> <a href='/User/Content/ShowPubList.aspx?ID=<%# Eval("GeneralID") %>'> <%# Eval("Title")%></a> </ItemTemplate>
      <ItemStyle HorizontalAlign="left" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="状态">
        <HeaderStyle Width="6%" />
      <ItemTemplate> <%# GetStatus(Eval("Status", "{0}")) %> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="已生成">
      <HeaderStyle Width="6%" />
      <ItemTemplate> <%# GetCteate(Eval("IsCreate", "{0}"))%> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="操作">
      <HeaderStyle Width="15%" />
      <ItemTemplate> <a href='/User/Content/ShowPubList.aspx?ID=<%# Eval("GeneralID") %>' class="option_style" title="预览"><i class="fa fa-eye"></i></a>
          <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>' CssClass="option_style"  title="修改"><i class="glyphicon glyphicon-pencil"></i></asp:LinkButton>
          <a href="<%# GetUrl(Eval("GeneralID", "{0}"))%>" target="_blank" class="option_style"><i class="fa fa-globe"></i>访问</a>
        
        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' CssClass="option_style" OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"><%# GetIsDe(Eval("Status", "{0}")) %></i></asp:LinkButton>
      </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    </Columns>
    <PagerStyle HorizontalAlign="Center" />
  </ZL:ExGridView>
       </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  
</asp:Content>