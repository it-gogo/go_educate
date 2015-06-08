/**
 * 添加
 */
function addxx(){
	location.href="add.do";
}
/**
 * 后退
 */
function back(){
	history.go(-1);
}
/**
 * 导入数据
 */
function loadxx(id){
	location.href="load.do?ID="+id;
}
/**
 * 提示
 * @param msg
 */
function showMsg(msg){
	jBox.alert(msg, "提示");
    setTimeout(function () {back();}, 1500);
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
//        				jBox.confirm(json[key], "提示",function(){back();});
        				showMsg(json[key]);
        			}else if(key=="error"){//失败
        				jBox.tip(json[key]);
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

/**
 * 删除单条数据
 * @param row
 */
function deleteOne(strID){
	  var id = [];
	  id.push(strID);
	  jBox.confirm('您是否要删除当前记录？', '询问', function(v, h, f) {
		  if(v=="ok"){
			  $.ajax({
				  url:"delete.do",
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
/**
 * 批量删除数据
 */
function deleteAll(){
	  var  obj = $("input[name='ID']:checked");
	    var  sns = "";
	    for(var i=0;i<obj.size();i++){
	       sns += obj.eq(i).val()+",";
	    }
	    if(sns.length!=0){
	       sns = sns.substring(0,sns.length-1);
	    }
	  if(sns==""){
		  jBox.alert('至少选择一条数据删除！', "提示");
		  return;
	  }
	  deleteOne(sns);
}
/**
 * 选择所要
 * @param obj
 */
function checkAll(obj){
	var $obj;
	$obj=$("input[type='checkbox']");
	for(var i=0;i<$obj.size();i++){
		var o=$obj.get(i);
		o.checked = obj.checked;
	}
}
function changeIsactives(id,isactives){
	$.ajax({
		url:"changeIsactives.do",
		data:"ID="+id+"&ISACTIVES="+isactives,
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

function clearData(formid){
	var obj=$("input[type='text']","#"+formid);
	for(var i=0;i<obj.size();i++){
		obj.eq(i).val("");
	}
}