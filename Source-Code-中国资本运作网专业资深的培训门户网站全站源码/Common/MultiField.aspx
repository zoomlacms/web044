<%@ page language="C#" autoeventwireup="true" inherits="Common_MultiField, App_Web_k4yxdclq" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head>
<title>表格操作</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    //增加行
    function addrow() {
        var i = parseInt(document.getElementById("rowindex").value);
        i = parseInt($("#sortList tr:last-child").attr("id").replace('t','')) + 1;
        var name = "t" + i;
        var row = document.createElement("tr");
        row.setAttribute("id", name);
        row.setAttribute("onmouseover", "setContent(this)");
        row.setAttribute("onmousemove", "setContent(this)");
        row.setAttribute("onkeyup", "setContent(this)");
        var cell = document.createElement("td");
        cell.setAttribute("style", "text-align:right;width:20px");
        cell.innerHTML = "<a href='javascript:deleterow(\"" + name + "\")'>[-]</a>";
        row.appendChild(cell);
        var cell1 = document.createElement("td");
        cell1.innerHTML = "<%=strHtml %>";
        row.appendChild(cell1);
        i = i++;
        document.getElementById("sortList").appendChild(row);
        document.getElementById("rowindex").value = i + 1;
    }

    //删除行
    function deleterow(id) {
        if (id != null) {
            var rowToDelete = document.getElementById(id);
            var sortList = document.getElementById("sortList");
            sortList.removeChild(rowToDelete);
            delContent(id);
        }
    }

    function delContent(id) {
        var content = $("#content").val().split(',');
        var str = "";
        for (var i = 0; i < content.length; i++) {
            if (content[i].split('|')[0] != id && content[i] != "") {
                str += content[i] + ",";
            }
        }
        $("#content").val(str);
        setParentContent();
    }

    function setContent(obj) {
        var content = $("#content").val().split(',');
        var str = "";
        var j = 0;
        for (var i = 0; i < content.length; i++) {
            if (content[i].split('|')[0] == $(obj).attr("id")) {
                str += $(obj).attr("id") + "|" + $(obj).children("td").children("select").val() + "|" + $(obj).children("td").children("input").val() + ",";
                j = 1;
            } else if (content[i].split('|')[0] != "") {
                str += content[i] + ",";
            }
        }
        if (j == 0) {
            str += $(obj).attr("id") + "|" + $(obj).children("td").children("select").val() + "|" + $(obj).children("td").children("input").val() + ",";
        }
        $("#content").val(str);
        setParentContent();
    }
    function setParentContent() {
        var content = $("#content").val().split(',');
        var str = "";
        //t0|0|,t1|0|,t2|0|,
        for (var i = 0; i < content.length; i++) {
                if (content[i].split('|')[0] != ""&&content[i].split('|')[2]!="") {
                    str += content[i].split('|')[1] + "|" + content[i].split('|')[2];
                    str += ",";
                }
        }
        parent.document.getElementById("txt_<%=fieldname %>").value = str.substr(0, str.length - 1);
    }
</script>
<style type="text/css">
body{background:#e8f5ff;}
</style>
</head>
<body>
<input type="hidden" id="rowindex" value="1" />
<input type="hidden" id="content" runat="server" />
<table border="0" width="400" cellspacing="1">
  <tbody id="sortList" runat="server">
      <%--<tr id="t0" onmouseover="setContent(this)" onmousemove="setContent(this)" onkeypress="setContent(this)"><td style="text-align: right; width: 20px"><a href="javascript:addrow()">[+]</a></td><td><%=strHtml %></td></tr>--%>
  </tbody>
</table>
</body>
</html>