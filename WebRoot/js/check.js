/*检测空值*/
function checkEmpty(dom, message) {
	dom.next().empty();      //删除子节点
	if ($.trim(dom.val()).length == 0) {	
		dom.after(createEmpySpanText(message));
		return false;
	}
	
	return true;
}

function createEmpySpanText(name) {
	return $("<span/>").css("color","red").html("&nbsp;&nbsp;对不起，"+name+"名称不能为空！");
}




/*添加检测*/
function loadData(dom, url, params, form, message) {
	dom.next().empty();      //删除子节点
	if ($.trim(dom.val()).length == 0) {	
		dom.after(createEmpySpan(message));
		return false;
	}
	
	$.post(url, params, 
			function(data) {
				result = data.exists;
				if (result == 0) {
					form.submit();
				} else {
					dom.after(createExitsSpan(message));
					return false;
				}
	}, "json");
	
	return false;
}


function createEmpySpan(name) {
	return $("<span/>").css("color","red").html("&nbsp;&nbsp;对不起，此"+name+"名称不能为空！");
}

function createSpan(name) {
	return $("<span/>").css("color","#FF0000").html("&nbsp;&nbsp;恭喜，可以添加此"+name);
}

function createExitsSpan(name) {
	return $("<span/>").css("color","red").html("&nbsp;&nbsp;对不起，此"+name+"已经存在！");
}


/*修改检测*/
function loadData_edit(dom, url, params, form, message) {
	dom.next().empty();      //删除子节点
	if ($.trim(dom.val()).length == 0) {	
		dom.after(createEmpySpan2(message));
		return false;
	}
	
	$.post(url, params, 
			function(data) {
				result = data.exists;
				if (result == 0) {
					form.submit();
				} else {
					dom.after(createExitsSpan2(message));
					return false;
				}
	}, "json");
	
	return false;
}


function createEmpySpan2(name) {
	return $("<span/>").css("color","red").html("&nbsp;&nbsp;对不起，此"+name+"名称不能为空！");
}

function createSpan2(name) {
	return $("<span/>").css("color","#FF0000").html("&nbsp;&nbsp;恭喜，可以添加此"+name);
}

function createExitsSpan2(name) {
	return $("<span/>").css("color","red").html("&nbsp;&nbsp;对不起，此"+name+"已经存在！");
}