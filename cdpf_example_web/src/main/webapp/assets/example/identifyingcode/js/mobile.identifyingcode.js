/**
 * 多长时间后验证码失效
 */
var InterValObj; // timer变量，控制时间
var count = 30; // 间隔时间
var curCount;// 当前剩余秒数
var code = ""; // 验证码
var buttonName = "";
var sendMessage=function sendMessage1(time,btnName,phoneNoId,url1) {
	count = time;
	buttonName = btnName;
	curCount = count;
	// 设置button效果，开始计时
	$("#"+buttonName).attr("disabled", "true");
	$("#"+buttonName).val(curCount + "秒再获取");
	
	// 向后台发送处理数据
	$.ajax({
		type : "POST",
		url : url1,
		dataType:'json',
		data : "data=" + $("#"+phoneNoId).val(),
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		},
		success : function(msg) {
			bootbox.alert(msg.code);
			InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次
		}
	});
}
// timer处理函数
function SetRemainTime() {
	if (curCount == 0) {
		window.clearInterval(InterValObj);// 停止计时器
		$("#"+buttonName).val("重新获取验证码");
		$("#"+buttonName).prop("disabled", "");// 启用按钮
		code = ""; // 清除验证码。如果不清除，过时间后，输入收到的验证码依然有效
	} else {
		curCount--;
		$("#"+buttonName).val(+curCount + "秒再获取");
	}
}
