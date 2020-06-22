﻿<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Message, App_Web_pnzydsse" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>收件箱</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="u_ban page_ban">
    <div class="container">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 u_ban_l text-center">
        <i class="glyphicon glyphicon-comment"></i> 
        </div>
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 u_ban_r">
        <ul class="list-unstyled text-center">
        <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/Content/ManagePub.aspx"><i class="glyphicon glyphicon-th"></i><br/>互动管理</a></li> 
        <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/Content/CommentList.aspx"><i class="fa fa-comments-o"></i><br/>我的评论</a></li>
        <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/user/Message/Message.aspx"><i class="fa fa-envelope-o"></i><br/>收件箱</a></li>
        <div class="clearfix"></div>
        </ul>
        </div>
    </div>
    </div>
    <div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="Message.aspx">消息中心</a></li>
        <li class="active">收件箱</li>
        <div class="clearfix"></div>
    </ol>
    </div>
    <div class="container">
    <div class="btn-group">
        <a href="MessageSend.aspx" class="btn btn-primary">新消息</a>
        <a href="Message.aspx" class="btn btn-primary">收件箱</a>
        <a href="MessageOutbox.aspx" class="btn btn-primary">发件箱</a>
        <a href="MessageDraftbox.aspx" class="btn btn-primary">草稿箱</a>
        <a href="MessageGarbagebox.aspx" class="btn btn-primary">垃圾箱</a>
        <a href="Mobile.aspx" class="btn btn-primary">手机短信</a>
    </div>
    </div>
    <div class="container">
    <div class="us_seta u_cnt" style="margin-top:10px;">
        <div class="us_pynews">
             <ZL:ExGridView runat="server" ID="EGV"  DataKeyNames="MsgID" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="无相关信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >           
                <Columns>
                    <asp:TemplateField HeaderText="选择" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="center">
                        <ItemTemplate>
                            <asp:CheckBox ID="cheCk" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle Width="5%"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="主题">
                        <HeaderStyle Width="40%" />
                        <ItemTemplate><%# Eval("Title", "{0}")%>（<%#getStatus(Eval("ReadUser","{0}"))%>)</ItemTemplate>
                        <ItemStyle HorizontalAlign="left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="发件人">
                        <ItemTemplate>
                            <%# GetUserName(Eval("Sender","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PostDate" HeaderText="发送日期" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="center">
                        <HeaderStyle Width="20%"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确实要删除此信息到垃圾箱吗？');" CommandArgument='<%# Eval("MsgID")%>' Text="删除"></asp:LinkButton>
                            <asp:LinkButton ID="lbRead" runat="server" CommandName="ReadMsg" CommandArgument='<%# Eval("MsgID")%>'><%#getMess(Eval("ReadUser","{0}"))%></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="20%"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center"  />
    </ZL:ExGridView>           
            <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged"
                Text="全选" />
            <asp:Button ID="Button1" runat="server" class="btn btn-primary" Font-Size="9pt" Text="取消"
                OnClick="Button1_Click" />
            <asp:Button ID="Button2" class="btn btn-primary" runat="server" Font-Size="9pt" Text="批量删除"
                OnClick="Button2_Click" />
        </div>
    </div>
        </div>
</asp:Content>
