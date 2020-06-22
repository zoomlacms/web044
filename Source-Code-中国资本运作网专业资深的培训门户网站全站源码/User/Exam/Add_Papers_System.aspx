<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Add_Papers_System, App_Web_0xgpqldf" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>编辑试卷信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a href="/user">用户中心</a></li>
        <li><a href='Papers_System_Manage.aspx'>试卷管理</a></li>
        <li class="active"><%=Label2.Text %></li>
    </ol>
    <asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="td_l" align="right">
               试卷名称：
            </td>
            <td class="bqright">
                <asp:TextBox ID="txtPaperName" runat="server" class="form-control text_md" /><span class="rd_red">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="试卷名不能为空!" ForeColor="Red" ControlToValidate="txtPaperName"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
               试卷类型：
            </td>
            <td class="bqright">
                <asp:DropDownList ID="ddRtyle" runat='server' CssClass="form-control text_md">
                    <asp:ListItem Value="1" Selected="True">考试</asp:ListItem>
                    <asp:ListItem Value="2">练习</asp:ListItem>
                    <asp:ListItem Value="3">作业</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label4" runat="server" Text="出题方式："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:DropDownList ID="ddType" runat='server' CssClass="form-control text_md">
                    <asp:ListItem Value="1" Selected="True">固定试卷(手工)</asp:ListItem>
                    <asp:ListItem Value="2">固定试卷(随机)</asp:ListItem>
                    <asp:ListItem Value="3" >随机试卷</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="tdbg">
            <td align="right">
               所属类别：
            </td>
            <td>
                <asp:DropDownList ID="ddlC_ClassId" runat="server" CssClass="form-control text_md">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
               考试时间：
            </td>
            <td class="bqright">
                <asp:TextBox ID="txtTime" runat="server" class="form-control text_md" Text="0"></asp:TextBox><span>分钟</span>
                <span class="rd_green">(为0不限时间,否则到时自动提交)</span>
            </td>
        </tr>
        <tr>
            <td align="right">
              有效时间：
            </td>
            <td class="bqright">
                <asp:TextBox ID="txtBegionTime" runat="server" class="form-control text_md"   onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm' });"></asp:TextBox>
                <span>至</span>
                <asp:TextBox ID="txtEndTime" runat="server" class="form-control text_md"  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm' });"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
               说明：
            </td>
            <td class="bqright">
                <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" class="form-control tarea_l"></asp:TextBox>
            </td>
        </tr>
        <tr class="tdbgbottom">
            <td></td>
            <td>
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存试卷" OnClick="EBtnSubmit_Click" runat="server" />
                <a href="Papers_System_Manage.aspx" class="btn btn-primary">返回列表</a>
            </td>
        </tr> 
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>