<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="manage_Question_AddEngLishQuestion, App_Web_0xgpqldf" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/Plugins/Ueditor/ueditor.config.js" charset="utf-8"></script>
    <script src="/Plugins/Ueditor/ueditor.all.min.js" charset="utf-8"></script>
    <script src="/Plugins/Ueditor/kityformula-plugin/addKityFormulaDialog.js"></script>
    <script src="/Plugins/Ueditor/kityformula-plugin/getKfContent.js"></script>
    <script src="/Plugins/Ueditor/kityformula-plugin/defaultFilterFix.js"></script>
<%--    <script src="/Plugins/Ueditor/Formdesign/leipi.Formdesign.v4.js" charset="utf-8" ></script>--%>
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="/App_Themes/V3.css" />
    <title>试题管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a href="/user">用户中心</a></li>
        <li><a href="QuestionManage.aspx">试题管理</a></li>
        <li class="active">添加试题</li>
    </ol>
     <asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>
    <table class="table table-striped table-bordered table-hover">    
        <tbody id="Tabs0">
            <tr>
                <td>试题标题:</td>
                <td>
                    <asp:TextBox ID="txtP_title" runat="server" CssClass="form-control text_md" />
                    <span class="r_red_mid">*</span>
                    <asp:RequiredFieldValidator ID="RV1" runat="server" ErrorMessage="试题标题不能为空!" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtP_title" />
                    <asp:HiddenField ID="hfC_Id" runat="server"  />
                </td>
            </tr>
            <tr>
                <td class="td_l">所属年级</td>
                 <td>
                     <label><input type="radio" name="grade" value="1"/>一年级</label>
                     <label><input type="radio" name="grade" value="2" />二年级</label>
                     <label><input type="radio" name="grade" value="3" />三年级</label>
                     <label><input type="radio" name="grade" value="4" />四年级</label>
                     <label><input type="radio" name="grade" value="5" />五年级</label>
                     <label><input type="radio" name="grade" value="6" />六年级</label>
                     <label><input type="radio" name="grade" value="7" checked="checked"/>初一</label>
                     <label><input type="radio" name="grade" value="8" />初二</label>
                     <label><input type="radio" name="grade" value="9" />初三</label>
                     <label><input type="radio" name="grade" value="10" />高一</label>
                     <label><input type="radio" name="grade" value="11" />高二</label>
                     <label><input type="radio" name="grade" value="12" />高三</label>
                 </td>
            </tr>
            <tr>
                <td class="td_l">试题类别</td>
                <td>
                    <div class="btn-group Quesst_Dr">
                        <button type="button" class="btn btn-default dropdown-toggle text-left text_300"><span class="curquest"><span class="gray_9"><i class="fa fa-warning"></i>点击选择类别!</span></span> <span class="pull-right"><span class="caret"></span></span></button>
                        <ul class="dropdown-menu Template_files" role="menu">
                        <asp:Literal ID="QuestType_Li" runat="server" EnableViewState="false"></asp:Literal>
                        </ul></div>
                        <asp:HiddenField ID="QuestType_Hid" runat="server" />
                    <asp:Repeater ID="quesType_RPT" runat="server" EnableViewState="false">
                        <ItemTemplate>
                            <label><input type="radio" name="questype" value="<%#Eval("c_id") %>" /><%#Eval("C_ClassName") %></label>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td class="td_l">考点名称:</td>
                <td>
                    <asp:Repeater ID="ddlKnow_RPT" runat="server" EnableViewState="false">
                        <ItemTemplate>
                            <label><input type="radio" name="knowname" value="<%#Eval("ID") %>" /><%#Eval("TestPoint") %></label>
                        </ItemTemplate>
                    </asp:Repeater>
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
                <td>题型:</td>
                <td>
                    <label><input type="radio" name="qtype" value="0" checked="checked" />单选题 </label>
                    <label><input type="radio" name="qtype" value="1" />多选题 </label>
                    <label><input type="radio" name="qtype" value="2" />填空题 </label>
                    <label><input type="radio" name="qtype" value="3" />解析题 </label>
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
                <td>分数:</td>
                <td><asp:TextBox ID="txtDefaSocre" runat="server" Text="5" CssClass="form-control text_xs"></asp:TextBox></td>
            </tr>     
            <tr>
                <td>试题信息:</td>
                <td>
                         <span></span><asp:DropDownList ID="ddlNumber1" CssClass="form-control text_x" onchange="AddOption($(this).val());" runat="server"> 
                            <asp:ListItem Value="0">0</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>                          
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                        </asp:DropDownList>
                    <div>
                        <ul id="option_ul"></ul>
                    </div>
                    <asp:Literal ID="Tips" runat="server" Visible="false"></asp:Literal>
                    <div id="optionDiv" runat="server" visible="false"> </div>
                </td>
            </tr>
            <tr>
                <td>正确答案：<span class="rd_green">(仅用于自动改卷)</span></td>
                <td>
                    <asp:TextBox runat="server" ID="Answer_T" CssClass="form-control text_300"></asp:TextBox>
                    <span class="r_green_x">如有多个答案用|号分隔,用于支持自动批阅试卷,单选:A,多选:A|B,填空:值1|值2|值3</span>
                </td>
            </tr>
            <tr><td>正确答案：<span class="rd_green">(教师与学生可见)</span></td>
                <td>
                    <asp:TextBox runat="server" ID="AnswerHtml_T" TextMode="MultiLine" style="width:100%;height:200px;"></asp:TextBox>
                    <%=Call.GetUEditor("AnswerHtml_T",2) %>
                </td>
            </tr>
        </tbody>
        <tbody id="Tabs1">
            <tr>
                <td>试题解析:</td>
                <td>
                   <%-- <asp:TextBox ID="txtJiexi" runat="server"  TextMode="MultiLine" CssClass="m715-50" style="height:200px;"/>--%>
                    <textarea runat="server" id="txtJiexi" style="height:200px;width:100%;">
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; font-weight: bold; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;">【考点】</span></p>
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;"><span style="font-weight: bold;">【专题】</span></span></p>
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;"><span style="font-weight: bold;">【分析】</span></span></p>
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;"><span style="font-weight: bold;">【解答】</span></span></p>
                        <p style="white-space: normal;"><span style="font-weight: bold; font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;">【点评】</span></p>
                    </textarea>
                    <%=Call.GetUEditor("txtJiexi",2) %>
                </td>
            </tr>
              <%--<tr>
                <td>排序:</td>
                <td>
                    <asp:TextBox ID="Order" runat="server"  CssClass="form-control text_md" Text="0" />
                </td>
            </tr>--%>             
         <%--   <tr>
                <td>是否共享: </td>
                <td>
                    <div style="width: auto; float: left">
                        <input type="checkbox" runat="server" id="RadioButtonList1" class="switchChk"/>
                    </div>
                </td>
            </tr>--%>
            <%--<tr runat="server" visible="false">
                <td>视频路径:</td>
                <td>
                    <asp:TextBox ID="txtFile" runat="server" class="form-control text_md" /><input type="button" class="btn btn-info" value="选择视频" />
                </td>
            </tr>--%>
   <%--         <tr class="tdbg" id="shumi">
                <td>说明：</td>
                <td><asp:TextBox runat="server" ID="shuming"  CssClass="form-control text_md" cols="40" rows="6" ></asp:TextBox></td>
            </tr>--%>
        </tbody>
        <tr class="tdbgbottom">
            <td></td>
            <td>
            <asp:HiddenField ID="hffilename" runat="server" />
            <asp:HiddenField ID="Optioninfo_Hid" runat="server" />
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存" OnClientClick="return CheckData();" OnClick="EBtnSubmit_Click" runat="server" />
                <a href="QuestionManage.aspx" class="btn btn-primary">返回</a>
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
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/SelectCheckBox.js"></script>
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
            console.log(option);
            InitQuestEvent();
        })
        function InitQuestEvent() {
            $(".Quesst_Dr button").click(function () {
                $(this).next().toggle();
            });
        }
        function CheckData() {
            if ($("#QuestType_Hid").val()=="") {
                alert('请选择试题类别!');
                return false;
            }
            if (!$("[name='knowname']:checked")[0]) {
                alert("请选择考点名称!");
                return false;
            }
            GetOptions();
            return true;
        }
        //选择试题类别
        function SelQuestType(obj,id) {
            $(".Quesst_Dr button .curquest").html($(obj).text());
            $("#QuestType_Hid").val(id);
            $(obj).closest('ul').hide();
        }
        $().ready(function () {
            if ($("#QuestType_Hid").val() || $("#QuestType_Hid").val()>0)
            SetQuestType($("#QuestType_Hid").val());
        });
        function SetQuestType(id) {
            $(".Quesst_Dr button .curquest").html($(".Quesst_Dr ul [data-id='" + id + "']"));
        }
    </script>
</asp:Content>
