/*
 * 后退
 */
function back(){
	location.href="findList.do"
}
function checkMenu(obj){
	var td=$(obj).parent().parent().next("td");
	var $obj;
	$obj=td.find("input[type='checkbox']");
	for(var i=0;i<$obj.size();i++){
		var o=$obj.get(i);
		o.checked = obj.checked;
	}
}
