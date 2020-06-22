<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Cloud_CloudManage, App_Web_oebotbm0" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>网络云盘</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content"> 
<div class="u_ban u_cloud">
<div class="container">
<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 u_ban_l text-center">
<i class="fa fa-cloud"></i>
</div>
<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 u_ban_r"  >
<ul class="list-unstyled text-center">
<li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="CloudManage.aspx?Type=file"><i class="fa fa-folder-open"></i><br/>我的文档</a></li>
<li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="CloudManage.aspx?Type=photo"><i class="fa fa-image "></i><br/>我的相册</a></li>
<li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="CloudManage.aspx?Type=music"><i class="fa fa-music"></i><br/>我的音乐</a></li>
<li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="CloudManage.aspx?Type=video"><i class="fa fa-film"></i><br/>我的视频</a></li>
<div class="clearfix"></div>
</ul>
<span runat="server" id="OpenCloud" visible="false"><i class="fa fa-warning"></i>您还没有云盘，请先
<asp:LinkButton ID="Open" runat="server" OnClick="OpenCloud_Click" ForeColor="Red">开通云盘</asp:LinkButton>
</span>
</div>
</div>
</div> 
<div class="clearfix"></div>
<div class="u_site margin_t5">
<div class="container">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">网络云盘</li>
</ol>
</div>
</div> 
<div class="clearfix"></div>
<div class="container u_cnt">   

    <div id="Cloud" runat="server" visible="false">
        <div class="url_title">
            <span id="navv" runat="server" style="margin-left: 10px;"></span>
            <asp:HiddenField ID="HdnPath" runat="server" />
        </div>
        <div class="clearfix"></div>
        <div class="us_seta" id="us_seta" style="text-align: left;margin-top:5px;" runat="server">
            <input id="back" type="button" runat="server" class="btn btn-primary" value="返 回" onclick="javascript:history.back();" />
            <input type="button" class="btn btn-primary" name="demoCode04-3" value="上传"
                onclick="ShowFileDiag()" />
            <input id="newFile" type="button" class="btn btn-primary" value="新建文件夹"
                onclick="ShowDirDiag()" />
        </div> 
        <table class="table">
                <thead>
                    <tr>
                 <td style="width:60%;">名称</td>
	            <td style="width:20%;">大小</td>
	            <td style="width:20%;">创建时间</td></tr>
                </thead>
        <asp:Repeater ID="RptFiles" runat="server" OnItemCommand="RptFiles_ItemCommand">
            <ItemTemplate>
                <tr style="height: 24px" class="tdbg" onmouseover="$(this).find('.hoverDiv').show();" onmouseout="$(this).find('.hoverDiv').hide();">
                    <td align="left">
                        <div style="position:relative;bottom:-10px;display:inline-block;"><%# System.Convert.ToInt32(Eval("type")) == 1 ? GroupPic.GetExtNameMini("filefolder") : GroupPic.GetExtNameMini(Eval("content_type").ToString())%></div>
                        <%#GetLink(Eval("type").ToString(),Eval("content_type").ToString(),Eval("Name").ToString()) %>
                        <span class="hoverDiv" style="display:none;">
		  <%#GetOP() %>
                            <%if (GetDelAuth())
                          { %>
			 <asp:LinkButton ID="LbtnDelList" CommandName='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "DelDir":"DelFiles" %>' CommandArgument='<%# Eval("Name")%>'
                 OnClientClick="if(!this.disabled) return confirm('确定要删除吗？');" runat="server"><span class='glyphicon glyphicon-trash' title='删除'></span></asp:LinkButton></td>
                    <%} %>
                    </td>
                    <td><%# GetSize(Eval("size").ToString())%></td>
                    <td><%# Eval("createTime")%></td>
                   <%-- <td align="center"><%--[<a href='javascript:' onclick='javascript:parent.NewFormd(\"文件分享\" ,\"/Common/File.aspx?T=f&FD=" + FileJiaM(CurrentDir+"/"+Eval("Name").ToString()) + "\")'>分享</a>]
                        <%#GetDownUrl() %>
                        <%if (GetDelAuth())
                          { %>
			 [<asp:LinkButton ID="LbtnDelList" CommandName='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "DelDir":"DelFiles" %>' CommandArgument='<%# Eval("Name")%>'
                 OnClientClick="if(!this.disabled) return confirm('确定要删除吗？');" runat="server">删除</asp:LinkButton>]</td>
                    <%} %>--%>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        </table> 
  <asp:Literal runat="server" ID="MsgPage_L" EnableViewState="false"></asp:Literal>
    </div>
    <div style="display:none;" id="NewDir_div">
        <asp:TextBox ID="DirName_T" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:Button ID="CreateDiv" runat="server" CssClass="btn btn-primary" OnClick="CreateDiv_Click" Text="确定" />
    </div>
    <div style="display:none;" id="File_div">
        <input type="file" id="files" />
    </div>
    </div>
    <div class="user_menu_sub"> 
