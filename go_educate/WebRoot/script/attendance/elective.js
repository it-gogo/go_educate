/*
 * 后退
 */
function back(){
	location.href="findList.do"
}
/**
 * 选课
 * @param id
 */
function elective(id){
	location.href="add.do?ID="+id;
}

/**
 * 导入数据
 */
function load(id,electiveid){
	location.href="load.do?ID="+id+"&ELECTIVEID="+electiveid;
}
/**
 * 添加数据之前
 * @param eform
 */
function beforeSubimt(eform){
	if($("input[type='checkbox']:checked").size()==0){
		jBox("至少选择一个课时。")
		return false;
	}
	return true;
}
/**
 * 生成课表
 */
function generateTimetable(){
	jBox.confirm('您是否确定生成课表？', '询问', function(v, h, f) {
		  if(v=="ok"){
			 // location.href="generateTimetable.do";
			  $.ajax({
				  url:"generateTimetable.do",
				  success:function(data){
					  var json=eval("("+data+")");
					  for (var key in json){
						  if(key=="message"){//成功
							  showMsg(json[key]);
						  }else if(key=="error"){//失败
							  jBox.tip(json[key]);
						  }
						  break;
					  }
				  }
			  });
		  }
	  });
}