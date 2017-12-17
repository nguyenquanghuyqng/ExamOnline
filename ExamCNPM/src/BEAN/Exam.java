package BEAN;

public class Exam {
	private int testid;
	private String testtypename;
	private String classname;
	private String subjectname;
	private String datetimestart;
	private String datetimeend;
	private int numberquestion;
	private String time;

	public String getTesttypename() {
		return testtypename;
	}

	public void setTesttypename(String testtypename) {
		this.testtypename = testtypename;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getSubjectname() {
		return subjectname;
	}

	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}

	public String getDatetimestart() {
		return datetimestart;
	}

	public void setDatetimestart(String datetimestart) {
		this.datetimestart = datetimestart;
	}

	public String getDatetimeend() {
		return datetimeend;
	}

	public void setDatetimeend(String datetimeend) {
		this.datetimeend = datetimeend;
	}


	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getNumberquestion() {
		return numberquestion;
	}

	public void setNumberquestion(int numberquestion) {
		this.numberquestion = numberquestion;
	}

	public int getTestid() {
		return testid;
	}

	public void setTestid(int testid) {
		this.testid = testid;
	}
}
