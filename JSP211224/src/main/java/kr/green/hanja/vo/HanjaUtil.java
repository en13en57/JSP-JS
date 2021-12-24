package kr.green.hanja.vo;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class HanjaUtil {
	// json파일 전체를 읽는 메서드
	public static List<HanjaVO> readHanja(String path){
		List<HanjaVO> list = null;
		
		Gson gson = new Gson();
		try(FileReader fr= new FileReader(path + File.separator + "hanja2test.json");) {
			list = gson.fromJson(fr, new TypeToken<List<HanjaVO>>() {}.getType());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return list;
	}
	
	// ?급을 중복없이 얻은 메서드
	public static Set<String> readGrade(String path){
		Set<String> gradeSet = new TreeSet<String>();
		for(HanjaVO vo : readHanja(path)) {
			//gradeSet.add(vo.getD() + " " + vo.getS());
			gradeSet.add(vo.getD());
		}
		return gradeSet;
	}
	// ?회를 중복없이 얻은 메서드
	public static Set<String> readGrade(String path, String grade){
		Set<String> gradeSet = new TreeSet<String>();
		for(HanjaVO vo : readHanja(path)) {
			if(grade.equals(vo.getD())) gradeSet.add(vo.getS()); // 같은 급수일때만 회차를 추가
		}
		return gradeSet;
	}
	
	// 전체 데이터 중에서 시험을 치룰 ?급 ?회 문제만 리턴하는 메서드
	public static List<HanjaVO> getQ(String path, String grade, String times){
		List<HanjaVO> list = new ArrayList<HanjaVO>();
		for(HanjaVO vo : readHanja(path)) {
			if(grade.equals(vo.getD()) && times.equals(vo.getS())) list.add(vo); 
		}
		return list;
	}
	
}
