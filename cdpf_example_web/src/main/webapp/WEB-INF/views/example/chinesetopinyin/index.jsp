<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>汉字转拼音</title>
    <critc-css>
        <link
                href="${staticServer}/assets/treetable/treeTable.min.css?version=${versionNo}"
                rel="stylesheet" type="text/css" />
    </critc-css>
    <style type="text/css">
        .portlet-body {
            margin-left: 40px;
        }
    </style>
</head>

<body>
    <!-- BEGIN PAGE BAR -->
    <div class="page-bar">
        <ul class="page-breadcrumb">
            <li><i class="fa fa-home"></i> <a
                    href="${dynamicServer}/index.htm">首页</a></li>
            <li>>代码示例</li>
            <li>>汉字转拼音</li>
        </ul>
    </div>
    <div class="row" style="position: relative; top: 0px;">
        <div class="col-md-12 col-md-12">
            <div class="portlet-body">
                <div class="content">
                    <h4>
                        <b>汉字转拼音：</b>
                    </h4>
                    <div class="row">
                        <div class="col-md-5">
                            <textarea id="hanZi" class="form-control " rows=10 placeholder="请输入要转译的汉字" style="resize: none"></textarea>
                        </div>
                        <div class="col-md-5">
                            <textarea id="pinYin" class="form-control  " rows=10 readonly style="resize: none"></textarea>
                        </div>
                    </div>
                    <div class="col-md-12" style="margin: 15px 0px 0px 0px">
                        <input type="button" class="btn btn-primary"
                               id="chineseToAllPinYin" value="汉字转全拼音" style="margin: 0px 15px 0px 0px" />
                        <input type="button"
                               class="btn btn-primary" id="chineseToFirstPinYin" value="汉字转首字母大写" />
                    </div>
                    <div class="col-md-12">
                        <p>代码路径：/core/src/main/java/com/critc/example/service/ExampleChineseToPinYinService.java</p>
                        <p>
                            说明：本页提供的汉字拼音转换器，可将汉字短文转换成<b>小写全拼音</b>或者<b>首字母大写拼音</b>。
                        </p>
                        <p>
                            <b>注意：本转换器暂不提供多音字转换。</b>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<critc-script>
    <script type="text/javascript">
        $(function () {
            //汉字转全拼
            $("#chineseToAllPinYin").click(function () {
                var hanZi = $("#hanZi").val();
                var pinYin = $("#pinYin")
                if ($.trim(hanZi) == "") {
                    bootbox.alert("汉字输入框不能为空");
                    return;
                }
                $.post("${dynamicServer}/example/chinesetopinyin/convertToAllPinYin.htm", {
                    hanZi: hanZi
                }, function (data) {
                    $("#pinYin").val(data);
                }, 'json')
            });


            //汉字转首字母大写

            $("#chineseToFirstPinYin").click(function () {
                var hanZi = $("#hanZi").val();
                var pinYin = $("#pinYin")
                if ($.trim(hanZi) == "") {
                    bootbox.alert("汉字输入框不能为空");
                    return;
                }
                $.post("${dynamicServer}/example/chinesetopinyin/convertToFirstPinYin.htm", {
                    hanZi: hanZi
                }, function (data) {
                    $("#pinYin").val(data);
                }, 'json')
            });
        });
    </script>
</critc-script>