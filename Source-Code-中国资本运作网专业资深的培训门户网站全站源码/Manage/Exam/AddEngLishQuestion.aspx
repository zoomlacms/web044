<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="manage_Question_AddEngLishQuestion, App_Web_ltehqopl" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/Plugins/Ueditor/ueditor.config.js" charset="utf-8"></script>
    <script src="/Plugins/Ueditor/ueditor.all.min.js" charset="utf-8"></script>
    <script src="/Plugins/Ueditor/kityformula-plugin/addKityFormulaDialog.js"></script>
    <script src="/Plugins/Ueditor/kityformula-plugin/getKfContent.js"></script>
    <script src="/Plugins/Ueditor/kityformula-plugin/defaultFilterFix.js"></script>
<%--    <script src="/Plugins/Ueditor/Formdesign/leipi.Formdesign.v4.js" charset="utf-8" ></script>--%>
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <title>试题管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>
    <table class="table table-striped table-bordered table-hover">    
        <tbody id="Tabs0">
            <tr>
                <td class="td_l">考点名称:</td>
                <td>
                    <asp:DropDownList ID="ddlKnow" CssClass="form-control text_md" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>试题标题:</td>
                <td>
                    <asp:TextBox ID="txtP_title" runat="server" CssClass="form-control text_md" />
                    <span class="rd_red">*</span>
                    <asp:RequiredFieldValidator ID="RV1" runat="server" ErrorMessage="试题标题不能为空!" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtP_title" />
                    <asp:HiddenField ID="hfC_Id" runat="server"  />
                </td>
            </tr>
            <tr>
                <td>难度:</td>
                <td>
                    <div style="width: auto; float: left">
                        <asp:RadioButtonList ID="rblDiff" runat="server" RepeatDirection="Horizontal" Height="22px"
                            Width="277px">
                            <asp:ListItem Selected="True" Value="1">基础</asp:ListItem>
                            <asp:ListItem Value="2">容易</asp:ListItem>
                            <asp:ListItem Value="3">中等</asp:ListItem>
                            <asp:ListItem Value="4">偏难</asp:ListItem>
                            <asp:ListItem Value="5">极难</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </td>
            </tr>
            <tr>
                <td>分数:</td>
                <td><asp:TextBox ID="txtDefaSocre" runat="server" Text="5" CssClass="form-control text_xs"></asp:TextBox></td>
            </tr>
            <tr>
                <td>题型:</td>
                <td>
                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control text_md">
                         <asp:ListItem Value="0">单选题</asp:ListItem>
                         <asp:ListItem Value="1">多选题</asp:ListItem>
                         <asp:ListItem Value="2">填空题</asp:ListItem>
                         <asp:ListItem Value="3">解析题</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>试题内容:<span class="rd_red">*</span></td>
                <td>
                    <asp:TextBox ID="txtP_Content" runat="server" Style="height: 200px; width: 100%;" TextMode="MultiLine"></asp:TextBox>
                    <%=Call.GetUEditor("txtP_Content",2) %>
                    <asp:RequiredFieldValidator ID="RV2" runat="server" ErrorMessage="试题内容不能为空!" ControlToValidate="txtP_Content" />
                </td>
            </tr>          
            <tr>
                <td>试题信息:</td>
                <td>
                         <span>选项:</span><asp:DropDownList ID="ddlNumber1" CssClass="form-control text_x" onchange="AddOption($(this).val());" runat="server"> 
                            <asp:ListItem Value="0">0</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>                          
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                            <asp:ListItem Value="8">8</asp:ListItem>
                            <asp:ListItem Value="9">9</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                        </asp:DropDownList>
                    <div>
                        <ul id="option_ul"></ul>
                    </div>
                    <asp:Literal ID="Tips" runat="server" Visible="false"></asp:Literal>
                    <div id="optionDiv" runat="server" visible="false"> </div>
                </td>
            </tr>          
        </tbody>
        <tbody id="Tabs1">
            <tr>
                <td>试题解析:</td>
                <td>
                   <%-- <asp:TextBox ID="txtJiexi" runat="server"  TextMode="MultiLine" CssClass="m715-50" style="height:200px;"/>--%>
                    <textarea runat="server" id="txtJiexi" class="m715-50" style="height:200px;">
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; font-weight: bold; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;">【考点】</span></p>
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;"><span style="font-weight: bold;">【专题】</span></span></p>
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;"><span style="font-weight: bold;">【分析】</span></span></p>
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;"><span style="font-weight: bold;">【解答】</span></span></p>
                        <p style="white-space: normal;"><span style="font-weight: bold; font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;">【点评】</span></p>
                    </textarea>
                    <%=Call.GetUEditor("txtJiexi",2) %>
                </td>
            </tr>
              <tr>
                <td>排序:</td>
                <td>
                    <asp:TextBox ID="Order" runat="server"  CssClass="form-control text_md" Text="0" />
                </td>
            </tr>             
            <tr>
                <td>是否共享: </td>
                <td>
                    <div style="width: auto; float: left">
                        <input type="checkbox" runat="server" id="RadioButtonList1" class="switchChk"/>
                    </div>
                </td>
            </tr>
            <tr runat="server" visible="false">
                <td>视频路径:</td>
                <td>
                    <asp:TextBox ID="txtFile" runat="server" class="form-control text_md" /><input type="button" class="btn btn-info" value="选择视频" />
                </td>
            </tr>
            <tr class="tdbg" id="shumi">
                <td>说明：</td>
                <td><asp:TextBox runat="server" ID="shuming"  CssClass="form-control text_md" cols="40" rows="6" ></asp:TextBox></td>
            </tr>
        </tbody>
        <tr class="tdbgbottom">
            <td></td>
            <td>
            <asp:HiddenField ID="hfC_ClassId" runat="server" />
            <asp:HiddenField ID="hffilename" runat="server" />
            <asp:HiddenField ID="Optioninfo_Hid" runat="server" />
            <asp:HiddenField ID="hfanw" runat="server" />
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存试题" OnClientClick="GetOptions();" OnClick="EBtnSubmit_Click" runat="server" />
                <a href="AddQuestionForType.aspx" class="btn btn-primary">返回</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
        #option_ul li{margin-top:3px;}
    </style>
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Exam_Paper.js"></script>
    <script type="text/javascript">
        var diag = new ZL_Dialog();
        function ShowDiag() {//后期增加对公式的支持,已有实现思路
            diag.title = "设定内容";
            diag.maxbtn = false;
            diag.backdrop = true;
            diag.url = "/Manage/Exam/Addoption.html";
            diag.ShowModal();
        }
        function CloseDiag() { diag.CloseModal(); }
        $(function () {
            var option = $("#Optioninfo_Hid").val();
            if (option != "") {
                AnalyOption(JSON.parse(option));
            }
        })
    </script>
</asp:Content>
