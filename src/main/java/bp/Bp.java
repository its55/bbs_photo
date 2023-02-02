package bp;

public class Bp {
	private int bpID;
	private String bpTitle;
	private String userID;
	private String bpDate;
	private String bpContent;
	private int bpAvailable;

	public int getBpID() {
		return bpID;
	}

	public void setBpID(int bpID) {
		this.bpID = bpID;
	}

	public String getBpTitle() {
		return bpTitle;
	}

	public void setBpTitle(String bpTitle) {
		this.bpTitle = bpTitle;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getBpDate() {
		return bpDate;
	}

	public void setBpDate(String bpDate) {
		this.bpDate = bpDate;
	}

	public String getBpContent() {
		return bpContent;
	}

	public void setBpContent(String bpContent) {
		this.bpContent = bpContent;
	}
	
	public int getBpAvailable() {
		return bpAvailable;
	}

	public void setBpAvailable(int bpAvailable) {
		this.bpAvailable = bpAvailable;
	}

	@Override
	public String toString() {
		return "Bbs [bpID=" + bpID + ", bpTitle=" + bpTitle + ", userID=" + userID + ", bpDate" + bpDate
				+ ", bpContent" + bpContent + ", bpAvailable" + bpAvailable + "]";

	}
}
