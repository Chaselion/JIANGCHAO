function getUrlParam(searchStr, name) {
	var reg= new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = searchStr.match(reg);
	if (r != null) {
		//return unescape(r[2]); 
		return decodeURIComponent(r[2]); 
	}
	return "";
}