<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>ztree异步加载</title>
	<link rel="stylesheet" href="${staticServer}/assets/zTree3.5/css/zTreeStyle/metro.css" type="text/css">
	<script type="text/javascript" src="${staticServer}/assets/zTree3.5/js/jquery.ztree.all-3.5.min.js"></script>
</head>


<body>
    <%-- <div class="page-bar">
		<ul class="page-breadcrumb">
		    <li><a href="${dynamicServer}/index.htm">首页</a> <i class="fa fa-circle"></i>
			</li>
			<li><a href="${dynamicServer}/index.htm">代码示例</a><i class="fa fa-circle"></i>
			</li>
			<li><span>Ztree 代码示例</span></li>
	   </ul>
    </div> --%>
    <div>
		<div class="row" style="position: relative;top:20px;"> 
			<div class="col-xs-5 col-xs-5">
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
					    <div class="mt-avatar" style="height:300px;">
					    	<div class="zTreeDemoBackground left">
								<ul id="treeDemo" class="ztree"></ul>
								<input type="hidden" id="code" value="123433"/><br/>
								<button id="confirm" type="button" class="btn default">获取选中的节点信息</button>
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
					<div class="portlet-body" style="height:328px;">
					    <div class="mt-avatar">
					    	<p style="font-size: 16px; line-height: 30px;">
					    		配置说明<br/>
					    		async:  配置异步请求的路径,请求参数等属性,
					    		其中的otherParam,支持自定义函数<br/>
					    		data:   配置节点信息,其中的idKey和pidKey可以自定义设置<br/><br/>
					    		
					    		完整代码示例，详见路径 [/web/src/main/webapp/WEB-INF/views/example/ztree/async.jsp]
					    		
					    	</p>
                        </div>
					</div>
					
				</div>
			</div>		
		</div>
		
		<br/>
		
		<div class="row"> 
			<div class="col-xs-11 col-xs-11">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-body">
						<div class="caption" style="position: relative;">
							 <button type="button" class="btn default">
                                 <a href="diyAsync.htm" style="color:white;"><font style="color:black;">Ztree 节点异步加载</font></a>
                                 <span class="ladda-spinner"></span>
                             </button>
                            
                             <button type="button" style="position: relative; left:50px" class="btn default">
	                             <a href="index.htm" style="color:white;"><font style="color:black;">快速入门</font></a>
	                             <span class="ladda-spinner"></span>
                             </button> 
                             <button type="button" style="position: relative; left:100px" class="btn default" >
                               <a href="checkboxTree.htm" style="color:white;"><font style="color:black;">Checkbox tree的使用方法</font></a>
                               <span class="ladda-spinner"></span>
                            </button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div> 
	
	
	<script type="text/javascript">
	      var setting = {
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
    				onAsyncSuccess: onAsyncSuccess,            //节点异步加载成功后的回调函数
    			}
 
	      }
	      
	      
	      function onAsyncSuccess(event, treeId, treeNode, msg) {
	    	    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	  			zTree.expandAll(true);    //全部展开节点 
	  			
	  		   /*  var node = zTree.getNodeByParam("id",1);   //展开指定id的节点
	  		    zTree.selectNode(node,true);//指定选中ID的节点  
	  		    zTree.expandNode(node, true,false);//指定选中ID节点展开   */ 
	      }
	      
	      $(document).ready(function(){
	    	  //初始化tree
			  $.fn.zTree.init($("#treeDemo"), setting);
	    	    
	    	  //节点取值测试
	    	  $("#confirm").click(function(){
    	    	  var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	              var nodes = treeObj.getSelectedNodes();
	              if (nodes.length > 0) {
	                var id = nodes[0].idKey;
	                var name =  nodes[0].name;
	                alert("id:"+id+", name:"+name);
	              }else{
	            	alert("请选择节点！");
	              }
	    	  })
	    	  
	    	  
	    	    				
		  });
	  
	</script>
	
</body>
      
</html>
