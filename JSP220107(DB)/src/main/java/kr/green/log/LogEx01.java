package kr.green.log;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import lombok.extern.log4j.Log4j2;

@Log4j2 // log변수를 자동으로 만들어 준다.
public class LogEx01 {
	// 로그 변수 선언
	static Logger logger = LogManager.getLogger(LogEx01.class);
	
	public static void main(String[] args) {
		// log4j2.xml파일을 사용하지 않고 기본적인 설정대로 로그를 출력해라!!!
		// BasicConfigurator.configure();
		// 기본적으로 로그를 출력할때 log4j2.xml파일을 찾아서 설정한대로 로그를 출력한다.
		// 없어서 에러이다.
		
		logger.fatal("fatal 로그");
		logger.error("error 로그");
		logger.warn("warn 로그");
		logger.info("info 로그");
		logger.debug("debug 로그");
		
		log.info("롬복을 이용하여 로그찍기!!!");
	}
}
