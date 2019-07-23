<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>首页</title>
    <!--
                      说明：
         1、版本说明： 本示例使用的版本为1.4.3
         2、其中的window.UEDITOR_HOME_URL表示的是资源文件的位置如：dialogs等文件夹，
		 window.UEDITOR_HOME_URL默认的路径为ueditor.config.js所在的路径
    -->
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${staticServer}/"; //加载配置文件的根路径
    </script>
    <script type="text/javascript" charset="utf-8" src="${staticServer}/assets/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${staticServer}/assets/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${staticServer}/assets/ueditor/lang/zh-cn/zh-cn.js"></script>
    <style>
    	.content{
    		font-size:16px;
    		position: relative;
    		left:20px;
    	}
    
    </style>
</head>

<body>

<div class="page-bar">
		<ul class="page-breadcrumb">
		    <li><a href="${dynamicServer}/index.htm">首页</a> <i class="fa fa-circle"></i>
			</li>
			<li><a href="${dynamicServer}/index.htm">代码示例</a><i class="fa fa-circle"></i>
				</li>
				<li><span>Ueditor代码示例 （本示例由文档列表和使用说明两部分组成）</span>
			  </li>
		</ul>
</div>
<div>
	 <div class="row"> 
			<div class="col-md-3">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
							  <span class="caption-subject font-dark uppercase">
							              文档列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							      <a id="addUeditor" href="javascript:;" class="btn btn-success"> 
                                       <i class="fa fa-plus"></i>&nbsp;新增
                                  </a>
							  </span>
                              </div>
						</div>
					</div>
					<div class="portlet-body" style="height: 420px">
						<c:forEach items="${list}" var="ueditor" varStatus="st">
							<div position: relative; left:-10px">
							    <a href="javascript:openFile(${st.index})" class="btn white">${st.index+1}.&nbsp;新建文件${st.index+1}</a>
							    <a href="delete.htm?id=${ueditor.id}" class="btn white deleteUeditor">删除
                                     <i class="fa fa-times"></i></a>
							</div>
						</c:forEach>
					</div>
					
				</div>
			</div>
			<div class="col-md-9">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-body" style="height: 510px;">
					  <form id="ueditorForm" action="add.htm" method="post">
					    <div id="ueditorDescription" class="col-md-12" style="display: none;">
				    	    <script id="editor" type="text/plain" style="height:260px"></script>
				    	    <input type="hidden" name="description" id="description" value=""/>
				    	    <input type="hidden" name="content" id="content" value=""/>
				    	    <input type="hidden" id="id" name="id"  value=""/>
				    	   <div id="endUeditor" style="position: relative; left:30px; top:20px;">
				               <button type="button" onclick="setContent()"  class="btn default">为编辑器赋值</button>
				               <button type="button" onclick="getContentTxt()"  class="btn default">获得纯文本</button>
				               <button type="button" onclick="getContent()"  class="btn default">获得完整的文本</button>
				               <button type="button" onclick="hasContent()"  class="btn default">判断是否有内容</button>
				               <button type="button" onclick="setDisabled()"  class="btn default">不可编辑</button>
				               <button type="button" onclick="setEnabled()"  class="btn default">可以编辑</button><br/>
				               
				               <div style="position: relative; left:470px; top:20px;">
				                   <button type="button" id="saveUeditor"  class="btn btn-primary">保存</button>
				                   <button type="button"  id="exitUeditor" class="btn default">关闭</button>
				                   <button type="button"  id="resetUeditor"  class="btn default">重置</button>
				               </div>
				           </div>
				        </div>
				       </form>
					</div>
				</div>
			</div>
		</div>
		<br/>
		<br/>
		<div class="row"> 
		     <div class="col-md-12">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
							  <span class="caption-subject font-dark uppercase">
							             使用说明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  </span>
                              </div>
						</div>
					</div>
					
					<div class="portlet-body">
						   <p> 1、快速入门   </p>
						     <p > 1.1、引入ueditor.config.js,ueditor.all.min.js,lang/zh-cn/zh-cn.js三个js文件,注意三个文件的顺序 </p>
						     <p> 1.2、为编辑器指定位置</p>
						      <pre>&lt;script id='editor' type="text/plain" style="width:1024px;height:500px;">&lt;/script></pre>
						      <p>1.3、初始化编辑器  </p>
						     
						      <pre class="text-left">&lt;script type="text/javascript">
    var ue = UE.getEditor('editor');
