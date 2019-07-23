<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<head>
<meta charset="UTF-8">
<title>多图片上传</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#upBox {
	text-align: center;
	width: 500px;
	padding: 20px;
	border: 1px solid #666;
	margin: auto;
	position: relative;
	border-radius: 10px;
}

#inputBox {
	width: 100%;
	height: 40px;
	border: 1px solid cornflowerblue;
	color: cornflowerblue;
	border-radius: 20px;
	position: relative;
	text-align: center;
	line-height: 40px;
	overflow: hidden;
	font-size: 16px;
}

#inputBox input {
	width: 114%;
	height: 40px;
	opacity: 0;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: -14%;
}

#imgBox {
	text-align: left;
}

.imgContainer {
	display: inline-block;
	width: 32%;
	height: 150px;
	margin-left: 1%;
	border: 1px solid #666666;
	position: relative;
	margin-top: 30px;
	box-sizing: border-box;
}

.imgContainer img {
	width: 100%;
	height: 150px;
	cursor: pointer;
}

.imgContainer p {
	position: absolute;
	bottom: -1px;
	left: 0;
	width: 100%;
	height: 30px;
	background: black;
	text-align: center;
	line-height: 30px;
	color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	display: none;
}

.imgContainer:hover p {
	display: block;
}

#btn {
	outline: none;
	width: 100px;
	height: 30px;
	background: cornflowerblue;
	border: 1px solid cornflowerblue;
	color: white;
	cursor: pointer;
	margin-top: 30px;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页 > </a></li>
			<li>代码示例 ></li>
			<li>多图片上传</li>
		</ul>
	</div>
	<div class="portlet-title col-md-12">
		<div class="caption">
			<h4>
				<i class="fa fa-file-image-o"></i><b>多图片上传</b>
			</h4>
			
		</div>
	</div>
	<div class="col-md-4">
			<p>需要引入uploadImg.js包。</p>
			<p>调用imgUpload方法。</p>
			<p>具体代码使用及参数说明请查看页面元素。</p>
			</div>
			<form id="jvForm" class="col-md-6"  enctype="multipart/form-data">
				<div>
					<div id="upBox">
						<div id="inputBox">
							<input type="file" name="files" title="请选择图片" id="file" multiple
								accept="image/png,image/jpg,image/gif,image/JPEG" />点击选择图片
						</div>
						<div id="imgBox"></div>
						<button id="btn">上传</button>
					</div>
				</div>
			</form>
</body>
<critc-script> <script
	src="${staticServer}/assets/example/fileupload/js/uploadImg.js"
	type="text/javascript"></script> <script>
		imgUpload({
			inputId : 'file', //input框id
			imgBox : 'imgBox', //图片容器id
			buttonId : 'btn', //提交按钮id
			upUrl : 'upload.htm', //提交地址
			formId : 'jvForm',
			data : 'files',
			fileSize:'2'
		});
	</script> </critc-script>