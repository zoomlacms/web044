<%@ page language="C#" autoeventwireup="true" inherits="Manage_AccountForm, App_Web_emmhtgtv" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>填取表单获得后台访问权限！</title>
    <script type="text/javascript" src="http://code.zoomla.cn/Area.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_PCC.js"></script>
    <style>
		body{ position:relative; width:100%; height:100%; min-height:100%; background-image: url(http://code.zoomla.cn/user_login.jpg);  background-size: cover; background-repeat: no-repeat; background-position:50% 50%; background-size:cover; background-attachment: fixed;}
        .userform{ margin:auto; margin-top:10%; padding-top:20px; width:580px; max-width:100%; font-size:12px; font-family:'Microsoft YaHei'; background:rgba(255,255,255,0.8); box-shadow:0 0 5px 2px rgba(245,245,245,0.5);}
		.userform .panel{ background:none; border:none; border-radius:0; box-shadow:none;}
		.userform .panel-heading .pull-right{ margin-top:35px;}
		.userform .panel-body p{ color:#999;}
		.userform .panel-default .panel-heading{ border:none; border-bottom:1px solid #ddd; background:none;}
		.userform .panel table .nesinfo{ color:#f00;}
        .userform .popover{font-size:14px;}
        .userform .hascount{font-size:16px;}
        .table tbody tr td{border:none;}
        .table span{line-height:30px; color:#333;}
        .userdiag {width: 450px;}
        #Tip_Div{padding:30px 20px;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="Form_Div" runat="server" class="container userform">
        <div class="panel panel-default">
          <div class="panel-heading"><h2 class="pull-left">申请测试帐号</h2><span class="pull-right"><a href="Login.aspx?hasAccount=1" class="hascount"><span class="glyphicon glyphicon-info-sign"></span> 已有帐号</a></span><div class="clearfix"></div></div>
          <div class="panel-body">
            <p>当前访问的是逐浪DEMO体验站点，请填写以下信息申请测试权限</p>
            <table class="table">
                <tr><td class="text-right"><span>姓名:</span></td><td><asp:TextBox ID="UserName_T" CssClass="form-control" runat="server" placeholder="用户姓名"></asp:TextBox></td><td><span class="nesinfo name_err">*将是您登录后台的帐号</span></td></tr>
                <tr><td class="text-right"><span>手机:</span></td><td><asp:TextBox ID="UserPhone_T" CssClass="form-control" runat="server" placeholder="手机号码"></asp:TextBox></td><td><span class="nesinfo mb_err"></span></td></tr>
                <tr><td class="text-right"><span>邮箱:</span></td><td><asp:TextBox ID="UserEmail_T" CssClass="form-control" runat="server" placeholder="邮箱地址"></asp:TextBox></td><td><span class="nesinfo email_err"></span></td></tr>
                <tr><td class="text-right"><span>公司:</span></td><td><asp:TextBox ID="Compay_T" CssClass="form-control" runat="server" placeholder="所属公司"></asp:TextBox></td><td><span class="nesinfo">*可为空</span></td></tr>
                <tr><td class="text-right"><span>所在地:</span></td><td><select id="tbProvince" class="btn btn-default"></select> <select id="tbCity" class="btn btn-default"></select> <select class="btn btn-default" id="tbCounty"></select></td></tr>
                <tr><td class="text-right"><span>QQ号:</span></td><td><asp:TextBox ID="QQ_T" runat="server" CssClass="form-control" placeholder="QQ号码"></asp:TextBox></td><td><span class="nesinfo qq_err">*至少5位数字</span></td></tr>
                <tr><td colspan="3" class="text-center"><asp:Button ID="Submit_B" runat="server" OnClick="Submit_B_Click" CssClass="btn btn-info" OnClientClick="return CheckDate()" Text="提交" /> <input type="button" class="btn btn-info" onclick="reinput()" value="重置" /></td></tr>
            </table>
            <asp:HiddenField ID="Adrees_Hid" runat="server" />
          </div>
        </div>
        
    </div>
    <div id="Tip_Div" runat="server" class="container userform" visible="false">
        <div class="panel panel-default">
          <div class="panel-heading">提示</div>
          <div class="panel-body text-center">
            您的申请资料已成功提交,我们会尽快已邮件回复您! [<a href="/">返回首页</a>]
          </div>
        </div>
    </div>
    <script type="text/javascript" src="/JS/ZL_Regex.js"></script>
    <script>
        $().ready(function () {
            //如有父页面则重定向父页面
            if (window.top!=window.self)
                parent.window.location = window.location;
            var pcc = new ZL_PCC("tbProvince", "tbCity", "tbCounty");
            pcc.ProvinceInit();
            $("select").change(function () {
                $("#Adrees_Hid").val($("#tbProvince").val() + ',' + $("#tbCity").val() + ',' + $("#tbCounty").val());
            });
            $("#Adrees_Hid").val($("#tbProvince").val() + ',' + $("#tbCity").val() + ',' + $("#tbCounty").val());
        });
        function reinput() {
            $("input[type='text']").val('');
        }

        function CheckDate() {
            if ($("#UserName_T").val() == "") {
				$(".name_err").text("用户名不能为空");
//                showtips("UserName_T", "用户名不能为空");
                return false;
            }
            if (!ZL_Regex.isMobilePhone($("#UserPhone_T").val())) {
				$(".mb_err").text("手机号格式不对");
//                 showtips("UserPhone_T", "手机号格式不对");
                return false;
            }
            if (!ZL_Regex.isEmail($("#UserEmail_T").val())) {
				$(".email_err").text("邮箱格式不对");
//                showtips("UserEmail_T", "邮箱格式不对");
                return false;
            }
            if (!ZL_Regex.isNum($("#QQ_T").val()) || $("#QQ_T").val().length <= 5) {
				$(".qq_err").text("QQ号码格式不对");
//                showtips("QQ_T", "QQ号码格式不对");
                return false;
            }
            return true;
        }
        var timetip;
        function showtips(id, content) {
            //冒泡插件
            $("#" + id).popover({
                animation: true,
                placement: 'bottom',
                content: '<span style="color:red;  display:block;"><span class="glyphicon glyphicon-info-sign"></span> ' + content + '!</span>',
                html: true,
                trigger: 'manual',
                delay: { show: 10000, hide: 100 }
            });
            $("#" + id).popover('show');
            timetip = setTimeout(function () { $("#" + id).popover('destroy'); }, 2000);
        }
    </script>
</asp:Content>