&lt;/script>
						      </pre> 
						      <p> 2、常用功能说明 </p>
						        <p> 2.1、为编辑器赋值   </p>
						        <p>  2.2、获得纯文本    </p>
						        <p> 2.3、获得完整的文本(包括文本样式) </p>
						        <p>  2.4、判断是否有内容  </p>
						        <p>  2.5、不可编辑  </p>
						        <p>   2.6、可以编辑  </p> 
						        <p>    2.7、重置 </p> 
						        <p> 2.8、设置编辑器的高度  </p>
						         
						      <p> 3、取消自动保存的设置</p>
						        <p>  问题：ueditor1.4.3版本通过设置enableAutoSave: false,是没有效果的，必须修改代码
							        步骤如下：  </p>
							       <p> 打开ueditor.all.min.js 找到  'contentchange': function () 方法，
							        在该方法的开始位置加入如下代码： </p>
						       <pre>if (!me.getOpt('enableAutoSave')) {
   return;
}
                               </pre> 
                              
		                                                          更多设置请详查ueditor.config.js 文件
		                       </br></br>
						      <p> 4、图片上传配置</p>
						      <p>主要涉及到的文件有： config.json, ueditor.all.js,ueditor.config.js,image.js,controller.jsp</p>
						       <p>4.1、在项目中添加ueditor的maven 依赖</p>
                               <pre>
&lt;dependency&gt; 
   &lt;groupId&gt;cn.songxinqiang&lt;/groupId&gt;
   &lt;artifactId&gt;com.baidu.ueditor&lt;/artifactId&gt;
   &lt;version&gt;1.1.2-offical&lt;/version&gt;
&lt;/dependency&gt;
							  </pre>				       
						      <p>4.2、除了在快速入门中提到的三个js文件还需要引入：</p>
						      <pre>
&lt;script type="text/javascript" charset="utf-8"&gt;
        window.UEDITOR_HOME_URL = "${staticServer}/"; //加载配置文件的根路径
&lt;/script&gt;
						      </pre>
						      <p>4.3、重写getActionUrl方法：</p>
						      <pre>
UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
UE.Editor.prototype.getActionUrl = function(action) { 
         if (action == 'ueditorUploadImage' || action == 'uploadscrawl' || action == 'uploadimage') {
         //这里调用后端我们写的图片上传接口
         return '${dynamicServer}/ueditorUploadImage.htm?basePath=/example/ueditor/';
         }else{
              return this._bkGetActionUrl.call(this, action);
         }
}
						      </pre>
						      <p>其中的basePath为上传的模块路径
						      </p>
						      <p> 4.4、配置nginx</p>
						      <pre>
