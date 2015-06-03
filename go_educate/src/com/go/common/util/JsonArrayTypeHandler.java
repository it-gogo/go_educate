package com.go.common.util;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import com.alibaba.fastjson.JSONArray;


public class JsonArrayTypeHandler implements TypeHandler<JSONArray> {

	@Override
	public JSONArray getResult(ResultSet arg0, String arg1) throws SQLException {
		Object  val = arg0.getObject(arg1);
		String  str = "";
		if(val!=null&&!"".equals(val.toString())){
			str = val.toString();
		}else{
			return null;
		}
		JSONArray  array = JSONUtil.strToArray(str);
		return array;
	}

	@Override
	public JSONArray getResult(ResultSet arg0, int arg1) throws SQLException {
		Object  val = arg0.getObject(arg1);
		String  str = "";
		if(val!=null&&!"".equals(val.toString())){
			str = val.toString();
		}else{
			return null;
		}
		JSONArray  array = JSONUtil.strToArray(str);
		return array;
	}

	@Override
	public JSONArray getResult(CallableStatement arg0, int arg1)
			throws SQLException {
		Object  val = arg0.getObject(arg1);
		String  str = "";
		if(val!=null&&!"".equals(val.toString())){
			str = val.toString();
		}else{
			return null;
		}
		JSONArray  array = JSONUtil.strToArray(str);
		return array;
	}

	@Override
	public void setParameter(PreparedStatement arg0, int arg1, JSONArray arg2,
			JdbcType arg3) throws SQLException {
		String str = null;
		if(arg2!=null){
			str = JSONUtil.objToJSonStr(arg2);
		}
		arg0.setString(arg1,str);
	}

}
