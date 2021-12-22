package kr.green.lunar.app;

import kr.green.lunar.vo.LunarVO;

public class LunarTest1 {
	public static void main(String[] args) {
		LunarVO vo = new LunarVO();
		vo.setSolar("2009-07-01 (수)");
		vo.setLunar("2009-05-09 (윤)");
		vo.setGanji("기축(己丑)년 정미(丁未)일");
		
		System.out.println(vo.getSolarYear() + "년");
		System.out.println(vo.getSolarMonth() + "월");
		System.out.println(vo.getSolarDate() + "일");
		System.out.println(vo.getSolarWeek() + "요일(" + vo.getSolarIntWeek() +")" );
		System.out.println();
		
		System.out.println(vo.getLunarYear() + "년");
		System.out.println(vo.getLunarMonth() + "월");
		System.out.println(vo.getLunarDate() + "일");
		System.out.println();
		
		System.out.println(vo.getGanjiYearK());
		System.out.println(vo.getGanjiYearH());
		System.out.println(vo.getGanjiMonthK());
		System.out.println(vo.getGanjiMonthH());
		System.out.println(vo.getGanjiDateK());
		System.out.println(vo.getGanjiDateH());
		System.out.println();
		
		vo.setGanji("기축(己丑)년 병인(丙寅)월 정축(丁丑)일");
		System.out.println(vo.getGanjiYearK());
		System.out.println(vo.getGanjiYearH());
		System.out.println(vo.getGanjiMonthK());
		System.out.println(vo.getGanjiMonthH());
		System.out.println(vo.getGanjiDateK());
		System.out.println(vo.getGanjiDateH());
	}
}