location / {
	root   D:\\upload\\image;
	rewrite /(.*)$ \$1 break;
}
						      </pre>
						      其中的D:\\upload\\image, 对应application-common.properties中的imageUploadPath
						      <br/><br/>
                             <p> 4.5、点击单个图片上传响应很慢的解决方法 
                                                                              响应很慢的原因：在上传时需要验证所有支持的图片的格式，默认是所有格式的图片<br/><br/> 
                                                                              解决方案：将ueditor.all.js 中的accept属性改为需要上传的几种格式即可，如：accept="image/jpeg,image/jpg,image/png,image/gif"</p> 
                                                                                

							 <p> 4.6、点击上传多张图片响应很慢的解决方法 
							      响应很慢的原因： 与单张图片类似 
							      解决方案： 修改dialogs/image/imgage.js 中370 或者查找accept: {
							      将其中的mimeTypes 属性改为 'image/jpeg,image/jpg,image/png,image/gif' </p>

                             
								<p> 完整代码示例，详见路径 [/web/src/main/webapp/WEB-INF/views/example/ueditor/index.jsp]<br/>   </p>   
                           
					</div>
				</div>
			</div>
		</div>
	
</div>

<script>
     var ue = null;
    
	 $(function(){	
		 $("#saveUeditor").bind("click",saveUeditor);
		 $("#cancelUeditor").bind("click",resetUeditor);
		 $("#exitUeditor").bind("click",exitUeditor);
		 $("#addUeditor").bind("click",addUeditor);
		 $("#resetUeditor").bind("click",resetUeditor);
		 
		 
		 
		 
		 /**
		      提交请求
		 */
		 function sendForm(url,form){
			 $.ajax({
				  url: url,
				  data:form.serialize(),
				  success: function(data){
					  if(data==1){
					     window.location.href="index.htm";
					  }
					  
					  if(data == 2){
						  alert("最多只能新建10个文件！");
					  }
				 } 
			 });
		 }
		   
		 /**
		             保存编辑的文档 
		 */
		 function saveUeditor(){
			 $("#content").val(ue.getContent());
			 sendForm("saveOrUpdate.htm",$("#ueditorForm"));
		 }
		 
		 
		 
		 
		 /**
		     重置编辑的内容
		 */
		 function resetUeditor(){
			 ue.execCommand('cleardoc');   //命令的方式
		 }
		 
		 /**
		        退出编辑
		 */
		 function exitUeditor(){
			 $("#ueditorDescription").css("display","none");
		     $("#id").val("");
		 }
		 
		 /**
		         新建文档
		 */
		 function addUeditor(){
			 $.ajax({
				  url: "readFile.htm",
				  data:{path:"template.txt"},
				  success: function(data){
					  
				      if(data.replace(/[\r\n]/g,"") == 'NOT EXIST'){
				    	  bootbox.alert("模板文件路径为空！");
				      }else{
					      ue.setContent(data);
				      } 
				 } 
			 });
			 
			 $("#id").val(0);
			 
			 $("#ueditorDescription").css("display","block");
		 } 
	 })

     var ueditorArray = new Array();
     var ueditor = null;
     
     init();
     
     
     /**
                   阻止a标签的href跳转
     */
     function stopDefault(e){ 
	    if (e && e.preventDefault) {
	        e.preventDefault();
	    }
 	 } 	
 
     
     /**
                       初始化list,因为在js中无法直接通过el表达式获取指定索引的值
                       不用 方法参数的原因是<a>标签 采用的是get请求，
                       最长只能发送2k字节长度的内容
     */
     function init(){
    	 <c:forEach items="${list}" var="ueditor">  
    	     var description = "${ueditor.description}";
    	     
	         ueditor = {
	   			id: ${ueditor.id},
	   			description:description.split("\\").join("\\\\"),
	   		 }
	         
	         ueditorArray.push(ueditor); 
		 </c:forEach> 
		 
		 
		 UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
		 
		 ue = UE.getEditor('editor',{
			 autoHeightEnabled: false,    //显示滚动条
			 enableAutoSave: false,       //取消自动保存
 			 autoFloatEnabled: false,      //是否保持toolbar的位置不动,默认true
 			 elementPathEnabled:false,     //显示元素路径
 			 initialFrameWidth: null,
 			 wordCount:false
	     });
		 
		 UE.Editor.prototype.getActionUrl = function(action) { 
	            if (action == 'ueditorUploadImage' || action == 'uploadscrawl' || action == 'uploadimage') {
			          //这里调用后端我们写的图片上传接口
			          return '${dynamicServer}/ueditorUploadImage.htm?basePath=/example/ueditor/';
	            }else{
	                 return this._bkGetActionUrl.call(this, action);
	            }
	     }
		 
		 
     }
     
	 //打开文件操作
	 function openFile(index){
		 
		 $("#ueditorDescription").css("display","block");
		 $("#id").val(ueditorArray[index].id);
		 $("#description").val(ueditorArray[index].description);
		 ue.ready(function() {
	    		$.ajax({
	  				  url: "readFile.htm",
	  				  data: {path:ueditorArray[index].description},
	  				  success: function(data){
	  					 var result = data.replace(/[\r\n]/g,"");
	  					 if(result == 'NOT EXIST'){
					    	  bootbox.alert("文件路径为空！");
					      }else {
						      ue.setContent(data);
					      }
	  				  } 
				});
	     });  
		 
		 stopDefault(event);
	 }
	 
	 //1、手动设置编辑器内容
	 function setContent(){
		ue.setContent("Hello World!");
	 }
		
	 //2、获得纯文本内容
	 function getContentTxt(){
		alert(ue.getContentTxt());
	 }
	
	 //3、判断是否有内容
	 function hasContent(){
		alert(ue.hasContents());
	 }
	
	 //4、可以编辑
	 function setEnabled(){
		ue.setEnabled();
	 }
	
	
	 //5、不可编辑
	 function setDisabled(){
		ue.setDisabled();
	 }
	 
	 
	 //6、获取完整文本
	 function getContent(){
		 alert(ue.getContent());
	 }
	 

    
</script>
</body>
