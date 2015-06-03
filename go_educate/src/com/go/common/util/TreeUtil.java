package com.go.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class TreeUtil {
	public static List<Map<String,Object>> createMenuTree(List<Map<String,Object>> list){
		List<Map<String,Object>> arraylist = new ArrayList<Map<String,Object>>();
		Map<Object,Map<String,Object>> m=new HashMap<Object,Map<String,Object>>();
		for(Map<String,Object> map:list){
			Object SERIES=map.get("SERIES");
			if(SERIES!=null && "1".equals(SERIES.toString())){
				m.put(map.get("ID"), map);
			}
		}
		for(Map<String,Object> map:list){
			Object PID=map.get("PID");
			if(PID!=null){
				Map<String,Object> mm=m.get(PID);
				if(mm!=null){
					List<Map<String,Object>> ll=(List) mm.get("list");
					if(ll==null){
						ll=new ArrayList<Map<String,Object>>();
						mm.put("list",ll);
					}
					ll.add(map);
				}
			}
		}
		arraylist=mapTransitionList(m);
		return arraylist;
	}
	//map转换成lisy
	private static List<Map<String,Object>>  mapTransitionList(Map<Object,Map<String,Object>> map) {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Iterator<Object> iter = map.keySet().iterator(); //获得map的Iterator
		while(iter.hasNext()) {
			Object key =iter.next();
			list.add(map.get(key));
		}
		return list;
	}
}
