package com.go.service.sign;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.go.po.common.PageBean;
import com.go.service.base.BaseService;

/**
 * 签到逻辑层类
 * @author linyb
 * @date 2015-6-4下午9:51:14
 */
@Service
public class SignService extends BaseService{

	public PageBean<Map<String, Object>> findList(Map<String, Object> parameter) {
		return this.getBaseDao().findPageBean("class.findcount", "class.findlist", parameter);
	}
	public Map<String,Object> load(Map<String, Object> parameter) {
		return (Map<String, Object>) this.getBaseDao().findOne("class.load", parameter);
	}
	public void updateSign(Map<String, Object> parameter) {
		this.getBaseDao().update("class.updateSign", parameter);
	}
	public void updateStatus(Map<String, Object> parameter) {
		this.getBaseDao().update("class.updateStatus", parameter);
		
	}

}
