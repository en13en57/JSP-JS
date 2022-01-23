package kr.green.memo.vo;

import java.util.List;

public class PagingVO<T> {
	private int totalCount;
	private int currentPage;
	private int pageSize;
	private int blockSize;
	
	private int totalPage;
	private int startNo;
	private int endNo;
	private int startPage;
	private int endPage;
	
	private List<T> list;

	public PagingVO(int totalCount, int currentPage, int pageSize, int blockSize) {
		super();
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		calc();
	}

	private void calc() {
		if(currentPage<=0) currentPage=1;
		if(pageSize<2) pageSize=10;
		if(blockSize<2) blockSize=10;
		if(totalCount<0) totalCount=0;

		if(totalCount>0) {
				// 전체 페이지수 = (전체개수-1)/페이지당글수
				totalPage = (totalCount-1)/pageSize + 1;
				// 현재 페이지가 전체 페이지수를 넘을 수 없다.
				if(currentPage>totalPage) currentPage = 1;
				// 시작번호 = (현재페이지-1)*페이지당글수
				startNo = (currentPage-1) * pageSize; // 오라클은 +1을 한다. 왜? 인덱스가 1부터이다.
				// 끝번호 = 시작번호 + 페이지당글수 - 1
				endNo = startNo + pageSize - 1; 
				// 마지막 번호는 전체 개수보다 클 수 없다.
				if(endNo>=totalCount) endNo = totalCount -1; // 오라클은 -1을 하지 않는다. 조건에 등호가 없다.
				// 시작 페이지번호 = (현재 페이지번호-1)/페이지개수 * 페이지 개수 + 1
				startPage = (currentPage-1)/blockSize * blockSize + 1;
				// 끝페이지 번호 = 시작페이지번호 + 페이지개수 -1
				endPage = startPage + blockSize -1;
				// 끝 페이지 번호는 전체 페이지수를 넘을 수 없다.
				if(endPage>totalPage) endPage = totalPage;
		}
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getBlockSize() {
		return blockSize;
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

	@Override
	public String toString() {
		return "PagingVO [totalCount=" + totalCount + ", currentPage=" + currentPage + ", pageSize=" + pageSize
				+ ", blockSize=" + blockSize + ", totalPage=" + totalPage + ", startNo=" + startNo + ", endNo=" + endNo
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", list=" + list + "]";
	}
	// 페이지 상단에 표시할 메서드를 추가하자
		public String getPageInfo() {
			return "전체 : " + totalCount + "개(" + currentPage + "/" + totalPage + "Page)";
		}
		// 페이지 하단에 표시할 메서드를 추가하자!!!
		public String getPageList() {
			StringBuffer sb = new StringBuffer();
			sb.append("<ul class='pagination pagination-sm justify-content-center'>");
			// "이전"은 시작페이지 번호가 1보다 크다면 있다.
			if(startPage>1) {
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' href='?p=" +(startPage-1)+ "&s="+pageSize+"&b="+blockSize+"' aria-label='Previous'>");
				sb.append("<span aria-hidden='true'>&laquo;</span>");
				sb.append("</a>");
				sb.append("</li>");
			}
			// 페이지 번호들을 출력해준다.
			for(int i=startPage;i<=endPage;i++) {
				if(i!=currentPage) { // 현재 페이지가 아니면 링크를 걸고
					sb.append("<li class='page-item'><a class='page-link' href='?p=" +(i)+ "&s=" + pageSize + "&b=" + blockSize + "'>" + i + "</a></li>");
				}else { // 현재 페이지는 링크를 걸지 않는다.
					sb.append("<li class='page-item active' aria-current='page'><a class='page-link' href='#'>" + i + "</a></li>");
				}
			}
			// "다음"은 끝 페이지번호가 전체 페이지 번호보다 적다면 있다.
			if(endPage<totalPage) {
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' href='?p=" +(endPage+1)+ "&s="+pageSize+"&b="+blockSize+"' aria-label='Previous'>");
				sb.append("<span aria-hidden='true'>&raquo;</span>");
				sb.append("</a>");
				sb.append("</li>");
			}
			sb.append("</ul>");
			return sb.toString();
		}
	}


