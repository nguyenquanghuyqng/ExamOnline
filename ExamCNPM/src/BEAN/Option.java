package BEAN;

public class Option {
	
	private int questionid;
	private int optionid;
	private String optionname;
	private boolean isanswer;
	
	public Option() {
	}

	public Option(int questionid,int optionid, String optionname, boolean isanswer) {
		this.questionid = questionid;
		this.optionid= optionid;
		this.optionname=optionname;
		this.isanswer= isanswer;
	}

	public int getQuestionid() {
		return questionid;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}

	public int getOptionid() {
		return optionid;
	}

	public void setOptionid(int optionid) {
		this.optionid = optionid;
	}

	public String getOptionname() {
		return optionname;
	}

	public void setOptionname(String optionname) {
		this.optionname = optionname;
	}

	public boolean isIsanswer() {
		return isanswer;
	}

	public void setIsanswer(boolean isanswer) {
		this.isanswer = isanswer;
	}

	
}
