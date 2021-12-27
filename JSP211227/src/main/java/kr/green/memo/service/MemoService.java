package kr.green.memo.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kr.green.memo.vo.MemoVO;

public class MemoService {
	// 읽기
	public static List<MemoVO> getMemo(String path){
		List<MemoVO> list = null;
		String filename = "memo.json";
		Gson gson = new Gson();
		try(FileReader fr = new FileReader(path + File.separator + filename)){
			list = gson.fromJson(fr, new TypeToken<List<MemoVO>>() {}.getType());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	// 저장하기
	public static void setMemo(String path, MemoVO vo) {
		List<MemoVO> list = getMemo(path); // 읽어온다
		list.add(0, vo); // 첫번째 삽입한다.
		// 다시 저장한다.
		String filename = "memo.json";
		Gson gson = new Gson();
		try(PrintWriter pw = new PrintWriter(path + File.separator + filename)){
			gson.toJson(list, pw);
			pw.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
