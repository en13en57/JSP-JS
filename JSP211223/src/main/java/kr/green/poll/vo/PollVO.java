package kr.green.poll.vo;

import java.util.List;

import lombok.Data;

@Data
public class PollVO {
	private String title;
	private List<String> items;
	private List<Integer> counts;
	
	// 총투표수를 구하는 메서드
	public int getTotalCount() {
		int totalCount = 0;
		for(int i : counts) totalCount += i;
		return totalCount;
	}
	// 득표율을 구하는 메서드
	public String getPercent(int i) {
		if(getTotalCount()!=0)
			// %자체를 출력하기 위해서는 %%를 쓴다.
			return String.format("%.2f%%", (double)counts.get(i)/getTotalCount() * 100); 
		else
			return "0.00%";
	}
}
