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
function elective(id){
	location.href="add.do?SEMESTERID="+id;
}

/**
 * 导入数据
 */
function load(id,electiveid){
	location.href="load.do?ID="+id+"&ELECTIVEID="+electiveid;
}