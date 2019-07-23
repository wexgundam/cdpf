<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<critc-css>
<link
	href="${staticServer}/assets/metronic4.7/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<link
	href="${staticServer}/assets/metronic4.7/global/css/components.css"
	rel="stylesheet" type="text/css" />
<link
	href="${staticServer}/assets/metronic4.7/layouts/layout/css/themes/darkblue.min.css"
	rel="stylesheet" type="text/css" />
</critc-css>
<head>
<title>数据导入</title>
</head>

<body>

	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页</a></li>
			<li>>代码示例</li>
			<li>>数据导入</li>
		</ul>
	</div>

	<div class="portlet box blue" style="display: none;">
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
							 placeholder="" value="${exampleStudentSearchVO.no }"></td>
						<td>姓名：</td>
						<td><input type="text" id="txtStudentname"
							placeholder="" value="${exampleStudentSearchVO.name }"></td>
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
					</tr>

				</table>
			</div>
		</div>
	</div>
	<div class="row">
	<div class="col-md-12">
		<c:if test="${critc:isP('ExampleDataimportImport')}">
		<p
			style="margin: 0; opacity: .8; filter: alpha(opacity = 80); font-size: 18px; font-weight: 600;">
			导入流程:&nbsp;</p>
			<div class="cd-horizontal-timeline mt-timeline-horizontal"
				data-spacing="125">
				<div class="timeline">
					<div class="events-wrapper">
						<div class="events">
							<ol>
							<li><a href="#0" data-date="1/01/2017"
									class="border-after-red bg-after-red selected" style="pointer-events: auto" onclick="delStudent()">清除数据</a></li>
								<li><a href="#0" data-date="3/01/2017"
									class="border-after-red bg-after-red"
									style="pointer-events: auto;" onclick="downloadModel()" >模板下载</a></li>
								<li><a href="#0" data-date="5/01/2017"
									class="border-after-red bg-after-red"
									style="pointer-events: auto;"
									onclick="document.getElementById('textSelectFilePath').click()" id="selectFile">选择文件</a>
									<input style="display: none;" type="file"
										id="textSelectFilePath" name="file"
										accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" />
										</li>
								<li><a href="#0" data-date="7/01/2017"
									class="border-after-red bg-after-red" onclick="uploadFile()">上传文件</a></li>
								<li><a href="#0" data-date="9/01/2017"
									class="border-after-red bg-after-red" id="btnValidateData"
									onclick="uploadValidateFile()" style="pointer-events: auto;">检验文件</a></li>
								<li><a href="#0" data-date="11/01/2017"
									class="border-after-red bg-after-red" onclick="importFile()">导入数据</a></li>
								
							</ol>
							<span class="filling-line bg-red" aria-hidden="true"></span>
						</div>
						<!-- .events -->
					</div>
					<!-- .events-wrapper -->
					<ul class="cd-timeline-navigation mt-ht-nav-icon">
						<li><a href="#0"
							class="prev inactive btn btn-outline red md-skip"> <i
								class="fa fa-chevron-left"></i>
						</a></li>
						<li><a href="#0" class="next btn btn-outline red md-skip " >
								<i class="fa fa-chevron-right"></i>
						</a></li>
					</ul>
					<!-- .cd-timeline-navigation -->
				</div>
				<!-- .timeline -->

			</div>
			<div><i class='fa fa-warning' style='color:#e8c30a;'></i>注意：清除数据为清除用户导入数据，保留初始数据。</div><br/>
		</c:if>
	</div>
	</div>
	<div>
	<table style="font-size: 16px" id="span"></table>
	<br/>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table id="studentTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="40px">#</th>
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
							<td>${st.index+1 }</td>
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

