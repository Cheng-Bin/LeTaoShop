// JavaScript Document

$(function(){
	var scr_height = document.documentElement.clientHeight;
	var sj_height = scr_height - 126;
	$("#left").css("height",sj_height);
	var lt_height = $("#left").height();
	var rt_height = $("#right").height();
	if(lt_height>sj_height){
		$("#left").height(sj_height);
		$("#left").css("overflow-y","scroll");
	}
	if(rt_height>sj_height){
		$("#right").height(sj_height);
		$("#right").css("overflow-y","scroll");
	}
})

function displayNav(id) {
	if(document.getElementById("left").getElementsByTagName("dl")[id].getElementsByTagName("dd")[0].style.display=="none") {
		$("#nav_"+id).nextAll().slideDown("normal");
		$("#nav_"+id).find("img").attr("src","../images/unfold.gif");
	}
	else {
		$("#nav_"+id).nextAll().slideUp("normal");
		$("#nav_"+id).find("img").attr("src","../images/fold.gif");
	}		
}

function trim(str) { // É¾³ý×óÓÒÁ½¶ËµÄ¿Õ¸ñ
	return str.replace(/(^\s*)|(\s*$)/g, "");
}








