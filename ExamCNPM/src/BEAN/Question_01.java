package BEAN;

public class Question_01 {
	
	private int questionid;
	private int number;
	private String contentquestion;
	private String correctoption;
	private int mediaid;
	private String media;
	private int questiontypeid;

	public Question_01() {
	}

	public Question_01(int questionid, int number, String contentquestion, String correctoption, int mediaid,String media, int questiontypeid) {
		this.questionid = questionid;
		this.number = number;
		this.contentquestion = contentquestion;
		this.correctoption = correctoption;
		this.mediaid = mediaid;	
		this.setMedia(media);
		this.questiontypeid = questiontypeid;
	}
	public int getQuestionid() {
		return questionid;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getContentquestion() {
		return contentquestion;
	}

	public void setContentquestion(String contentquestion) {
		this.contentquestion = contentquestion;
	}

	public String getCorrectoption() {
		return correctoption;
	}

	public void setCorrectoption(String correctoption) {
		this.correctoption = correctoption;
	}

	public int getMediaid() {
		return mediaid;
	}

	public void setMediaid(int mediaid) {
		this.mediaid = mediaid;
	}

	public int getQuestiontypeid() {
		return questiontypeid;
	}

	public void setQuestiontypeid(int questiontypeid) {
		this.questiontypeid = questiontypeid;
	}

	public String getMedia() {
		return media;
	}

	public void setMedia(String media) {
		this.media = media;
	}
}
