<%@ page language="C#" autoeventwireup="true" inherits="test_design, App_Web_11fs3in2" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html class="webkit chrome diy-design-mode">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="/JS/jquery-1.9.1.min.js"></script>
    <script src="/dist/js/bootstrap.min.js"></script>
    <link href="/dist/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/JS/Design/design.css" rel="stylesheet" />
    <style>
        .row{margin:initial;}
        a{color:inherit;}
        .dialog{width:1100px;}
        .label{font-weight:normal;padding:initial;text-align:left; line-height:initial}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="hidden">
            <asp:Button runat="server" ID="Save_Btn" OnClick="Save_Btn_Click" Style="display: none;" />
            <asp:HiddenField runat="server" ID="Head_Hid" />
            <asp:HiddenField runat="server" ID="AllHtml_Hid" />
            <input type="hidden" id="vpath_hid" />
        </div>
        <div>
            <iframe id="tlp_ifr" src="TlpShow.aspx?VPath=<%:VPath %>&Action=1" style="border: none; width: 100%; height: 900px;"></iframe>
        </div>
        <div id="sidebar-dock" class="spinner-able">
            <div class="top">
                <a class="button icon-home" href="TemplateManage.aspx" title="模板管理" onclick="return confirm('确定要返回吗模板管理吗');"></a>
                <a class="button icon-page large" title="模板" onclick="ShowDiag('TemplateList.aspx?OpenerText=vpath_hid','模板库');"></a>
                <a class="button icon-color disable" title="皮肤"></a>
                <a class="button icon-add higilight large disable" title="添加"></a>
                <a class="button icon-preview" title="预览" href="TlpShow.aspx?PreView=1&VPath=<%=VPath %>" target="_blank"></a>
                <a class="button icon-save" title="保存" onclick="SaveHtml();"></a></div>
          <%-- <div class="bottom"><span class="group group-history"><a class="button icon-undo disable"></a><a class="button icon-redo disable"></a></span><a class="button icon-help large"></a>--%>
             <div></div>
        </div>
        <div id="sidebar-panel" class="spinner-able">
            <div class="tabs"><span class="tab active"><i></i>设置</span></div>
            <div class="breadcrumbs shadow-top"><a><i data-hint="点击选中 页面 组件|bottom">页面</i></a></div>
            <div class="tabviews">
                <div class="tabview setting active">
                    <div class="panel-view body ui-scroller" data-panel-type="body" data-panel-name="body" style="left: -239px; display: none;">
                        <div class="ui-scroller-inner" style="right: -17px; padding-right: 0px;">
                            <div class="ui-scroller-body">
                                <div class="section">
                                    <h3 class="title shadow-top"><i></i>页面设置</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row">
                                                <td class="cell" style="width: 40px;"><span class="label">宽度</span></td>
                                                <td class="cell">
                                                    <div class="diy-control size has-unit"><span class="unit"></span>
                                                        <input type="text"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row background-color">
                                                <td class="cell"><span class="label">背景色</span></td>
                                                <td class="cell">
                                                    <div class="diy-control color">
                                                        <input type="text"><span class="preview blank"><i></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="cell"><span class="label">背景图</span></td>
                                                <td class="cell">
                                                    <div class="diy-control image">
                                                        <div class="preview"></div>
                                                        <div class="actions"><a class="edit" data-action="edit">编辑</a><a class="select" data-action="select">选择</a><a class="delete" data-action="delete">清除</a></div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <a class="panel-navigator shadow-top" data-panel-target-name="style" data-panel-direction="forward"><span>区块设置</span><i class="icon icon-arrow-right"></i></a></div>
                        </div>
                        <div class="ui-scroller-bar"></div>
                    </div>
                    <div class="panel-view common-style ui-scroller" data-panel-type="common" data-panel-name="style" style="left: 0px; display: block;">
                        <div class="ui-scroller-inner" style="right: -17px; padding-right: 0px;">
                           <%-- <div class="ui-scroller-body"><a class="panel-navigator shadow-top" data-panel-direction="backward"><span>区块设置</span><i class="icon icon-arrow-left" data-hint="返回"></i></a><div class="styles">--%>
                                <div class="section position">
                                    <h3 class="title shadow-top"><i></i>位置和大小</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row">
                                                <td class="cell" colspan="2">
                                                    <div class="diy-control offset"><!--margin-disabled-->
                                                        <div class="box">
                                                            <span class="handle top" data-direct="top"><i></i></span>
                                                            <span class="handle right" data-direct="right"><i></i></span>
                                                            <span class="handle bottom" data-direct="bottom"><b>外边</b><i></i></span>
                                                            <span class="handle left" data-direct="left"><i></i></span>
                                                            <span class="label margin top">auto</span>
                                                            <span class="label margin right">auto</span>
                                                            <span class="label margin bottom">auto</span>
                                                            <span class="label margin left">auto</span>
                                                            <div class="padding">
                                                                <span class="handle top" data-direct="top"><i></i></span>
                                                                <span class="handle right" data-direct="right"><i></i></span>
                                                                <span class="handle bottom" data-direct="bottom"><b>内边</b><i></i></span>
                                                                <span class="handle left" data-direct="left"><i></i></span>
                                                                <span class="label padding top disable-select">空</span>
                                                                <span class="label padding right disable-select">空</span>
                                                                <span class="label padding bottom disable-select">空</span>
                                                                <span class="label padding left disable-select">空</span>
                                                            </div>
                                                        </div>
                                                        <div class="control"><a class="action center active" style="display: none;"><i data-hint="居中"></i></a><a class="action reset"><i data-hint="清除"></i></a></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="row width-height">
                                                <td class="cell"><span class="label" style="width: 34px;">宽度</span><div class="diy-control size has-unit" style="width: 68px;"><span class="unit"></span>
                                                    <input type="text" id="width_t"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                </td>
                                                <td class="cell"><span class="label" style="width: 34px;">高度</span><div class="diy-control size has-unit" style="width: 68px;"><span class="unit"></span>
                                                    <input type="text" id="height_t"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="section background">
                                    <h3 class="title shadow-top"><i></i>背景</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row">
                                                <td class="cell">
                                                    <div class="diy-control background">
                                                        <div class="row color"><span class="label">颜色</span><div class="diy-control color">
                                                            <input type="text" id="bkcolor_t"><span class="preview blank"><i></i></span></div>
                                                        </div>
                                                        <div class="row image"><span class="label">图片</span><div class="diy-control image">
                                                            <div id="bkimg" class="preview"></div>
                                                            <div class="actions"><a class="edit" data-action="edit">编辑</a><a class="select" data-action="select" onclick="SelImg('bkimg');">选择</a><a onclick="CleanBGImg()" data-action="delete">清除</a></div>
                                                        </div>
                                                        </div>
                                                        <div class="row position"><span class="label block">定位</span><div class="preset"><a class="left-top" data-pos="left top"><i></i></a><a class="top" data-pos="top"><i></i></a><a class="right-top" data-pos="right top"><i></i></a><a class="left" data-pos="left"><i></i></a><a class="center" data-pos="center"><i></i></a><a class="right" data-pos="right"><i></i></a><a class="left-bottom" data-pos="left bottom"><i></i></a><a class="bottom" data-pos="bottom"><i></i></a><a class="right-bottom" data-pos="right bottom"><i></i></a></div>
                                                            <div class="offset">
                                                                <div class="row position-x"><span class="label"><a></a>横向</span><div class="diy-control size has-unit"><span class="unit"></span>
                                                                    <input type="text"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                                </div>
                                                                <div class="row position-y"><span class="label"><a></a>纵向</span><div class="diy-control size has-unit"><span class="unit"></span>
                                                                    <input type="text"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row repeat-fixed"><span class="label">重复</span><div id="background_repeat" class="diy-control options uncheck"><span data-bind="background-repeat" data-param="repeat" class="option disable-select background-repeat"><i data-hint="平铺"></i></span><span data-bind="background-repeat" data-param="repeat-x" class="option disable-select background-repeat-x"><i data-hint="横向平铺"></i></span><span data-bind="background-repeat" data-param="repeat-y" class="option disable-select background-repeat-y"><i data-hint="纵向平铺"></i></span><span data-bind="background-repeat" data-param="no-repeat" class="option disable-select background-no-repeat"><i data-hint="不平铺"></i></span></div>
                                                            <span class="label">固定</span><div class="diy-control options uncheck"><span class="option disable-select background-attachment-fixed"><i data-hint="开启"></i></span><span class="option disable-select background-attachment-scroll"><i data-hint="关闭"></i></span></div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="section border">
                                    <h3 class="title shadow-top"><i></i>边框</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row">
                                                <td class="cell">
                                                    <div class="diy-control border">
                                                        <div class="sides"><span class="side top" data-side="top"><i data-hint="上边框"></i></span><span class="side right" data-side="right"><i data-hint="右边框"></i></span><span class="side bottom" data-side="bottom"><i data-hint="下边框"></i></span><span class="side left" data-side="left"><i data-hint="左边框"></i></span><span class="all active" data-side="all" style="line-height:25px;">ALL</span></div>
                                                        <div class="control">
                                                            <div class="row style"><span class="label">样式</span><div class="diy-control options uncheck"><span data-bind="border" data-param="solid" class="option disable-select border-style-solid"><i data-hint="实线"></i></span><span data-bind="border" data-param="dashed" class="option disable-select border-style-dashed"><i data-hint="虚线"></i></span><span data-bind="border" data-param="dotted" class="option disable-select border-style-dotted"><i data-hint="点线"></i></span><span data-bind="border" data-param="none" class="option disable-select border-style-none"><i data-hint="无"></i></span></div>
                                                            </div>
                                                            <div class="row width"><span class="label">线宽</span><div class="diy-control size has-unit"><span class="unit"></span>
                                                                <input type="text" id="border_width_t"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                            </div>
                                                            <div class="row color"><span class="label">颜色</span><div class="diy-control color">
                                                                <input type="text" id="border_color_t"><span class="preview blank"><i></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="section text">
                                    <h3 class="title shadow-top"><i></i>文字</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row font-family">
                                                <td class="cell" colspan="2"><span class="label">字体</span>
                                                    <select class="diy-control select" id="font_family_dp" style="height: 23px; width: 180px;">
                                                        <option>请选择字体</option>
                                                        <option>Arial, Helvetica, 微软雅黑</option>
                                                        <option>Arial, Helvetica, 黑体</option>
                                                        <option>Comic Sans MS, 微软雅黑</option>
                                                        <option>Comic Sans MS, 黑体</option>
                                                        <option>Impact, 微软雅黑</option>
                                                        <option>Impact, 黑体</option>
                                                        <option>Lucida Sans Unicode, 微软雅黑</option>
                                                        <option>Lucida Sans Unicode, 黑体</option>
                                                        <option>Trebuchet MS, 微软雅黑</option>
                                                        <option>Trebuchet MS, 黑体</option>
                                                        <option>Verdana, 微软雅黑</option>
                                                        <option>Verdana, 黑体</option>
                                                        <option>Georgia, 微软雅黑</option>
                                                        <option>Georgia, 黑体</option>
                                                        <option>Palatino Linotype, 微软雅黑</option>
                                                        <option>Palatino Linotype, 黑体</option>
                                                        <option>Times New Roman, 微软雅黑</option>
                                                        <option>Times New Roman, 黑体</option>
                                                        <option>Courier New, 微软雅黑</option>
                                                        <option>Courier New, 黑体</option>
                                                        <option>Lucida Console, 微软雅黑</option>
                                                        <option>Lucida Console, 黑体</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr class="row color-size">
                                                <td class="cell"><span class="label">颜色</span><div class="diy-control color" style="width: 80px;">
                                                    <input id="color_t" type="text"><span class="preview"><i style="background-color: rgb(51, 51, 51);"></i></span></div>
                                                </td>
                                                <td class="cell"><span class="label">大小</span><div class="diy-control size has-unit" style="width: 55px;"><span class="unit"></span>
                                                    <input type="text" id="font_size_t"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row text-align-line-height">
                                                <td class="cell options"><span class="label">对齐</span><div id="text_align_div" class="diy-control options uncheck text-align" style="width: 80px;"><span data-bind="text" data-param="left" class="option disable-select text-align-left"><i data-hint="左对齐"></i></span><span data-bind="text" data-param="center" class="option disable-select text-align-center"><i data-hint="居中对齐"></i></span><span data-bind="text" data-param="right" class="option disable-select text-align-right"><i data-hint="右对齐"></i></span></div>
                                                </td>
                                                <td class="cell"><span class="label">行高</span><div class="diy-control size has-unit" style="width: 55px;"><span class="unit"></span>
                                                    <input type="text" id="line_height_t"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row font-weight">
                                                <td class="cell" colspan="2"><span class="label">厚度</span><div class="diy-control select" tabindex="0" hidefocus="true" style="width: 167px;"><i></i><span class="label disable-select">请选择</span></div>
                                                </td>
                                            </tr>
                                            <tr class="row decoration-style">
                                                <td class="cell options"><span class="label">修饰</span><div id="text_decoration_div" class="diy-control options text-decoration" style="width: 80px;"><span data-bind="text-decoration" data-param="none" class="option disable-select text-decoration-none"><i data-hint="无"></i></span><span data-bind="text-decoration" data-param="underline" class="option disable-select text-decoration-underline"><i data-hint="下划线"></i></span><span data-bind="text-decoration" data-param="line-through" class="option disable-select text-decoration-line-through"><i data-hint="删除线"></i></span></div>
                                                </td>
                                                <td class="cell options"><span class="label">样式</span><div id="font_style_div" class="diy-control options uncheck font-style" style="width: 55px;"><span data-bind="font-style" data-param="normal" class="option disable-select font-style-normal"><i data-hint="正常"></i></span><span data-bind="font-style" data-param="italic" class="option disable-select font-style-italic"><i data-hint="斜体"></i></span></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="section link">
                                    <h3 class="title shadow-top"><i></i>链接</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row">
                                                <td class="cell"><span class="label" style="width: 55px;">链接颜色</span><div class="diy-control color" style="width: 162px;">
                                                    <input type="text" id="a_color_t"><span class="preview"><i style="background-color: rgb(0, 116, 255);"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="cell options"><span class="label" style="width: 55px;">链接修饰</span><div id="a_decoration_div" class="diy-control options text-decoration" style="width: 162px;"><span data-bind="a-decoration" data-param="none" class="option disable-select text-decoration-none active"><i data-hint="无"></i></span><span data-bind="a-decoration" data-param="underline" class="option disable-select text-decoration-underline"><i data-hint="下划线"></i></span><span data-bind="a-decoration" data-param="line-through" class="option disable-select text-decoration-line-through"><i data-hint="删除线"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="cell"><span class="label" style="width: 55px;">悬停颜色</span><div class="diy-control color" style="width: 162px;">
                                                    <input type="text"><span class="preview"><i style="background-color: rgb(0, 89, 176);"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="cell options"><span class="label" style="width: 55px;">悬停修饰</span><div id="a_decoration_hover" class="diy-control options text-decoration" style="width: 162px;"><span class="option disable-select text-decoration-none"><i data-hint="无"></i></span><span class="option disable-select text-decoration-underline active"><i data-hint="下划线"></i></span><span class="option disable-select text-decoration-line-through"><i data-hint="删除线"></i></span></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            </div>
                        </div>
                        <div class="ui-scroller-bar visible" style="height: 264.025278058645px; top: 0px;"></div>
                    </div>
                </div>
