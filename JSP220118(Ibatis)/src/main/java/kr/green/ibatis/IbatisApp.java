package kr.green.ibatis;

import java.io.IOException;
import java.io.InputStream;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class IbatisApp {
	private static SqlMapClient sqlMapClient;
	
	static {
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream ("SqlMapConfig.xml");
			sqlMapClient = SqlMapClientBuilder.buildSqlMapClient(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(inputStream!=null) inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	public static SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}
}
