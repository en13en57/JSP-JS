package kr.green.poll.vo;

import java.util.Arrays;


public class Test {
	public static void main(String[] args) {
		PollVO vo = new PollVO();
		vo.setItem("하나@@두울@@세엣");
		vo.setCount("12@@16@@8");
		
		System.out.println(vo.getCount());
		System.out.println(vo.getItem());
		
		// System.out.println(Arrays.toString("하나@@두울@@세엣".split("@@")));
		System.out.println(Arrays.toString(vo.getPollItems()));
		System.out.println(Arrays.toString(vo.getPollCounts()));
		
		System.out.println(vo.getTotalCount());
		System.out.println(vo.getPercent(0));
		System.out.println(vo.getPercent(1));
		System.out.println(vo.getPercent(2));
		
		vo.setPollItems(new String[] {"한놈","두식이","석삼"});
		vo.setPollCounts(new int[] {11,22,33});
		
		System.out.println(vo.getCount());
		System.out.println(vo.getItem());
	}
}
