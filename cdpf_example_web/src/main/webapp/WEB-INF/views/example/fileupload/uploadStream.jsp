<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<head>
<title>文件拖拽上传</title>

<style>
.fileBox {
	margin-top: 0px;
	margin-bottom: 50px;
}

.fileInputP {
	display: inline-block;
	width: 200px;
	height: 30px;
	border-radius: 5px;
	overflow: hidden;
	position: relative;
}

.fileInputP i {
	width: 200px;
	height: 30px;
	text-align: center;
}

#fileInput {
	position: absolute;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	opacity: 0;
}

#fileSpan {
	display: inline-block;
	width: 300px;
	height: 150px;
	border: 2px dashed #ccc;
	text-align: center;
	line-height: 150px;
}

.fileList_parent {
	display: none;
}

.fileList_parent th {
	background: #dadada;
	font-weight: bold;
}

.fileList_parent th, .fileList_parent td {
	padding: 5px;
}

.fileList tr:nth-of-type(2n) {
	background: #dadada;
}

.progressParent {
	width: 200px;
	height: 20px;
	border-radius: 5px;
	background: #ccc;
	overflow: hidden;
	position: relative;
}

.progress {
	width: 0%;
	height: 20px;
	background: #7d8f33;
}

.progressNum {
	display: inline-block;
	width: 100%;
	height: 20px;
	text-align: center;
	line-height: 20px;
	color: #fff;
	position: absolute;
	left: 0;
	top: 0;
}

#fileBtn {
	display: none;
}
</style>
</head>
<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页 > </a></li>
			<li>代码示例 ></li>
			<li>文件拖拽上传</li>
		</ul>
	</div>
	<div class="portlet-title col-md-12">
		<div class="caption">
			<h4>
				<i class="fa fa-file"></i><b>文件拖拽上传</b>
			</h4>

		</div>
	</div>
	<div class="col-md-4">
		<p>纯页面实现，复制页面html和js即可。</p>
		<p>具体代码实现过程说明请查看页面元素。</p>
	</div>
	<div class="text-center col-md-6">
		<div class="fileBox ">
			<span id="fileSpan" class="vm">或者将文件拖到此处</span>
			<div class="mask"></div>
			<p class="fileInputP vm btn btn-primary btn-file">
				<label>选择文件</label><input type="file" multiple id="fileInput" />
			</p>
		</div>
	</div>
	<div class=" col-md-12">
		<table width="80%" border="1" class="fileList_parent">
			<thead>
				<tr>
					<th>文件名</th>
					<th>类型</th>
					<th>大小</th>
					<th>进度</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody class="fileList">
				<tr>
					<td><cite title="模板">模板</cite></td>
					<td>pdf</td>
					<td>5K</td>
					<td>
						<div class="progressParent">
							<p class="progress"></p>
							<span class="progressNum">0%</span>
						</div>
					</td>
					<td><a href="javascript:;">删除</a></td>
				</tr>
			</tbody>
		</table>
		<div class="text-center col-md-8" style="margin-top: 30px;">
			<input class="btn btn-primary" type="button" value="上传" id="fileBtn" />
			<input class="btn btn-default" type="button" value="返回"
				id="returnBtn" style="display: none" />
		</div>
	</div>

