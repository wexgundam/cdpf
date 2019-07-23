<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<head>
<title>表单验证</title>
</head>
<link
	href="${staticServer }/assets/example/validation/css/bootstrap-multiselect.css"
	rel="stylesheet" type="text/css" />
<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页</a></li>
			<li>>示例代码</li>
			<li>>表单验证</li>
		</ul>
	</div>
	<div class="row"
		style="margin-left: 0px; margin-right: 0px; overflow-x: hidden">
		<div class="col-md-12">
			<div class="col-md-12">
				<div>
					<p class="font-dark sbold uppercase">一、基本使用</p>
				</div>
				<form class="form-horizontal" role="form" id="form">
					<div class="form-group col-md-7">
						<label for="username" class="col-md-3 control-label">用户名:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline"
								id="username" name="username" placeholder="字母数字下划线" /><label
								id="usernameTip" maxlength="16"></label>
						</div>
					</div>
					<div class="form-group col-md-5">
						<label for="name" class="col-md-3 control-label">姓名:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="name"
								name="name" maxlength="20" placeholder="汉字或字母"><label id="nameTip"></label>
						</div>
					</div>
					<div class="form-group col-md-7">
						<label for="pwd" class="col-md-3 control-label">密码:</label>
						<div class="col-md-9">
							<input type="password" class="form-control input-inline" id="pwd"
								name="pwd" maxlength="16" placeholder="6~16位字母数字"><label id="pwdTip"></label>
						</div>
					</div>
					<div class="form-group col-md-5">
						<label for="pwdcon" class="col-md-3 control-label">确认密码:</label>
						<div class="col-md-9">
							<input type="password"
								class="form-control input-inline input-inline" id="pwdcon"
								name="pwdcon" maxlength="16" placeholder="请确认密码"><label id="pwdconTip"></label>
						</div>
					</div>
					<div class="form-group col-md-7">
						<label for="age" class="col-md-3 control-label">年龄:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="age"
								name="age" maxlength="3" placeholder="0~120"><label id="ageTip"></label>
						</div>
					</div>
					<div class="form-group col-md-5">
						<label for="email" class="col-md-3 control-label">电子邮箱:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="email"
								name="email"  placeholder="请输入电子邮箱"><label id="emailTip"></label>
						</div>
					</div>
					<div class="form-group col-md-7">
						<label for="tel" class="col-md-3 control-label">固定电话:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="tel"
								name="tel" maxlength="12" placeholder="带分机号固定电话 "><label id="telTip"></label>
						</div>
					</div>
					<div class="form-group col-md-5">
						<label for="ename" class="col-md-3 control-label">英文名:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="ename"
								name="ename" maxlength="20" placeholder="只能输入字母 "><label id="enameTip"></label>
						</div>
					</div>
					<div class="form-group col-md-7">
						<label for="phone" class="col-md-3 control-label">手机号码:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="phone"
								name="phone" maxlength="11" placeholder="请输入手机号码"><label id="phoneTip"></label>
						</div>
					</div>
					<div class="form-group col-md-5">
						<label for="postalcode" class="col-md-3 control-label">邮政编码:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline"
								id="postalcode" name="postalcode" placeholder="请输入邮政编码"><label
								id="postalcodeTip" maxlength="5"></label>
						</div>
					</div>
					<div class="form-group col-md-7">
						<label for="qq" class="col-md-3 control-label">QQ:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="qq"
								name="qq" maxlength="11" placeholder="请输入QQ"><label id="qqTip"></label>
						</div>
					</div>
					<!-- <div class="form-group col-md-5">
						<label for="ffzf" class="col-md-3 control-label">非法字符:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="ffzf"
								name="ffzf" maxlength="10" placeholder="非法字符匹配"><label id="ffzfTip"></label>
						</div>
					</div> -->
					<div class="form-group col-md-5">
						<label for="ip" class="col-md-3 control-label">IPv4地址:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="ip"
								name="ip" maxlength="20" placeholder="请输入ip地址"><label id="ipTip"></label>
						</div>
					</div>
					<div class="form-group col-md-7">
						<label for="ffzs" class="col-md-3 control-label">非负整数:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="ffzs"
								name="ffzs" placeholder="请输入非负整数"><label id="ffzsTip"></label>
						</div>
					</div>
					<div class="form-group col-md-5">
						<label for="zfxs" class="col-md-3 control-label">正负小数:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="zfxs"
								name="zfxs" placeholder="请输入正负小数"><label id="zfxsTip"></label>
						</div>
					</div>
					<div class="form-group col-md-7">
						<label for="zfzsyxs" class="col-md-3 control-label">正负整数与小数:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="zfzsyxs"
								name="zfzsyxs" placeholder="请输入正负整数与小数"><label
								id="zfzsyxsTip"></label>
						</div>
					</div>
					<div class="form-group col-md-5">
						<label for="number" class="col-md-3 control-label">数字步进器:</label>
						<div class="col-md-9">
							<input type="number" min="0" step="1"
								class="form-control input-inline" id="number" name="number"
								placeholder="0"><label id="numberTip"></label>
						</div>
					</div>
					<div class="form-group col-md-7">
						<label for="datesel" class="col-md-3 control-label">日期选择:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="datesel"
								name="datesel" placeholder="请选择日期"><label
								id="dateselTip"></label>
						</div>
					</div>
					<div class="form-group col-md-5">
						<label for="idcard" class="col-md-3 control-label ">身份证号:</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-inline" id="idcard"
								name="idcard" placeholder="请输入身份证号"><label
								id="idcardTip" maxlength="18"></label>
						</div>
					</div>
					<div class="form-group col-md-7">
						<label for="color" class="col-md-3 control-label">颜色:</label>
						<div class="col-md-7">
							<input type="color" style="width: 180px;" class="form-control"
								id="color" name="color" placeholder="点击选择颜色"><label
								id="colorTip"></label>
						</div>
					</div>
					<div class="form-group col-md-5">
						<label for="sex" class="col-md-3 control-label">性别:</label>
						<div class="col-md-4 " style='width: 53%;'>
							<select id="sex" name="sex" class="form-control">
								<option id="sexopt" value="" selected="selected">请选择</option>
								<option id="sexnan" value="1">男</option>
								<option id="sexnv" value="2">女</option>
							</select>
						</div>
						<label id="sexTip"></label>
					</div>
					<!-- <div class="form-group col-md-7">
						<label for="city" class="col-md-3 control-label">多选菜单:</label>
						<div class="col-md-4" style="width: 52%;">
							<select id="city" name="city" class="form-control multiselect"
								multiple="multiple">
								<option name=city value="1">北京</option>
								<option name=city value="2">上海</option>
								<option name=city value="3">广州</option>
							</select>
						</div>
						<label id="cityTip"></label>
					</div> -->
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-10">
							<button class="btn btn-primary" type="submit">校验</button>
							<button class="btn btn-default" type="reset">重置</button>
							<button class="btn btn-default" type="button" id="reset">清除错误信息</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-12">
				<div>
					<p class="font-dark sbold uppercase">二、手动触发验证</p>
					<p class="help-block col-md-12" style="margin-left: 7%;">点击按钮后，对上面的表单触发一次验证</p>
				</div>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<div class="col-sm-offset-1 col-sm-12">
							<button type="button" id="checkform" class="btn btn-primary">点击验证</button>
						</div>
					</div>
					<p class="help-block col-md-12" style="margin-left: 7%;">点击按钮后，对上面的表单触发一次验证，并且不会验证身份证号码</p>
					<div class="form-group">
						<div class="col-sm-offset-1 col-sm-10">
							<button type="button" id="checkform2" class="btn btn-primary">点击验证除"身份证号码"元素</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-8 text-right">
				<p>备注： 手动验证多用于异步提交表单的情况,如果验证通过再调用函数进行表单的异步提交。     </p>
			</div>
			<div class="col-md-12">
				<div>
					<p class="font-dark sbold uppercase">三、ajax验证</p>
					<p class="help-block col-md-12" style="margin-left: 7%;">点击按钮后，触发一次ajax验证，模拟数据为[work,play,look]</p>
				</div>
				<form id="ajaxform" class="form-inline" role="form"
					style="margin-left: 7%;">
					<div class="form-group col-md-12">
						<input type="text" id="data" name="data" maxlength="4"
							class="form-control control-input" placeholder="请输入模拟数据" />
						<button type="submit" id="checkform" class="btn btn-primary">点击验证</button>
						<label id="dataTip"></label>
					</div>
				</form>
			</div>

			<div class="col-md-8 form-group text-right">
				<p>备注：ajax验证多用于异步验证用户信息的情况,如果验证通过再通过回调函数进行结果判断。</p>
			</div>
			<div class="col-md-8">
				<div>
					<p class="font-dark sbold uppercase">四、为表单动态添加并触发验证</p>
					<p class="help-block col-md-12" style="margin-left: 11%;">此例为复选框选中后，电子邮件必填；不选中则为非必填项</p>
				</div>
				<form id="doform" class="form-horizontal" role="form" action="#">
					<div class="form-group">
						<label for="doname" class="col-md-3 control-label">用户名：</label>
						<div class="col-md-9">
							<input id="doname" name="doname" type="text"
								class="form-control input-inline" placeholder="字母数字下划线" value="">
							<label id="donameTip"></label>
						</div>
					</div>
					<div class="form-group" style="margin-left: 13%;">
						<div class="mt-checkbox-inline ">
							<label>是否愿意留下邮箱：</label> <label class="mt-checkbox"> <input
								type="checkbox" id="inlineCheckbox" name="inlineCheckbox"
								class="form-control" value="1">愿意<span></span>
							</label>
						</div>
					</div>
					<div class="form-group" style="display: none" id="doemaildiv">
						<label for="doemail" class="col-md-3 control-label">邮箱地址：</label>
						<div class="col-md-9">
							<input id="doemail" name="doemail" type="text"
								class="form-control input-inline" placeholder="请输入邮箱地址" value="">
							<label id="doemailTip"></label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-10">
							<button class="btn btn-primary" type="submit"
								class="btn btn-default">校验</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-8 form-group text-right">
				<p>备注：动态添加验证多用于用户信息补全的情况,动态提供表单内容，验证通过进行表单提交。</p>
			</div>
			<div class="col-md-8">
				<div>
					<p class="font-dark sbold uppercase">五、设置不允许输入的内容</p>
					<p class="help-block" style="margin-left: 12%;" >输入内容包含test时，会提示错误信息</p>
				</div>
				<form id="limitform" class="form-horizontal" role="form" action="#">
					<div class="form-group">
						<label for="limit" class="col-md-3 control-label">用户名：</label>
						<div class="col-md-9">
							<input id="limit" type="text" name="limit"
								class="form-control input-inline" placeholder="不能输入test"
								value=""> <label id="limitTip"></label>
						</div>
					<div class="col-md-12 form-group text-center">
				<p>备注：限制输入多用于需要用输入特定内容的情况。动态的监控表单内容，验证通过再进行表单提交。</p>
			</div>
					</div>
				</form>
			</div>
			
			
			
			<div class="col-md-6">
				<div>
					<p class="font-dark sbold uppercase">一、基本文本框</p>
					<p class="help-block">———显示图标和水印</p>
				</div>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-md-3 control-label" for="username">账号:</label>
						<div class=" col-md-9 input-icon form-label">
							<i class="col-md-2  fa fa-user"></i> <input
								class="col-md-6 form-control" type="text" autocomplete="off"
								name="username" id="username" placeholder="请输入账号" />
						</div>
					</div>
					<div class="form-group">
						<label class=" col-md-3 control-label">密码:</label>
						<div class="col-md-9 input-icon form-label">
							<i class="col-md-2 fa fa-lock"></i> <input
								class="col-md-6 form-control" type="password" autocomplete="off"
								name="password" id="password" placeholder="请输入密码" />
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-6 ">
				<div>
					<br /> <br /> <br />
					<p class="help-block">———不显示图标和水印</p>
				</div>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-md-3 control-label" for="username">账号:</label>
						<div class=" col-md-8 input-icon form-label">
							<input class="form-control" type="text" autocomplete="off"
								name="username" id="username" />
						</div>
					</div>
					<div class="form-group">
						<label class=" col-md-3 control-label">密码:</label>
						<div class="col-md-8 input-icon form-label">
							<input class="form-control" type="password" autocomplete="off"
								name="password" id="password" />
						</div>
					</div>
				</form>
			</div>

			<div class="col-md-12 form-group">
				<p>备注：</p>
				<p>
					1.是否显示图标由i标签的class：<i class="fa fa-user"></i>控制。
				</p>
				<p>2.是否显示水印由input控件的placeholder属性控制。</p>
			</div>

			<!-- 限制输入个数-->
			<div class="col-md-4">
				<div>
					<p class="font-dark sbold uppercase">二、限制输入个数</p>
				</div>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-md-3 control-label" for="username">账号:</label>
						<div class=" col-md-9 input-icon form-label">
							<input class="form-control" type="text" autocomplete="off"
								name="username" maxlength="6" id="username"
								placeholder="限制输入6个字符" />
						</div>
					</div>
					<div class="form-group">
						<label class=" col-md-3 control-label">密码:</label>
						<div class="col-md-9 input-icon form-label">
							<input class="form-control" type="password" autocomplete="off"
								name="password" id="password" maxlength="6"
								placeholder="限制输入6个字符" />
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-12">
				<br /> <br />
				<p>备注：</p>
				<p>限制输入字符个数由input控件的maxlength属性决定</p>
			</div>

			<!--输入框组-->
			<div class="col-md-5">
				<div>
					<p class="font-dark sbold uppercase">三、输入框组</p>
				</div>
				<form class="bs-example bs-example-form" role="form">
					<div class="input-group input-group-lg">
						<span class="input-group-addon">@</span> <input type="text"
							class="form-control" placeholder="加大">
					</div>
					<br>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="标准">
						<span class="input-group-addon">.00</span>
					</div>
					<br>
					<div class="input-group input-group-sm">
						<span class="input-group-addon">$</span> <input type="text"
							class="form-control" placeholder="缩小"> <span
							class="input-group-addon">.00</span>
					</div>
				</form>
			</div>
			<div class="col-md-4">
				<br /> <br />
				<p>备注：</p>
				<p>需要给span标签添加.input-group-addon</p>
				<p>可以通过修改span的位置和内容来修改前后组合和框组文字</p>
				<p>通过给span直接父类div添加input-group-lg、input-group-sm来修改框组的大小</p>
			</div>

			<!--输入框组加强-->
			<div class="col-md-5">
				<div>
					<p class="font-dark sbold uppercase">四、输入框组加强</p>
					<p class="help-block">———将按钮和下拉菜单作为前缀或后缀元素</p>
				</div>
				<form class="bs-example bs-example-form" role="form">
					<div class="col-lg-12">
						<div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">Go!</button>
							</span> <input type="text" class="form-control">
						</div>
					</div>
					<br /> <br /> <br />
					<div class="col-lg-12">
						<div class="input-group">
							<input type="text" class="form-control"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">Go!</button>
							</span>
						</div>
					</div>
					<br /> <br /> <br />
					<div class="col-lg-12">
						<div class="input-group">
							<div class="input-group-btn">
								<button type="button"
									class="btn btn-default 
                        dropdown-toggle"
									data-toggle="dropdown">
									下拉菜单 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">功能</a></li>
									<li><a href="#">另一个功能</a></li>
									<li><a href="#">其他</a></li>
									<li class="divider"></li>
									<li><a href="#">分离的链接</a></li>
								</ul>
							</div>
							<!-- /btn-group -->
							<input type="text" class="form-control">
						</div>
					</div>
					<br /> <br /> <br />
					<div class="col-lg-12">
						<div class="input-group">
							<input type="text" class="form-control">
							<div class="input-group-btn">
								<button type="button"
									class="btn btn-default 
                        dropdown-toggle"
									data-toggle="dropdown">
									下拉菜单 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu pull-right">
									<li><a href="#">功能</a></li>
									<li><a href="#">另一个功能</a></li>
									<li><a href="#">其他</a></li>
									<li class="divider"></li>
									<li><a href="#">分离的链接</a></li>
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-12">
				<br /> <br />
				<p>备注：</p>
				<p>将按钮和下拉菜单作为前缀或后缀元素时不再是添加class .input-group-addon。</p>
				<p>添加按钮您需要使用 class .input-group-btn 来包裹按钮。</p>
				<p>在输入框组中添加带有下拉菜单的按钮，只需要简单地在一个 .input-group-btn class
					中包裹按钮和下拉菜单即可</p>
			</div>

				<div class="col-md-12">
					<p class="font-dark sbold uppercase">五、限制输入类型</p>
				</div>
			<div class="col-md-5">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-md-3 control-label" for="username">数字:</label>
						<div class=" col-md-9 input-icon form-label">
							<i class="col-md-2 glyphicon glyphicon-pencil"></i> <input
								class="col-md-6 form-control" type="number" autocomplete="off"
								min=0 max=10 step=1 value=0 placeholder="请输入数字类型" />
						</div>
					</div>
					<div class="form-group">
						<label class=" col-md-3 control-label">密码:</label>
						<div class="col-md-9 input-icon form-label">
							<i class="col-md-2 fa fa-lock"></i> <input
								class="col-md-6 form-control" type="password" autocomplete="off"
								placeholder="请输入密码" />
						</div>
					</div>
					<div class="form-group">
						<label class=" col-md-3 control-label">日期:</label>
						<div class="col-md-9 input-icon form-label">
							<i class="col-md-2 fa fa-calendar"></i> <input type="text"
								id="dateh5" readonly="readonly" class="form-control" placeholder="请选择日期"
								value="2017-09-18">

						</div>
					</div>
					<div class="form-group">
						<label class=" col-md-3 control-label">范围:</label>
						<div class="col-md-9 input-icon form-label">
							<input class="col-md-6 form-control" type="range" id="range"
								onmousemove="rangeChange()" autocomplete="off" max=10 value=0
								step=1 placeholder="请选择范围" /> <label id="show">0</label>
						</div>
					</div>
					<div class="form-group">
						<label class=" col-md-3 control-label">正则使用:</label>
						<div class="col-md-9 form-label">
							<input class="col-md-6 form-control" placeholder="匹配身份证号码"
								pattern="\d{15}|\d{18}" type="text" />
						</div>
					</div>
					<input type="submit" class="btn btn-primary"
						style="margin-left: 85%;" />
				</form>
			</div>

			<div class="col-md-6 ">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class=" col-md-3 control-label">颜色:</label>
						<div class="col-md-9 input-icon form-label">
							<i class="col-md-2 glyphicon glyphicon-adjust"></i> <input
								class="col-md-6 form-control" type="color" autocomplete="off"
								placeholder="请输入密码" />
						</div>
					</div>
					<div class="form-group">
						<label class=" col-md-3 control-label">邮箱:</label>
						<div class="col-md-9 input-icon form-label">
							<i class="col-md-2 fa fa-envelope"></i> <input
								class="col-md-6 form-control" type="email" autocomplete="off"
								placeholder="请输入邮箱地址" />
						</div>
					</div>
					<div class="form-group">
						<label class=" col-md-3 control-label">url:</label>
						<div class="col-md-9 input-icon form-label">
							<i class="col-md-2 glyphicon glyphicon-link"></i> <input
								class="col-md-6 form-control" type="url" autocomplete="off"
								placeholder="请输入url地址" />
						</div>
					</div>
					<div class="form-group">
						<label class=" col-md-3 control-label">搜索框:</label>
						<div class="col-md-9 input-icon form-label">
							<i class="col-md-2 glyphicon glyphicon-search"></i> <input
								class="col-md-6 form-control" type="search" autocomplete="off"
								placeholder="请输入关键字" />
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary"
							style="margin-left: 85%;" />
					</div>
				</form>
			</div>
			<div class="col-md-12 form-group">
				<p>备注：</p>
				<p>输入类型由input控件的type属性控制，也可用正则表达式自行控制，修改正则表达式由input的pattern控制</p>
			</div>

			<div class="col-md-12">
				<div>
					<p class="font-dark sbold uppercase">六、常用按钮类型</p>
				</div>
				<!-- 标准的按钮 -->
				<button type="button" class="btn btn-default">默认按钮</button>
				<!-- 提供额外的视觉效果，标识一组按钮中的原始动作 -->
				<button type="button" class="btn btn-primary">原始按钮</button>
				<!-- 表示一个成功的或积极的动作 -->
				<button type="button" class="btn btn-success">成功按钮</button>
				<!-- 信息警告消息的上下文按钮 -->
				<button type="button" class="btn btn-info">信息按钮</button>
				<!-- 表示应谨慎采取的动作 -->
				<button type="button" class="btn btn-warning">警告按钮</button>
				<!-- 表示一个危险的或潜在的负面动作 -->
				<button type="button" class="btn btn-danger">危险按钮</button>
				<!-- 并不强调是一个按钮，看起来像一个链接，但同时保持按钮的行为 -->
				<button type="button" class="btn btn-link">链接按钮</button>
			</div>
			<div class="col-md-12 form-group">
				<p>备注：</p>
				<p>输入类型由input控件的type属性控制，也可用正则表达式自行控制</p>
			</div>

			<div class="col-md-12">
				<div>
					<p class="font-dark sbold uppercase">七、常用按钮衍生</p>
				</div>
				<p>
					<button type="button" class="btn btn-primary btn-lg">大的原始按钮</button>
					<button type="button" class="btn btn-default btn-lg">大的按钮</button>
				</p>
				<p>
					<button type="button" class="btn btn-primary">默认大小的原始按钮</button>
					<button type="button" class="btn btn-default">默认大小的按钮</button>
				</p>
				<p>
					<button type="button" class="btn btn-primary btn-sm">小的原始按钮</button>
					<button type="button" class="btn btn-default btn-sm">小的按钮</button>
				</p>
				<p>
					<button type="button" class="btn btn-primary btn-xs">特别小的原始按钮</button>
					<button type="button" class="btn btn-default btn-xs">特别小的按钮</button>
				</p>
				<p>
					<button type="button" class="btn btn-primary btn-lg btn-block">块级的原始按钮</button>
					<button type="button" class="btn btn-default btn-lg btn-block">块级的按钮</button>
				</p>
				<p>
					<button type="button" class="btn btn-default btn-lg ">默认按钮</button>
					<button type="button" class="btn btn-default btn-lg active">激活按钮</button>
				</p>
				<p>
					<button type="button" class="btn btn-primary btn-lg ">原始按钮</button>
					<button type="button" class="btn btn-primary btn-lg active">激活的原始按钮</button>
				</p>
				<p>
					<button type="button" class="btn btn-default btn-lg">默认按钮</button>
					<button type="button" class="btn btn-default btn-lg"
						disabled="disabled">禁用按钮</button>
				</p>
				<p>
					<button type="button" class="btn btn-primary btn-lg ">原始按钮</button>
					<button type="button" class="btn btn-primary btn-lg"
						disabled="disabled">禁用的原始按钮</button>
				</p>
				<p>
					<a href="#" class="btn btn-default btn-lg" role="button">链接</a> <a
						href="#" class="btn btn-default btn-lg disabled" role="button">禁用链接</a>
				</p>
				<p>
					<a href="#" class="btn btn-primary btn-lg" role="button">原始链接</a> <a
						href="#" class="btn btn-primary btn-lg disabled" role="button">禁用的原始链接</a>
				</p>
				<p>
					<a class="btn btn-default" href="#" role="button">链接</a>
					<button class="btn btn-default" type="submit">按钮</button>
					<input class="btn btn-default" type="button" value="输入"> <input
						class="btn btn-default" type="submit" value="提交">
				</p>
				<textarea rows="2" cols="100" readonly="readonly">这4种为按钮标签，您可以在<a>、<button> 或 <input> 元素上使用按钮 class。但是建议您在 <button> 元素上使用按钮 class，避免跨浏览器的不一致性问题。</textarea>
			</div>
			<div class="col-md-12 form-group">
				<p>备注：</p>
				<p>样式均由class控制</p>
			</div>

			<div class="col-md-12">
				<div>
					<p class="font-dark sbold uppercase">八、复选框和单选框</p>
				</div>
				<form role="form">
					<div class="form-group col-md-6">
						<label>复选框</label>
						<div class="mt-checkbox-list">
							<label class="mt-checkbox"> 选项 1 <input type="checkbox"
								value="1" name="test" /> <span></span>
							</label> <label class="mt-checkbox"> 选项 2 <input type="checkbox"
								value="1" name="test" /> <span></span>
							</label> <label class="mt-checkbox"> 选项 3 <input type="checkbox"
								value="1" name="test" /> <span></span>
							</label>
						</div>
					</div>
					<div class="form-group col-md-6">
						<label>外联 复选框</label>
						<div class="mt-checkbox-list">
							<label class="mt-checkbox mt-checkbox-outline"> 选项 1 <input
								type="checkbox" value="1" name="test1" /> <span></span>
							</label> <label class="mt-checkbox mt-checkbox-outline"> 选项 2 <input
								type="checkbox" value="1" name="test1" /> <span></span>
							</label> <label class="mt-checkbox mt-checkbox-outline"> 选项 3 <input
								type="checkbox" value="1" name="test1" /> <span></span>
							</label>
						</div>
					</div>
					<div class="form-group">
						<label>内联 复选框</label>
						<div class="mt-checkbox-inline">
							<label class="mt-checkbox"> <input type="checkbox"
								id="inlineCheckbox1" name="test1" value="option1"> 选项 1
								<span></span>
							</label> <label class="mt-checkbox"> <input type="checkbox"
								id="inlineCheckbox2" name="test1" value="option2"> 选项 2
								<span></span>
							</label> <label class="mt-checkbox mt-checkbox-disabled"> <input
								type="checkbox" id="inlineCheckbox3" name="test1"
								value="option3" disabled> Disabled <span></span>
							</label>
						</div>
					</div>
					<div class="form-group col-md-6">
						<label>单选框</label>
						<div class="mt-radio-list">
							<label class="mt-radio"> 选项 1 <input type="radio"
								value="1" name="test" /> <span></span>
							</label> <label class="mt-radio"> 选项 2 <input type="radio"
								value="1" name="test" /> <span></span>
							</label> <label class="mt-radio"> 选项 3 <input type="radio"
								value="1" name="test" /> <span></span>
							</label>
						</div>
					</div>
					<div class="form-group col-md-6">
						<label>外联 单选框</label>
						<div class="mt-radio-list">
							<label class="mt-radio mt-radio-outline"> 选项 1 <input
								type="radio" value="1" name="test1" /> <span></span>
							</label> <label class="mt-radio mt-radio-outline"> 选项 2 <input
								type="radio" value="1" name="test1" /> <span></span>
							</label> <label class="mt-radio mt-radio-outline"> 选项 3 <input
								type="radio" value="1" name="test1" /> <span></span>
							</label>
						</div>
					</div>
					<div class="form-group">
						<label>内联 单选框</label>
						<div class="mt-radio-inline">
							<label class="mt-radio"> <input type="radio"
								name="optionsRadios" id="optionsRadios4" value="option1" checked>
								选项 1 <span></span>
							</label> <label class="mt-radio"> <input type="radio"
								name="optionsRadios" id="optionsRadios5" value="option2">
								选项 2 <span></span>
							</label> <label class="mt-radio mt-radio-disabled"> <input
								type="radio" name="optionsRadios" id="optionsRadios6"
								value="option3" disabled> Disabled <span></span>
							</label>
						</div>
					</div>
				</form>
				<div class="col-md-12 form-group">
					<p>备注：</p>
					<p>类型均由class控制</p>
				</div>
			</div>
			<div class="col-md-6">
				<div>
					<p class="font-dark sbold uppercase">九、静态控件</p>
				</div>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">Email</label>
						<div class="col-sm-10">
							<p class="form-control-static">email@example.com</p>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="inputPassword"
								placeholder="请输入密码">
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-6 form-group">
				<p>备注：</p>
				<p>当您需要在一个水平表单内的表单标签后放置纯文本时，请在p标签上使用 class .form-control-static。








				
			</div>

			<div class="col-md-12">
				<div>
					<p class="font-dark sbold uppercase">十、验证样式</p>
				</div>
				<form class="form-horizontal" role="form">
					<div class="form-group has-warning col-md-12">
						<label class="control-label col-md-2">警告样式</label>
						<div class="col-md-4">
							<div class="input-icon right">
								<i class="fa fa-exclamation tooltips"
									data-original-title="please write a valid email"></i> <input
									type="text" class="form-control" />
							</div>
						</div>
					</div>
					<div class="form-group has-error col-md-12">
						<label class="control-label col-md-2">错误样式</label>
						<div class="col-md-4">
							<div class="input-icon right">
								<i class="fa fa-warning tooltips"
									data-original-title="please write a valid email"></i> <input
									type="text" class="form-control" />
							</div>
						</div>
					</div>
					<div class="form-group has-success col-md-12">
						<label class="control-label col-md-2">成功样式</label>
						<div class="col-md-4">
							<div class="input-icon right">
								<i class="fa fa-check tooltips"
									data-original-title="success input!"></i> <input type="text"
									class="form-control" />
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-12 form-group">
				<p>备注：</p>
				<p>样式由外层div中class .has-*控制。</p>
			</div>

			<div class="col-md-6">
				<div>
					<p class="font-dark sbold uppercase">十一、垂直表单布局</p>
				</div>
				<form class="form-horizontal" role="form">
					<div class="form-group col-md-12">
						<label for="name">名称 :</label> <input type="text"
							class="form-control" id="name" placeholder="请输入名称">
					</div>
					<div class="form-group col-md-12">
						<label for="name">名称 :</label> <input type="text"
							class="form-control" id="name" placeholder="请输入名称">
					</div>
					<div class="form-group col-md-12">
						<div class="mt-checkbox-list">
							<label class="mt-checkbox mt-checkbox-outline"> 选项 1 <input
								type="checkbox" value="1" name="test" /> <span></span>
							</label>
						</div>
					</div>
					<button type="button" class="btn btn-default">提交</button>
				</form>
			</div>
			<div class="col-md-6 form-group">
				<p>备注：</p>
				<p>基本的表单结构是 Bootstrap 自带的，个别的表单控件自动接收一些全局样式。
				<p>下面列出了创建基本表单的步骤：</p>
				<p>1. 向父 form 元素添加 role="form"。</p>
				<p>2. 把标签和控件放在一个带有 class .form-group 的div中。这是获取最佳间距所必需的。</p>
				<p>3. 向所有的文本元素 input、textarea和 select等标签中添加 class="form-control"
					。</p>
			</div>
			<div class="col-md-7">
				<div>
					<p class="font-dark sbold uppercase">十二、水平表单布局</p>
				</div>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="firstname" class="col-sm-4 control-label">名字：</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="firstname"
								placeholder="请输入名字">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-4 control-label">姓：</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="lastname"
								placeholder="请输入姓">
						</div>
					</div>
					<div class="form-group col-sm-12" style="margin-left: 33%;">
						<div class="mt-checkbox-list">
							<label class="mt-checkbox mt-checkbox-outline"> 记住我 <input
								type="checkbox" value="1" name="test" /> <span></span>
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-12">
							<button type="submit" class="btn btn-default">登录</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-5 form-group">
				<p>备注：</p>
				<p>基本的表单结构是 Bootstrap 自带的，个别的表单控件自动接收一些全局样式。
				<p>下面列出了创建基本表单的步骤：</p>
				<p>1. 向父 form 元素添加class .form-horizontal。</p>
				<p>2. 把标签和控件放在一个带有 class .form-group 的div中。这是获取最佳间距所必需的。</p>
				<p>3. 向所有的label标签中添加 class="control-label" 。</p>
			</div>

			<div class="col-md-12">
				<div>
					<p class="font-dark sbold uppercase">十三、内联表单布局</p>
				</div>
				<form class="form-inline" role="form">
					<div class="form-group">
						<label for="name">名称：</label> <input type="text"
							class="form-control" id="name" placeholder="请输入名称">
					</div>
					<div class="form-group">
						<label class="sr-only" for="inputfile">文件输入</label> <input
							type="file" id="inputfile">
					</div>
					<div class="form-group">
						<div class="mt-checkbox-inline">
							<label> 记住我 <input type="checkbox" value="1" name="test" />
								<span></span>
							</label>
						</div>
					</div>
					<button type="submit" class="btn btn-default">提交</button>
				</form>
			</div>
			<div class="col-md-8 form-group">
				<p>备注：</p>
				<p>下面列出了创建内联表单的步骤：</p>
				<p>1. 向父 form 元素添加class .form-inline。</p>
				<p>2. 把标签和控件放在一个带有 class .form-group 的div中。这是获取最佳间距所必需的。</p>
				<p>3. 默认情况下，Bootstrap 中的 input、select 和 textarea 有 100%
					宽度。在使用内联表单时，您需要在表单控件上设置一个宽度。</p>
				<p>4. 使用 class .sr-only，您可以隐藏内联表单的标签。</p>
			</div>
		</div>
	</div>
