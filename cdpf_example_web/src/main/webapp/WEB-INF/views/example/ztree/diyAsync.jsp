<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ztree 节点异步加载</title>
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
     <div>
		<div class="row"> 
			<div class="col-xs-5 col-xs-5">
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
					    <div class="mt-avatar" style="height:200px;">
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
					<div class="portlet-body" style="height:228px;">
					    <div class="mt-avatar">
					    	<p style="font-size: 16px; line-height: 20px; ">
					    	1、使用场景： 适用于父节点下子节点数量较多的情况<br/><br/>
					    	2、配置说明：<br/><br/>
                             <nobr>callback: 用于注册回调函数，在本示例中用到了onAsyncSuccess</nobr>回调函数，当一次异步请求加载成功后，会调用该函数，在该函数中定义一个定时任务,可以强制进行多次异步加载。<br/><br/>
                                                                        完整代码示例，详见路径 [/web/src/main/webapp/WEB-INF/views/example/ztree/diyAsync.jsp]                                           
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
                            
                             <button type="button" style="position: relative; left:50px" class="btn default ">
	                             <a href="index.htm" style="color:white;"><font style="color:black;">快速入门</font></a>
	                             <span class="ladda-spinner"></span>
                             </button> 
                             <button type="button" style="position: relative; left:100px" class="btn default">
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
    
    /*
                        异步加载节点数据的流程：
          1、点击展开节点时执行beforeExpand方法，判断节点是否进行异步加载，
                               默认情况为false,该方法主要用于记录加载的开始时间，
                               添加一个表示正在加载的图片(这一步不是必须的，为了避免干扰，示例代码我已注释)
          2、自动执行一次异步加载，加载成功后执行onAsyncSuccess 方法，该方法中有一个
                              定时任务，当已加载的节点数小于总节点数时，执行ajaxGetNodes,时间间隔为100ms
                              在ajaxGetNodes中调用reAsyncChildNodes 强制异步加载
    */
	   
    var setting = {
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
				onAsyncSuccess: onAsyncSuccess,            //节点异步加载成功后的回调函数
				onAsyncError: onAsyncError                 //节点异步加载失败后的回调函数
			}
		};
    
        //父节点信息，其中的times不是必须的主要用于记录加载的次数
	    var zNodes =[
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
        *	该方法主要用于记录加载时间的初始值
        */
        /* function beforeExpand(treeId, treeNode) {
        	//treeNode.isAjaxing false 表示没有开始进行异步加载
			if (!treeNode.isAjaxing) {   //记录 treeNode 节点是否正在进行异步加载。
				startTime = new Date();
				ajaxGetNodes(treeNode, "refresh");
				return true;
			} else {
				alert("zTree 正在下载数据中，请稍后展开节点。。。");
				return false;
			}
		} */
        
        /**
        *   用于捕获异步加载正常结束的事件回调函数
        */
		function onAsyncSuccess(event, treeId, treeNode, msg) {
			if (!msg || msg.length == 0) {
				return;
			}
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
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
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			treeNode.times = treeNode.times+1;
			//主要用于加载刷新的图标
			/* if (reloadType == "refresh") {
				treeNode.icon = "${staticServer}/assets/zTree3.5/css/zTreeStyle/img/loading.gif";
				zTree.updateNode(treeNode);  
			} */
			zTree.reAsyncChildNodes(treeNode, reloadType, true);   //强行异步加载父节点的子节点
		}
		
		
		//加载出现异常时执行
		function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			alert("异步获取数据出现异常。");
			treeNode.icon = "";
			zTree.updateNode(treeNode);
		}
		
		
		
	    
		$(document).ready(function(){
			//ztree 的初始化
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);  
		});
		
    </script>	
</body>
</html>
