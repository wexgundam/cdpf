<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>ztree同步加载</title>
	<link rel="stylesheet" href="${staticServer}/assets/zTree3.5/css/zTreeStyle/metro.css" type="text/css">
	<script type="text/javascript" src="${staticServer}/assets/zTree3.5/js/jquery.ztree.all-3.5.min.js"></script>
</head> 
<body>
<div class="page-bar">
	<ul class="page-breadcrumb">
	    <li><a href="${dynamicServer}/index.htm">首页</a> <i class="fa fa-circle"></i>
		</li>
		<li><a href="${dynamicServer}/index.htm">代码示例</a><i class="fa fa-circle"></i>
		</li>
		<li><span>Ztree 代码示例</span></li>
	</ul>
 </div>
<div class="row">
    <div class="portlet-body">
      <div class="tabbable-custom">
        <ul class="nav nav-tabs ">
          <li class="active">
              <a href="#tab_1" data-toggle="tab"> 快速入门 </a>
          </li>
          <li class="">
              <a href="#tab_2" data-toggle="tab"> ztree异步加载 </a>
          </li>
          
           <li class="">
              <a href="#tab_3" data-toggle="tab"> ztree 节点异步加载 </a>
          </li>  
          
           <li class="">
              <a href="#tab_4" data-toggle="tab"> checkbox tree的基本使用</a>
          </li>                                                   
        </ul>
           <div class="tab-content">         
               <div class="tab-pane active" id="tab_1">
                <div class="row">
                    <div class="col-md-12">
				       <h1 class="page-title">
							快速入门
					   </h1>
					   <div class="row"> 
						<div class="col-md-5">
							<div class="portlet light portlet-fit bordered">
								<div class="portlet-title">
									<div class="caption">
									   <div class="mt-title">
			                                 <i class="icon-directions font-green hide"></i> 
										  <span class="caption-subject font-dark uppercase">快速入门</span>
			                              </div>
									</div>
								</div>
								<div class="portlet-body">
								    <div class="mt-avatar">
								    	<div class="zTreeDemoBackground left" style="height:360px;">
											<ul id="treeDemo1" class="ztree"></ul>
											<input type="hidden" id="code" value="123433"/><br/>
											<button id="confirm" type="button" class="btn default">获取选中的节点信息</button>
										</div>
			                        </div>
								</div>
								
							</div>
						</div>
						<div class="col-md-6">
							<div class="portlet light portlet-fit bordered">
								<div class="portlet-title">
									<div class="caption">
									   <div class="mt-title">
			                                 <i class="icon-directions font-green hide"></i> 
										  <span class="caption-subject font-dark uppercase">说明</span>
			                              </div>
									</div>
								</div>
								<div class="portlet-body" style="height:388px;">
								    	<p>1、引入metro.css,jquery.ztree.all-3.5.min.js 两个js文件 </p>
								    	<p>2、为ztree 指定位置</p>
								    	<p>3、配置参数和节点数据</p>
								    	<p>4、初始化</p>
								    	<p> 完整代码示例，详见路径 [/web/src/main/webapp/WEB-INF/views/example/ztree/index.jsp]
								    	</p>
			                        </div>
								</div>
								
							</div>
						</div>		
					 </div>
                  </div>
                </div>                            
             
             <div class="tab-pane" id="tab_2">
                <div class="row">
                   <div id="tab2" class="col-md-12">
                       <div class="row" style="position: relative;top:20px;"> 
						<div class="col-md-5">
							<div class="portlet light portlet-fit bordered">
								<div class="portlet-title">
									<div class="caption">
									   <div class="mt-title">
			                                 <i class="icon-directions font-green hide"></i> 
										  <span class="caption-subject font-dark uppercase">异步加载数据</span>
			                              </div>
									</div>
								</div>
								<div class="portlet-body">
								    <div class="mt-avatar" style="height:360px;">
								    	<div class="zTreeDemoBackground left">
											<button id="loadZtree" type="button" class="btn default">异步加载Ztree</button>
											<button id="clearZtree" type="button" class="btn default">清空</button>
											<ul id="treeDemo2" class="ztree"></ul>
											
										</div>
			                        </div>
								</div>
								
							</div>
						</div>
						<div class="col-md-6">
							<div class="portlet light portlet-fit bordered">
								<div class="portlet-title">
									<div class="caption">
									   <div class="mt-title">
			                                 <i class="icon-directions font-green hide"></i> 
										  <span class="caption-subject font-dark uppercase">说明</span>
			                              </div>
									</div>
								</div>
								<div class="portlet-body" style="height:388px;">
								    	<p>配置说明:</p>
							    		<p>async:  配置异步请求的路径,请求参数等属性,
							    		其中的otherParam,支持自定义函数</p>
							    		<p>data:   配置节点信息,其中的idKey和pidKey可以自定义设置</p>
							    		<p>完整代码示例，详见路径 [/web/src/main/webapp/WEB-INF/views/example/ztree/index.jsp]</p>
								</div>
								
							</div>
						</div>		
		              </div>
                   </div>
               </div>
            </div>  
            
             <div class="tab-pane" id="tab_3">
                <div class="row">
                   <div id="tab3" class="col-md-12">
                      <div class="row"> 
						<div class="col-md-5">
							<div class="portlet light portlet-fit bordered">
								<div class="portlet-title">
									<div class="caption">
									   <div class="mt-title">
			                                 <i class="icon-directions font-green hide"></i> 
										  <span class="caption-subject font-dark">ztree 节点异步加载</span>
			                              </div>
									</div>
								</div>
								<div class="portlet-body">
								    <div class="mt-avatar" style="height:360px; overflow-y:scroll; " >
								    	<div class="zTreeDemoBackground left">
					                         <ul id="treeDemo3" class="ztree"></ul>
				                         </div>
			                        </div>
								</div>
								
							</div>
						</div>
						<div class="col-md-6">
							<div class="portlet light portlet-fit bordered">
								<div class="portlet-title">
									<div class="caption">
									   <div class="mt-title">
			                                 <i class="icon-directions font-green hide"></i> 
										  <span class="caption-subject font-dark uppercase">说明</span>
			                              </div>
									</div>
								</div>
								<div class="portlet-body" style="height:388px;">
								    	<p>
								    	1、使用场景： 适用于父节点下子节点数量较多的情况
								    	</p>
								    	<p>
								    	2、配置说明：<br/><br/>
			                             callback: 用于注册回调函数，在本示例中用到了onAsyncSuccess</nobr>回调函数，当一次异步请求加载成功后，会调用该函数，在该函数中定义一个定时任务,可以强制进行多次异步加载。</p>
			                            <p>完整代码示例，详见路径 [/web/src/main/webapp/WEB-INF/views/example/ztree/index.jsp] </p>                                          
								</div>
							</div>
						</div>		
		             </div>
                  </div>
               </div>
            </div>    
            
             <div class="tab-pane" id="tab_4">
                <div class="row">
                   <div id="tab4" class="col-md-12">
                     <div class="row"> 
						<div class="col-md-5">
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
					                         <ul id="treeDemo4" class="ztree"></ul>
				                         </div>
			                        </div>
								</div>
								
							</div>
						</div>
						<div class="col-md-6">
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
								    	 <p>1、setting 配置信息说明</p>
											<p>父子关联关系：<br/>
												被勾选时：<input type="checkbox" id="py" checked /><span>关联父</span>
												<input type="checkbox" id="sy" checked /><span>关联子</span><br/>
												取消勾选时：<input type="checkbox" id="pn" checked /><span>关联父</span>
												<input type="checkbox" id="sn" checked /><span>关联子</span><br/>
												<span id="code"></span>
											 </p>
										     <p>2、treeNode 禁用节点和取消禁用</p>
											  <p>		
												   1)[ <a id="disabledTrue" href="#" title="set checkbox to be disabled." onclick="return false;">禁用节点</a>] &nbsp;&nbsp;
											       2)[ <a id="disabledFalse" href="#" title="set checkbox to be abled." onclick="return false;">取消禁用</a> ]
											  </p>	
											  <p>3、获取选中的节点</p>
												  <p> 
													 选中的节点：<input id="selectValue" name="nodes" type="text"></br><br/>
													<button class="btn default" type="button" name="getNode"  onclick="getNodeValue()">获取选中的节点</button>
													<button class="btn default" type="button" name="clearNode"  onclick="clearNodeValue()">清空选中的节点</button> <br/><br/>
													 完整代码示例，详见路径 [/web/src/main/webapp/WEB-INF/views/example/ztree/index.jsp]
											      </p>
				                        </div>
			                        </div>
								</div>
							</div>
			           </div>		
                  </div>
               </div>
            </div>            
        </div>
     </div>
   </div>
   </div>
           
 </div>
  
 <script type="text/javascript" src="${staticServer}/assets/example/ztree/js/async.js"></script> 
 <script type="text/javascript">
 
       
	   
		var setting1 = {
			data: {
				simpleData: {
					enable: true
				}
			}
		};

		var zNodes1 =[
			{ id:1, pId:0, name:"父节点1 - 展开", open:true},
			{ id:11, pId:1, name:"父节点11 - 折叠"},
			{ id:111, pId:11, name:"叶子节点111"},
			{ id:112, pId:11, name:"叶子节点112"},
			{ id:113, pId:11, name:"叶子节点113"},
			{ id:114, pId:11, name:"叶子节点114"},
			{ id:12, pId:1, name:"父节点12 - 折叠"},
			{ id:121, pId:12, name:"叶子节点121"},
			{ id:122, pId:12, name:"叶子节点122"},
			{ id:123, pId:12, name:"叶子节点123"},
			{ id:124, pId:12, name:"叶子节点124"},
			{ id:13, pId:1, name:"父节点13 - 没有子节点", isParent:true},
			{ id:2, pId:0, name:"父节点2 - 折叠"},
			{ id:21, pId:2, name:"父节点21 - 展开", open:true},
			{ id:211, pId:21, name:"叶子节点211"},
			{ id:212, pId:21, name:"叶子节点212"},
			{ id:213, pId:21, name:"叶子节点213"},
			{ id:214, pId:21, name:"叶子节点214"},
			{ id:22, pId:2, name:"父节点22 - 折叠"},
			{ id:221, pId:22, name:"叶子节点221"},
			{ id:222, pId:22, name:"叶子节点222"},
			{ id:223, pId:22, name:"叶子节点223"},
			{ id:224, pId:22, name:"叶子节点224"},
			{ id:23, pId:2, name:"父节点23 - 折叠"},
			{ id:231, pId:23, name:"叶子节点231"},
			{ id:232, pId:23, name:"叶子节点232"},
			{ id:233, pId:23, name:"叶子节点233"},
			{ id:234, pId:23, name:"叶子节点234"},
			{ id:3, pId:0, name:"父节点3 - 没有子节点", isParent:true}
		];
		
		
		var setting2 = {
    		  async : {
    			    enable: true,               // 如果需要异步加载必须将其设置为true
    				url : "asyncData.htm",  
    				dataType : "json",         //返回的数据类型
    				type : "post",
    				/* 
    				 otherParam传值的两种方式：
    				 1、通过array数组
    				 2、通过json数组（value可以用自定义函数）
    				 otherParam:{"otherParam":"zTreeAsyncTest","code":function() { return $('#code').val();}}
    				*/
    				otherParam: ["id", "1", "name", "test"]

    		   },
    		   data : {
    		  		simpleData : {
    		  			enable : true,
    		  			idKey : "id",      //默认为id,可以自定义
    		  			pIdKey : "pId"     //默认为pid，可以自定义
    		  		}
    		  		
    		  	},
    		  	callback: {
    				onAsyncSuccess: onAsyncSuccess2,            //节点异步加载成功后的回调函数
    			}
	 
		 }
		      
		      
	     function onAsyncSuccess2(event, treeId, treeNode, msg) {
	   	     var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
	 		 zTree.expandAll(true);    //全部展开节点 
	 			
 		    //var node = zTree.getNodeByParam("id",1);   //展开指定id的节点
 		    //zTree.selectNode(node,true);//指定选中ID的节点  
 		    //zTree.expandNode(node, true,false);//指定选中ID节点展开   
	     }
		
		
		 var setting3 = {
			async: {
				enable: true,
				url: getUrl,
				dataType : "json",
			},
			
			data: {
				simpleData: {
					enable: true,
					idKey : "id",      //默认为id
		  			pIdKey : "pId"     //默认为pid
				}
			},
			view: {
				expandSpeed: ""     //设置展开时的动画效果（fast,normal,slow,""）,""表示没有动画
			},
			callback: {
				//beforeExpand:beforeExpand,                 //节点展开前的回调函数
				onAsyncSuccess: onAsyncSuccess3,            //节点异步加载成功后的回调函数
				onAsyncError: onAsyncError3                 //节点异步加载失败后的回调函数
			}
		 };
		    
        //父节点信息，其中的times不是必须的主要用于记录加载的次数
	    var zNodes3 =[
			{name:"500个节点", idKey:"1", count:500, times:0, isParent:true},
			{name:"1000个节点", idKey:"2", count:1000, times:0, isParent:true},
			{name:"2000个节点", idKey:"3", count:2000, times:0, isParent:true}
		];
	    
	    
	    var  perCount = 100;   //每次请求的节点个数
	    var  perTime = 100;    //100ms 执行一次请求
        
	    /**
	                    说明:
	                    在异步请求的过程中如果节点数量过大的话，需要分多次进行加载，
	                    其中的baseContent表示已经请求的节点数，作为下一次请求的开始值
	        getContent 表示每次实际请求的节点个数,如果 请求的开始值+ 每次请求的
	                    节点个数大于总节点数，getContent的值为总节点数- 请求的开始值，否则为perCount.
	    */
        function getUrl(treeId, treeNode) {
			var baseContent = (treeNode.children) ? treeNode.children.length : 0;  
			var getCount = (baseContent + perCount) > treeNode.count ? (treeNode.count - baseContent) : perCount;
			var param = "idKey="+treeNode.idKey +"&count="+getCount+"&baseCount="+baseContent;
			return "getNodesForBigData.htm?" + param;
	    }
        
        
        /**
        *   用于捕获异步加载正常结束的事件回调函数
        */
		function onAsyncSuccess3(event, treeId, treeNode, msg) {
			if (!msg || msg.length == 0) {
				return;
			}
			var zTree = $.fn.zTree.getZTreeObj("treeDemo3"),
			totalCount = treeNode.count;
			if (treeNode.children.length < totalCount) {
				setTimeout(function() {ajaxGetNodes(treeNode);}, perTime);
			} else {
				treeNode.icon = "";
				zTree.updateNode(treeNode);
				zTree.selectNode(treeNode.children[0]);
				endTime = new Date();
				//var usedTime = (endTime.getTime() - startTime.getTime())/1000;
				//alert("加载完毕，共进行 "+ (treeNode.times-1) +" 次异步加载, 耗时："+ usedTime + " 秒"); 
				alert("加载完毕，共进行 "+ (treeNode.times) +" 次异步加载");
			}
		}
        
        /**
            reloadType!=refresh时 表示追加，反之为清空重新加载
        */
		function ajaxGetNodes(treeNode, reloadType) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo3");
			treeNode.times = treeNode.times+1;
			//主要用于加载刷新的图标
			/* if (reloadType == "refresh") {
				treeNode.icon = "${staticServer}/assets/zTree3.5/css/zTreeStyle/img/loading.gif";
				zTree.updateNode(treeNode);  
			} */
			zTree.reAsyncChildNodes(treeNode, reloadType, true);   //强行异步加载父节点的子节点
		}
		
		
		//加载出现异常时执行
		function onAsyncError3(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo3");
			alert("异步获取数据出现异常。");
			treeNode.icon = "";
			zTree.updateNode(treeNode);
		}
		
		
		var setting4 = {
				check: {
					enable: true
				},
				data: {
					simpleData: {
						enable: true
					}
				}
	    };

		var zNodes4 =[
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
			var zTree = $.fn.zTree.getZTreeObj("treeDemo4"),
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
			var zTree = $.fn.zTree.getZTreeObj("treeDemo4"),
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
			var zTree = $.fn.zTree.getZTreeObj("treeDemo4");
			var nodes = zTree.getCheckedNodes(true);
			var selectValue = [];
			for(var i =0;i<nodes.length;i++){
				selectValue.push(nodes[i].name);
			}
			$("#selectValue").val(selectValue.join(","));
		}
	    
	    
	    function clearNodeValue(){
	    	$("#selectValue").val("");
	    }
	    
	    
		$(document).ready(function(){
			 $.fn.zTree.init($("#treeDemo1"), setting1, zNodes1);
			 $.fn.zTree.init($("#treeDemo3"), setting3, zNodes3); 
			 $.fn.zTree.init($("#treeDemo4"), setting4, zNodes4);
			 
			 
			 //异步加载
			 $("#loadZtree").click(function(){
				 $.fn.zTree.init($("#treeDemo2"), setting2);
			 });
			 
			 $("#clearZtree").click(function(){
				 var treeObj = $.fn.zTree.getZTreeObj("treeDemo2");
				 var nodes = treeObj.getNodes();
				 for (var i = nodes.length-1; i >= 0; i--) {
					 treeObj.removeNode(nodes[i]);
			     }
			 })
	    	  //节点取值测试
    	     $("#confirm").click(function(){
	  	         var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");
	             var nodes = treeObj.getSelectedNodes();
	             if (nodes.length > 0) {
	                //var id = nodes[0].idKey;
	                var name =  nodes[0].name;
	                alert("name:"+name);
	             }else{
	            	alert("请选择节点！");
	             }
    	     })
    	     
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
		
 </script> 
</body>
</html>
