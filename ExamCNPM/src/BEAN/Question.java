package BEAN;

public class Question {
	
	private int questionid;
	private String questiontype;
	private int number;
	private String contentquestion;
	private String options;
	private String correctoption;
	private int mediaid;

	public Question() {
	}

	public Question(int questionid, String questiontype, int number, String contentquestion,
					String options, String correctoption, int mediaid) {
		this.questionid = questionid;
		this.questiontype = questiontype;
		this.number = number;
		this.contentquestion = contentquestion;
		this.options = options;
		this.correctoption = correctoption;
		this.mediaid = mediaid;	
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

	public String getQuestiontype() {
		return questiontype;
	}

	public void setQuestiontype(String questiontype) {
		this.questiontype = questiontype;
	}
	public String getContentquestion() {
		return contentquestion;
	}

	public void setContentquestion(String contentquestion) {
		this.contentquestion = contentquestion;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
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
}
