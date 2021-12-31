package kr.green.session;
import lombok.ToString;

@ToString
public class CommonVO {
	private int p;
	private int s;
	private int b;
	private int currentPage;
	private int sizeOfPage;
	private int sizeOfBlock;
	// 데이터를 받을것들은 Setter를
	// EL로 출력할 것들은 Getter로 만든다.
	public int getCurrentPage() {
		return currentPage;
	}
	public int getSizeOfPage() {
		return sizeOfPage;
	}
	public int getSizeOfBlock() {
		return sizeOfBlock;
	}
	public void setP(int p) {
		this.p = p<1 ? 1 : p;
		this.currentPage = this.p;
	}
	public void setS(int s) {
		this.s = s<2 ? 10 : s;
		this.sizeOfPage = this.s;
	}
	public void setB(int b) {
		this.b = b<2 ? 10 : b;
		this.sizeOfBlock = this.b;
		
	}
	
}
