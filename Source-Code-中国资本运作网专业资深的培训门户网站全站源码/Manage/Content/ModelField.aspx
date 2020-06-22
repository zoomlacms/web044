<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_ModelField, App_Web_chetbuey" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDown" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>字段列表</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div>
        <table border="0" id="FieldList" cellpadding="0" cellspacing="1" class="table table-striped table-bordered table-hover" style="text-align: center; width: 100%">
            <tr class="gridtitle" align="center" style="height: 25px;">
                <th style="width: 10%; height: 20px;">
                    <strong>字段名</strong>
                </th>
                <th style="width: 10%">
                    <strong>字段别名</strong>
                </th>
                <th style="width: 10%">
                    <strong>字段类型</strong>
                </th>
                <th style="width: 8%">
                    <strong>字段级别</strong>
                </th>
                <th style="width: 5%">
                    <strong>是否必填</strong>
                </th>
                <th style="width: 5%">
                    <strong>是否显示</strong>
                </th>
                <th style="width: 5%">
                    <strong>可复制</strong>
                </th>
                <th style="width: 7%">
                    <strong>批量添加</strong>
                </th>
                <th>
                    <strong>允许内链</strong>
                </th>
                <th style="width: 10%">
                    <strong>排序</strong>
                </th>
                <th>
                    <strong>手动排序</strong>
                </th>
                <th style="width: 15%">
                    <strong>编辑</strong>
                </th>
            </tr>
            <asp:Repeater ID="rptSystemModel" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("FieldName")%></td>
                        <td align="center"><%#Eval("FieldAlias")%></td>
                        <td align="center"><%#Eval("FieldType", "{0}")%></td>
                        <td align="center"><span style="color: #339900">系统</span></td>
                        <td align="center"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Repeater ID="rptModelField" runat="server" OnItemCommand="rptModelField_ItemCommand">
                <ItemTemplate>
                    <tr ondblclick="location.href='AddModelField.aspx?FieldID=<%# Eval("FieldID") %>&ModelID=<%# Eval("ModelID") %>&ModelType=<%=Request["ModelType"] %>'">
                        <td>
                            <%#Eval("IsShow", "{0}") == "False" ? "<font color=#999999>" :""%><%#Eval("FieldName")%><%#Eval("IsShow","{0}")=="False"?"</font>":"" %>
                        </td>
                        <td align="center"><%#Eval("FieldAlias")%></td>
                        <td align="center"><%#GetFieldType(Eval("FieldType", "{0}"))%></td>
                        <td align="center"><%#Get_sum(Eval("Sys_type", "{0}")) ? "自定义" : "系统"%></td>
                        <td align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:ImageButton ID="imgbtnCanNull" runat="server" CommandName="ChangeValue" CommandArgument='<%# Eval("FieldID")+ " | Null" %>' ImageUrl='<%# "~/Images/" + BoolValueToImgName(Eval("IsNotNull", "{0}")) +".gif" %>' OnClick="ImageButton_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td align="center">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>

                                    <asp:ImageButton ID="imgbtnCanShow" runat="server" CommandName="ChangeValue" CommandArgument='<%# Eval("FieldID")+ " | Show" %>' ImageUrl='<%# "~/Images/" + BoolValueToImgName(Eval("ShowList", "{0}")) +".gif" %>' OnClick="ImageButton_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td align="center">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <asp:ImageButton ID="imgbtnCanCopy" runat="server" CommandName="ChangeValue" CommandArgument='<%# Eval("FieldID")+ " | Copy" %>' ImageUrl='<%# "~/Images/" + BoolValueToImgName(Eval("IsCopy", "{0}")) +".gif" %>' OnClick="ImageButton_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td align="center">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:ImageButton ID="imgbtnCanBadd" runat="server" CommandName="ChangeValue" CommandArgument='<%# Eval("FieldID")+ " | BatchAdd" %>' ImageUrl='<%# "~/Images/" + BoolValueToImgName(Eval("Islotsize", "{0}")) +".gif" %>' OnClick="ImageButton_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </td>
                        <td align="center">
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="ChangeValue" CommandArgument='<%# Eval("FieldID")+ " | BatchAdd" %>' ImageUrl='<%# "~/Images/" + BoolValueToImgName(Eval("IsChain", "{0}")) +".gif" %>' OnClick="ImageButton_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="lbtnMove" runat="server" CssClass="option_style" CommandName="UpMove" CommandArgument='<%# Eval("FieldID") %>' Visible='<%# Get_sum(Eval("Sys_type","{0}")) ? true:false %> '>↑上移 </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="option_style" CommandName="DownMove" CommandArgument='<%# Eval("FieldID") %>' Visible='<%# Get_sum(Eval("Sys_type","{0}")) ? true:false %> '>下移↓</asp:LinkButton>
                        </td>
                        <td class="text-center">
                            <input type="text" class="text_x text-center" name="order" data-id="<%# Eval("FieldID") %>" data-old="<%#Eval("OrderID") %>" value="<%#Eval("OrderID") %>" />
                        </td>
                        <td align="center">
                            <a class="option_style" href="AddModelField.aspx?FieldID=<%# Eval("FieldID") %>&ModelID=<%# Eval("ModelID") %>&ModelType=<%=Request["ModelType"] %>"><i class="glyphicon glyphicon-pencil" title="修改"></i></a>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CssClass="option_style" CommandName="Delete" CommandArgument='<%# Eval("FieldID") %>' OnClientClick="return confirm('确定删除此字段吗?\r\n\r\n删除后请更新相应字段输出配置以确保应用')" Visible='<%# Get_sum(Eval("Sys_type","{0}")) ? true:false %> '><i class="glyphicon glyphicon-trash"></i></asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    <div class="clearbox"></div>
    <table cellpadding="2" cellspacing="1" class="border" style="width: 100%">
        <tr>
            <td style="width: 30%">
                <%=PageCommon.GetTlpDP("TxtTemplate") %>
                <asp:HiddenField runat="server" ID="TxtTemplate_hid" />
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="设定模板" OnClick="SetTemplate" />
                <asp:HiddenField ID="Order_Hid" runat="server" Value="" />
                <asp:Button ID="Order_B" runat="server" OnClientClick="return CheckOrder()" CssClass="btn btn-info" Text="保存排序" OnClick="Order_B_Click" />
            </td>
        </tr>
    </table>
   <ZL:TlpDown runat="server" />
    <style>
        th {
            text-align: center;
        }
    </style>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            Tlp_initTemp();
        });
        window.onload = function () {
            $("#FieldList tr td:contains('系统')").parent().hide();
        }
        function ShowList() {
            $("#FieldList tr td:contains('系统')").parent().toggle();
            $("#ShowLink").text($("#ShowLink").text() == "[显示所有字段]" ? "[隐藏系统字段]" : "[显示所有字段]");
        }
        function WinOpenDialog(url, w, h) {
            var feature = "dialogWidth:" + w + "px;dialogHeight:" + h + "px;center:yes;status:no;help:no";
            showModalDialog(url, window, feature);
        }
        function CheckOrder() {
            $("[name='order']").each(function (i, v) {
                if ($(v).val() != $(v).data('old')) {
                    $("#Order_Hid").val($("#Order_Hid").val() + ","+$(v).data('id')+"|"+ $(v).val());
                }
            });
            return true;
        }
    </script>
</asp:Content>
