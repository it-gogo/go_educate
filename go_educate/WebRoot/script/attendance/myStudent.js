/*
 * 后退
 */
function back(){
	location.href="findList.do"
}
/**
 * 课程详情
 * @param semesterid
 */
function lookClass(semesterid){
	location.href="lookClass.do?SEMESTERID="+semesterid;
}
/**
 * 查看课表
 * @param id
 */
function lookTimetable(semesterid){
	window.open("../semester/lookTimetable.do?SEMESTERID="+semesterid);
}
/**
 * 调课
 * @param classid
 */
function transfer(classid){
	location.href="transfer.do?CLASSID="+classid;
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
	jBox("选择一个时间段。");
	return false;
}
