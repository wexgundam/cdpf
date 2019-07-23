<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<head>
<title>验证码</title>
<critc-css>
<link rel="stylesheet" href="${staticServer }/assets/example/identifyingcode/css/jquery.slideidentifyingcode.css" />
<style>
#captcha {
	width: 300px;
	height: 32;
	display: inline-block;
}

.show {
	display: block;
}

.hide {
	display: none;
}

#wait {
	text-align: left;
	color: #666;
	margin: 0;
}
</style>
</critc-css>
</head>

<body>
	<!-- BEGIN PAGE BAR -->
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a></li>
			<li>>代码示例</li>
			<li>>验证码</li>
		</ul>
	</div>
	<h1 class="page-title">验证码实现方式：</h1>
	<h5>1.使用Java后台技术动态生成常用格式验证码图片，并在页面显示。</h5>
	<h5>2.使用JavaScript技术生成滑动图片验证码，并进行验证。</h5>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet light portlet-fit portlet-form bordered">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-eye"></i>java实现
					</div>
					<div class="tools">
						<a href="javascript:;" class="collapse"> </a>
					</div>
				</div>

				<div class="portlet-body">

					<div class="form-body">
						<div class="form-group">
							<label class="col-md-2 control-label" style="text-align: right;">普通数字验证码:</label>
							<div class="col-md-2 col-lg-1">
								<img id="img_number" style="width: 100%; height: 27px" onclick="resetDraw('number',3);" />
							</div>
							<div class="col-md-3">
								<input type="text" class="form-control" placeholder="请输入验证码" id="code_input_number" />
							</div>
							<div class="col-md-3">
								<input class="btn btn-primary" type="button" id="buttonVaNumber" onclick="valicationCode('number',3);" value="验证" />
							</div>
						</div>
					</div>
					<div class="form-body">
						<div class="form-group">
							<label class="col-md-2 control-label" style="text-align: right;">普通字母验证码:</label>
							<div class="col-md-2  col-lg-1">
								<img id="img_english" style="width: 100%; height: 27px" onclick="resetDraw('english',2);" />
							</div>
							<div class="col-md-3">
								<input type="text" class="form-control" placeholder="请输入验证码" id="code_input_english" />
							</div>
							<div class="col-md-3">
								<input class="btn btn-primary" type="button" id="buttonVaEnglish" onclick="valicationCode('english',2);" value="验证" />
							</div>
						</div>
					</div>
					<div class="form-body">
						<div class="form-group">
							<label class="col-md-2 control-label" style="text-align: right;">普通字母+数字验证码:</label>
							<div class="col-md-2  col-lg-1">
								<img id="img_numberandenglish" style="width: 100%; height: 27px" onclick="resetDraw('numberandenglish',1);" />
							</div>
							<div class="col-md-3 ">
								<input type="text" class="form-control" placeholder="请输入验证码" id="code_input_numberandenglish" />
							</div>
							<div class="col-md-3">
								<input class="btn btn-primary" type="button" id="buttonVaBlend" onclick="valicationCode('numberandenglish',1);" value="验证" />
							</div>
						</div>
					</div>

					<div class="form-body">
						<div class="form-group">
							<label class="col-md-2 control-label" style="text-align: right;">普通算术验证码:</label>
							<div class="col-md-2  col-lg-1">
								<img id="img_sums" style="width: 100%; height: 27px" onclick="resetDraw('sums',5);" />
							</div>
							<div class="col-md-3  ">
								<input type="text" class="form-control" placeholder="请输入运算结果" id="code_input_sums" />
							</div>
							<div class="col-md-3">
								<input class="btn btn-primary" type="button" id="buttonVaSums" onclick="valicationCode('sums',5);" value="验证" />
							</div>
						</div>
					</div>
					<div class="form-body">
						<div class="form-group">
							<label class="col-md-2 control-label" style="text-align: right;">普通汉字验证码:</label>
							<div class="col-md-2  col-lg-1">
								<img id="img_chinese" style="width: 100%; height: 27px" onclick="resetDraw('chinese',4);" />
							</div>
							<div class="col-md-3   ">
								<input type="text" class="form-control" placeholder="请输入验证码" id="code_input_chinese" value="${characters }" />
							</div>
							<div class="col-md-3">
								<input class="btn btn-primary" type="button" id="buttonVaChinese" onclick="valicationCode('chinese',4);" value="验证" />
							</div>
						</div>
					</div>
					<div class="form-body">
						<div class="form-group">
							<label class="col-md-2 control-label" style="text-align: right;">20秒后验证码失效:</label>
							<div class="col-md-5  col-lg-4">
								<input type="text" class="form-control" placeholder="验证码" id="data" />
							</div>
							<div class="col-md-3">
								<input class="btn btn-primary" type="button" id="buttonSend" value="获取验证码" />
								<input class="btn btn-primary" type="button" id="buttonSendVa" value="验证" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet light portlet-fit portlet-form bordered">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-eye"></i>js实现
					</div>
					<div class="tools">
						<a href="javascript:;" class="collapse"> </a>
					</div>
				</div>
				<div class="portlet-body">
					<div class="form-body">
						<div class="form-group">
							<label class="col-md-2 control-label" style="text-align: right;">滑动验证:</label>
							<div class="col-md-5   col-lg-4">
								<div id="slider"></div>
							</div>
							<div class="col-md-3">
								<input class="btn btn-primary" type="button" id="resetSlider" value="还原" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<critc-script> <!-- 倒计时按钮js start --> <script type="text/javascript"
	src="${staticServer }/assets/example/identifyingcode/js/mobile.identifyingcode.js?version=${versionNo}"></script> <!-- 倒计时按钮js end --> <!-- 滑动验证码js start--> <script
	type="text/javascript" src="${staticServer }/assets/example/identifyingcode/js/slider.identifyingcode.js?version=${versionNo}"></script> <!-- 滑动验证码js end --> <script
	type="text/javascript">
		$(function() {
			//获取验证码绑定事件
			$("#buttonSend").bind("click", function() {
				/*
				 *  获取验证码
				 *	参数：间隔时间，点击按钮id，文本框id，请求发送路径
				 */
				sendMessage(20, "buttonSend", "data", "${dynamicServer}" + "/example/identifyingcode/identifyingCodeGet.htm")
			});
			//验证验证码绑定事件
			$("#buttonSendVa").bind("click", function() {
				$.post("${dynamicServer }/example/identifyingcode/getMessage.htm", {
					data : $("#data").val(),
				}, function(data) {
					if (data.code === null || data.code === "") {
						bootbox.alert("验证码失效");
					} else if (data.code) {
						bootbox.alert("验证成功");
					} else if (!data.code) {
						bootbox.alert("验证失败");
					}
				}, "json");
			});

			/* 滑动验证 */
			$("#slider").slider({
				width : 300, // width
				height : 30, // height
				sliderBg : "rgb(134, 134, 131)", // 滑块背景颜色
				color : "#fff", // 文字颜色
				fontSize : 14, // 文字大小
				bgColor : "#33CC00", // 背景颜色
				textMsg : "按住滑块，拖拽验证", // 提示文字
				successMsg : "验证通过", // 验证成功提示文字
				//successColor : "", // 滑块验证成功提示文字颜色
				time : 400, // 返回时间
				callback : function(result) { // 回调函数，true(成功),false(失败)
					if (result) {
						bootbox.alert("验证通过");
					} else {
						bootbox.alert("验证失败");
					}
				}
			});
			$("#resetSlider").click(function() {
				$("#slider").slider("restore");
			});
			/* 验证码内容类型 1.字母+数字 2.字母 3.数字 4.汉字 5.算术*/
			resetDraw('chinese', 4);
			resetDraw('sums', 5);
			resetDraw('numberandenglish', 1);
			resetDraw('number', 3);
			resetDraw('english', 2);
		});

		//点击换一张验证码，参数1：放置验证码图片的id,参数2:验证码类型
		function resetDraw(s, par) {
			var imgSrc = $("#img_" + s + "");
			var src = imgSrc.attr("src");
			var timestamp = (new Date()).valueOf();
			imgSrc.attr("src", "${dynamicServer }/example/identifyingcode/charactersIdentifying.htm" + "?par=" + par + "&timestamp=" + timestamp);
			$("#code_input_" + s).val("");
		}
		//点击验证之后发送异步请求验证
		var valicationCode = function(s, par) {
			var code = $("#code_input_" + s).val();
			if ("" == $.trim(code)) {
				return;
			} else {
				$.post("${dynamicServer }/example/identifyingcode/valicateCharIdentifying.htm", {
					code : code,
					para : par
				}, function(data) {
					if (data.result) {
						bootbox.alert("验证通过");
					} else {
						bootbox.alert("验证失败");
					}
				}, "json");
			}
		}
	</script> </critc-script>