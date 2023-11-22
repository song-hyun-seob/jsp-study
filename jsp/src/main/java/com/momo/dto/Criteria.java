package com.momo.dto;
/*
 * 리스트를 조회 하기 위한 파라메터 세팅
 */
public class Criteria {
	// 기본값.설정
	private int pageNo = 1;
	
	private int amount = 10;
	
	//검색어
	private String searchWord = "";
	
	private String searchField = "";
	
	
	
	// 조회 할 게시물의 시작번호
	private int startNum;
	// 조회 할 게시글 끝번호
	private int endNum;
	
	
	
  public Criteria() {
	  // 시작번호와 끝번호 구함
	  // 페이지 조회 쿼리에서 사용
		endNum = this.pageNo * this.amount;
		startNum = endNum -(this.amount-1);
	}
  public String toString() {
	  return "searchWord : " + searchWord 
			  + "\n [searchField]" + searchField
			  + "\n [pageNo]" + pageNo
			  + "\n [amount]" + amount;
  }

public int getPageNo() {
	return pageNo;
}

public void setPageNo(int pageNo) {
	this.pageNo = pageNo;
}

public int getAmount() {
	return amount;
}

public void setAmount(int amount) {
	this.amount = amount;
}

public int getStartNum() {
	return startNum;
}

public void setStartNum(int startNum) {
	this.startNum = startNum;
}

public int getEndNum() {
	return endNum;
}

public void setEndNum(int endNum) {
	this.endNum = endNum;
}

public Criteria(String pageNo, String amount, String searchField, String searchWord) {
	
	if(pageNo !=null &&!"".equals(pageNo)) {
		this.pageNo = Integer.parseInt(pageNo);
		
	}
	if(amount !=null &&!"".equals(amount)) {
		this.amount = Integer.parseInt(amount);
		
	}
	
	endNum = this.pageNo * this.amount;
	startNum = endNum -(this.amount-1);
	
	// 검색어 세팅
	if(searchField !=null &&!"".equals(searchField)) {
		this.searchField = searchField;
	}
	if(searchWord !=null &&!"".equals(searchWord)) {
		this.searchWord = searchWord;
	}
	
	
	
	
}
  /*
   * 생성자를 통해 페이지번호와 페이지당 게시물의 수를 받아와서
   * 시작번호와 끝번호 구함
   */
  
public Criteria(String pageNo, String amount) {
	
	if(pageNo !=null &&!"".equals(pageNo)) {
		this.pageNo = Integer.parseInt(pageNo);
		
	}
	if(amount !=null &&!"".equals(amount)) {
		this.amount = Integer.parseInt(amount);
		
	}
	
	endNum = this.pageNo * this.amount;
	startNum = endNum -(this.amount-1);
}

public String getSearchWord() {
	return searchWord;
}

public void setSearchWord(String searchWord) {
	this.searchWord = searchWord;
}

public String getSearchField() {
	return searchField;
}

public void setSearchField(String searchField) {
	this.searchField = searchField;
}
 
	
	
}
