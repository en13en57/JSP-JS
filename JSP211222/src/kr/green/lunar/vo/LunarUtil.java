package kr.green.lunar.vo;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class LunarUtil {
	public static List<LunarVO> getLunarData(String path, int year, int month){
		List<LunarVO> list = null;
		String fileName = String.format("%04d%02d.json", year, month); // 파일이름
		// 이미 json파일이 있다면 json파일을 읽어서 리턴하고
		File file = new File (path + File.separator + fileName);
		if(file.exists()) {
			Gson gson = new Gson();
			FileReader fr = null;
			try {
				fr = new FileReader(file);
				list = gson.fromJson(fr, new TypeToken<List<LunarVO>>( ) {}.getType());
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if(fr!=null) fr.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}else {
			
			// json파일이 없다면 인터넷에서 읽어서 리턴하자
			String date = String.format("?search_year=%04d&search_month=%02d", year, month);
			String urlAddress ="https://astro.kasi.re.kr/life/pageView/5" + date;
			// 해당 URL에 접속하여 문서를 얻어온다.
			try {
				Document document = Jsoup.connect(urlAddress).get();
				list = new ArrayList<LunarVO>();
				Elements elements = document.select("table tbody tr");
				for(Element e : elements){ // 반복
					// 1줄이 날짜 하나이다
					LunarVO vo = new LunarVO();
					// vo를 채워주자
					vo.setSolar(e.select("td").get(0).text()); // tr안의 td중 첫번째가 양력이다.
					vo.setLunar(e.select("td").get(1).text());
					vo.setGanji(e.select("td").get(2).text());
					list.add(vo); // 날짜 한개를 리스트에 추가
				}
				System.out.println(list.size() + "개 읽음");
				
				System.out.println("저장 경로 : " + path + "<br>");
				fileName = list.get(0).getSolarYear() + list.get(0).getSolarMonth() + ".json";
				
				Gson gson = new Gson();
				PrintWriter pw = new PrintWriter(path + File.separator + fileName);
				gson.toJson(list, pw);
				pw.flush();
				pw.close();
				System.out.println(path + File.separator + fileName + "저장완료 <br>");
			} catch (IOException e) {
				e.printStackTrace();
			}
				
		}
		
		return list;
	}
}
