package kr.green.memo.vo;
// 어떤 데이터든 페이지 나누는 방법은 동일하므로 어떤 VO클래스든 사용 가능하도록 Generic으로 만들자

import java.util.List;

// 전체 : ??개(?/?Page) ===> 예)  전체 : 127개(3/13Page)
// [처음][이전] [1][2][3][4][5] [다음][마지막]

public class PagingVO<T> {
	
	private List<T> list; // 이 데이터를 페이징 하겠다.
	
	// 페이지를 계산하는데 필요한 내용
	private int totalCount; 	// 전체 개수
	private int sizeOfPage; 	// 페이지당 글 수
	private int sizeOfBlock; 	// 블록당 표시할 페이지 개수
	private int currentPage;	// 현재 페이지
	
	// 계산해서 얻어야 하는 내용
	private int totalPage;  // 전체 페이지수
	private int startNo;  	// 시작 글번호
	private int endNo;  	// 끝 글번호
	private int startPage;  // 시작 페이지 번호
	private int endPage;  	// 끝 페이지 번호
	
	// 생성자!!!
	// 알려줘야 하는 값을 받아 객체를 생성한다.
	public PagingVO(int totalCount, int sizeOfPage, int sizeOfBlock, int currentPage) {
		super();
		this.totalCount = totalCount;
		this.sizeOfPage = sizeOfPage;
		this.sizeOfBlock = sizeOfBlock;
		this.currentPage = currentPage;
		calc();
	}

	private void calc() {
		// 일단 넘어온 변수들도 유효성을 검사 해 주어야 한다.
		if(totalCount<0) totalCount = 0; 	// 전체 개수는 음수가 될 수 없다.
		if(sizeOfPage<1) sizeOfPage = 10;	// 페이지당 글수는 최소 1개 이상이어야 한다.
		if(sizeOfBlock<2) sizeOfBlock = 10;	// 페이지표시는 최소 2개 이상이어야 한다.
		
		// 나머지 5개 변수 값을 계산해서 넣는다.
		if(totalCount>0) { // 데이터가 없으면 계산할 필요가 없다.
			totalPage = (totalCount-1)/sizeOfPage + 1; // 전체페이지 = (전체개수-1)/페이지당글수 + 1
			// 현재 페이지의 유효성을 검사한다.
			if(currentPage<1 || currentPage>totalPage) currentPage = 1;
			startNo = (currentPage-1) * sizeOfPage; // 시작번호 = (현재페이지-1) *  페이지당글수
			endNo = startNo + sizeOfPage - 1;// 끝번호 = 시작번호 + 페이지당글수 - 1;
			// 끝번호의 마지막 페이지만 바뀔 수 있다.
			if(endNo>=totalCount) endNo = totalCount-1; // -1은 왜? 0부터 세기때문
			// 시작 페이지 번호  = ((현재페이지-1)/블록당개수 * 블록당개수) + 1
			startPage = ((currentPage-1)/sizeOfBlock * sizeOfBlock) + 1;
			// 끝페이지 번호 = 시작 페이지 번호 + 블록당개수 -1
			endPage = startPage + sizeOfBlock - 1;
			if(endPage>totalPage) endPage = totalPage;
		}
	}

	// Getter만 만든다.
	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getSizeOfPage() {
		return sizeOfPage;
	}

	public int getSizeOfBlock() {
		return sizeOfBlock;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
	
	// 페이지 상단에 페이지 정보를 출력하는 메서드를 추가해  보자
	public String getPageInfo() {
		return "전체 : " + totalCount + "개(" + currentPage + "/" + totalPage + "Page)";
	} 
	
	// 페이지 하단에 나타날 페이지 번호 링크를 만들어서 리턴해 주는 메서드
	public String getPageList() {
		StringBuffer sb = new StringBuffer();
		// 시작페이지 번호가 1보다 크다면 "이전"이 있다.
		if(startPage>1) {
			sb.append("[<a href='?p=" + (startPage-1) + "&s=" + sizeOfPage + "&b=" + sizeOfBlock + "'>이전</a>]");
		}
		// 페이지 번호 출력
		for(int i=startPage;i<=endPage;i++) {
			if(i==currentPage) { // 현재 페이지는 링크를 걸지 않는다.
				sb.append("[" + i + "] ");
			}else {
				sb.append("[<a href='?p=" + i + "&s=" + sizeOfPage + "&b=" + sizeOfBlock + "'>" + i + "</a>] ");
			}
		}
		
		// 끝페이지 번호가 전체페이지수 보다 적다면 "다음"이 있다.
		if(endPage<totalPage) {
			sb.append("[<a href='?p=" + (endPage+1) + "&s=" + sizeOfPage + "&b=" + sizeOfBlock + "'>다음</a>]");
		}
		return sb.toString();
	}
	@Override
	public String toString() {
		return "PagingVO [list=" + list + ", totalCount=" + totalCount + ", sizeOfPage=" + sizeOfPage + ", sizeOfBlock="
				+ sizeOfBlock + ", currentPage=" + currentPage + ", totalPage=" + totalPage + ", startNo=" + startNo
				+ ", endNo=" + endNo + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
}
