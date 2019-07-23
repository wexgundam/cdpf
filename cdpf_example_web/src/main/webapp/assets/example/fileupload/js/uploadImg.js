var imgSrc = [];
var imgFile = [];
var imgName = [];
function imgUpload(obj) {
	var oInput = '#' + obj.inputId;
	var imgBox = '#' + obj.imgBox;
	var btn = '#' + obj.buttonId;
	var form='#' + obj.formId;
	$(oInput).on("change", function() {
		var fileImg = $(oInput)[0];
		var fileList = fileImg.files;
		for (var i = 0; i < fileList.length; i++) {
			if(fileList[i].size/(1024*1024)<obj.fileSize){
				var imgSrcI = getObjectURL(fileList[i]);
				imgName.push(fileList[i].name);
				imgSrc.push(imgSrcI);
				imgFile.push(fileList[i]);
		    }else{
		    	bootbox.alert("图片"+fileList[i].name+"大小大于"+obj.fileSize+"MB,无法上传");
		    }
		}
		addNewContent(imgBox);
	});
	$(btn).bind("click",function(){
		
				for (var i =0; i < imgFile.length; i++) {
					var fd = new FormData();
					fd.append("file", imgFile[i]);
					var xhr = new XMLHttpRequest();
					xhr.open("post",obj.upUrl,false);
					xhr.send(fd);
				}
				bootbox.alert("上传完成");
	});
}
function addNewContent(obj) {
	$(imgBox).html("");
	for (var a = 0; a < imgSrc.length; a++) {
		var oldBox = $(obj).html();
		$(obj).html(
				oldBox + '<div class="imgContainer"><img title=' + imgName[a] + ' alt=' + imgName[a] + ' src=' + imgSrc[a]
						+ ' onclick="imgDisplay(this)"><p onclick="removeImg(this,' + a + ')" class="imgDelete">删除</p></div>');
	}
}
function removeImg(obj, index) {
	imgSrc.splice(index, 1);
	imgFile.splice(index, 1);
	imgName.splice(index, 1);
	var boxId = "#" + $(obj).parent('.imgContainer').parent().attr("id");
	addNewContent(boxId);
}
function imgDisplay(obj) {
	var src = $(obj).attr("src");
	var imgHtml = '<div style="width: 100%;height: 100vh;overflow: auto;background: rgba(0,0,0,0.5);text-align: center;position: fixed;top: 0;left: 0;z-index: 1000;"><img src='
			+ src
			+ ' style="margin-top: 100px;width: 70%;margin-bottom: 100px;"/><p style="font-size: 50px;position: fixed;top: 30px;right: 30px;color: white;cursor: pointer;" onclick="closePicture(this)">×</p></div>'
	$('body').append(imgHtml);
}
function closePicture(obj) {
	$(obj).parent("div").remove();
}

function getObjectURL(file) {
	var url = null;
	if (window.createObjectURL != undefined) { // basic
		url = window.createObjectURL(file);
	} else if (window.URL != undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file);
	} else if (window.webkitURL != undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file);
	}
	return url;
}