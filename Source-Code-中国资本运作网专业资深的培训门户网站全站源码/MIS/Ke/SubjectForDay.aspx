<%@ page language="C#" autoeventwireup="true" inherits="test_SubjectForDay, App_Web_m0xbzz2w" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<title runat="server" id="title_str">日程表</title>
<link type="text/css" rel="stylesheet" href="/JS/Plugs/date/bootstrap-datetimepicker.css" />
<script type="text/javascript" src="/JS/Plugs/date/bootstrap-datetimepicker.js"></script>
<style>
.navbar-nav li a{font-size:20px}
.navbar-nav li span{font-size:18px;}
.navbar-nav li .loginout_str{font-size:14px; float:left; margin-left:5px;}
.modal-header{background:none;}
#DateTable thead td{border:none; font-size:14px;}
#DateTable thead .tips{font-weight:600; font-size:28px;}
#DateTable thead span{font-size:20px;}
#DateBody tr .datas{ font-size: 0.7em;}
#DateBody tr .datas:hover{background-color:#bce8f1;}
.td_active{background-color:#ccc;}
.adddiag{width:550px;}
#Add_Table tbody td{border:none;}
#Add_Table span{line-height:30px;}
#DateBody .content{border:1px solid #999; border-left:5px solid #999; padding:5px; float:left; overflow:hidden;white-space:nowrap;text-overflow:ellipsis; cursor:pointer; }
.con_active{background-color:#ccc;}
.curdays{background-color:#46b8da}
.left{height:auto; background:rgba(255, 255, 255, 0) }

.ullist li{font-size:14px; cursor:pointer;}
.ullist li:hover{background-color:#f5f5f5;}
.ullist li .last_date{font-size:12px; color:#ccc;}
.ullist li .last_title{font-size:14px;}
.empty_div p{font-size:16px; color:#999;}

.sub_active{background-color:#ccc;}

.typediag{width:340px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <nav class="navbar navbar-default ">
      <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-7" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">我的日程</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-7">
          <ul class="nav navbar-nav">
            <li><a href="DailyPlan.aspx<%=Request.Url.Query %>"><span class="glyphicon glyphicon-calendar"></span> 月</a></li>
            <li><a href="SubjectForWeek.aspx<%=Request.Url.Query %>"><span class="fa fa-calendar"></span> 周</a></li>
            <li class="active"><a href="SubjectForDay.aspx<%=Request.Url.Query %>"><span class="fa fa-clock-o"></span> 日</a></li>
          </ul>
            <ul class="nav navbar-nav pull-right">
            <li><a class="login_out" href="/User/Logout.aspx?url=/mis/ke/DailyPlan.aspx"><span class="glyphicon glyphicon-off pull-left"></span> <span class="loginout_str">退出</span></a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div>
    </nav>
    <div class="container-fluid">
        <div class="col-md-2">
            <div class="panel panel-default">
            <div class="panel-heading">日程列表 <span class="pull-right"><a href="javascript:;" title="添加日程" onclick="ShowTypeDiag()"><span class="glyphicon glyphicon-plus"></span></a></span></div>
              <ul class="list-group ullist" id="sublist">
                <asp:Repeater ID="SubList_RPT" OnItemCommand="SubList_RPT_ItemCommand" runat="server">
                    <ItemTemplate>
                        <li class="list-group-item" data-uid="<%#Eval("MID") %>" data-type="<%#Eval("ID") %>"><%#GetSubName() %>
                            <span class="pull-right">
                                <a href="javascript:;" title="修改" onclick="event.stopPropagation();ShowEditType(<%#Eval("ID") %>,'<%#Eval("Title") %>')"><span class="glyphicon glyphicon-pencil"></span></a>
                                <asp:LinkButton runat="server" CommandName="DelType" OnClientClick="event.stopPropagation(); return confirm('确认删除该日程吗?')" CommandArgument='<%#Eval("ID") %>'><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                            </span>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
              </ul>
                <div class="panel-body empty_div" runat="server" visible="false" id="EmptySub_Div">
                    <p>没有相关日程!</p>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <table class="table table-bordered" id="DateTable">
                <thead id="DateTitle" runat="server">
                    <tr>
                        <td class="text-center td_m"><asp:LinkButton runat="server" CssClass="btn btn-primary" OnClick="PreDay_Btn_Click"><i class="glyphicon glyphicon-chevron-left"></i></asp:LinkButton></td>
                        <asp:Literal ID="HeadTip_Li" runat="server" EnableViewState="false"></asp:Literal>
                        <td class="text-center td_m"><asp:LinkButton runat="server" CssClass="btn btn-primary" OnClick="NextDay_Btn_Click"><i class="glyphicon glyphicon-chevron-right"></i></asp:LinkButton></td>
                    </tr>
                    <tr>
                        <td></td><asp:Literal ID="HeadDate_Li" runat="server" EnableViewState="false"></asp:Literal><td></td>
                    </tr>
                </thead>
                <tbody id="DateBody" runat="server">
                    <asp:Literal ID="DayDatas_Li" runat="server" EnableViewState="false"></asp:Literal>
                </tbody>
            </table>
        </div>
        <div class="col-md-3">
            <div class="panel panel-default">
            <div class="panel-heading">最近日程</div>
              <ul class="list-group ullist" id="lastlist">
                <asp:Repeater ID="MyTop_RPT" runat="server">
                    <ItemTemplate>
                        <li class="list-group-item" data-id="<%#Eval("ID") %>"><span class="last_title"><%#Eval("Name") %></span> <span class="pull-right last_date"><%#Eval("StartDate") %></span></li>
                    </ItemTemplate>
                </asp:Repeater>
              </ul>
                <div class="panel-body empty_div" runat="server" visible="false" id="listempty_div">
                    <p>您还没有日程!</p>
                </div>
            </div>
        </div>
    </div>
    <div id="addsubject_div" style="display:none;">
    <table id="Add_Table" class="table">
      <tr>
        <td class="text-right"><span><span style="color: red; margin-left: 1em;">*</span>日程名称:</span></td>
        <td><asp:TextBox runat="server" type="text" ID="Name_T" class="form-control text_300 day_text" ></asp:TextBox></td>
      </tr>
      <tr>
        <td class="text-right"><span><span style="color: red; margin-left: 1em; text-decoration: none;">*</span>时间:</span></td>
        <td><asp:TextBox CssClass="form-control text_x day_text formdate" ID="txtBeginTime" runat="server"></asp:TextBox>
          -
          <asp:TextBox CssClass="form-control text_x day_text formdate" ID="txtEndTime" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="Req1" ValidationGroup="Add" runat="server" ErrorMessage="开始或结束时间不能为空！" ControlToValidate="txtEndTime"></asp:RequiredFieldValidator>
            <asp:HiddenField ID="StartDate_Hid" runat="server" />
            <asp:HiddenField ID="EndDate_Hid" runat="server" />
        </td>
      </tr>
     <%-- <tr>
        <td class="text-right"><span>负责人:</span></td>
        <td><input type="text" id="LeaderIDS_T" class="form-control text_300 day_text"/>
          <input type="button" value="选择" onclick="selRuser();" class="btn btn-primary" style="margin-left:5px;" />
          <asp:HiddenField runat="server" ID="LeaderIDS_Hid" /></td>
      </tr>
      <tr>
        <td class="text-right"><span>参与人:</span></td>
        <td><input type="text" id="PartTakeIDS_T" class="form-control text_300 day_text"  placeholder="选择用户名或姓名"/>
          <input type="button" value="选择" onclick="selCuser();" class="btn btn-primary" style="margin-left:5px;"/>
          <asp:HiddenField runat="server" ID="PartTakeIDS_Hid" /></td>
      </tr>--%>
      <tr>
        <td class="text-right"><span>日程描述:</span></td>
        <td><textarea class="form-control day_text" style="width: 75%; height: 8em;" name="describe" placeholder="点击此处添加日程描述"></textarea></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><asp:Button ID="Add_Btn" runat="server" Text="提交" CssClass="btn btn-primary" OnClientClick="return SetData()" OnClick="Add_Btn_Click" ValidationGroup="Add" />
          <input type="button" class="btn btn-default" onclick="ViewTaskDetail()"  data-dismiss="modal"value="取消" /></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
      </tr>
    </table>
  </div>
    <div id="addtype_div" style="display:none;">
            <div class="input-group text_300">
        <asp:HiddenField ID="TypeID_Hid" runat="server" />
            <asp:TextBox ID="Type_T" CssClass="form-control" placeholder="日程名" Text="" runat="server"></asp:TextBox>
                <span class="input-group-btn"><asp:Button ID="AddType_B" runat="server" OnClick="AddType_B_Click" Text="确定" OnClientClick="return CheckTypeData()" CssClass="btn btn-primary" /></span>
            </div>
    </div>
    <div id="taskDetail_Div" style="height: 100%; width: 610px; position: fixed; bottom: 0px; right: 0px; border-left: 1px solid #ddd; background-color: white; display: none; z-index: 1031;" onfocus="console.log('11');" onblur="console.log('22');">
<iframe id="taskDetail_if" style=" border: none; height: 100%; width: 100%; overflow:hidden;"></iframe>
</div>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        var diag = new ZL_Dialog();
        var flag=0;
        $().ready(function () {
            $("#DateBody .datas").dblclick(function () {
                diag.title = "添加日程";
                diag.width = "adddiag";
                diag.content = "addsubject_div";
                diag.ShowModal();
                $(".day_text").val('');
                var date=$(this).data('date');
                $("#txtBeginTime").val($(this).data('hour') + ':00:00');
                $("#txtEndTime").val($(this).data('hour') + ':00:00');  
                $("#StartDate_Hid").val(date);
                $("#EndDate_Hid").val(date);
                $('[name=place]').val('<%=TypeID %>');
                if(flag==0){
                    //时间控件
                    $(".formdate").datetimepicker({
                        format:"hh:ii:ss",
                        language:"zh-CN",
                        startView:"day",
                        weekStart: 1,
                        minView:'hour',
                        maxView:'decade',
                        todayBtn:1,
                        autoclose: 1,
                        initialDate:new Date()
                    }).on('changeDate',function(ev){//防止结束时间大于开始时间
                        $("#txtEndTime").datetimepicker('setStartDate',date+" "+$("#txtBeginTime").val());
                        $("#txtBeginTime").datetimepicker('setEndDate',date+" "+$("#txtEndTime").val());
                    }).on('outOfRange',function(){//当超过时间范围时
                        alert('您选择的时间格式超过范围，请重新选择!');
                    });
                    flag++;
                }
                $("#txtBeginTime").datetimepicker('setStartDate',date);
                $("#txtBeginTime").datetimepicker('setEndDate',date+" "+"23:59:59");
                $("#txtEndTime").datetimepicker('setStartDate',date+" "+$("#txtBeginTime").val());
            });
            
            //提示工具
            $("#DateBody .datas").each(function (i, v) {
                $(v).tooltip({ title: $(v).data('hour') + ':00', placement: 'left', container: 'body' });
            });
            $("#DateBody tr").hover(function () { $(this).find('td').first().addClass("td_active") }, function () { $(this).find('td').first().removeClass("td_active") });
            //最近日程点击事件
            $("#lastlist li").click(function () { ViewDetail(this,$(this).data('id')); });
            //日程列表
            var type='<%=TypeID %>',userid=<%=UserID %>;
            $("#sublist [data-uid='"+userid+"'][data-type='"+type+"']").addClass("sub_active");
            $("#sublist li").click(function(){
                window.location.href="SubjectForDay.aspx?userid="+$(this).data('uid')+"&type="+$(this).data("type");
            });
        });
        //替换开始时间与结束时间格式
        function SetData() {
            if($("#Name_T").val()==""){
                alert('日程名称不能为空!');
                return false;
            }
            if ($("#txtBeginTime").val() == "" || $("#txtEndTime").val() == "") {
                alert('开始时间或结束时间不能为空!');
                return false;
            }
            if($("[name='place']").val()==""){
                alert("日程类别不能为空!")
                return false;
            }
            $("#StartDate_Hid").val($("#StartDate_Hid").val() + " " + $("#txtBeginTime").val());
            $("#EndDate_Hid").val($("#EndDate_Hid").val() + " " + $("#txtEndTime").val());
            return true;
        }
        //修改操作
        function ViewDetail(obj,id) {
            $("#taskDetail_if").attr("src", "DailyDetail.aspx?ID=" + id);
            $("#taskDetail_Div").show();
            $(".con_active").removeClass('con_active');
            $(obj).addClass("con_active");
        }
        function HideMe() {
            $("#taskDetail_Div").fadeOut("fast");
        }

        function UpdateData(id,content){
            $(".content[data-id='"+id+"']").text(content);
            $("#lastlist [data-id='"+id+"'] .last_title").text(content);
            $("#taskDetail_Div").hide();
        }
        function DelData(id){
            $(".content[data-id='"+id+"']").remove();
            $("#lastlist [data-id='"+id+"']").remove();
            $("#taskDetail_Div").hide();
        }
        //添加日程类型
        var typediag=new ZL_Dialog();
        function ShowTypeDiag(){
            EmptyTypeDate();
            typediag.title="新建日程类型";
            typediag.content="addtype_div";
            typediag.width="typediag";
            typediag.ShowModal();
        }
        //修改日程类型
        function ShowEditType(id,title){
            EmptyTypeDate();
            typediag.title="修改日程类别";
            typediag.content="addtype_div";
            typediag.width="typediag";
            typediag.ShowModal();
            $("#Type_T").val(title);
            $("#TypeID_Hid").val(id);
            $("#AddType_B").val("修改");
            return false;
        }
        //清空编辑日程类型信息
        function EmptyTypeDate(){
            $("#Type_T").val('');
            $("#TypeID_Hid").val('');
            $("#AddType_B").val("添加");
        }
        function CheckTypeData(){
            if($("#Type_T").val()==""){
                alert("日程名称不能为空!");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
