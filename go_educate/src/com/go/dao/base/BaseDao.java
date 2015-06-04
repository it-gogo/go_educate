package com.go.dao.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONObject;
import com.go.common.component.SqlTemplementInf;
import com.go.common.util.LogUtil;
import com.go.po.common.PageBean;
import com.go.po.common.Syscontants;

@Repository
public class BaseDao  {

	@Resource
	private SqlSessionTemplate sqlSession;
	
	@Resource
	private SqlTemplementInf  sqlTemple;
	/**
	 * 获取列表,封装参数和SQL语句
	 * @param statement
	 * @param parameter
	 * @return
	 */
	public JSONObject  findListPage(String cstatement,String statement,Map<String,Object> parameter){
		JSONObject  jsonobj = new JSONObject();
		Map<String ,Object>  n_parameter = sqlTemple.createQuerySql(parameter);
		//查找总记录数
		Integer allRows = Integer.parseInt(sqlSession.selectOne(cstatement,n_parameter)+"");
		//设置分页信息
		PageBean  pb = this.setPage(n_parameter, allRows);
		n_parameter.put("pageBean", pb);
		//查找记录数量
		List<Map<String,Object>>  rows = sqlSession.selectList(statement, n_parameter);
		jsonobj.put("rows", rows);
		jsonobj.put("total", allRows);
		return  jsonobj;
	}
	
	/**
	 * 获取列表,封装参数和SQL语句
	 * @param statement
	 * @param parameter
	 * @return
	 */
	public PageBean<Map<String,Object>>  findPageBean(String cstatement,String statement,Map<String,Object> parameter){
		//查找总记录数
		Integer allRows =Integer.parseInt(sqlSession.selectOne(cstatement,parameter)+"");
		//设置分页信息
		PageBean<Map<String,Object>>  pb = this.setPage(parameter, allRows);
		parameter.put("pageBean", pb);
		List<Map<String,Object>>  rows = sqlSession.selectList(statement, parameter);
		pb.setList(rows);
		return  pb;
	}
	
	
	
	private  PageBean<Map<String,Object>>  setPage(Map<String,Object> parameter,Integer allRows){
		Object page = parameter.get(Syscontants.PAGE_PARAMETER);
		Object rows = parameter.get(Syscontants.ROWS_PARAMETER);
		PageBean<Map<String,Object>>  pb = new PageBean<Map<String,Object>>();
		int n_page =pb.getPage();
		int n_rows = pb.getRows();
		if(page!=null){
			n_page = Integer.parseInt(page.toString());
		}
		if(rows!=null){
			n_rows = Integer.parseInt(rows.toString());
		}
		
		//设置总记录数
		pb.setTotalRows(allRows.intValue());
		pb.setAllPageCount();
		//设置开始条数
		pb.setRows(n_rows);
		pb.setPage(n_page);
		pb.setTopRows(n_page*n_rows);
		return pb;
	}
	
	/**
     * 查找全部信息
     * @param statement
     * @param parameter
     * @return
     */
	public  List<Map<String,Object>>  findList(String statement){
		return  sqlSession.selectList(statement);
	}
	
    /**
     * 查找全部信息
     * @param statement
     * @param parameter
     * @return
     */
	public  List<Map<String,Object>>  findList(String statement,Object parameter){
		return  sqlSession.selectList(statement, parameter);
	}
	
	/**
	 * 插入数据
	 * @param statement
	 * @param parameter
	 * @return
	 */
	public  int  insert(String statement,Object parameter){
		return sqlSession.insert(statement, parameter);
	}
	
	/**
	 * 更新数据 
	 * @param statement
	 * @param parameter
	 * @return
	 */
	public  int  update(String statement,Object parameter){
		return sqlSession.update(statement, parameter);
	}
	
	/**
	 * 删除数据
	 * @param statement
	 * @param parameter
	 * @return
	 */
	public  int  delete(String statement,Object parameter){
		return sqlSession.delete(statement, parameter);
	}
	
	/** 
	 * 查找单个对象
	 * @param statement
	 * @return
	 */
	public  Object  findOne(String statement){
		return sqlSession.selectOne(statement);
	}  
	
	/**
	 * 查找单个对象,通过参数
	 * @param statement
	 * @param parameter
	 * @return
	 */
	public  Object  findOne(String statement,Object  parameter){
		return  sqlSession.selectOne(statement, parameter);
	}
	
	/**
	 * 查找单个文件
	 * @param statement
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object>  loadEntity(String statement,Object parameter){
		return  sqlSession.selectOne(statement, parameter);
	}
	
	/**
	 * 查找单个文件
	 * @param statement
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object>  loadEntity(String statement,Map<String,Object> parameter){
		Map<String,Object>  n_parameter = null;
		if(parameter!=null){
			n_parameter = this.sqlTemple.createQuerySql(parameter);
		}
		return  sqlSession.selectOne(statement, n_parameter);
	}
	
	  
    

//	public  void  tests(){
//		Map  parame = new HashMap();
//		parame.put("id", "aa");
//		List<Map> list = sqlSession.selectList("bmenu.findlist",parame);
//		LogUtil.info(this.getClass(), list);
//	}
	
	
}
