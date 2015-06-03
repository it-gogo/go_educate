package com.go.po.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 树对象
 * @author Administrator
 *
 */
public class TreePo {

	private Object  id;
	
	private Object  pid;
	
	private String  text;
	
	private String state;
	
	private Map<String,Object>  attr;
	
	
	
	private List<TreePo>  children = new ArrayList<TreePo>();


	public Object getId() {
		return id;
	}

	public void setId(Object id) {
		this.id = id;
	}

	public Object getPid() {
		return pid;
	}

	public void setPid(Object pid) {
		this.pid = pid;
	}

	public Map<String, Object> getAttr() {
		return attr;
	}

	public void setAttr(Map<String, Object> attr) {
		this.attr = attr;
	}

	public List<TreePo> getChildren() {
		return children;
	}

	public void setChildren(List<TreePo> children) {
		this.children = children;
	}
	
	public void  addChildren(TreePo po){
		this.children.add(po);
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
//	public  String toString(){
//		return  "{\"id\":"+id+",\"text\":\""+text+"\"," +
//				"\"pid\":"+pid+"," +
//						//"\"checked\":" +checkbox+","+
//				"\"attributes\":"+attr+","+
//				"\"children\":"+children+"}";
//		
//	}

	
	
	
	
}
