package org.kh.fin.freeboard.domain;

public class Search {
	
	private String searchCondition;
	private String searchValue;
	
	public Search() {
	}

	public Search(String searchCondition, String searchValue) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getsearchValue() {
		return searchValue;
	}

	public void setsearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchValue=" + searchValue + "]";
	}
	
	
	
	

}
