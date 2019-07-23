<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<link
	href="${staticServer}/assets/metronic4.7/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />

<head>
<title>EXCEL导出</title>
</head>

<body>

	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页</a></li>
			<li>>代码示例</li>
			<li>>EXCEL导出</li>
		</ul>
	</div>

	<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-cogs"></i>操作面板
			</div>
			<div class="tools">
				<a href="javascript:;" class="collapse"> </a>
			</div>
		</div>
		<div class="portlet-body">
			<div class="table-responsive">
				<table class="searchTable">
					<tr>
						<td>学号：</td>
						<td><input type="text" id="txtStudentno"
							class="form-control input-middle" placeholder=""
							value="${exampleStudentSearchVO.no }"></td>
						<td>姓名：</td>
						<td><input type="text" id="txtStudentname"
							class="form-control input-middle" placeholder=""
							value="${exampleStudentSearchVO.name }"></td>
						<td>学院：</td>
						<td><form:select path="exampleStudentSearchVO.collegeNo"
								class="form-control" id="cmbCollegeNo">
								<form:option value="" label="--请选择学院--" />
								<form:options items="${listCollege}" itemValue="value"
									itemLabel="content" />
							</form:select></td>
						<td>专业：</td>
						<td><form:select path="exampleStudentSearchVO.majorNo"
								class="form-control" id="cmbMajorNo">
								<form:option value="" label="--请选择专业--" />
								<form:options items="${listMajor}" itemValue="value"
									itemLabel="content" />
							</form:select></td>

						<td>
							<button class="btn btn-primary" id="btnSearch">
								<i class="ace-icon fa fa-search"></i> 查询
							</button>
						</td>
						<td><c:if test="${critc:isP('ExampleExcelExportExport')}">
								<button type="button" class="btn btn-success" id="btnExport"
									onclick="exportList()">
									<i class="ace-icon fa fa-file-excel-o bigger-110"></i> 导出
								</button>
							</c:if></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<table id="studentTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="40px"><input name="checkAllChange" type="checkbox"
							id="checkAllChange" /><span></span> #</th>
						<th width="120px">学号</th>
						<th width="100px">姓名</th>
						<th width="60px">性别</th>
						<th width="120px">身份证号</th>
						<th width="220px">学院--专业</th>
						<th width="80px">备注</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="student" varStatus="st">
						<tr>
							<td><input name="stuno" type="checkbox"
								value="${student.no }">&nbsp;${st.index+1 }</td>
							<td>${student.no }</td>
							<td>${student.name }</td>
							<td><c:if test="${student.sex eq '0'}">男 </c:if> <c:if
									test="${student.sex eq '1'}">女</c:if></td>
							<td>${student.idcardNo }</td>
							<td>${student.collegenameMajorname }</td>
							<td>${student.remark}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">${ pageNavigate.pageModel}</div>
	</div>




</body>
<critc-script> 
<script src="${staticServer}/assets/metronic4.7/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
	 <script type="text/javascript">
		$(function() {
			$("#btnSearch").bind('click', searchData);
			$("#cmbCollegeNo").bind('change', searchMajor);

		})
		// 查询方法
		var searchData = function() {
			var url = "index.htm?";
			if ($("#txtStudentno").val() != '')
				url += "no=" + $("#txtStudentno").val();
			if ($("#txtStudentname").val() != '')
				url += "&name=" + $("#txtStudentname").val();
			if ($("#cmbCollegeNo").val() != '')
				url += "collegeNo=" + $("#cmbCollegeNo").val();
			if ($("#cmbMajorNo").val() != '')
				url += "&majorNo=" + $("#cmbMajorNo").val();
			window.location = encodeURI(url);
		}

		//二级联动查询专业
		var searchMajor = function() {
			var url = 'listMajor.htm?collegeNo=' + $("#cmbCollegeNo").val();
			//绑定Ajax的内容
			$.getJSON(url, function(data) {
				$("#cmbMajorNo").empty();//清空下拉框	    	
				$("#cmbMajorNo").append(
						"<option value=''>&nbsp;" + '--请选择专业--' + "</option>");
				$.each(data, function(i, item) {
					$("#cmbMajorNo").append(
							"<option value='" + item.value + "'>&nbsp;"
									+ item.content + "</option>");
				});
			});
		}

		//全选/取消全选
		$("#checkAllChange").click(function() {
			if (this.checked == true) {
				$("#studentTable").find(':checkbox').each(function() {
					this.checked = true;
				});
			} else {
				$("#studentTable").find(':checkbox').each(function() {
					this.checked = false;
				});
			}
		});

		//监听复选框点击事件，当有没选中时，取消全选
		$(":checkbox").click(function() {
			var flag = true;
			$("#studentTable").find(':checkbox').each(function() {
				if (this.id != "checkAllChange") {
					if (!$(this).prop("checked")) {
						flag = false;
						$("#checkAllChange").prop("checked", false);
					}
				}
			});
			if (flag) {
				$("#checkAllChange").prop("checked", true);
			}
		})
		function exportList() {
			var student_ids = new Array();
			$('input:checkbox[name=stuno]:checked').each(function(i) {
				student_ids[i] = $(this).val();
			});
			var url = "exportList.htm?"
			if ($("#txtStudentno").val() != '')
				url += "no=" + $("#txtStudentno").val();
			if ($("#txtStudentname").val() != '')
				url += "&name=" + $("#txtStudentname").val();
			if (student_ids.length == 0) {
				bootbox.confirm("你确定要导出当前所有学生信息的列表吗？", function(result) {
					if (result) {
						window.location.href = url;
					}
				})
			} else {
				bootbox.confirm("你确定要导出选中的学生信息的列表吗？", function(result) {
					if (result) {
						url += "&student_ids=" + student_ids;
						window.location.href = url;
					}
				})
			}

		}
	</script> </critc-script>