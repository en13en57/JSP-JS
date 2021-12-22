package kr.green.lunar.vo;

public class LunarVO {
	private String solar; // 양력
	private String lunar; // 음력
	private String ganji; // 간지

	// Getter & Setter 만들자
	public String getSolar() {
		return solar;
	}
	public void setSolar(String solar) {
		this.solar = solar;
	}
	public String getLunar() {
		return lunar;
	}
	public void setLunar(String lunar) {
		this.lunar = lunar;
	}
	public String getGanji() {
		return ganji;
	}
	public void setGanji(String ganji) {
		this.ganji = ganji;
	}
	
	@Override
	public String toString() {
		return solar + "(" + lunar + ", " + ganji + ")";
	}
	// 필요한 메서드를 추가해 보자
	
	// 양력을 분해해 보자
	// 2022-01-01 (토)
	// 1. 연도
	public String getSolarYear() {
		return solar.split("-")[0]; // -로 구분하여 배열을 만들고 첫번째 값은 연도다.
	}
	// 2. 월
	public String getSolarMonth() {
		return solar.split("-")[1]; // -로 구분하여 배열을 만들고 두번째 값은 월이다.
	}
	// 3. 일
	public String getSolarDate() {
		return solar.split("-")[2].split(" ")[0]; // -로 구분하고 세번째, 다시 공백으로 구분하여 첫번째 
	}
	// 4. 요일(숫자)
	public int getSolarIntWeek() {
		String week = "일월화수목금토";
		return week.indexOf(solar.split("-")[2].split(" ")[1].charAt(1));
	}
	// 5. 요일(문자)
	public String getSolarWeek() {
		return solar.split("-")[2].split(" ")[1].charAt(1)+"";
	}
	
	// 음력을 분해해 보자
	// 2021-11-29
	// 1. 연도
	public String getLunarYear() {
		return lunar.split("-")[0]; // -로 구분하여 배열을 만들고 첫번째 값은 연도다.
	}
	// 2. 월
	public String getLunarMonth() {
		return lunar.split("-")[1]; // -로 구분하여 배열을 만들고 두번째 값은 월이다.
	}
	// 3. 일
	public String getLunarDate() {
		return lunar.split("-")[2]; // -로 구분하여 배열을 만들고 세번째 값은 일이다. 
	}
	// 간지를 구분 해 보자
	//    세차        월건        일진
	// 신축(辛丑)년 경자(庚子)월 갑인(甲寅)일
	// 윤년의 경우 월건이 없다. 
	// 기축(己丑)년 정미(丁未)일
	// 1. 세차(한글)
	public String getGanjiYearK() { // 세차를 한글
		return ganji.split(" ")[0].substring(0,2);
	}
	// 	  세차(한자)
	public String getGanjiYearH() { // 세차를 한자
		return ganji.split(" ")[0].substring(3,5);
	}
	// 2. 월건(한글)
	public String getGanjiMonthK() { // 월건을 한글
		if(ganji.split(" ").length==3) { // 세차, 월건, 일진이 있는경우
			return ganji.split(" ")[1].substring(0,2);
		}else { // 윤달인 경우
			return "";
		}
	}
	// 	  월건(한자)
	public String getGanjiMonthH() { // 월건을 한자
		if(ganji.split(" ").length==3) { // 세차, 월건, 일진이 있는경우
			return ganji.split(" ")[1].substring(3,5);
		}else { // 윤달인 경우
			return "";
		}
	}
	// 3. 일진(한글)
	public String getGanjiDateK() { // 일진을 한글로
		if(ganji.split(" ").length==3) { // 세차, 월건, 일진이 있는경우
			return ganji.split(" ")[2].substring(0,2);
		}else { // 윤달인 경우
			return ganji.split(" ")[1].substring(0,2);
		}
	}
	// 	  일진(한자)
	public String getGanjiDateH() { // 일진을 한자로
		if(ganji.split(" ").length==3) { // 세차, 월건, 일진이 있는경우
			return ganji.split(" ")[2].substring(3,5);
		}else { // 윤달인 경우
			return ganji.split(" ")[1].substring(3,5);
		}
	}
}
