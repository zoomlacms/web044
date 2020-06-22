﻿<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_PreViewOrder, App_Web_fmruwczc" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>购物订单管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="u_ban page_ban">
        <div class="container">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 u_ban_l text-center">
            <i class="glyphicon glyphicon-shopping-cart"></i>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 u_ban_r"  >
            <ul class="list-unstyled text-center">
            <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/Order/PreViewOrder.aspx?menu=Orderinfo"><i class="glyphicon glyphicon-shopping-cart"></i><br/>我的订单</a></li>
            <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/GroupList.aspx?start=true"><i class="fa fa-users"></i><br/>我的团定</a></li>
            <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/BossInfo/NodeTree.aspx"><i class="glyphicon glyphicon-plus-sign"></i><br/>我的加盟商</a></li>
            <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="/User/Info/DredgeVip.aspx"><i class="fa fa-star-half-empty"></i><br/>VIP卡管理</a></li>
            <div class="clearfix"></div>
            </ul>
            </div> 
        </div> 
    </div>
    <div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/UserShop/ProductList.aspx">我的店铺</a></li>
        <li class="active">购物订单管理</li>
    </ol>
    </div>
    <div class="container">
    <div runat="server" id="Login" class="us_seta" visible="false">
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <td colspan="2" class="text-center"><font color="red">本页需支付密码才能登入请输入支付密码</font></td>
            </tr>
            <tr>
                <td style="width: 50%;" class="text-right">
                    <asp:TextBox ID="Second" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:Button ID="sure" runat="server" Text="确定" OnClick="sure_Click" />
                </td>
            </tr>
        </table>
    </div>
    </div>
    <div class="container">
    <div runat="server" id="DV_show">
        <div class="btn-group">
            <a href="PreViewOrder.aspx?menu=Cartinfo" class="btn btn-primary">购物车管理</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo" class="btn btn-primary">订单管理</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=1" class="btn btn-primary">已确定的订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=2" class="btn btn-primary">已发货订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=3" class="btn btn-primary">正常订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=4" class="btn btn-primary">成交订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=5" class="btn btn-primary">回收站</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=1&panel=1" class="btn btn-primary">代购历史订单</a>
            <a href="MyAuctionList.aspx" class="btn btn-primary">竞拍记录</a>
            <a href="HotelOrder.aspx?menu=Cartinfo" class="btn btn-primary">酒店订单</a>
            <a href="FeightOrder.aspx?menu=Cartinfo" class="btn btn-primary">机票订单</a>
            <a href="TripOrder.aspx?menu=Cartinfo" class="btn btn-primary">旅游订单</a>
            <a class="btn btn-primary" href="/User/Info/UserRecei.aspx">收货地址</a>
        </div>
        <div class="us_topinfo" style="margin-top: 10px;">
            <input type="text" class="form-control" id="orderNum" style="color: #666; width: 200px;" placeholder="快递100物流订单跟踪查询" />
            <script type="text/javascript">
                function disED(url)
                {
                
                    $("#queryIF").show().attr("src",url);//attr("display","")
                    easyDialog.open({
                        container  : 'cotainer',
                        fixed : false,
                        overlay :true
                    });//Dialog end;
                }
            
                $("#orderNum").bind('keydown', function (e) {
                    if (e.which == 13) {
                        e.preventDefault();
                        $.ajax({
                            type:"post",
                            url:"PreViewOrder.aspx",
                            data:{Num:$("#orderNum").val()},
                            success:function(data)
                            {
                                if(data==-1)
                                {
                                    alert("无此订单，请重新核对");
                                }
                                else
                                {
                                    var url="http://api.kuaidi100.com/api?id="+data+"&com=<%=Company %>&nu=<%=txtlabel11 %>&show=2&muti=1";
                                    disED(url);
                                }
                            },
                            error:function(xhr,status,errMsg)
                            {alert("查询失败");}
                        });//AJAX end;
                    }//e.witch==13
                });//bind end;
            </script>
            <span style="float: right">
                <input id="Button11" runat="server" onclick="location.href='/user/iServer/FiServer.aspx?menu=OrderType'" type="button" value="服务记录" style="display: none" />
            </span>
        </div>
        <div>
            <table class="table table-striped table-bordered" style="margin-bottom: 0;">
                <tr>
                    <td class="text-center">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Orderlist" runat="server" Visible="false">
                <table class="table table-striped table-bordered">
                    <tr>
                        <td style="text-align:center;" class="td_x"><input type="checkbox" id="chkall"/></td>
                        <td style="text-align: center;">订单编号</td>
                        <td style="text-align: center;">客户名称</td>
                        <td style=" text-align: center;">下单时间</td>
                        <td style=" text-align: center;">订单金额</td>
                        <td style=" text-align: center;">实际金额</td>
                        <td style=" text-align: center;">需要发票</td>
                        <td style=" text-align: center;">已开发票</td>
                        <td style=" text-align: center;">订单状态</td>
                        <td style=" text-align: center;">付款状态</td>
                        <td style=" text-align: center;">物流状态</td>
                        <td style=" text-align: center;">操作</td>
                    </tr>
                    <ZL:ExRepeater runat="server" ID="Order_RPT" OnItemDataBound="Order_RPT_ItemDataBound" OnItemCommand="Order_RPT_ItemCommand" PagePre="<tr><td colspan='13' style='text-align:center;vertical-align:middle;'>" PageEnd="</td></tr>" PageSize="10">
                        <ItemTemplate>
                            <tr>
                                <td style="text-align: center;">
                                    <input type="checkbox" name="idchk" value="<%#Eval("id") %>" /></td>
                                <td style="text-align: center; white-space: nowrap; overflow: hidden">
                                    <a href="OrderProList.aspx?OrderNo=<%#Eval("OrderNo")%>"><%#Eval("OrderNo")%></a></td>
                                <td style="text-align: center;">
                                    <%#Eval("Reuser") %></td>
                                <td style="text-align: center; white-space: nowrap; overflow: hidden">
                                    <%#Eval("AddTime") %>
                                </td>
                                <td style="text-align: center;">
                                    <%#formatcc(DataBinder.Eval(Container, "DataItem.Ordersamount", "{0:N2}"))%>
                                </td>
                                <td class="text-center">
                                    <%#getshijiage(Eval("id", "{0}"))%></td>
                                <td style="text-align: center;">
                                    <%#fapiao(DataBinder.Eval(Container, "DataItem.Invoiceneeds", "{0}"))%></td>
                                <td style="text-align: center;">
                                    <%#fapiao(DataBinder.Eval(Container, "DataItem.Developedvotes","{0}")) %></td>
                                <td style="text-align: center;">
                                    <%#formatzt(DataBinder.Eval(Container, "DataItem.OrderStatus", "{0}"),"0")%>
                                    <%#GetReturnStr() %>
                                    <input type="hidden" class="returnmsg_hid" value="<%#Eval("Guojia") %>" />
                                </td>
                                <td style="text-align: center;">
                                    <%#formatzt(DataBinder.Eval(Container, "DataItem.Paymentstatus", "{0}"),"1")%></td>
                                <td style="text-align: center;">
                                    <%#formatzt(DataBinder.Eval(Container, "DataItem.StateLogistics", "{0}"),"2")%></td>
                                <td class="text-center">
                                    <asp:LinkButton ID="CancelRe_L" runat="server" CommandName="cancel" CommandArgument='<%#Eval("ID") %>'>取消退款</asp:LinkButton>
                                    <%#GetOP() %>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate></FooterTemplate>
                    </ZL:ExRepeater>
                </table>
                <asp:Button runat="server" ID="BatDel_Btn"  Text="批量删除" OnClick="BatDel_Btn_Click" OnClientClick="return DelConfirm();"  CssClass="btn btn-primary"  Visible="false"/>
                <asp:Button runat="server" ID="Recoverty_Btn" Text="恢复订单" OnClick="Recoverty_Btn_Click" OnClientClick="return DelConfirm();"  CssClass="btn btn-primary"  Visible="false"/>
                <asp:Button runat="server" ID="BatDel2_Btn" Text="永久删除" OnClick="BatDel2_Btn_Click" OnClientClick="return DelConfirm();" CssClass="btn btn-primary" Visible="false"/>
            </asp:Panel>
            <asp:Panel ID="Panel1" runat="server" Width="100%" Visible="false">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <td id="Li1" style="text-align: center;">订单编号 </td>
                        <td style="text-align: center;">客户名称 </td>
                        <td style="text-align: center;">下单时间 </td>
                        <td style="text-align: center;">订单金额 </td>
                        <td style="text-align: center;">实际金额 </td>
                        <td style="text-align: center;">订单状态 </td>
                        <td style="text-align: center;">付款状态 </td>
                        <td style="text-align: center;">物流状态 </td>
                        <td style="text-align: center;">其他金额 </td>
                        <td style="text-align: center;">操作 </td>
                    </tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td id="1" style="text-align: left; white-space: nowrap; overflow: hidden"><a href="?menu=ViewOrderlist&tp=Pre&id=<%#Eval("id") %>&">
                                    <%#Eval("OrderNo")%></a> </td>
                                <td style="text-align: center;">
                                    <%#Eval("Reuser") %>
                                </td>
                                <td style="text-align: center; white-space: nowrap; overflow: hidden">
                                    <%#Eval("AddTime") %>
                                </td>
                                <td style="text-align: center;">
                                    <%#formatcc( DataBinder.Eval(Container, "DataItem.Ordersamount", "{0:N2}"))%>
                                </td>
                                <td style="text-align: center;">
                                    <%#getshijiage(Eval("id", "{0}"))%>
                                </td>
                                <td style="text-align: center;">
                                    <%#formatzt(DataBinder.Eval(Container, "DataItem.OrderStatus", "{0}"),"0")%>
                                </td>
                                <td style="text-align: center;">
                                    <%#formatzt(DataBinder.Eval(Container, "DataItem.Paymentstatus", "{0}"),"1")%>
                                </td>
                                <td style="text-align: center;">
                                    <%#formatzt(DataBinder.Eval(Container, "DataItem.StateLogistics", "{0}"),"2")%>
                                </td>
                                <td style="text-align: center;">
                                    <%#ChkExtra(Eval("OrderNo").ToString(), Eval("id").ToString())%>
                                </td>
                                <td style="text-align: center;">
                                    <%#getbotton(Eval("id","{0}")) %>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr>
                        <td colspan="10" class="text-center">共
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            条记录
                            <asp:Label ID="Label3" runat="server" Text="" />
                            <asp:Label ID="Label4" runat="server" Text="" />
                            <asp:Label ID="Label5" runat="server" Text="" />
                            <asp:Label ID="Label6" runat="server" Text="" />
                            页次：
                            <asp:Label ID="Label7" runat="server" Text="" />
                            /
                            <asp:Label ID="Label8" runat="server" Text="" />
                            页
                            <asp:TextBox ID="txtpages" runat="server" Width="25px" AutoPostBack="True" OnTextChanged="txtpages_TextChanged"></asp:TextBox>
                            条记录/页 转到第
                            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                            页
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <td style="text-align: center;">商品名称</td>
                        <td style="text-align: center;">来源</td>
                        <td style="text-align: center;">单价</td>
                        <td style="text-align: center;">数量</td>
                        <td style="text-align: center;">备注</td>
                        <td style="text-align: center;">操作</td>
                    </tr>
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 24.6%; text-align: center; white-space: nowrap; overflow: hidden"><a href='../shop.aspx?ItemID=<%#Eval("ProID") %>' target='_blank'>
                                    <%#Gettypes(Eval("ProID","{0}"))%><%#DataBinder.Eval(Container, "DataItem.proname", "{0}")%>
                                </a></td>
                                <td style="width: 13.6%; text-align: center">
                                    <%#Eval("ProSeller")%>
                                </td>
                                <td style="width: 16.6%; text-align: center">
                                    <%#GetPrice(Eval("id","{0}"),Eval("Shijia","{0}"))%>
                                </td>
                                <td style="width: 13.6%; text-align: center">
                                    <%#Eval("Pronum")%>
                                </td>
                                <td style="width: 13.6%; text-align: center">
                                    <%#Eval("Proinfo")%>
                                </td>
                                <td style="width: 16.6%; text-align: center">
                                    <%# getAction(Eval("id").ToString())%>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr>
                        <td colspan="2" style="text-align: center">合计：<asp:Label ID="preojiage" runat="server" Text=""></asp:Label>元 
                        </td>
                        <td style="text-align: center">运费：<asp:Label ID="preoyunfei" runat="server" Text=""></asp:Label>元
                        </td>
                        <td style="text-align: center">实际金额：<asp:Label ID="preojiages" runat="server" Text=""></asp:Label>+<asp:Label ID="precyunfei" runat="server" Text=""></asp:Label>=<asp:Label ID="preorderallpromoney" runat="server" Text=""></asp:Label>元
                        </td>
                        <td style="text-align: center">已付款：<asp:Label ID="prelabelmoney" runat="server" Text=""></asp:Label>元
                        </td>
                        <td style="text-align: center">快递单号：<asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="text-center">
                            <asp:Button ID="Button3" OnClientClick="javascript:history.go(-1);return false;" runat="server" Text="返回" CssClass="btn btn-primary" />
                            <asp:Button ID="Button6" runat="server" Text="在线支付" OnClientClick="return confirm('确定支付?')" OnClick="Button6_Click" CssClass="btn btn-primary" />
                            <asp:Button ID="btnANewbuys" runat="server" Text="重新购买" Visible="false" OnClick="btnANewbuys_Click" CssClass="btn btn-primary" />
                            <input id="Button5" onclick="window.open('PreViewOrder.aspx?menu=rebuys&id=<%=sid %>    ');" type="button" value="重新购买" class="btn btn-primary" />
                            <input id="Button10" onclick="location.href='/user/iServer/FiServer.aspx?OrderID=<%=sid %>    ';" type="button" value="提交问题" class="btn btn-primary" />
                        </td>
                    </tr>
                </table>
                <ul>
                </ul>

                <ul>
                    <li style="text-align: left;"></li>
                    <li style="text-align: left;">运费：
                    
                    </li>
                    <li style="text-align: left;">+
                    
                        ＝
                    
                    </li>
                    <li style="text-align: left;"></li>
                    <li style="text-align: left;"></li>
                </ul>
                <ul>
                    <li style="text-align: center;"></li>
                </ul>
            </asp:Panel>
            <asp:Panel ID="Cartinfo" runat="server" Width="100%" Visible="false">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <td></td>
                        <td style="text-align: center;">购物车ID </td>
                        <td style="text-align: center;">客户名称 </td>
                        <td style="text-align: center;">下单时间 </td>
                        <td style="text-align: center;">数量 </td>
                        <td style="text-align: center;">金额 </td>
                        <td style="text-align: center;">操作 </td>
                    </tr>
                    <asp:Repeater ID="Carttable" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="text-align: center; white-space: nowrap; overflow: hidden">
                                    <input type="checkbox" name="idchk" value="<%#Eval("id")%>" />
                                </td>
                                <td style="text-align: center; white-space: nowrap; overflow: hidden">
                                    <a href="OrderProList.aspx?OrderNo=<%#Eval("Cartid")%>&SType=1"><%#Eval("Cartid")%></a></td>
                                </td>
                                <td style="text-align: center">
                                    <%#Eval("Username")%>
                                </td>
                                <td style="text-align: center">
                                    <%#Eval("Addtime")%>
                                </td>
                                <td style="text-align: center">
                                    <%#Eval("Pronum")%>
                                </td>
                                <td style="text-align: center">
                                    <%#formatcc(DataBinder.Eval(Container, "DataItem.AllMoney", "{0}"))%>
                                </td>
                                <td style="text-align: center"> 
                                    <a href="OrderProList.aspx?OrderNo=<%#Eval("Cartid")%>&SType=1" class="option_style" title="查看"><i class="fa fa-eye"></i></a>
									<a href="?menu=delcart&id=<%#Eval("id") %>" class="option_style" title="删除" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"><i class="fa fa-trash"></i></a>
                                    <a href="?menu=actcart&id=<%#Eval("id") %>" class="option_style"><i class="fa fa-check"></i>提交订单</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr>
                        <td class="text-center"><input type="checkbox" id="chkAll" onclick="ChkAll(this)" /></td>
                        <td colspan="6" class="text-center">共
                            <asp:Label ID="Allnum1" runat="server" Text=""></asp:Label>
                            条记录
                            <asp:Label ID="Toppage1" runat="server" Text="" />
                            <asp:Label ID="Nextpage1" runat="server" Text="" />
                            <asp:Label ID="Downpage1" runat="server" Text="" />
                            <asp:Label ID="Endpage1" runat="server" Text="" />
                            页次：
                            <asp:Label ID="Nowpage1" runat="server" Text="" />
                            /
                            <asp:Label ID="PageSize1" runat="server" Text="" />
                            页
                            <asp:TextBox ID="txtpage2" runat="server" Width="25px" AutoPostBack="True" OnTextChanged="txtpage2_TextChanged"></asp:TextBox>
                            条记录/页 转到第
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                            </asp:DropDownList>
                            页
                        </td>
                    </tr>
                </table>
                <asp:Button ID="Dels" runat="server" CssClass="btn btn-primary" Text="批量删除" OnClick="Dels_Click" />
            </asp:Panel>
            <asp:Panel ID="ViewCartpro" runat="server" Visible="true">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <td style="text-align: center;">商品名称 </td>
                        <td style="text-align: center;">单位 </td>
                        <td style="text-align: center;">数量 </td>
                        <td style="text-align: center;">销售类型 </td>
                        <td style="text-align: center;">市场价 </td>
                        <td style="text-align: center;">相关操作 </td>
                    </tr>
                    <asp:Repeater ID="cartproinfo" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="text-align: center; white-space: nowrap; overflow: hidden">
                                    <%#DataBinder.Eval(Container, "DataItem.proname", "{0}")%>
                                </td>
                                <td style="text-align: center">
                                    <%# Eval("Danwei").ToString() == "" ? "空" : Eval("Danwei")%>
                                </td>
                                <td style="text-align: center">
                                    <%#Eval("pronum") %>
                                </td>
                                <td style="text-align: center">
                                    <%#formatnewstype(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%>
                                </td>
                                <td style="text-align: center">
                                    <%#getjiage(Eval("proclass","{0}"),"1",DataBinder.Eval(Container, "DataItem.proid", "{0}"))%>
                                </td>
                                <td style="text-align: center">
                                    <a href="?menu=delcartpro&id=<%#Eval("id") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" class="option_style" title="删除"><i class="fa fa-trash"></i></a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr>
                        <td colspan="6" class="text-center">
                            <asp:Button ID="Button2" OnClientClick="javascript:history.go(-1);return false;" CssClass="btn btn-primary" runat="server" Text="返回" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <%--以下为代购列表显示--%>
            <asp:Panel ID="OrderProlist" runat="server" Width="100%">
                <table class="table table-striped table-bordered table-hover" style="margin-bottom:0;">
                    <tr>
                        <td style="text-align: center;">商品名称</td>
                        <td style="text-align: center;">单位</td>
                        <td style="text-align: center;">数量</td>
                        <td style="text-align: center;">销售类型</td>
                        <td style="text-align: center;">市场价</td>
                        <td style="text-align: center;">金额</td>
                    </tr>
                </table>
                <div runat="server" id="userorderproview" visible="false">
                    <table class="table table-striped table-bordered table-hover">
                        <asp:Repeater ID="userrep" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="text-align: center; white-space: nowrap; overflow: hidden">
                                        <a href='../Store/StoreContent.aspx?itemid=<%#Eval("ProID") %>&ID=<%#GetUserShopID() %>' target='_blank'>
                                            <%#Gettypes(Eval("ProID","{0}"))%><%#DataBinder.Eval(Container, "DataItem.proname", "{0}")%>
                                        </a>
                                    </td>
                                    <td style="text-align: center">
                                        <%#Eval("Danwei") == "" ? "空" : Eval("Danwei")%>
                                    </td>
                                    <td style="text-align: center">
                                        <%#Eval("pronum") %>
                                    </td>
                                    <td style="text-align: center">
                                        <%#formatnewstype(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%>
                                    </td>
                                    <td style="width: 13.6%; text-align: center">
                                        <%#getjiage(Eval("proclass", "{0}"), "1", DataBinder.Eval(Container, "DataItem.proid", "{0}"))%>
                                    </td>
                                    <td style="text-align: center">
                                        <%#getprojia(Eval("proclass", "{0}"), DataBinder.Eval(Container, "DataItem.ID", "{0}"))%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>
                            <td style="text-align: left;">合计：<asp:Label ID="ojiage01" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="text-align: left;">运费：<asp:Label ID="oyunfei01" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="text-align: left;">包装费：<asp:Label ID="lblpack" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="text-align: left;">实际金额：<asp:Label ID="ojiages01" runat="server" Text=""></asp:Label>
                                +
                                <asp:Label ID="cyunfei01" runat="server" Text=""></asp:Label>
                                +
                                <asp:Label ID="pack01" runat="server" Text=""></asp:Label>
                                ＝
                                <asp:Label ID="orderallpromoney01" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="text-align: left;">已付款：<asp:Label ID="labelmoney01" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="text-align: left;">快递单号：<asp:Label ID="label9" runat="server" Text=""></asp:Label><br />
                                <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="ULB_Track" Text="查看快递详细信息>>" Visible="false" OnClick="ULB_Track_Click"></asp:LinkButton>
                            </td>
                        </tr>
                        <tr id="UOrders" visible="false" runat="server">
                            <td colspan="6" class="text-center">
                                <iframe src="http://api.kuaidi100.com/api?id=<%=KDKey %>&com=<%=Company %>&nu=<%=txtlabel11 %>&show=2&muti=1" width='550' height='310' scrolling='no' frameborder='0'></iframe>
                            </td>
                        </tr>
                        <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
                        <tr>
                            <td colspan="6">
                                <asp:Button ID="Button8" OnClientClick="javascript:history.go(-1);return false;" runat="server" Text="返回" CssClass="btn btn-primary" />
                                <input id="Button14" onclick="<%="window.open('PreViewOrder.aspx?menu=rebuy&id="+sid+"&type="+OrderType+"')"%>    ;" type="button" value="重新购买" class="btn btn-primary" />
                                <input id="Button15" onclick="location.href='/user/iServer/FiServer.aspx?OrderID=<%=sid %>    '" type="button" value="提交问题" class="btn btn-primary" />
                                <input id="Button13" onclick="window.open('/Store/StockOrderOver.aspx?OrderCode=<%=cardId %>    ')" type="button" value="立即支付" class="btn btn-primary" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="orderview" runat="server">
                    <%--以下输出代购产品列表实际网址--%>
                    <table class="table table-striped table-bordered table-hover">
                        <asp:Repeater ID="OrderProview" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 24.6%; text-align: center; white-space: nowrap; overflow: hidden">
                                        <a href='../shop.aspx?ID=<%#Eval("ItemID") %>' target='_blank'>
                                            <%#Gettypes(Eval("ProID","{0}"))%><%#DataBinder.Eval(Container, "DataItem.proname", "{0}")%>
                                        </a>
                                    </td>
                                    <td style="width: 13.6%; text-align: center">
                                        <%#Eval("Danwei") == "" ? "空" : Eval("Danwei")%>
                                    </td>
                                    <td style="width: 13.6%; text-align: center">
                                        <%#Eval("pronum") %>
                                    </td>
                                    <td style="width: 16.6%; text-align: center">
                                        <%#formatnewstype(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%>
                                    </td>
                                    <td style="width: 13.6%; text-align: center">
                                        <%#getjiage(Eval("proclass", "{0}"), "1", DataBinder.Eval(Container, "DataItem.proid", "{0}"))%>
                                    </td>
                                    <td style="width: 16.6%; text-align: center">
                                        <%#getprojia(Eval("proclass", "{0}"), DataBinder.Eval(Container, "DataItem.ID", "{0}"))%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>
                            <td style="text-align: left;">合计：
                        <asp:Label ID="ojiage" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="text-align: left;">运费：
                        <asp:Label ID="oyunfei" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="text-align: left;">实际金额：
                        <asp:Label ID="ojiages" runat="server" Text=""></asp:Label>
                                +
                        <asp:Label ID="cyunfei" runat="server" Text=""></asp:Label>
                                ＝
                        <asp:Label ID="orderallpromoney" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="text-align: left;">已付款：
                        <asp:Label ID="labelmoney" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="text-align: left;">快递公司：<asp:Label ID="LB_KDCompany" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="text-align: left;">快递单号：
                        <asp:Label ID="label11" runat="server" Text=""></asp:Label>
                                <asp:LinkButton runat="server" ID="LB_Track" Text="查看快递详细信息>>" Visible="false" OnClick="LB_Track_Click"></asp:LinkButton>
                            </td>
                        </tr>
                        <tr id="Orders" visible="false" runat="server">
                            <td colspan="6">
                                <iframe src="http://api.kuaidi100.com/api?id=<%=KDKey %>&com=<%=Company %>&nu=<%=txtlabel11 %>&show=2&muti=1" width='550' height='310' scrolling='no' frameborder='0'></iframe>
                            </td>
                        </tr>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        <tr>
                            <td colspan="6" class="text-center">
                                <asp:Button ID="Button1" OnClientClick="javascript:history.go(-1);return false;" runat="server" Text="返回" CssClass="btn btn-primary" />
                                <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="在线支付" OnClientClick="return confirm('确定支付?')" CssClass="btn btn-primary" />
                                <asp:Button ID="Button12" runat="server" OnClick="UserPurseBTN_Click" Text="余额支付" OnClientClick="return confirm('确定支付?')" CssClass="btn btn-primary" />
                                <asp:Button ID="btnANewBuy" runat="server" OnClick="btnANewBuy_Click" Text="重新购买" Visible="false" CssClass=" btn btn-primary" />
                                <input id="Button4" onclick="window.open('PreViewOrder.aspx?menu=rebuy&amp;id=<%=sid %>    ');" type="button" value="重新购买" class="btn btn-primary" />
                                <input id="Button9" onclick="location.href='/user/iServer/FiServer.aspx?OrderID=<%=sid %>    '" type="button" value="提交问题" class="btn btn-primary" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </div>
        <asp:HiddenField ID="orderID" runat="server" />
    </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <link type="text/css" href="/Plugins/JqueryUI/EasyDialog/easydialog.css" rel="stylesheet" />
    <script type="text/javascript" src="/Plugins/JqueryUI/EasyDialog/easydialog.min.js"></script>
    <script type="text/javascript">
        function openWin(obj) 
        {
            window.showModelessDialog("Shopfee/PayWindow.aspx?sid=" + obj + "", "", "dialogHeight:450px;dialogWidth:600px;status:no;scroll:no");
        }
        $().ready(function(){
            $("#chkall").click(function(){
                $("input[name=idchk]").each(function(){this.checked=$("#chkall")[0].checked;});});
        });
        function ChkAll(data){
            $("[name=idchk]").each(function(i,d){
                d.checked=data.checked;
            });
        }
        function DelConfirm()
        {
            if($("input[name=idchk]:checked").length>0)
            {
                return confirm('你确定要操作所选订单吗!!');
            }
            else {alert("请先选择订单");return false;}
        }
        var diag=new ZL_Dialog();
        function ShowDrawBack(oid)
        {
            diag.maxbtn=false;
            diag.title="申请退款";
            diag.url="/User/Order/DrawBack.aspx?id="+oid;
            diag.ShowModal();
        }
        var tempdiag=new ZL_Dialog();
        //拒绝退款理由
        function ShowReturn(obj){
            var $td=$(obj).closest("td");
            $('body').append("<div id='ReturnDiag' style='display:none;'><p>" + $td.find('.returnmsg_hid').val() + "</p></div>");
            tempdiag.title="拒绝退款理由";
            tempdiag.body="";
            tempdiag.content="ReturnDiag";
            tempdiag.reload=true;
            tempdiag.ShowModal();
        }
        function SureRece(oid)
        {
            if(!confirm("确定要确认收货吗?")){return false;}
            else
            {
                $("#OPOid_Hid").val(oid);
                $("#SureRece_Btn").click();
            }
        }
    </script>
    <asp:HiddenField runat="server" ID="OPOid_Hid" />
    <asp:Button runat="server" ID="SureRece_Btn" OnClick="SureRece_Btn_Click" style="display:none;" />
</asp:Content>
