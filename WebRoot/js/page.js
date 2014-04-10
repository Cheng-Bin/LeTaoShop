function loadData(dom, url, params, form) {
	dom.innerHTML = "";
	$.post(url, params, 
			function(data) {
				result = data.exists;
				if (result == 0) {
					dom.innerHTML = "<font color='red'>购买数量不能大于库存数</font>";
					return false;
				} else {
					form.submit();
				}
	}, "json");
	
	return false;
}