<ul class="list-inline text-center">
<li><a href="/Mis/ke/DailyPlan.aspx"><i class="glyphicon glyphicon-calendar" style="background:#990000"></i><span>日程安排</span></a></li>
<li><a href="MySubscription.aspx"><i class="fa fa-rss" style="background:#28b779"></i><span>订阅管理</span></a></li>
<li><a href="Info/Listprofit.aspx"><i class="glyphicon glyphicon-usd" style="background:#a43ae3"></i><span>财务管理</span></a></li>
<li><a href="/Space/SpaceManage.aspx"><i class="fa fa-users" style="background:#f874a4"></i><span>个人聚合</span></a></li>
<li><a href="CashCoupon/ArriveManage.aspx"><i class="fa fa-file-text" style="background:#004b9b"></i><span class="span_xs">抵用券</span></a></li>
<li><a href="Info/DredgeVip.aspx"><i class="glyphicon glyphicon-credit-card" style="background:#CC3366"></i><span class="span_xs">VIP卡</span></a></li>
<li><a href="PrintServer/ImageList.aspx"><i class="fa fa-paint-brush" style="background:#27a9e3"></i><span>FLEX涂鸦</span></a></li>
<li><a href="PrintServer/Project/ProjectList.aspx"><i class="glyphicon glyphicon-th-large" style="background:#990000"></i><span>项目管理</span></a></li>
<li><a href="Survey/SurveyAll.aspx"><i class="glyphicon glyphicon-list-alt" style="background:#999"></i><span>问卷投票</span></a></li>
<li><a href="/Try/Default.aspx" target="_blank"><i class="glyphicon glyphicon-headphones" style="background:#6699CC"></i><span>在线试戴</span></a></li> 
<li><a href="/Plugins/Domain/Domname.aspx?Page=7" target="_blank"><i class="glyphicon glyphicon-globe" style="background:#852b99"></i><span>IDC管理</span></a></li> 
<li><a href="/Mis/" target="_blank"><i class="glyphicon glyphicon-tags" style="background:#1FA67A"></i><span class="span_xs">MIS管理系统</span></a></li> 
<li><a href="UserFunc/Watermark/" target="_blank"><i class="glyphicon glyphicon-barcode" style="background:#22afc2"></i><span class="span_xs">授权证书生成</span></a></li>    
</ul> 
</div>  
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/Plugins/Uploadify/jquery.uploadify.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript">

        (function () {
            var _skin, _jQuery;
            var _search = window.location.search;
            if (_search) {
                _skin = _search.split('demoSkin=')[1];
                _jQuery = _search.indexOf('jQuery=true') !== -1;
                if (_jQuery) document.write('<scr' + 'ipt src="jquery-1.6.2.min.js"></sc' + 'ript>');
            };
            document.write('<scr' + 'ipt src="artDialog.source.js?&skin=' + (_skin || 'aero') + '"></sc' + 'ript>');
        })();
        var DirDiag=new ZL_Dialog();
        function ShowDirDiag(){
            DirDiag.content="NewDir_div";
            DirDiag.title="新建目录";
            DirDiag.width="dirdiag";
            DirDiag.ShowModal();
        }
        var FileDiag=new ZL_Dialog();
        function ShowFileDiag(){
            FileDiag.title="文件上传";
            FileDiag.content="File_div";
            FileDiag.width="dirdiag";
            FileDiag.ShowModal();
            $("#files").uploadify({
                //按钮宽高
                width: 120,
                height: 35,
                auto: true,
                swf: '/Plugins/Uploadify/uploadify.swf',
                uploader: '/Plugins/Uploadify/UploadFileHandler.ashx',
                buttonText: "上传附件",
                buttonCursor: 'hand',
                fileTypeExts: "*.*",
                fileTypeDesc: "请选择文件",
                fileSizeLimit: "50000KB",
                formData: { "action": "Cloud_Doc", "value": "<%:CurrentDir%>","Type":"<%=Request["Type"] %>" },
                queueSizeLimit: 3,
                removeTimeout: 2,
                multi: true,
                onUploadStart: function (file) { },
                onUploadSuccess: function (file, data, response) {//json,result,tru||false
                },
                onQueueComplete: function (queueData) { location = location; },
                onUploadError: function (file) { }
            });
        }
        $().ready(function(){
            
        });
        function NewFormd(title, content) {
            if ($("iframe").eq(2).html() == null) {
                $(".aui_title").html(title);
                art.dialog.data('homeDemoPath', './_doc/');
                if (title == "新建文件夹") {
                    art.dialog.open(content, { title: title, width: "360" }, true);
                    $("iframe").eq(2).css({ "width": "360px", "height": "300px" });
                } else if (title == "文件上传") { 
                    art.dialog.open(content, { title: title, width: "440" }, true);
                    $("iframe").eq(2).css({  "width": "430px","height": "500px" });
                } else if (title == "音乐播放") {
                    art.dialog.open(content, { title: title, width: "300" }, true);
                    $("iframe").eq(2).css({ "width": "430px", "height": "500px" });
                    $('#back').remove();
                } else {
                    art.dialog.open(content, { title: title, width: "400" }, true);
                    $("iframe").eq(2).css({ "width": "430px", "height": "500px" });
                }
            } else {
                $("iframe").eq(2).attr("src", $("iframe").eq(2).attr("src"));
            }
        }
    </script>
    <script type="text/javascript">
        function myfunction() {
            $.get("CloudManage.aspx?DownUrl=" + escape(Url) + "&time=" + Date(), function (da) {
                alert(da);
            })
        }
        function UXml(mp, Url) {
            $.get("CloudManage.aspx?mpname=" +escape(mp) + "&time=" + Date()+"&Url="+escape(Url), function (data) {
            })
        }

        function open(path) {
            var titles = path.split('/');
            var title;
            for (var i = 0; i < titles.length; i++) {
                if (titles[i].indexOf('.') > 0)
                    title = titles[i];
            } 
            switch ('<%=Request["Type"] %>') {              
                case "file":
                    popAlert(path);
                    break;
                case "photo":
                    popAlert(path);
                    break;
                case "video":
                    NewFormd(title, "Cloud/Jwplayer/PlayM.aspx?MeUrl=" + path);
                    break;
                case "music":
                    NewFormd("音乐播放", "Cloud/Jwplayer/PlayM.aspx?MeUrl=" + path);
                    break;
                case "PF":
                    //根据后缀名来判断
                    result=checkFileType(path.split(".")[(path.split(".").length-1)]);
                    switch(result)
                    {
                        case 1:
                            parent.popAlert(path+"&Type=PF");
                            break;
                        case 2:
                            parent.NewFormd("音乐播放", "Cloud/Jwplayer/PlayM.aspx?MeUrl=" + path+"&Type=PF");
                            break;
                    }
                    break;
            }
        }
        function checkFileType(ex)//后缀名
        {
            var imgArr=["jpg","gif","png","bmp","txt"];
            var video=["mp3","wma","wmv","avi","mp4","f4v","m4v","rmvb","rm","flv","wm","ram","asf","wmv"];
            for (var i = 0; i < imgArr.length; i++) {
                if(imgArr[i]==ex)
                    return 1;
            }
            for (var i = 0; i < video.length; i++) {
                if(video[i]==ex)
                    return 2;
            }
        }
    </script>
    <script type="text/javascript">

        function popAlert(str) {
            //width="' + $(window).width() + '"
            $('<div id="popalert">' + '<iframe id="picture" name="picture" marginwidth="0" marginheight="0" frameborder="0" scrolling="no"  src="/user/Cloud/ShowPhoto.aspx?Dir=' + str + '\" width="100%" height="100%"></iframe>' + '</div>').appendTo('body');
            var _popalert = $('#popalert');
            _popalert.css({
                position: 'absolute',
                height: ($(window).height() + $('body').scrollTop()) + 'px',
                width: ($(window).width()) + 'px',
                left: '0px',
                top: '0px'
            });
        }
        //窗口自适应
        window.onresize = function () {
            $('#popalert').css({
                position: 'absolute',
                height: ($(window).height()) + 'px',
                width: ($(window).width()) + 'px',
                left: '0px',
                top: '0px'
            });
        }
        //关闭浏览图片
        function close() {
            $('#popalert').remove();
        }
        //关闭弹出层
        function closeNewFile() {
            //alert(8);
            $('.aui_focus').remove();
            $('#back').remove();

        }
        //弹出层
        function NewFormd(title, content) {
            //alert(title);
            if ($("iframe").eq(2).html() == null) {
                $(".aui_title").html(title);
                art.dialog.data('homeDemoPath', './_doc/');
                if (title == "新建文件夹") {
                    art.dialog.open(content, { title: title, width: "360" }, true);
                    $("iframe").eq(2).css({ "width": "360px", "height": "200px" });
                } else if (title == "文件上传") {
                    art.dialog.open(content, { title: title, width: "360" }, true);
                    $("iframe").eq(2).css({ "height": "180px", "width": "360px" });
                } else if (title == "音乐播放") {
                    art.dialog.open(content, { title: title, width: "300" }, true);
                    $("iframe").eq(2).css({ "width": "300px", "height": "405px" });
                    $('#back').remove();
                } else {
                    art.dialog.open(content, { title: title, width: "400" }, true);
                    $("iframe").eq(2).css({ "width": "400px", "height": "300px" });
                }
            } else {
                $("iframe").eq(2).attr("src", $("iframe").eq(2).attr("src"));
            }
        } 
    </script>
</asp:Content>
 