package BEAN;

public class Question {
	
	private int questionid;
	private int number;
	private String contentquestion;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String correctoption;
	private int mediaid;
	private int questiontypeid;

	public Question() {
	}

	public Question(int questionid, int number, String contentquestion, String option1, String option2, String option3,
			String option4, String correctoption, int mediaid, int questiontypeid) {
		this.questionid = questionid;
		this.number = number;
		this.contentquestion = contentquestion;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.correctoption = correctoption;
		this.mediaid = mediaid;
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

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
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

}
