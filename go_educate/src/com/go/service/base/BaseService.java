package com.go.service.base;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.go.dao.base.BaseDao;

@Service
public class BaseService {
   
	@Resource
	private  BaseDao  baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}
}
