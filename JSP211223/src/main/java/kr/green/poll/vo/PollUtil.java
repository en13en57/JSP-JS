package kr.green.poll.vo;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class PollUtil {
	// json파일을 읽어서 PollVO를 리턴하는 메서드
	public static PollVO readPollVO(String path, String fileName) {
		PollVO pollVO = null;
		Gson gson = new Gson();
		try(FileReader fr = new FileReader(path + File.separator + fileName);){
			pollVO = gson.fromJson(fr, PollVO.class);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return pollVO;
	}
	// PollVO를 받아 json으로 저장하는 메서드
	public static void savePollVO(String path, String fileName, PollVO pollVO) {
		Gson gson = new Gson();
		try(PrintWriter pw = new PrintWriter(path + File.separator + fileName);){
			gson.toJson(pollVO, pw);
			pw.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//-----------------------------------------------------------------------------------------
	// pollList.json파일을 읽어 List<PollVO>로 리턴하는 메서드
	public static List<PollVO> readPollList(String path) {
		List<PollVO> list = null;
		Gson gson = new Gson();
		try(FileReader fr = new FileReader(path + File.separator + "pollList.json");){
			list = gson.fromJson(fr, new TypeToken<List<PollVO>>(){}.getType());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	// List<PollVO>를 받아 pollList.json파일로 저장하는 메서드
	public static void savePollList(String path,  List<PollVO> list) {
		Gson gson = new Gson();
		try(PrintWriter pw = new PrintWriter(path + File.separator + "pollList.json");){
			gson.toJson(list, pw);
			pw.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
