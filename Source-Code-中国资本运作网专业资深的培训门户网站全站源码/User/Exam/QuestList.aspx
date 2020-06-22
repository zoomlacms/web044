<%@ page language="C#" autoeventwireup="true" inherits="User_Exam_QuestList, App_Web_0xgpqldf" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>问题管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <ol class="breadcrumb">
            <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
            <li><a href="/user">用户中心</a></li>
            <li>试题管理<a href='AddEnglishQuestion.aspx'>[添加试题]</a></li>
        </ol>
        <div class="input-group text_300">
                <asp:TextBox ID="Search_T" runat="server" CssClass="form-control" placeholder="试题名"></asp:TextBox>
                <span class="input-group-btn">
                <asp:LinkButton ID="Search_B" runat="server" OnClick="Search_B_Click" CssClass="btn btn-default"><i class="glyphicon glyphicon-search"></i></asp:LinkButton>
                </span>
            </div><!-- /input-group -->
    <div class="divbox" id="nocontent" runat="server" style="display: none"> 暂无试题信息</div>
        <div>
        <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"   EnableTheming="False" IsHoldState="false"
                class="table table-striped table-bordered table-hover margin_t5" EmptyDataText="当前没有信息!!"  OnPageIndexChanging="EGV_PageIndexChanging"
            OnRowDataBound="gvCard_RowDataBound" OnRowCommand="gvCard_RowCommand" >
            <RowStyle CssClass="tdbg" Height="26px"></RowStyle>
            <Columns>
                <asp:TemplateField ItemStyle-Width="50">
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" value="<%#Eval("p_id") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="试题标题">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CommandName="Upd" CommandArgument='<%#Eval("p_id") %>'><%# Eval("p_title")%></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_Inputer" HeaderText="作者" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle" />
                <asp:TemplateField HeaderText="难度" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetDifficult() %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类别" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetClass(Eval("p_Class","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_Views" HeaderText="使用次数" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle" />
                <asp:TemplateField HeaderText="题型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetType(Eval("p_Type", "{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="考点" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetTestPoint(Eval("p_Knowledge", "{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_CreateTime" HeaderText="创建时间" ItemStyle-VerticalAlign="Middle"
                    ItemStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="相关操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Upd" CommandArgument='<%#Eval("p_id") %>'>修改</asp:LinkButton>
                        <asp:Button data-name="id" runat="server" CommandName="Upd" CommandArgument='<%#Eval("p_id") %>' style="display:none;" />
                     <%--   <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del" CommandArgument='<%#Eval("p_id") %>'
                            OnClientClick="return confirm('你确定将该数据删除吗？');">删除</asp:LinkButton>--%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
