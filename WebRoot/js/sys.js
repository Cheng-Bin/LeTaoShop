function all_select(elements) {
	for (i = 0; i < elements.length; i++) {
		elements[i].checked = true;
	}
}
function other_select(elements) {
	for (i = 0; i < elements.length; i++) {
		if (elements[i].checked) {
			elements[i].checked = false;
		} else {
			elements[i].checked = true;
		}
	}
}

function fangxuan(form) {

	var flag = form.checked;
	
	$("input[type=checkbox]").each(function() {
		$(this).attr("checked", flag);
	});
}

function del() {
	var flag = false;
	var names = document.getElementsByName("ids");
	for (var i = 0; i < names.length; i++) {
		if (names[i].checked == true) {
			flag = true;
			break;
		}
	}
	
	if (flag == false) {
		alert("请至少选择一条记录");
		return false;
	}
	
	if (confirmDialog() == true) {
		return true; 
	}
		
	return false;
}

function confirmDialog() {
	if (confirm("确定要删除选择的记录？")) {
		return true;
	} else {
		return false;
	}
}