<%--            </div>--%>
            <div class="overlay">
                <div class="block" style="display: none;"><i class="icon-link"></i>
                    <p>改变该引用区块会影响到<br>
                        <b>所有使用该区块的区域</b></p>
                    <p class="line"></p>
                    <p><b>双击</b>引用区块来编辑</p>
                </div>
            </div>
<%--        </div>--%>
    </form>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        var config={tlpdir:"<%=ZoomLa.Components.SiteConfig.SiteOption.TemplateDir%>"};
        $cur = null;//$()当前元素
        //根据控件数据,填充设计栏
        function EditA(obj) {
            $cur = $(obj);
            //margin与padding
            var directArr = "top,bottom,left,right".split(',');
            for (var i = 0; i < directArr.length; i++) {
                var val = ConverToInt($cur.css("margin-" + directArr[i]));
                $(".label.margin." + directArr[i]).text(val);
            }
            for (var i = 0; i < directArr.length; i++) {
                var val = ConverToInt($cur.css("padding-" + directArr[i]));
                $(".label.padding." + directArr[i]).text(val);
            }
            //-------------
            $("#width_t").val($cur.width());
            $("#height_t").val($cur.height());
            //都可以通过其取到值
            $("#bkcolor_t").val(RGBTo16($cur.css("background-color")));
            $("#bkimg_t").val($cur.css("background-image"));
            $("#border_width_t").val($cur.css("border-width"));
            $("#font_size_t").val($cur.css("font-size"));
            //对齐方式
            $("#text_align_div *").removeClass('active');
            var align=$cur.css("text-align")=="start"?"left":$cur.css("text-align");//过滤start
            align=$cur.css("text-align")=="end"?"right":align;//过滤end
            $("#text_align_div [data-param='"+align+"']").addClass('active');
            //文本样式
            $("#color_t").val(RGBTo16($cur.css('color')));
            $("#color_t").next().children().css('background-color',$cur.css('color'));
            $("#text_decoration_div *").removeClass('active');
            $("#text_decoration_div").find('.text-decoration-'+$cur.css('text-decoration')).addClass('active');
            //字体样式
            $("#font_style_div *").removeClass('active');
            $("#font_style_div").find('.font-style-'+$cur.css('font-style')).addClass('active');
            //链接属性
            $("#a_decoration_div *").removeClass('active');
            if($cur.find('a').css('color')){
                $("#a_color_t").val(RGBTo16($cur.find('a').css('color')));
                $("#a_color_t").next().children().css('background-color',$cur.find('a').css('color'));
                //链接文本样式
                $("#a_decoration_div").find('.text-decoration-'+$cur.find('a').css('text-decoration')).addClass('active');
            }
            //背景图片
            $("#background_repeat *").removeClass('active');
            $("#bkimg").css('background',$cur.css('background'));
            $("#background_repeat .background-"+$cur.css('background-repeat')).addClass('active');
            //window.getComputedStyle();
            //$("#line_height_t").val($cur.css("line-height"));
        }
        //字体,字体大小,文本对齐,边框,
        //-----------事件JS,用于绑定右边栏与控件事件
        $(function () {
            //边框线
            $(".sides>span").click(function () {
                $(this).siblings().removeClass("active");
                $(this).addClass("active");
            });
            //边框线,文字等各种选项
            //1,依据样式,2,依据data-hint(这个应该仅用于提示)
            $(".options>.option").click(function () {
                $obj=$(this);
                $obj.siblings().removeClass("active");
                $obj.addClass("active");
                //根据data-bind和根据样式来做不同的处理吧
                switch ($obj.data("bind"))
                {
                    case "border":
                        {
                            //获取边框
                            var side = $(".border .sides .active").data("side");
                            if (side == "all") { side = "border"; }
                            else { side = "border-" + side; }
                            //获取线的样式
                            var line_width = ConverToInt($("#border_width_t").val()) + "px";
                            var line_color=$("#border_color_t").val()!=""?$("#border_color_t").val():"#ddd";
                            var style = line_width + " " + $obj.data("param") + " "+line_color;
                            $cur.css(side, style);
                        }
                        break;
                    case "text"://文字左右对齐等
                        {
                            var align = $obj.data("param");
                            $cur.css("text-align", align);
                        }
                        break;
                    case "text-decoration"://文本下划线
                        var decoration=$obj.data("param");
                        $cur.css("text-decoration",decoration);
                        break;
                    case "font-style"://文字样式(斜体)
                        {
                            var style=$obj.data("param");
                            $cur.css('font-style',style);
                        }
                        break;
                    case "a-decoration"://链接下划线样式
                        {
                            var decoration=$obj.data('param');
                            $cur.find('a').css('text-decoration',decoration);
                        }
                        break;
                    case "background-repeat"://背景重复样式
                        {
                            var repeat=$obj.data('param');
                            $cur.css('background-repeat',repeat);
                        }
                        break;
                    default:
                        console.log($obj.data("bind"));
                        break;
                }
            });
            //直接绑定,用于某些较简单的事件,如文字大小等
            $("#font_size_t").change(function () {
                $cur.css("font-size", ConverToInt(this.value) + "px");
            });
            $("#font_family_dp").change(function () {
                $cur.css("font-family", $("#font_family_dp option:checked").text());
            });
            //选择颜色按钮点击事件
            $(".diy-control.color .preview").click(function(){
                $curImgText=$(this).prev();
                ShowDiag("/Common/SetColor.htm","选择颜色");
            });
            //label用于显示文字与值,handle绑定事件
            $(function () {
                $(".box>.handle[data-direct]").each(function () {
                    MouseBind_UD(this, "margin");//只用上下
                });
                $(".padding>.handle[data-direct]").each(function () {
                    MouseBind_UD(this, "padding");//只用上下
                });
            });
        })
        //清空背景样式
        function CleanBGImg(){
            $cur.css('background','none');
            $("#background_repeat *").removeClass('active');
            $("#bkimg").removeAttr('style');
        }
        var $curImgText;//当前图片字段
        function setColor(color){
            diag.CloseModal();
            $curImgText.val(color);
            $curImgText.next().children().css('background-color',color);
            switch ($curImgText.attr('id')) {
                case "color_t"://文本颜色
                    $cur.css('color',color);
                    break;
                case "a_color_t"://链接颜色
                    $cur.find('a').css('color',color);
                    break;
                case "bkcolor_t"://背景色
                    $cur.css('background-color',color);
                    $("#bkimg").css('background-color',color);
                    break;
        
            }
        }
        //-----------值获取或转换辅助方法
        function RGBTo16(rgb)
        {
            rgb = rgb.split('(')[1];
            var str =[3];
            for (var k = 0; k < 3; k++) {
                str[k] = parseInt(rgb.split(',')[k]).toString(16);//str 数组保存拆分后的数据 
            }
            var colsr = '#' + str[0] + str[1] + str[2];
            return colsr;
        }
        //默认返回1
        function ConverToInt(val, suf) {
            if (!val || val == "") { val = "1"; }
            val = val.replace(/ /g, "").replace("px", "").replace("em", "");
            val = parseInt(val);
            if (isNaN(val)) { val = 1; }
            return val;
        }
        //-----------
        var diag = new ZL_Dialog();
        function ShowDiag(url,title)
        {
            diag.maxbtn = false;
            diag.backdrop = true;
            diag.width="dialog";
            diag.url = url;//"/common/SelFiles.aspx?pval=" + JSON.stringify({ "name": name });
            diag.title =title;// "选择图片";
            diag.ShowModal();
        }
        function CloseDialog(){diag.CloseModal();}
        //选择在线图片,也可上传新的在线图片
        function SelImg(name) {
            ShowDiag("/common/SelFiles.aspx?pval=" + JSON.stringify({ "name": name }),"选择图片");
        }
        function PageCallBack(action,url,pval){
            $("#"+pval.name).css('background','url("'+url.split('|')[0]+'") center center no-repeat');
            $cur.css('background','url("'+url.split('|')[0]+'") center center no-repeat');
            diag.CloseModal();
        }
        //上下
        function MouseBind_UD(oLine, type)
        {
            oLine.onmousedown = function (e) {
                if ($cur == null) { return; }
                var disY = (e || event).clientY;
                var direct = $(oLine).data("direct");
                var $span = $(".label." + type + "." + direct);
                //oLine.top = ConverToInt($span.text());
                var initTop = ConverToInt($span.text());
                document.onmousemove = function (e) {
                    var val = initTop + ((e || event).clientY - disY);
                    $span.text(val);
                    $cur.css(type +"-"+ direct, val + "px");
                    return false
                };
                document.onmouseup = function () {
                    document.onmousemove = null;
                    document.onmouseup = null;
                    oLine.releaseCapture && oLine.releaseCapture();
                };
                oLine.setCapture && oLine.setCapture();
                return false
            };
        }
        //左右
        function MouseBind_LR(oLine) {
            oLine.onmousedown = function (e) {
                var disX = (e || event).clientX;
                oLine.left = oLine.offsetLeft;
                document.onmousemove = function (e) {
                    var val = oLine.left + ((e || event).clientX - disX);
                    var direct = $(oLine).data("direct");
                    $(".label[data-direct=" + direct + "]").text(val);
                    //将得到的值给予目标
                    return false
                };
                document.onmouseup = function () {
                    document.onmousemove = null;
                    document.onmouseup = null;
                    oLine.releaseCapture && oLine.releaseCapture()
                };
                oLine.setCapture && oLine.setCapture();
                return false
            };
        }
        //更换模板
        function Tlp_SetValByName (name,val)
        {
            location="Design.aspx?VPath="+config.tlpdir+"/"+val;
        }
        //----------保存
        function SaveHtml() {
            if (confirm("确定要保存已编辑的Html吗")) {
                var obj = $("#tlp_ifr")[0].contentWindow;
                obj.BeginSave();
                var allhtml = $("#tlp_ifr").contents().find("body")[0].outerHTML;
                $("#AllHtml_Hid").val(allhtml);
                $("#Save_Btn").click();
            }
        }
        function SaveHead(html) {
            $("#Head_Hid").val(html);
        }
        //----------define
        function define(url,callback,sett) {//modelName,callback,setting
            var scripts = document.getElementsByTagName('script');
            for (var i = 0; i < scripts.length; i++) {//是否已加载
                if (scripts[i].src.indexOf(url) > -1 && callback && (callback.constructor === Function)) {
                    //已创建script
                    if (scripts[i].className === 'loaded') {//已加载
                        callback();
                    } else {//加载中
                        onloaded(scripts[i], callback);
                    }
                    return;
                }
            }
            var script = document.createElement('script');
            script.type = "text/javascript";
            script.src = url;
            document.body.appendChild(script);
            onloaded(script, callback);
        }
        function onloaded(script, callback) {//绑定加载完的回调函数
            //var isJs = /\/.+\.js($|\?)/i.test(url) ? true : false;
            if (script.readyState) { //ie
                script.attachEvent('onreadystatechange', function () {
                    if (script.readyState == 'loaded' || script.readyState == 'complete') {
                        script.className = 'loaded';
                        callback && callback.constructor === Function && callback();
                    }
                });
            } else {
                script.addEventListener('load', function () {
                    script.className = "loaded";
                    callback && callback.constructor === Function && callback();
                }, false);
            }
        }
    </script>
</body>
</html>
