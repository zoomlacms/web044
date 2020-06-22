<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.ShowMessage, App_Web_h0owam4j" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<meta charset="utf-8">
<title>信息提示页</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />  
<style>
.msg_info{ margin:auto; margin-top:10%; padding:20px; width:500px; max-width:100%; background:#fafafa; text-align:center; font-family:"微软雅黑"; border:1px solid #eee;}
    .msg_info h1 { height:3em; line-height:3em; font-size:20px; font-weight:normal; }
        .msg_info h1 i { font-size:1.5em; color:#ffd800; }
    .msg_cnt { min-height:50px; line-height:2em; }
    .msg_btn a { margin-left:10px; margin-right:10px; text-decoration:none; }
</style>
</head>
<body>
<form id="form1" runat="server">
    <div class="msg_info">
        <h1><i class="glyphicon glyphicon-yen"></i><asp:Label ID="LblMessageTitle" runat="server" Text="信息提示" Font-Bold="true"></asp:Label></h1>
        <div class="msg_cnt"><asp:Literal ID="LtrMessage" runat="server"></asp:Literal></div>
        <div class="msg_btn">
            <asp:LinkButton ID="Link1"  OnClick="Link1_Click1" runat="server" Text="确定"></asp:LinkButton>
            <asp:HyperLink ID="LnkReturnUrl" runat="server">返回上一页</asp:HyperLink>
        </div>
    </div> 
</form> 
</body>
</html>