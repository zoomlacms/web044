<%@ page language="C#" responseencoding="utf-8" autoeventwireup="true" inherits="ZoomLa.WebSite.Shop.PayOnline, App_Web_qsjxyrlz" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE HTML>
<html>
<head>
    <title>在线支付</title>
    <script src="/JS/jquery-1.11.0.min.js"></script>
    <script src="/dist/js/bootstrap.min.js"></script>
    <link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/dist/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/App_Themes/User.css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
    <div class="mainpay_div"> 
      <table class="paytable" id="display1" runat="server">
      <tr><td><div class="top_pay"><div class="pay_logo"><a href="/"><img src="<%:Call.LogoUrl %>"></a></div></div></td></tr>
        <tr><td>
            <div class="pay_tab" id="pay_con">
                <div><strong>订单提交成功，请您尽快付款!</strong></div>
                <span>订单号：</span><asp:Label ID="LblOid" runat="server"></asp:Label>
                <span>应付金额：</span><asp:Label ID="LblPayMoney" runat="server"></asp:Label><br />
                <asp:Label Text="手续费：" ID="Fee" runat="server"></asp:Label>
                <asp:Label ID="LblRate" runat="server"></asp:Label>
            </div>
            <div class="PayPlat_s">
                <h3 class="r_green">请选择在线支付的方式：</h3>
                <asp:Label ID="Plat" Text="支付平台：" runat="server"></asp:Label>
                <asp:Label ID="LblPayPlatform" runat="server"></asp:Label>
                <a href="/PayOnline/Orderpay.aspx?PayNo=<%:PayNo %>" class="margin_l5">重新选择</a>
                <div class="margin_t5" runat="server" visible="false" id="Alipay_Btn">
                    <input type="button" value="确定付款" class="btn btn-info" onclick="alipaySubmit();" />
                </div>
                <div class="margin_t5">
                    <asp:Button runat="server" Text="确定支付" class="btn btn-info" Visible="false" ID="Confirm_VMoney_Btn" OnClick="Confirm_Click"   /><%//虚拟币,微信支付,Mobo %>
                </div>
                <div id="SecPwd" class="paypwd_div" runat="server" visible="false">
                    <span>请输入支付密码：</span><asp:TextBox ID="Second" runat="server" TextMode="Password" />
                </div>
            </div>
            <span style="display:none"><asp:Label ID="Titles" runat="server"><strong>在线支付操作（确认支付款项)</strong></asp:Label></span>
        </td></tr>
        <tr>
          <td class="tdbg">
            <div class="p_center">
              <table style="width:500px;">
                <tr class="tdbg">
                    <td align="right"> </td>
                    <td align="left"></td>
                </tr>
                <tr class="tdbg" id="Paymoney2" runat="server" style="display:none">
                    <td align="right">支付金额：</td>
                    <td align="left"></td>
                </tr>
                <tr class="tdbg" id="ActualAmount1" runat="server" style="display:none">
                    <td align="right">：</td>
                    <td align="left"> </td>
                </tr>
                <tr class="tdbg" id="aa" runat="server" style="display:none">
                    <td colspan="2" align="center" style="height: 38px;"><strong>点击“确认支付”按钮后，将进入在线支付界面。</strong></td>
                </tr>
                <tr class="tdbg" id="bb" runat="server">
                    <td colspan="5" align="center" style="height: 38px; padding-left: 140px;"></td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
      <table class="paytable" id="AfterPay_Tb" runat="server">
          <tr><td><div class="top_pay"><div class="pay_logo"><img src="<%:Call.LogoUrl %>"></div></div></td></tr>
          <tr>
              <td>
                  <div class="p_center">
                      <div class="pay_tab"><strong>恭喜您,下单成功！</strong><br /></div>
                      <div class="PayPlat_s payed">
                          <h3 class="r_green">确认款项：</h3>
                          <div>支付方式：<asp:Label ID="zfpt" runat="server"></asp:Label></div>
                          <div>订单号：<asp:Label ID="ddh" runat="server"></asp:Label></div>
                          <div>支付金额：<asp:Label ID="PayNum_L2" runat="server" Text="0"></asp:Label></div>
                          <div><asp:Label ID="fees" runat="server" Text="手续费："></asp:Label><asp:Label ID="sxf" runat="server"></asp:Label></div>
                          <div id="ActualAmount" runat="server" visible="false"><span>实际金额：</span><asp:Label ID="sjhbje" runat="server"></asp:Label></div>
                          <asp:Literal runat="server" ID="remindHtml" EnableViewState="false"></asp:Literal>
                          <div>
                              <asp:HyperLink runat="server" ID="Rurl_Href" CssClass="btn btn-primary">我的订单</asp:HyperLink>
                          </div>
                      </div>
                  </div>
              </td>
          </tr>
    </table>
    </div>
</form>
    <asp:Panel runat="server" ID="alipay_form" style="display:none;"><div class="margin_t5" runat="server" id="LblHiddenValue"></div></asp:Panel>
    <style type="text/css">
        .mainpay_div {width:950px; margin:auto;}
        .paytable{margin: auto; width:100%; margin-top: 10px; height: 180px;}
        .paypwd_div {width:300px;}
        .payed div {margin-top:5px;}
    </style>
    <script>
        function alipaySubmit() {
            $("#payform").submit();
        }
    </script>
</body>
</html>