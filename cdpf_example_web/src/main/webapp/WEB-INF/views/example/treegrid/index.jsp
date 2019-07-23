<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>TreeGrid</title>
    <critc-css>
        <link href="${staticServer}/assets/treetable/treeTable.min.css?version=${versionNo}" rel="stylesheet"
              type="text/css"/>
    </critc-css>
</head>

<body>
<!-- BEGIN PAGE BAR -->
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >代码示例
        </li>
        <li>
            >TreeGrid
        </li>
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
                    <td>
                        <button class="btn btn-primary" id="btnSearch">
                            <i class="fa fa-search"></i> 刷新
                        </button>
                            <button type="button" class="btn btn-success" id="btnAdd">
                                <i class=" fa fa-plus bigger-110"></i> 新增
                            </button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table id="treeTable" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th width=100>列1</th>
                <th width=100>列2</th>
                <th  width=100>列3</th>
                <th width=100>列4</th>
                <th style="text-align: center;" width=80>排序</th>
                <th width="241">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list }" var="tree" varStatus="st">
                <tr id="${tree.id}" pId="${tree.parentId}">
                    <td>${tree.name}</td>
                    <td>${tree.code}</td>
                    <td>${tree.col1}</td>
                    <td>${tree.col2}</td>
                    
                    <td style="text-align: center;">${tree.displayOrder}</td>
                    <td>
                            <a href="toUpdate.htm?id=${tree.id}&backUrl=${backUrl}"> 修改</i>
                            </a>
                        <a href="javascript:delModule(${tree.id });"> 删除 </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-md-12">${ pageNavigate.pageModel}</div>
</div>
</body>
<critc-script>
    <script src="${staticServer }/assets/treetable/jquery.treeTable.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $("#btnSearch").bind('click', searchModule);
            $("#btnAdd").bind('click', addNode);
            $("#treeTable").treeTable({
                expandLevel: 3
            });
        })

        // 查询方法
        var searchModule = function () {
            var url = "index.htm?";
            window.location = encodeURI(url);
        }
        // 删除
        var delModule = function (id) {
            bootbox.confirm("你确定要删除该节点吗？", function (result) {
                if (result) {
                    window.location = "delete.htm?id=" + id + "&backUrl=${backUrl}";
                }
            })
        }
        //新增
        var addNode = function (id) {
            window.location = 'toAdd.htm?backUrl=${backUrl }';
        }
        
    </script>
</critc-script>