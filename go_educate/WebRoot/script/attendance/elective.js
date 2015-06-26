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


/**
 * 保存
 * @param eform
 * @returns {Boolean}
 */
function save(eform) {
	var $obj=$(".requires","#"+eform);//必填项
	for(var i=0;i<$obj.size();i++){
		if($obj.eq(i).val()==""){
			if($obj.eq(i).hasClass("Wdate")){
				jBox.tip("请选择日期填写！");
			}else{
				jBox.tip("此项为必填项！");
				$obj.eq(i).focus();
			}
			return false;
		}
	}
	if($(".error").size()!=0){
		jBox.tip("存在错误操作，请根据提示修改。");
		return false;
	}
	 if(typeof(beforeSubimt)=='function'){
		 if(!beforeSubimt(eform)){
			 return false;
		}
     }
	$("#"+eform).submit(function() {
        $("#"+eform).ajaxSubmit({
        	clearForm: false,
        	success:function(data){
        		var json=eval("("+data+")");
        		for (var key in json){
        			if(key=="message"){//成功
        				showMsg(json[key]);
        			}else if(key=="error"){//失败
        				jBox.alert(json[key], "提示");
        			}
        			break;
        	    }
        		$("#"+eform).unbind("submit");
          	}
        }); 
        return false;
	}); 
	$("#"+eform).submit();
}