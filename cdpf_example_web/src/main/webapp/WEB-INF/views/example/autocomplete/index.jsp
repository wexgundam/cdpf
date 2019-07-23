<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<head>
<title>自动补全示例</title>
<link rel="stylesheet"
	href="${staticServer}/assets/example/autocomplete/css/jquery.autocomplete.css" />
</head>
<body>
	<div class="portlet-body">
		<div class="content">
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><i class="fa fa-home"></i> <a
						href="${dynamicServer}/index.htm">首页 > </a></li>
					<li>代码示例 ></li>
					<li>自动补全</li>
				</ul>
			</div>
			<div class="portlet-title col-md-12">
			<div class="caption">
				<h4>
					<i class="fa fa-coffee"></i><b>自动补全</b>
				</h4>
			</div>
		</div>
			<div class="col-md-6 ">
				<p>使用模拟数据测试：李四, 周周, 张新款, 李银, 周娟, 张丽, 张三</p>
				<p>1.使用自动补全首先需要引入jquery.autocomplete.js包。</p>
				<p>2.如果补全数据从数据库中取值，需要将Json格式数据返回前台。</p>
				<p>3.调用函数autocomplete实现自动补全。</p>
				<p>具体代码使用及参数说明请查看页面元素。</p>
			</div>
			<div class="col-md-6 center" style="margin-top:8%;">
				<table>
					<tr>
						<td><input type="text" id="autoComplete"
							class="form-control input-small " placeHolder="搜索的内容" /></td>
						<td style="padding-left: 10%;"><input type="button"
							name="btnSearch" class="btn btn-primary" onclick="onSearch();"
							value="搜索" /></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
<critc-script> <script
	src="${staticServer}/assets/example/autocomplete/js/jquery.autocomplete.js"></script>
<script>
	//本地数据<JSON>  
	var datas = [ {
		stuName : '李四'
	}, {
		stuName : '周周'
	}, {
		stuName : '张新款'
	}, {
		stuName : '李银'
	}, {
		stuName : '周娟'
	}, {
		stuName : '张丽'
	}, {
		stuName : '张三'
	} ];

	//开始  
	$().ready(function() {
		$("#autoComplete").autocomplete(datas, {
			minChars : 0, //至少输入的字符数，default：1；如果设为0，在输入框内双击或者删除内容时显示列表
			max : 5, //下拉项目的个数，default：10
			width : 220, //下拉框的宽度，default：input元素的宽度
			scrollHeight : 300, // 下拉框的高度， Default: 180
			scroll : true, //当结果集大于默认高度时，是否使用滚动条，Default: true
			autoFill : true, // 是否自动填充. Default: false
			mustMatch : false, //如果设置为true,只会允许匹配的结果出现在输入框,当用户输入的是非法字符时,将被清除， Default: false
			matchContains : true, //决定比较时是否要在字符串内部查看匹配.Default: false
			formatItem : function(data, i, total) {
				//结果中的每一行都会调用这个函数,返回值将用LI元素包含,显示在下拉列表中. 三个参数(row, i, max): 返回的结果数组, 当前处理的行数(从1开始), 当前结果数组元素的个数. Default: none, 表示不指定自定义的处理函数.
				return "<font style='color:black'>" + data.stuName + "</font>";
			},
			formatMatch : function(data, i, total) {
				//对每一行数据使用此函数格式化需要查询的数据格式. 返回值是给内部搜索算法使用的. 参数值row
				return data.stuName;
			},
			formatResult : function(data) {
				//和formatItem类似,但可以将将要输入到input文本框内的值进行格式化.同样有三个参数,和formatItem一样.Default: none,表示要么是只有数据,要么是使用formatItem提供的值.
				return data.stuName;
			}

		});
	});

	//搜索数据  
	function onSearch() {
		var nickName = $("#autoComplete").val();
		bootbox.alert(nickName);
	}
</script> </critc-script>