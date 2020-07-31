package org.kh.fin.notice.domain;

public class Search {

	
	private String searchCondition;//jsp의 값을 담기 위해서 필요하다 ex)title,writer,all,content랑 searchValue값
	private String searchValue;
	private String existFile;//첨부파일이 있는 게시물이 있는지 검색할때 필요 
	
	public Search() {}

	public Search(String searchCondition, String searchValue, String existFile) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.existFile = existFile;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getExistFile() {
		return existFile;
	}

	public void setExistFile(String existFile) {
		this.existFile = existFile;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", existFile="
				+ existFile + "]";
	}

}
