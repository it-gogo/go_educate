package com.go.po.common;

import java.util.List;
import java.util.Map;

public class PriceDz {

	private  Map<String,Object>  price;
	
	private  List<Map<String,Object>>  dzlist;

	public Map<String, Object> getPrice() {
		return price;
	}

	public void setPrice(Map<String, Object> price) {
		this.price = price;
	}

	public List<Map<String, Object>> getDzlist() {
		return dzlist;
	}

	public void setDzlist(List<Map<String, Object>> dzlist) {
		this.dzlist = dzlist;
	}
	
	
}

