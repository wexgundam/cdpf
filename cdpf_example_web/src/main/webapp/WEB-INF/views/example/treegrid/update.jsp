<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../../common/taglib.jsp"%>

<head>
<title>节点管理</title>
<critc-css>
<link href="${staticServer }/assets/zTree3.5/css/zTreeStyle/metro.css"
	rel="stylesheet" type="text/css" />
</critc-css>
</head>

<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页</a></li>
			<li>>系统管理</li>
			<li>>节点管理</li>
		</ul>
	</div>
	<h1 class="page-title">
		节点管理 <small>>>修改节点</small>
	</h1>

	<div class="row">
		<div class="col-md-8">
			<form role="form" id="treegridFrom" name="treegridFrom"
				class="form-horizontal" action="update.htm?id=${TreeGrid.id }"
				method="post">
				<input type="hidden" name="backUrl" value="${backUrl }">
				<div class="form-body">
					<div class="form-group">
						<label class="col-md-3 control-label">节点名称：</label>
						<div class="col-md-9">
							<input id="name" name="name" type="text"
								class="form-control input-inline  input-xlarge" placeholder=""
								value="${TreeGrid.name }"> <label id="nameTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">上级节点：</label>
						<div class="col-md-9">
							<div class="input-group input-xlarge">
								<input id="parentId" type="hidden" name="parentId"
									value="${TreeGrid.parentId}"> <input id="parentName"
									type="text" name="parentName" readonly="readonly"
									class="form-control " placeholder=""
									value="${TreeGrid.parentName}"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary"
										onclick="javascript:showSelTree()">
										<i class="fa fa-search" /></i> 选择
									</button>
									<label id="parentIdTip"></label>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">节点代码：</label>
						<div class="col-md-9">
							<input id="code" type="text" name="code"
								class="form-control input-inline  input-xlarge" placeholder=""
								value="${TreeGrid.code }"><label id="codeTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">描述：</label>
						<div class="col-md-9">
							<input id="description" type="text" name="description"
								class="form-control input-inline  input-xlarge" placeholder=""
								value="${TreeGrid.description }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">排序：</label>
						<div class="col-md-9">
							<input id="displayOrder" type="text" name="displayOrder"
								class="form-control input-inline  input-xlarge" placeholder=""
								value="${TreeGrid.displayOrder }"><label
								id="displayOrderTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">属性1：</label>
						<div class="col-md-9">
							<input id="col2" type="text" name="col1"
								class="form-control input-inline  input-xlarge" placeholder=""
								value="${TreeGrid.col1 }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">属性2：</label>
						<div class="col-md-9">
							<input id="col2" type="text" name="col2"
								class="form-control input-inline  input-xlarge" placeholder=""
								value="${TreeGrid.col2 }">
						</div>
					</div>
				</div>
				<div class="form-actions">
					<div class="row">
						<div class="col-md-offset-3 col-md-9">
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-save" /></i> 保存
							</button>
							<button type="button" class="btn default"
								onclick="history.back(-1)">
								<i class="fa fa-undo" /></i> 取消
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>


	<div class="modal fade" id="basic" tabindex="-1" role="basic"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title">选择上级节点</h4>
				</div>
				<div class="modal-body">
					<ul id="tree" class="ztree" style="width: 560px; overflow: auto;"></ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="javascript:getSelected();">确认</button>
					<button type="button" class="btn " data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

</body>
<critc-script> <script
	src="${staticServer }/assets/zTree3.5/js/jquery.ztree.all-3.5.min.js"
	type="text/javascript"></script> <script type="text/javascript">

        var zTree;
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pId",
                    rootPId: ""
                }
            }
        };
        var zNodes = [${ztree}];
        jQuery(document).ready(function () {
            var t = $("#tree");
            t = $.fn.zTree.init(t, setting, zNodes);
            var zTree = $.fn.zTree.getZTreeObj("tree");
        });

        function getSelected() {
            var treeObj = $.fn.zTree.getZTreeObj("tree");
            var nodes = treeObj.getSelectedNodes();
            if (nodes.length > 0) {
                $("#parentId").val(nodes[0].id);
                $("#parentName").val(nodes[0].name);
                $('#basic').modal('hide');
            }
            else return;

        }

        function showSelTree() {
            $('#basic').modal('show');
        }
        $(document).ready(function () {
            
            $("#treegridFrom").validate({
                debug: true,
                errorElement: "label",
                errorClass: "valiError",
                errorPlacement: function (error, element) {
                    error.appendTo($("#" + element.attr('id') + "Tip"));
                },
                rules: {
                    name: {
                        required: true,
                        maxlength: 40
                    },
                    code: {
                        required: true,
                        maxlength: 40
                    },
                    url: {
                        required: true,
                        maxlength: 100
                    },
                    displayOrder: {
                        required: true,
                        number: true,
                        maxlength: 10
                    },
                    description: {
                        maxlength: 50
                    }
                },
                messages: {},
                submitHandler: function (form) {
                    form.submit();
                }
            });
        });

    </script> </critc-script>