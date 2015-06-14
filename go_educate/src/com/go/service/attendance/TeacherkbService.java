package com.go.service.attendance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.go.po.common.PageBean;
import com.go.service.base.BaseService;
/**
 * 老师课表Service
 * @author Administrator
 *
 */
@Service
public class TeacherkbService extends BaseService {
	/**
	 * 分页查找数据
	 * @param parameter
	 * @return
	 */
	public  PageBean<Map<String,Object>>  findList(Map<String,Object> parameter){
		return this.getBaseDao().findPageBean("buser.findcount", "buser.findlist", parameter);
	}
	/**
	 * 查看课表
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object> findKB(Map<String,Object> parameter){
		List<Map<String,Object>> lessonList=this.getBaseDao().findList("elective.findTeacherkbLesson", parameter);//已选课时
		PageBean<Map<String,Object>> pb=this.getBaseDao().findPageBean("elective.findTeacherkbCount","elective.findTeacherkbDate", parameter);//已选日期
		List<Map<String,Object>> dateList=pb.getList();//已选日期
		List<Map<String,Object>> list=this.getBaseDao().findList("elective.findTeacherkb", parameter);//已选数据
//		Map<String,Object> res= this.getBaseDao().loadEntity("elective.findOneSemester", parameter);
		if(dateList==null || dateList.size()==0){
			return null;
		}
		int size=5;//每size天为一页
		int index=dateList.size()/size;
		List resList=new ArrayList();
		for(int i=0;i<dateList.size();i++){//遍历日期
			Map<String,Object> date=dateList.get(i);
			Object d=date.get("DATE");
			if(d==null){
				continue;
			}
			int j=i/size;
			if(resList.size()==j){
				List<Map<String,Object>> l=new ArrayList<Map<String,Object>>();
				l.add(date);
				resList.add(l);
			}else{
				((List<Map<String,Object>>)resList.get(j)).add(date);
			}
			for(Map<String,Object> vo:list){//遍历数据
				if(d.equals(vo.get("DATE"))){
					for(Map<String,Object> lesson:lessonList){//遍历课时
						Object lessonid=lesson.get("ID");
						Object lessonid1=vo.get("LESSONID");
						if(lessonid.equals(lessonid1)){
							List<Map<String,Object>> children=(List<Map<String, Object>>) date.get(lessonid);
							if(children==null){
								children=new ArrayList<Map<String, Object>>();
								date.put(lessonid.toString(), children);
							}
							children.add(vo);
						}
					}
				}
			}
		}
		Map<String,Object> res=new HashMap<String,Object>();
		res.put("lessonList",lessonList);
		pb.setList(resList);
		res.put("pb",pb);
		res.put("list",list);
		
		return res;
	}
}