</body>
<critc-script> <script
	src="${staticServer}/assets/metronic4.7/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script> 
	<script src="${staticServer}/assets/metronic4.7/global/plugins/horizontal-timeline/horizontal-timeline.js"
	type="text/javascript"></script> 
	<script type="text/javascript">
		var validateFlag = 0; //校验标识  0:未校验 1：校验通过 2：校验不通过
		var flagFile = false;//是否上传成功的标识
		var uploadFilePath = "";
		//选择文件提示
		var selectSpan="";
		//上传提示信息
		var uploadSpan="";
		//验证提示信息
		var validateSpan = "";
		//导入提示信息
		var importSpan="";
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

		// 删除
		var delStudent = function() {
			bootbox.confirm("你确定要清除部分数据，恢复到初始数据吗？", function(result) {
				if (result) {
					window.location = "delete.htm?backUrl=${backUrl}";
				}
			})
		}

		 //定义文件下载
		var downloadModel = function() {
			window.location.href = "${staticServer}/template/example/dataimport/example_dataimport.xlsx";
		}
		//当文件上传按妞获取焦点的时候，清空内容
		$("#selectFile").bind("focus", function() {
			$("#textSelectFilePath").val("");
			selectSpan="";
			$("#span").html(selectSpan);
		});
		//绑定当文件上传按钮内容发生改变时触发
		$("#textSelectFilePath").bind("change", function() {
			var fileName = $("#textSelectFilePath").val();
			if (fileName.lastIndexOf(".xls") < 0 && fileName.lastIndexOf(".xlsx") < 0) {
				//提示文件级错误
				selectSpan ="<tr><td>第一步：选择文件</td><td><i class='fa fa-close' style='color:red;'></i>&nbsp;&nbsp;<td>文件格式不正确,无法上传!</td></tr>";
				$("#span").html(selectSpan);
				$("#textSelectFilePath").val("");
				return;
			}else{
				selectSpan = "<tr><td>第一步：选择文件</td><td><i class='fa fa-check' style='color:green;'></i>&nbsp;&nbsp;</td><td></td></tr>";
				$("#span").html(selectSpan);
			}
		})
		//上传文件
		function uploadFile() {
			validateFlag = 0; //上传文件后，校验标识重置
			uploadSpan="";//上传提示重置
			var filePath = $('#textSelectFilePath').val();
			if (filePath == "") {
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定'
						}
					},
					message : '请选择文件'
				});
				uploadSpan ="<tr><td>第二步：上传文件</td><td><i class='fa fa-close' style='color:red;'></i>&nbsp;&nbsp;</td><td>请选择文件</td></tr>"
				$("#span").html(selectSpan+uploadSpan);
				return;
			}
			var formData = new FormData();
			formData.append("file", document.getElementById("textSelectFilePath").files[0]);
			$.ajax({
				type : 'POST',
				url : '${dynamicServer}/example/dataimport/uploadFile.htm',
				dataType : 'json',
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(result) {
					flagFile = true;
					uploadFilePath = result.createFilename;
					bootbox.alert({
						buttons : {
							ok : {
								label : '确定'
							}
						},
						message : result.msgText
					});
					uploadSpan ="<tr><td>第二步：上传文件</td><td><i class='fa fa-check' style='color:green;'></i>&nbsp;&nbsp;</td><td></td></tr>"
					$("#span").html(selectSpan+uploadSpan);
					return;
				},
				failure : function(result) {
					$('#textSelectFilePath').val('');
					bootbox.alert({
						buttons : {
							ok : {
								label : '确定'
							}
						},
						message : result.msgText
					});
					uploadSpan ="<tr><td>第二步：上传文件</td><td><i class='fa fa-close' style='color:red;'></i>&nbsp;&nbsp;</td><td>"+result.msgText+"</td</tr>"
					$("#span").html(selectSpan+uploadSpan);
				}
			});
		}
		//校验上传的文件
		function uploadValidateFile() {
			//验证提示信息
			validateSpan = "";
			if ($('#textSelectFilePath').val() == "") {
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定'
						}
					},
					message : '请先选择文件上传'
				});
				validateSpan ="<tr><td>第三步：检验文件</td><td><i class='fa fa-close' style='color:red;'></i>&nbsp;&nbsp;</td><td>请先选择文件上传</td></tr>";
				$("#span").html(selectSpan+uploadSpan+validateSpan);
				return;
			}
			if (flagFile == false) {
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定'
						}
					},
					message : '上传文件失败或未上传文件，无法检验，请重新上传！'
				});
				validateSpan = "<tr></td><td>第三步：检验文件</td><td><i class='fa fa-close' style='color:red;'></i><td>&nbsp;&nbsp;</td><td>上传文件失败或未上传文件，无法检验，请重新上传！</td></tr>";
				$("#span").html(selectSpan+uploadSpan+validateSpan);
				return;
			}
			$.ajax({
				type : 'POST',
				url : 'validateFile.htm',
				dataType : 'json',
				data : {
					uploadFilePath : uploadFilePath
				},
				success : function(result) {
					if (result.success) {
						validateFlag = 1;//通过
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定'
								}
							},
							message : '校验成功'
						});
						validateSpan ="<tr><td>第三步：检验文件</td><td><i class='fa fa-check' style='color:green;'></i>&nbsp;&nbsp;</td><td></td></tr>";
						$("#span").html(selectSpan+uploadSpan+validateSpan);
						return;
					} else {
						validateFlag = 2; //未通过
						var resultString = result.msgText;
						var firstString = "";
						var otherString = "";
						if(resultString.indexOf("<br/>") > 0 ){
							//返回数据检验结果，第一行在第三步提示信息后面显示，其他结果新加一行在下面显示
							 firstString = resultString.substring(0,resultString.indexOf("<br/>"));
							 otherString = resultString.substring(resultString.indexOf(">")+1);
						}else{
							firstString = resultString;
						}
						
						validateSpan = "<tr><td>第三步：检验文件</td><td><i class='fa fa-close' style='color:red;'style='width:'10px''></i>&nbsp;&nbsp;</td><td>"+firstString+"</td></tr>";
						if(otherString !=""){
							validateSpan +="<tr><td></td><td>&nbsp;&nbsp;</td><td id='valiResult'>"+otherString+"</td></tr>";
						}
						$("#span").html(selectSpan+uploadSpan+validateSpan);
					}
				}

			});

		}
		//导入
		var importFile = function() {
			importSpan = "";
			if (uploadFilePath == "") {
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定'
						}
					},
					message : '请先上传文件'
				});
				importSpan = "<tr><td>第四步：导入数据</td><td><i class='fa fa-close' style='color:red;'></i>&nbsp;&nbsp;</td><td>请先上传文件</td></tr>";
				$("#span").html(selectSpan+uploadSpan+validateSpan+importSpan);
				return;
			}
			if (validateFlag == 0) {
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定'
						}
					},
					message : '请先校验上传文件'
				});
				importSpan = "<tr><td>第四步：导入数据</td><td><i class='fa fa-close' style='color:red;'></i>&nbsp;&nbsp;</td><td>请先校验上传文件</td></tr>";
				$("#span").html(selectSpan+uploadSpan+validateSpan+importSpan);
				return;
			} else if (validateFlag == 2) {
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定'
						}
					},
					message : '检验不通过，请修改'
				});
				importSpan = "<tr><td>第四步：导入数据</td><td><i class='fa fa-close' style='color:red;'></i>&nbsp;&nbsp;</td><td>检验不通过，请修改</td></tr>";
				$("#span").html(selectSpan+uploadSpan+validateSpan+importSpan);
				return;
			}

			$.ajax({
				type : 'POST',
				url : 'importFile.htm',
				dataType : 'json',
				data : {
					uploadFilePath : uploadFilePath,
					no:$("#txtStudentno").val(),
					name:$("#txtStudentname").val(),
					collegeNo:$("#cmbCollegeNo").val(),
					majorNo:$("#cmbMajorNo").val()
				},
				success : function(result) {
					bootbox.alert({
						buttons : {
							ok : {
								label : '确定'
							}
						},
						message : '导入成功'
					});
						importSpan = "<tr><td>第四步：导入数据</td><td><i class='fa fa-check' style='color:green;'></i>&nbsp;&nbsp;</td><td></td></tr>";
						$("#span").html(selectSpan+uploadSpan+validateSpan+importSpan);
						 var tableObj = document.getElementById('studentTable');
						 //保留标题，删除表中其他数据
						 $("#studentTable tr:gt(0)").remove();
					     for(var i= 0;i<result.listAdd.length;i++){
					    	 var row = tableObj.insertRow(i+1);
					    	 row.insertCell(0).innerHTML=i+1;
					    	 row.insertCell(1).innerHTML=result.listAdd[i].no;
					    	 row.insertCell(2).innerHTML=result.listAdd[i].name+"&nbsp;<span class='badge badge-default' style='background-color:#36c6d3'> 新 </span>";
					    	 if(result.listAdd[i].sex=='0'){
					    		 row.insertCell(3).innerHTML='男';
					    	 }else{
					    		 row.insertCell(3).innerHTML='女';
					    	 }
					    	 row.insertCell(4).innerHTML=result.listAdd[i].idcardNo;
					    	 row.insertCell(5).innerHTML=result.listAdd[i].collegenameMajorname;
					    	 row.insertCell(6).innerHTML=result.listAdd[i].remark;
					     }
					     for(var i= 0;i<result.listBefore.length;i++){
					    	 var row = tableObj.insertRow(result.listAdd.length+1+i);
					    	 row.insertCell(0).innerHTML=result.listAdd.length+1+i;
					    	 row.insertCell(1).innerHTML=result.listBefore[i].no;
					    	 row.insertCell(2).innerHTML=result.listBefore[i].name;
					    	 if(result.listBefore[i].sex=='0'){
					    		 row.insertCell(3).innerHTML='男';
					    	 }else{
					    		 row.insertCell(3).innerHTML='女';
					    	 }
					    	 row.insertCell(4).innerHTML=result.listBefore[i].idcardNo;
					    	 row.insertCell(5).innerHTML=result.listBefore[i].collegenameMajorname;
					    	 row.insertCell(6).innerHTML=result.listBefore[i].remark;
					     }
					     return;
				},
				failure:function(){
					bootbox.alert({
						buttons : {
							ok : {
								label : '确定'
							}
						},
						message : '导入失败'
					});
					importSpan = "<tr><td>第四步：导入数据</td><td><i class='fa fa-close' style='color:red;'></i>&nbsp;&nbsp;</td><td>"+result.msgText+"</td></tr>";
					$("#span").html(selectSpan+uploadSpan+validateSpan+importSpan);
				}
			});
		}
	</script> </critc-script>