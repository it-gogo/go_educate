package com.go.service.platform;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.stereotype.Service;

import com.go.common.util.JSONUtil;
import com.go.common.util.TreeUtil;
import com.go.po.common.PageBean;
import com.go.po.common.TreePo;
import com.go.service.base.BaseService;
/**
 * 菜单Service
 * @author Administrator
 *
 */
@Service
public class BmenuService extends BaseService {

	/**
	 * 查询一个数据
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object>  findOne(Map<String,Object> parameter){
		return this.getBaseDao().loadEntity("bmenu.findone", parameter);
	}
	/**
	 * 分页查找数据
	 * @param parameter
	 * @return
	 */
	public  PageBean<Map<String,Object>>  findList(Map<String,Object> parameter){
		return this.getBaseDao().findPageBean("bmenu.findcount", "bmenu.findlist", parameter);
	}
	/**
	 * 根据条件查询所有数据
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findAll(Map<String,Object> parameter){
		return this.getBaseDao().findList("bmenu.findall", parameter);
	}
	
	/**
	 * 查询菜单树
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findTree(Map<String,Object> parameter){
		List<Map<String,Object>> list = this.getBaseDao().findList("bmenu.findtree", parameter);
		return TreeUtil.createMenuTree(list);
	}
	
	/**
	 * 加载信息
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object>  load(Map<String,Object> parameter){
		return this.getBaseDao().loadEntity("bmenu.load", parameter);
	}
	/**
	 * 添加菜单
	 * @param parameter
	 * @return
	 */
	public  void  add(Map<String,Object> parameter){
		Map  n_parameter = this.setInsertParameter(parameter);
	    this.getBaseDao().insert("bmenu.add", n_parameter);
	}
	
	/**
	 * 更新菜单
	 * @param parameter
	 */
	public  void  update(Map<String,Object> parameter){
		this.getBaseDao().update("bmenu.update", parameter);
	}
	
	/**
	 * 更新数据状态
	 * @param parameter
	 */
	public void updatestat(Map<String,Object> parameter){
		this.getBaseDao().update("bmenu.changestat", parameter);
	}
	
	/**
	 * 设置插入的参数
	 * @param parameter
	 * @return
	 */
	public Map<String,Object>  setInsertParameter(Map<String,Object>  parameter){
		Map<String,Object>  res = new HashMap<String,Object>(parameter);
		Object  pmcode = parameter.get("PMCODE");
		Integer  seq = this.getSeq();
		String   mcode = this.getMcode(pmcode);
		res.put("SEQ",seq);
		res.put("MCODE", mcode);
		res.put("SERIES", mcode.length()/3);
		return  res;
	}
	/**
	 * 删除数据
	 * @param parameter
	 */
	public  void  delete(List<String> parameter){
		this.getBaseDao().delete("bmenu.delete", parameter);
	}
	
	/**
	 * 获取序列
	 * @return
	 */
	private  Integer  getSeq(){
		Object  maxSeq = this.getBaseDao().findOne("bmenu.findMaxSeq");
		Integer seq = 0;
		if(maxSeq!=null){
			seq = (Integer)maxSeq;
		}
		return  seq+1;
	}
	
	/**
	 * 获取菜单规则代码
	 * @return
	 */
	private  String getMcode(Object  pmcode){
		String parameter = "";
		Map<String,String> parameMap = new HashMap<String,String>();
		if(pmcode!=null&&!"".equals(pmcode.toString().trim())){
			parameter +=" and PMCODE = #{PMCODE}";
		}else{
			parameter +=" and PMCODE IS NULL";
		}
		parameMap.put("parameter", parameter);
		if(pmcode!=null){
		  parameMap.put("PMCODE", pmcode.toString());
		}else{
			parameMap.put("PMCODE", "1");
		}
		
		Object maxMcode = this.getBaseDao().findOne("bmenu.findMCode", parameMap);
		String mcode = "100";
		if(maxMcode!=null&&!"".equals(maxMcode.toString().trim())){
			mcode = String.valueOf((Long.parseLong(maxMcode.toString())+1));
		}else{
			if(pmcode==null){
				pmcode="";
			}
			mcode = pmcode+mcode;
		}
		return mcode;
	}
	
	
}
