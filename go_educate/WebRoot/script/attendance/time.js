/*
 * 后退
 */
function back(){
	location.href="findList.do"
}

/**
 * 添加数据之前
 * @param eform
 */
function beforeSubimt(eform){
	var obj=$("input[name='TIME']");
	for(var i=0;i<obj.size();i++){
		if(obj.eq(i).val()!=""){
			return true;
		}
	}
	jBox("至少选择一个课时。");
	return false;
}