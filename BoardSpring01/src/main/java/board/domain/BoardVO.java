package board.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("BoardVO")
public class BoardVO {
	private int num;
	private String uploader;
	private String email;
	private String subject;
	private String pass;
	private int readcount;
	private int ref;
	private int step;
	private int depth;
	private Timestamp regdate;
	private String content;
	private String ip;
	private String filename;
	private String contentType;
	private long fileSize;
	
	public BoardVO() {}
	
	public BoardVO(int num, String uploader, String email, String subject, String pass, int readcount, int ref,
			int step, int depth, Timestamp regdate, String content, String ip, String filename) {
		super();
		this.num = num;
		this.uploader = uploader;
		this.email = email;
		this.subject = subject;
		this.pass = pass;
		this.readcount = readcount;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.regdate = regdate;
		this.content = content;
		this.ip = ip;
		this.filename = filename;
	}
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUploader() {
		return uploader;
	}
	public void setUploader(String uploader) {
		this.uploader = uploader;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}