<%@ page language="C#" autoeventwireup="true" inherits="Uploadify, App_Web_lxnrs5xi" enableviewstatemac="false" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>批量上传</title>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Plugins/Uploadify/jquery.uploadify.js"></script>
<link type="text/css" rel="stylesheet" href="/Plugins/Uploadify/style.css" />
    <style type="text/css">
        body {background: #e8f5ff;}
        .uploadifyQueue {border: 1px solid #ccc;width: 340px;height: 100px;overflow: auto;overflow-x: hidden;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="basic-demo" style="float: left; width: 360px;">
        <div style="margin: 0 auto;">
            <div id="fileQueue"></div>
            <input type="file" name="uploadify" id="uploadify" />
        </div>
        <input type="hidden" id="IsUpFile" />
    </div>
    
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script type="text/javascript">
        var strDir = "/Print/Templates/-Images"; //文件保存路径
        var maxFileSize = 1024 * <%=MaxSize %>; //文件最大限制1G 因为配置的单位是kb 这里的单位是b
    $(document).ready(function () {
        var img = "<img src='{0}' class='purview_img'/>";
        var fileurl = "/Plugins/Uploadify/UploadFileHandler.ashx";
        $("#uploadify").uploadify({
           //按钮宽高
           width: 120,
           height: 35,
           auto: true,
           swf: '/Plugins/Uploadify/uploadify.swf',
           uploader: fileurl,
           buttonText: "上传附件",
           buttonCursor: 'hand',
           fileTypeExts: "*.*",
           fileTypeDesc: "请选择文件",
           fileSizeLimit: "50000KB",
           formData: { "action": "ModelFile" },
           queueSizeLimit: 1,
           removeTimeout: 2,
           multi: false,
           onUploadStart: function (file) { },
           onUploadSuccess: function (file, data, response) {//暂只允许上传一个文件,后期根据业务需要看是否更改, //json,result,tru||false
               SwfFileUpload(data);
               $("#Attach_Hid").val(data);
               $("#edit").click();
           },
           onQueueComplete: function (queueData) { },
           onUploadError: function (file) { alert(file.name + "上传失败"); }
       });
    });

function SwfFileUpload(path) {
    if ("<%=ftp %>" == "") {
                parent.SwfFileUpload(path, 'sel_<%=FieldName %>', 'txt_<%=FieldName %>');
                $.get("../Ckeditor/Upload.aspx?path="+path+"&time="+Date(), function (da) {
                    //alert(da);
                })
            } else {
                parent.RemoteFile(path, 'sel_<%=FieldName %>', 'txt_<%=FieldName %>');
            } 
        }
    </script>
</asp:Content>