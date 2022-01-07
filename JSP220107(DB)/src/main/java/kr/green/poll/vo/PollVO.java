package kr.green.poll.vo;
/*
create table poll(
     idx int primary key auto_increment,
     subject varchar(100) not null, 
     item  text not null, 
     count text not null, 
     startDate varchar(10) not null,
     endDate varchar(10) not null,
     comment text
);
 */
public class PollVO {
	private int idx;
	private String subject;
	private String item;
	private String count;
	private String startDate;
	private String endDate;
	private String comment;
	
	// item과 count를 구분자로 구분하여 배열로 자동으로 저장되면 
	// 처리가 편리하다.
	private String[] pollItems;
	private int[] pollCounts;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
		// 아이템을 구분자로 분리해서 배열에 넣어준다.
		pollItems = this.item.split("@@");
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		// String문자열을 구분자로 구분해서 숫자배열로 만들어 준다.
		this.count = count;
		String[] cnts = this.count.split("@@");
		this.pollCounts = new int[cnts.length];
		for(int i=0;i<cnts.length;i++) {
			this.pollCounts[i] = Integer.parseInt(cnts[i]);
		}
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String[] getPollItems() {
		return pollItems;
	}
	// 배열이 들어오면 @@로 연결하여 넣어준다.
	public void setPollItems(String[] pollItems) {
		this.pollItems = pollItems;
		this.item = String.join("@@", pollItems);
	}
	public int[] getPollCounts() {
		return pollCounts;
	}
	// 배열이 들어오면 @@로 연결하여 넣어준다.
	public void setPollCounts(int[] pollCounts) {
		this.pollCounts = pollCounts;
		count = "";
		for(int i=0;i<pollCounts.length;i++) {
			count += pollCounts[i];
			if(i!=pollCounts.length-1) count += "@@";
		}
	}
	
	// 전체 투표수를 리턴하는 메서드 추가
	public int getTotalCount() {
		int totalCount = 0;
		for(int i=0;i<pollCounts.length;i++) totalCount += pollCounts[i];
		return totalCount;
	}
	// 지정 번호의 백분율을 구해서 리턴하는 메서드 추가
	public String getPercent(int index) {
		if(getTotalCount()>0)
			return String.format("%.2f", (double)pollCounts[index]/getTotalCount() * 100);
		else
			return "0.00";
	}
	
	@Override
	public String toString() {
		return "PollVO [idx=" + idx + ", subject=" + subject + ", item=" + item + ", count=" + count + ", startDate="
				+ startDate + ", endDate=" + endDate + ", comment=" + comment + "]";
	}
} 