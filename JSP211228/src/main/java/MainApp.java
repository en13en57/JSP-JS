import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class MainApp {
	public static void main(String[] args) {
		String addr= "http://flash24.co.kr/g4/bbs/board.php?bo_table=cartoon&wr_id=9077&sca=&sfl=wr_subject&stx=%C5%B7%B4%FD&sop=and&page=2";
		
		try {
			Document document = Jsoup.connect(addr).get();
			Elements elements = document.select("#writeContents p img");
			System.out.println(elements.size() + "개");
			int count = 0;
			for(Element e : elements) {
				//System.out.println("http://flash24.co.kr/"  + e.attr("src"));
				String urlAddress = "http://flash24.co.kr/"  + e.attr("src");
				URL url = new URL(urlAddress);
				InputStream is = url.openStream();
				FileOutputStream fos = new FileOutputStream(String.format("data/img%03d.jpg", ++count));
				byte[] data = new byte[2048];
				int n = 0;
				while((n=is.read(data))>0) {
					fos.write(data,0,n);
					fos.flush();
				}
				is.close();
				fos.close();
			}
			System.out.println("저장완료!!!");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