</body>
<critc-script> <!-- jQuery Validate表单验证相关JS --> <script
	src="${staticServer}/assets/example/validation/js/jquery.validate.js"></script>
<script
	src="${staticServer}/assets/example/validation/js/messages_zh.js"></script>
<script
	src="${staticServer}/assets/example/validation/js/bootstrap-multiselect.js"></script>
<script
	src="${staticServer}/assets/example/validation/js/regularExpress.js"></script>
<script>
	$.validator.setDefaults({//只校验，不提交
		debug : true
	});
	$('#datesel').datetimepicker({
		lang : 'ch',
		timepicker : false,
		format : 'Y-m-d'
	});
	$('#dateh5').datetimepicker({
		lang : 'ch',
		timepicker : false,
		format : 'Y-m-d'
	});
	$("#reset").click(function() {
		validator.resetForm();
	});
	var validator = $("#form").validate({
		ignore : ".ignore",
		nsubmit : false,
		onfocusout : false,
		onkeyup : function(element) {
			$(element).valid();
		},
		focusInvalid : true,
		errorElement : "label",
		errorClass : "valiError",
		errorPlacement : function(error, element) {
			error.appendTo($("#" + element.attr('id') + "Tip"));
		},
		submitHandler : function(form) { //表单提交句柄,为一回调函数，带一个参数：form   
			alert("提交表单");
			form.submit(); //提交表单
		},

		rules : {
			username : {
				required : true,
				maxlength : 10,
				usernameCheck : true
			},
			name : {
				required : true,
				maxlength : 10,
				nameCheck : true
			},
			pwd : {
				required : true,
				maxlength : 16,
				pwdCheck : true
			},
			pwdcon : {
				required : true,
				equalTo : "#pwd"
			},
			age : {
				required : true,
				ageCheck : true
			},
			email : {
				required : true,
				emailCheck : true
			},
			tel : {
				required : true,
				telCheck : true
			},
			phone : {
				required : true,
				phoneCheck : true
			},
			ename : {
				required : true,
				enameCheck : true
			},
			postalcode : {
				required : true,
				postalcodeCheck:true
			},
			qq : {
				required : true,
				qqCheck : true
			},
			ffzf : {
				required : true,
				charCheck : true

			},
			ip : {
				required : true,
				ipCheck : true
			},
			ffzs : {
				required : true,
				ffzsCheck : true
			},
			zfzsyxs : {
				required : true,
				zfzshxsCheck : true
			},
			zfxs : {
				required : true,
				zfxsCheck : true
			},
			number : {
				required : true
			},
			datesel : {
				required : true,
				dateISO : true
			},
			idcard : {
				required : true,
				idcardCheck : true
			},
			color : {
				required : true
			},
			sex : {
				required : true
			}
		},
		messages : {
			username : {
				required : "请输入用户名",
				maxlength : "不超过10位"
			},
			name : {
				required : "请输入姓名",
				maxlength : "不超过10位"
			},
			pwd : {
				required : "请输入密码",
				maxlength : "不超过16位",
			},
			pwdcon : {
				required : "请重复密码",
				equalTo : "密码不一致"
			},
			age : {
				required : "请输入年龄"
			},
			email : {
				required : "请输入邮箱"
			},
			tel : {
				required : "请输入固定电话"
			},
			phone : {
				required : "请输入手机号"
			},
			ename : {
				required : "请输英文名"
			},
			postalcode : {
				required : "请输入邮编"
			},
			qq : {
				required : "请输入QQ号"
			},
			ffzf : {
				required : "非法字符"
			},
			ip : {
				required : "请输入IP"
			},
			ffzs : {
				required : "非负整数"
			},
			zfzsyxs : {
				required : "输整数小数"
			},
			zfxs : {
				required : "正负小数"
			},
			number : {
				required : "数字步进器"
			},
			datesel : {
				required : "请选择日期",
				dateISO : "YYYY-MM-DD"
			},
			idcard : {
				required : "输身份证号"
			},
			color : {
				required : "请选择颜色"
			},
			sex : {
				required : "请选择性别"
			},
			city : {
				required : "请选择城市"
			}
		},
		submitHandler : function(form) {
			alert("表单提交！");
			form.submit();
		}
	});
	//批量正则验证添加，详情查看regularExpress.js
	regularArr({
			"postalcodeCheck":postalcodeExp,
			"usernameCheck":usernameExp,
			"nameCheck":nameExp,
			"pwdCheck":pwdExp,
			"ageCheck":ageExp,
			"emailCheck":emailExp,
			"telCheck":telExp,
			"phoneCheck":phoneExp,
			"enameCheck":enameExp,
			"qqCheck":qqExp,
			"charCheck":ffzfExp,
			"ipCheck":ipExp,
			"ffzsCheck":ffzsExp,
			"zfxsCheck":zfxsExp,
			"zfzshxsCheck":zfzshxsExp,
			"idcardCheck":idcardExp,
			"zfzshxsCheck":zfzshxsExp,
			"limitCheck":limitExp
	});

	//下拉框多选实现js
	$(document).ready(function() {
		$('.multiselect').multiselect({
			buttonClass : 'btn',
			buttonWidth : 'auto',
			buttonText : function(options) {
				if (options.length == 0) {
					return '请选择城市';
				} else {
					var selected = '';
					options.each(function() {
						selected += $(this).text() + ',';
					});
					return selected.substr(0, selected.length - 1);
				}
			},
		});
	});
	//手动验证
	$("#checkform").bind("click", function() {
		$("#form").submit();
	});
	//验证除了身份证号码元素
	$("#checkform2").bind("click", function() {
		validator.resetForm();
		$("#idcard").addClass("ignore");
		$("#form").submit();
		$("#idcard").removeClass("ignore");
	});
	//ajax验证
	$("#ajaxform").validate({
		nsubmit : true,
		debug : true,
		onfocusout : false,
		onkeyup : false,
		errorElement : "label",
		errorClass : "valiError",
		errorPlacement : function(error, element) {
			error.appendTo($("#" + element.attr('id') + "Tip"));
		},
		submitHandler : function(form) { //表单提交句柄,为一回调函数，带一个参数：form   
			alert("提交表单");
			form.submit(); //提交表单
		},
		rules : {
			data : {
				required : true,
				maxlength : 4,
				remote : {
					url : "ajaxcheck.htm", //后台处理程序
					type : "post", //数据发送方式
					dataType : "json", //接受数据格式    
					data : { //要传递的数据
						data : function() {
							return $("#data").val();
						}
					},
					success : function(result) {
						alert(result.msgText);
					},
					error : function() {
						alert("发送失败！");
					}
				}
			}
		},
		messages : {
			data : {
				required : "请输入模拟数据",
				maxlength : "不能超过4位字符"
			}
		},
		submitHandler : function(form) {
			alert("表单提交！");
			form.submit();
		}
	});
	//动态添加并触发验证
	$("#doform").validate({
		nsubmit : false,
		debug : true,
		onfocusout : false,
		onkeyup : function(element) {
			$(element).valid();
		},
		errorElement : "label",
		errorClass : "valiError",
		errorPlacement : function(error, element) {
			error.appendTo($("#" + element.attr('id') + "Tip"));
		},
		submitHandler : function(form) { //表单提交句柄,为一回调函数，带一个参数：form   
			alert("提交表单");
			form.submit(); //提交表单
		},
		rules : {
			doname : {
				required : true,
				usernameCheck : true,
			},
			doemail : {
				required : true,
				emailCheck : true
			}
		},
		messages : {
			doname : {
				required : "请输入用户名",
				usernameCheck : "用户名由字母数字下划线组成"
			},
			doemail : {
				required : "请输入邮箱地址",
				emailCheck : "请输入正确的邮箱"
			}
		},
		submitHandler : function(form) {
			alert("表单提交！");
			form.submit();
		}
	});
	//动态添加并触发验证
	$("#inlineCheckbox").bind("click", function() {
		if ($("#inlineCheckbox").is(":checked")) {
			$("#doemaildiv").css("display", "block");
		} else {
			$("#doemaildiv").css("display", "none");
		}
	});
	//限制输入
	/* $("#limit").bind("keyup",function(){
		if($("#limit").val()=='test')$("#limit").val("");
	}); */

	//限制输入
	$("#limitform").validate({
		nsubmit : false,
		debug : true,
		onfocusout : false,
		onkeyup : function(element) {
			$(element).valid();
		},
		errorElement : "label",
		errorClass : "valiError",
		errorPlacement : function(error, element) {
			error.appendTo($("#" + element.attr('id') + "Tip"));
		},
		submitHandler : function(form) { //表单提交句柄,为一回调函数，带一个参数：form   
			alert("提交表单");
			form.submit(); //提交表单
		},
		rules : {
			limit : {
				required : true,
				maxlength : 10,
				limitCheck : true
			}
		},
		messages : {
			limit : {
				required : "请输入字符串",
				maxlength : "不能超过10位字符",
				limitCheck : "不能输入test"
			}
		},
		submitHandler : function(form) {
			alert("表单提交！");
			form.submit();
		}
	});
</script> </critc-script>