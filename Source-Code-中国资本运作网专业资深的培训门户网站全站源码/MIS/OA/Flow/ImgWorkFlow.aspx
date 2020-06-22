<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_ImgWorkFlow, App_Web_sz0ss0uh" masterpagefile="~/User/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>查看流程图</title>
<style>
#myDiagram{height:400px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="myDiagram">
    </div>
    <asp:HiddenField ID="ImgData_Hid" runat="server" />
    <script src="/Plugins/Third/go/go.js" type="text/javascript"></script>
    <script>
            var makes = {};
            $().ready(function () {
                makes = go.GraphObject.make;
                myDiagram = makes(go.Diagram, "myDiagram",  // must name or refer to the DIV HTML element
                            {
                                initialContentAlignment: go.Spot.Center,
                                allowDrop: true,  // must be true to accept drops from the Palette
                                "LinkDrawn": showLinkLabel,  // this DiagramEvent listener is defined below
                                "LinkRelinked": showLinkLabel,
                                "animationManager.duration": 800, // slightly longer than default (600ms) animation
                                "undoManager.isEnabled": true  // enable undo & redo
                            });

                // when the document is modified, add a "*" to the title and enable the "Save" button
                myDiagram.addDiagramListener("Modified", function (e) {
                    var button = document.getElementById("SaveButton");
                    if (button) button.disabled = !myDiagram.isModified;
                    var idx = document.title.indexOf("*");
                    if (myDiagram.isModified) {
                        if (idx < 0) document.title += "*";
                    } else {
                        if (idx >= 0) document.title = document.title.substr(0, idx);
                    }
                });
                // define the Node templates for regular nodes
                var lightText = 'whitesmoke';

                myDiagram.nodeTemplateMap.add("",  // the default category
                  makes(go.Node, "Spot", nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    makes(go.Panel, "Auto",
                      makes(go.Shape, "Rectangle",
                        { fill: "#00A9C9", stroke: null },
                        new go.Binding("figure", "figure")),
                      makes(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text", "text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                  ));

                myDiagram.nodeTemplateMap.add("Start",
                  makes(go.Node, "Spot", nodeStyle(),
                    makes(go.Panel, "Auto",
                      makes(go.Shape, "Circle",
                        { minSize: new go.Size(40, 60), fill: "#79C900", stroke: null }),
                      makes(go.TextBlock, "开始",
                        { margin: 5, font: "bold 11pt Helvetica, Arial, sans-serif", stroke: lightText })
                    ),
                    // three named ports, one on each side except the top, all output only:
                    makePort("L", go.Spot.Left, true, false),
                    makePort("R", go.Spot.Right, true, false),
                    makePort("B", go.Spot.Bottom, true, false)
                  ));

                myDiagram.nodeTemplateMap.add("End",
                  makes(go.Node, "Spot", nodeStyle(),
                    makes(go.Panel, "Auto",
                      makes(go.Shape, "Circle",
                        { minSize: new go.Size(40, 60), fill: "#DC3C00", stroke: null }),
                      makes(go.TextBlock, "结束",
                        { margin: 5, font: "bold 11pt Helvetica, Arial, sans-serif", stroke: lightText })
                    ),
                    // three named ports, one on each side except the bottom, all input only:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, false, true),
                    makePort("R", go.Spot.Right, false, true)
                  ));

                myDiagram.nodeTemplateMap.add("Comment",
                  makes(go.Node, "Auto", nodeStyle(),
                    makes(go.Shape, "File",
                      { fill: "#EFFAB4", stroke: null }),
                    makes(go.TextBlock,
                      {
                          margin: 5,
                          maxSize: new go.Size(200, NaN),
                          wrap: go.TextBlock.WrapFit,
                          textAlign: "center",
                          editable: true,
                          font: "bold 12pt Helvetica, Arial, sans-serif",
                          stroke: '#454545'
                      },
                      new go.Binding("text", "text").makeTwoWay())
                    // no ports, because no links are allowed to connect with a comment
                  ));

                // replace the default Link template in the linkTemplateMap
                myDiagram.linkTemplate =
                  makes(go.Link,  // the whole link panel
                    {
                        routing: go.Link.AvoidsNodes,
                        curve: go.Link.JumpOver,
                        corner: 5, toShortLength: 4,
                        relinkableFrom: true,
                        relinkableTo: true,
                        reshapable: true
                    },
                    new go.Binding("points").makeTwoWay(),
                    makes(go.Shape,  // the link path shape
                      { isPanelMain: true, stroke: "gray", strokeWidth: 2 }),
                    makes(go.Shape,  // the arrowhead
                      { toArrow: "standard", stroke: null, fill: "gray" }),
                    makes(go.Panel, "Auto",  // the link label, normally not visible
                      { visible: false, name: "LABEL", segmentIndex: 2, segmentFraction: 0.5 },
                      new go.Binding("visible", "visible").makeTwoWay(),
                      makes(go.Shape, "RoundedRectangle",  // the label shape
                        { fill: "#F8F8F8", stroke: null }),
                      makes(go.TextBlock, "Yes",  // the label
                        {
                            textAlign: "center",
                            font: "10pt helvetica, arial, sans-serif",
                            stroke: "#333333",
                            editable: true
                        },
                        new go.Binding("text", "text").makeTwoWay())
                    )
                  );
                myDiagram.toolManager.linkingTool.temporaryLink.routing = go.Link.Orthogonal;
                myDiagram.toolManager.relinkingTool.temporaryLink.routing = go.Link.Orthogonal;
                //加载json方法
                CreateImg();
            });

            //加载json方法
            function load(json) {
                myDiagram.model = go.Model.fromJson(json);
            }
            var imagedata = {};
            //生成流程图
            function CreateImg() {
                imagedata = { "class": "go.GraphLinksModel", "linkFromPortIdProperty": "fromPort", "linkToPortIdProperty": "toPort", "nodeDataArray": [], "linkDataArray": [] };//初始化流程图数据
                var datas = JSON.parse($("#ImgData_Hid").val());//流程数据源
                var proname = datas[0] ? datas[0].ProcedureName : "请为该流程添加步骤!";
                imagedata.nodeDataArray.push({ "category": "Comment", "loc": "360 -10", "text": proname, "key": -13 });
                imagedata.nodeDataArray.push({ "key": 0, "category": "Start", "loc": "175 0", "text": "用户提交" });
                var x = -150, y = 0;//初始位置
                for (var i = 0; i < datas.length; i++) {
                    if (i % 6 == 0) {//6列换一行
                        imagedata.linkDataArray.push({ "from": i, "to": i + 1, "fromPort": "B", "toPort": "T" });
                        x = -150, y += 70;//换行初始化
                    } else {
                        imagedata.linkDataArray.push({ "from": i, "to": i + 1, "fromPort": "R", "toPort": "L" });
                        x += 120
                    }
                    imagedata.nodeDataArray.push({ "key": i + 1, "loc": x + " " + y, "text": datas[i].stepName });
                }
                imagedata.nodeDataArray.push({ "key": -2, "category": "End", "loc": "175 210", "text": "结束" });
                imagedata.linkDataArray.push({ "from": datas.length, "to": -2, "fromPort": "B", "toPort": "T" });
                load(JSON.stringify(imagedata));
            }



            function showLinkLabel(e) {
                var label = e.subject.findObject("LABEL");
                if (label !== null) label.visible = (e.subject.fromNode.data.figure === "Diamond");
            }
            // Make all ports on a node visible when the mouse is over the node
            function showPorts(node, show) {
                var diagram = node.diagram;
                if (!diagram || diagram.isReadOnly || !diagram.allowLink) return;
                node.ports.each(function (port) {
                    port.stroke = (show ? "white" : null);
                });
            }
            function nodeStyle() {
                return [
                  new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
                  {
                      // the Node.location is at the center of each node
                      locationSpot: go.Spot.Center,
                      //isShadowed: true,
                      //shadowColor: "#888",
                      // handle mouse enter/leave events to show/hide the ports
                      mouseEnter: function (e, obj) { showPorts(obj.part, true); },
                      mouseLeave: function (e, obj) { showPorts(obj.part, false); }
                  }
                ];
            }
            function makePort(name, spot, output, input) {
                // the port is basically just a small circle that has a white stroke when it is made visible
                return makes(go.Shape, "Circle",
                         {
                             fill: "transparent",
                             stroke: null,  // this is changed to "white" in the showPorts function
                             desiredSize: new go.Size(8, 8),
                             alignment: spot, alignmentFocus: spot,  // align the port on the main Shape
                             portId: name,  // declare this object to be a "port"
                             fromSpot: spot, toSpot: spot,  // declare where links may connect at this port
                             fromLinkable: output, toLinkable: input,  // declare whether the user may draw links to/from here
                             cursor: "pointer"  // show a different cursor to indicate potential link point
                         });
            }
        </script>
</asp:Content>
