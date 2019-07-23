<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<HTML>
<HEAD>
	<TITLE> checkbox tree的基本使用</TITLE>
	<link rel="stylesheet" href="${staticServer}/assets/zTree3.5/css/zTreeStyle/metro.css" type="text/css">
	<script type="text/javascript" src="${staticServer}/assets/zTree3.5/js/jquery.ztree.all-3.5.min.js"></script>
	<style>
		.content{
			font-size: 16px;
		}
	</style>
	<SCRIPT type="text/javascript">

		var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};

		var zNodes =[
			{ id:1, pId:0, name:"测试 1", open:true},
			{ id:11, pId:1, name:"测试 1-1", open:true},
			{ id:111, pId:11, name:"测试 1-1-1"},
			{ id:112, pId:11, name:"测试 1-1-2"},
			{ id:12, pId:1, name:"测试 1-2", open:true},
			{ id:121, pId:12, name:"测试 1-2-1"},
			{ id:122, pId:12, name:"测试 1-2-2"},
			{ id:2, pId:0, name:"测试 2", checked:true, open:true},
			{ id:21, pId:2, name:"测试 2-1"},
			{ id:22, pId:2, name:"测试 2-2", open:true},
			{ id:221, pId:22, name:"测试 2-2-1", checked:true},
			{ id:222, pId:22, name:"测试 2-2-2"},
			{ id:23, pId:2, name:"测试 2-3"}
		];
		
		var code;
		
		function setCheck() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			py = $("#py").prop("checked")? "p":"",
			sy = $("#sy").prop("checked")? "s":"",
			pn = $("#pn").is(":checked")? "p":"",
			sn = $("#sn").prop("checked")? "s":"",
			type = { "Y":py + sy, "N":pn + sn};
			zTree.setting.check.chkboxType = type;
			showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
		}
		 
		//输出日志信息，显示父子节点的关联关系
		function showCode(str) {
			if (!code) code = $("#code");
			code.empty();
			code.append(str);
		}
		

		//用于测试禁用节点和取消禁用节点（父子节点的关系默认为：{ "Y": "ps", "N": "ps" }）
		function disabledNode(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			disabled = e.data.disabled,   
			nodes = zTree.getSelectedNodes(),
			inheritParent = false, inheritChildren = false;
			if (nodes.length == 0) {
				alert("请先选择一个节点");
			}
			if (disabled) {
				inheritParent = true;
				inheritChildren = true;
			} else {
				inheritParent = true;
				inheritChildren = true;
			}

			for (var i=0, l=nodes.length; i<l; i++) {
				zTree.setChkDisabled(nodes[i], disabled, inheritParent, inheritChildren);
			}
		}
		
		
	    //获取选中的所有节点
		function getNodeValue(){
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = zTree.getCheckedNodes(true);
			var selectValue = [];
			for(var i =0;i<nodes.length;i++){
				selectValue.push(nodes[i].name);
			}
			$("#selectValue").val(selectValue.join(","));
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			
			//checkbox 父子节点的关联关系
			setCheck();
			$("#py").bind("change", setCheck);
			$("#sy").bind("change", setCheck);
			$("#pn").bind("change", setCheck);
			$("#sn").bind("change", setCheck);
			
			//checkbox禁用与取消禁用
			$("#disabledTrue").bind("click", {disabled: true}, disabledNode);
			$("#disabledFalse").bind("click", {disabled: false}, disabledNode);
		});
	
	</SCRIPT>
</HEAD>

<BODY>
<div class="page-bar">
	<ul class="page-breadcrumb">
	    <li><a href="${dynamicServer}/index.htm">首页</a> <i class="fa fa-circle"></i>
		</li>
		<li><a href="${dynamicServer}/index.htm">代码示例</a><i class="fa fa-circle"></i>
		</li>
		<li><span>checkbox tree的代码示例</span></li>
	</ul>
</div>
<div>
		<div class="row"> 
			<div class="col-xs-5 col-xs-5">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
                                 <i class="icon-directions font-green hide"></i> 
							  <span class="caption-subject font-dark">checkbox tree的代码示例</span>
                              </div>
						</div>
					</div>
					<div class="portlet-body">
					    <div class="mt-avatar" style="height:360px;">
					    	<div class="zTreeDemoBackground left">
		                         <ul id="treeDemo" class="ztree"></ul>
	                         </div>
                        </div>
					</div>
					
				</div>
			</div>
			<div class="col-xs-6 col-xs-6">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
                                 <i class="icon-directions font-green hide"></i> 
							  <span class="caption-subject font-dark uppercase">说明</span>
                              </div>
						</div>
					</div>
					<div class="portlet-body" style="height:388px; position: relative; top:-20px;">
					    <div class="mt-avatar">
					    	 <h4>1、setting 配置信息说明</h4>
								<p style="font-size: 16px;">父子关联关系：<br/>
									被勾选时：<input type="checkbox" id="py" checked /><span>关联父</span>
									<input type="checkbox" id="sy" checked /><span>关联子</span><br/>
									取消勾选时：<input type="checkbox" id="pn" checked /><span>关联父</span>
									<input type="checkbox" id="sn" checked /><span>关联子</span><br/>
									<span id="code"></span>
								 </p>
							     <h4>2、treeNode 禁用节点和取消禁用</h4>
								  <p class="content">		
									   1)[ <a id="disabledTrue" href="#" title="set checkbox to be disabled." onclick="return false;">禁用节点</a>] &nbsp;&nbsp;
								       2)[ <a id="disabledFalse" href="#" title="set checkbox to be abled." onclick="return false;">取消禁用</a> ]
								  </p>	
								  <h4>3、获取选中的节点</h4>
									  <p class="content"> 
										 选中的节点：<input id="selectValue" name="nodes" type="text"></br><br/>
										<button class="btn default" type="button" name="getNode"  onclick="getNodeValue()">获取选中的节点</button> <br/><br/>
										 完整代码示例，详见路径 [/web/src/main/webapp/WEB-INF/views/example/ztree/checkboxTree.jsp]
								      </p>
	                        </div>
                        </div>
					</div>
					
				</div>
			</div>		
		
		  <div class="row"> 
			<div class="col-xs-11 col-xs-11">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-body">
						<div class="caption" style="position: relative;">
							 <button type="button" class="btn default">
                                 <a href="async.htm" style="color:white;"><font style="color:black;">Ztree 异步加载</font></a>
                                 <span class="ladda-spinner"></span>
                             </button>
                            
                             <button type="button" style="position: relative; left:50px" class="btn default">
	                             <a href="index.htm" style="color:white;"><font style="color:black;">快速入门</font></a>
	                             <span class="ladda-spinner"></span>
                             </button> 
                             <button type="button" style="position: relative; left:100px" class="btn default">
                               <a href="diyAsync.htm" style="color:white;"><font style="color:black;">Ztree 节点异步加载</font></a>
                               <span class="ladda-spinner"></span>
                            </button>
						</div>
					</div>
				</div>
			</div>
	  </div>
   </div> 
</BODY>
</HTML>