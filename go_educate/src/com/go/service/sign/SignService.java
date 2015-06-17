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

}
