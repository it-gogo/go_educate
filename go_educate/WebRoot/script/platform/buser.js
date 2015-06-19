/*
 * 后退
 */
function back(){
	location.href="findList.do"
}

function checkText(obj){
	var id=$("#ID").val();
	var text=obj.value;
	$.ajax({
		url:"checkText.do",
		data:"ID="+id+"&TEXT="+text,
		success:function(data){
			var json=eval("("+data+")");
			if (json.message) {
				check(true,"",obj);
			}else{
				check(false,json.error,obj);
			}
		}
	});
}