</body>
<critc-script> <script>
 $(function(){
		
		//元素
		var oFileBox = $(".fileBox");					//选择文件父级盒子
		var oFileInput = $("#fileInput");				//选择文件按钮
		var oFileSpan = $("#fileSpan");					//选择文件框

		var oFileList_parent = $(".fileList_parent");	//表格
		var oFileList = $(".fileList");					//表格tbody
		var oFileBtn = $("#fileBtn");					//上传按钮
		var returnBtn = $("#returnBtn");				//返回按钮
		
		var flieList = [];								//数据，为一个复合数组
		var sizeObj = [];								//存放每个文件大小的数组，用来比较去重
		
		
		//拖拽外部文件，进入目标元素触发
		oFileSpan.on("dragenter",function(){
			$(this).text("可以释放鼠标了！").css("background","#ccc");
		});

		//拖拽外部文件，进入目标、离开目标之间，连续触发
		oFileSpan.on("dragover",function(){
			return false;
		});

		//拖拽外部文件，离开目标元素触发
		oFileSpan.on("dragleave",function(){
			$(this).text("或者将文件拖到此处").css("background","none");
		});

		//拖拽外部文件，在目标元素上释放鼠标触发
		oFileSpan.on("drop",function(ev){
			var fs = ev.originalEvent.dataTransfer.files;
			analysisList(fs);		//解析列表函数
			$(this).text("或者将文件拖到此处").css("background","none");
			return false;
		});

		//点击选择文件按钮选文件
		oFileInput.on("change",function(){
			analysisList(this.files);
		})
		
		//解析列表函数
		function analysisList(obj){
			//如果没有文件
			if( obj.length<1 ){
				return false;
			}
			
			for( var i=0;i<obj.length;i++ ){

				var fileObj = obj[i];		//单个文件
				var name = fileObj.name;	//文件名
				var size = fileObj.size;	//文件大小
				var type = fileType(name);	//文件类型，获取的是文件的后缀
				
				//文件大于30M，就不上传
				if( size > 1024*1024*1024){
					bootbox.alert('“'+ name +'”超过了30M,不能上传');
					continue;
				}
				//文件为空，就不上传
				if( size == 0){
					bootbox.alert('“'+ name +'”文件为空,不能上传');
					continue;
				}
				
				//文件类型不为这三种，就不上传
				/*if( ("pdf/txt/epub").indexOf(type) == -1 ){
					alert('“'+ name +'”文件类型不对，不能上传');
					continue;
				}*/
				
				//把文件大小放到一个数组中，然后再去比较，如果有比较上的，就认为重复了，不能上传
				if( sizeObj.indexOf(size) != -1 ){
					bootbox.alert('“'+ name +'”已经选择，不能重复上传');
					continue;
				}
				
				//给json对象添加内容，得到选择的文件的数据
				var itemArr = [fileObj,name,size,type];	//文件，文件名，文件大小，文件类型
				flieList.push(itemArr);
				
				//把这个文件的大小放进数组中
				sizeObj.push(size);
				
			}
			
			createList()				//生成列表
			oFileList_parent.show();	//表格显示
			oFileBtn.show();			//上传按钮显示
			returnBtn.show();			//返回按钮显示
		};
		
			
		//生成列表
		function createList(){
			oFileList.empty();					//先清空元素内容
			for( var i=0;i<flieList.length;i++ ){
				
				var fileData = flieList[i];		//flieList数组中的某一个
				var objData = fileData[0];		//文件
				var name = fileData[1];			//文件名
				var size = fileData[2];			//文件大小
				var type = fileData[3];			//文件类型
				var volume = bytesToSize(size);	//文件大小格式化
				
				
				var oTr = $("<tr></tr>");
				var str = '<td><cite title="'+ name +'">'+ name +'</cite></td>';
				str += '<td>'+ type +'</td>';
				str += '<td>'+ volume +'</td>';
				str += '<td>';
				str += '<div class="progressParent">';
				str += '<p class="progress"></p>';
				str += '<span class="progressNum">0%</span>';
				str += '</div>';
				str += '</td>';
				str += '<td><a href="javascript:;" class="operation">删除</a></td>';
				
				oTr.html(str);
				oTr.appendTo( oFileList );
			}
		}
		
		//删除表格行
		oFileList.on("click","a.operation",function(){
			var oTr = $(this).parents("tr");
			var index = oTr.index();
			oTr.remove();		//删除这一行
			flieList.splice(index,1);	//删除数据
			sizeObj.splice(index,1);	//删除文件大小数组中的项
			
			//console.log(flieList);
			//console.log(sizeObj);
			
		});
		
		returnBtn.on("click",function(){
			returnBtn.off();
			window.location.href="uploadStream.htm";
		});
		//上传
		oFileBtn.on("click",function(){
			oFileBtn.off();
			var tr = oFileList.find("tr");		//获取所有tr列表
			var successNum = 0;					//已上传成功的数目
			oFileList.off();					//取消删除事件
			oFileBox.slideUp();					//隐藏输入框
			oFileList.find("a.operation").text("等待上传");
			
			
			for( var i=0;i<tr.length;i++ ){
				uploadFn(tr.eq(i),i);		//参数为当前项，下标
			}
					
			function uploadFn(obj,i){
				
				var formData = new FormData();
				var arrNow = flieList[i];						//获取数据数组的当前项
				
				// 从当前项中获取上传文件，放到 formData对象里面，formData参数以key name的方式
				var result = arrNow[0];							//数据
				formData.append("imageFile" , result);
				
				var name = arrNow[1];							//文件名
				formData.append("email" , name);
				
				var progress = obj.find(".progress");			//上传进度背景元素
				var progressNum = obj.find(".progressNum");		//上传进度元素文字
				var oOperation = obj.find("a.operation");		//按钮
				
				oOperation.text("正在上传");							//改变操作按钮
				oOperation.off();
				
				var request = $.ajax({
					type: "POST",
					url: "upload.htm",
					data: formData,			//这里上传的数据使用了formData 对象
					processData : false, 	//必须false才会自动加上正确的Content-Type
					contentType : false,
					
					//这里我们先拿到jQuery产生的XMLHttpRequest对象，为其增加 progress 事件绑定，然后再返回交给ajax使用
					xhr: function(){
						var xhr = $.ajaxSettings.xhr();
						if(onprogress && xhr.upload) {
							xhr.upload.addEventListener("progress" , onprogress, false);
							return xhr;
						}
					},
					
					//上传成功后回调
					success: function(){
						oOperation.text("成功").css({"color":"black","text-decoration":"none","cursor":"default"});
						successNum++;
						$(".progressParent").css("background","green");
					},
					
					//上传失败后回调
					error: function(){
						oOperation.text("重传");
						oOperation.on("click",function(){
							request.abort();		//终止本次
							uploadFn(obj,i);
						});
					}
					
				});
				
				
				//侦查附件上传情况 ,这个方法大概0.05-0.1秒执行一次
				function onprogress(evt){
					var loaded = evt.loaded;	//已经上传大小情况  
					var tot = evt.total;		//附件总大小  
					var per = Math.floor((100*loaded)/tot);  //已经上传的百分比
					progressNum.html( per +"%" );
					progress.css("width" , per +"%");
					
				}
			
			}			
		});
		
		
	})


	//字节大小转换，参数为b
	function bytesToSize(bytes) {
	    var sizes = ['Bytes', 'KB', 'MB'];
	    if (bytes == 0) return 'n/a';
	    var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
	    return (bytes / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i];
	};

	//通过文件名，返回文件的后缀名
	function fileType(name){
		var nameArr = name.split(".");
		return nameArr[nameArr.length-1].toLowerCase();
	}


	</script> </script> </critc-script>