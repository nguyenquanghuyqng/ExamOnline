package BEAN;

public class QuestionType {
	private int questiontypeid;
	private String questiontypename;
	
	public QuestionType() {}
	
	public QuestionType(int questiontypeid, String questiontypename) {
		this.questiontypeid = questiontypeid;
		this.questiontypename = questiontypename;
	}

	public int getQuestiontypeid() {
		return questiontypeid;
	}

	public void setQuestiontypeid(int questiontypeid) {
		this.questiontypeid = questiontypeid;
	}

	public String getQuestiontypename() {
		return questiontypename;
	}

	public void setQuestiontypename(String questiontypename) {
		this.questiontypename = questiontypename;
	}
	
	
}
