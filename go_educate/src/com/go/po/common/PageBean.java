package com.go.po.common;

import java.util.List;


/**
 * 
 * 2014-03-12
 * 分页实体类
 * @author Administrator
 *
 * @param <T>
 */
public class PageBean<T> {
    
   private Integer endRowNum;//最后记录数   Last row index of this page.
	

	private Integer page = 1;//第几页   To specify index of current page.
	

	private Integer rows = 10 ;//页面记录数   To specify how many records are presented per page.
	

	private Integer startRowNum = 1;//当前页开始记录数   First row index of this page.
	

	private Integer totalPage;//总页数   To specify total number of pages.
	

	private Integer  totalRows;//总记录数量
	
	private Integer  topRows;//SQLSERVER的TOP数量
	
	private List<T> list;
	
	//是否还有前一页
	private boolean  hasPreviousPage;
	
	//是否还有后一页
	private boolean  hasNextPage;


	
	public Integer getTopRows() {
		return topRows;
	}


	public void setTopRows(Integer topRows) {
		this.topRows = topRows;
	}


	public Integer getEndRowNum() {
		return endRowNum;
	}


	public void setEndRowNum(Integer endRowNum) {
		this.endRowNum = endRowNum;
	}


	public Integer getStartRowNum() {
		return startRowNum;
	}


	public void setStartRowNum(Integer startRowNum) {
		this.startRowNum = startRowNum;
	}

	
	public Integer getPage() {
		return page;
	}


	public void setPage(Integer page) {
		this.page = page;
		this.startRowNum = (page-1)*rows;
	}


	public Integer getRows() {
		return rows;
	}


	public void setRows(Integer rows) {
		this.rows = rows;
	}


	public Integer getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}


	public Integer getTotalRows() {
		return totalRows;
	}


	public void setTotalRows(Integer totalRows) {
		
		this.totalRows = totalRows;
	}


	public List<T> getList() {
		return list;
	}


	public void setList(List<T> list) {
		this.list = list;
	}
	public boolean isHasPreviousPage() {
		return (this.page!=1);
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}

	public boolean isHasNextPage() {
		setAllPageCount();
		return (this.page<totalPage);
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}


	/**
	 * 取得总页数
	 * @return
	 */
	public void setAllPageCount() {
		Integer  allRowCount = this.getTotalRows();
		if(allRowCount%this.rows==0){
			totalPage = allRowCount/rows;
		}else{
			totalPage = allRowCount/rows+1;
		}
	    
	}
	
	
	
	
	
}
