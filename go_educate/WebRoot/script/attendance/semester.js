/*
 * 后退
 */
function back(){
	location.href="findList.do"
}
/**
 * 查看课表
 * @param id
 */
function lookTimetable(id){
	window.open("lookTimetable.do?SEMESTERID="+id);
}

/**
 * 选课
 * @param id
 */
function modifyElective(id,userid){
	location.href="modifyElective.do?SEMESTERID="+id+"&USERID="+userid;
}

/**
 * 选课
 * @param id
 */
function elective(curriculumid,userid,semesterid){
	location.href="add.do?SEMESTERID="+semesterid+"&CURRICULUMID="+curriculumid+"&USERID="+userid;
}

/**
 * 导入数据
 */
function load(curriculumid,electiveid,semesterid){
	location.href="load.do?SEMESTERID="+semesterid+"&ELECTIVEID="+electiveid+"&CURRICULUMID="+curriculumid;
}

function deleteOneElective(strID){
	  var id = [];
	  id.push(strID);
	  jBox.confirm('您是否要删除当前记录？', '询问', function(v, h, f) {
		  if(v=="ok"){
			  $.ajax({
				  url:"../elective/delete.do",
				  data:"id="+id.join(','),
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