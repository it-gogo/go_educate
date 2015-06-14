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
	window.open("lookTimetable.do?USERID="+id);
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