<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="DAO.ExamDAO"%>
<%
String question_no=request.getParameter("question_no");
String req=request.getParameter("req");
int subjectid = (int)session.getAttribute("subjectid");
int testid = (int)session.getAttribute("testid");
int set=(int)session.getAttribute("qstypeID");

if(req!=null){
	if(req.equals("first")){
	String result=ExamDAO.getQuestion(question_no,subjectid,testid,set);
	out.print(result);
	}
	else{
		   String question_id=request.getParameter("question_id");
		    String answer=request.getParameter("answer");
		    LinkedHashMap lhm=(LinkedHashMap)session.getAttribute("all_answers");
		    
		    if(!answer.equals("undefined")){
		          
		          
		          if(lhm==null){
		              lhm=new LinkedHashMap();
		              lhm.put(question_id, answer);
		              session.setAttribute("all_answers", lhm);
		          }
		          else{
		              lhm.put(question_id, answer);
		              session.setAttribute("all_answers", lhm);
		          }
		    }
		    else
		    {
		    	if(lhm==null){
		              lhm=new LinkedHashMap();
		              lhm.put(question_id, answer);
		              session.setAttribute("all_answers", lhm);
		          }
		          else{
		              lhm.put(question_id, answer);
		              session.setAttribute("all_answers", lhm);
		          }
		    }
	
	}
}
else{
	String question_id=request.getParameter("question_id");
	String answer=request.getParameter("answer");
    LinkedHashMap lhm=(LinkedHashMap)session.getAttribute("all_answers");
	
	if(!answer.equals("undefined")){
		  
		  
		  if(lhm==null){
			  lhm=new LinkedHashMap();
			  lhm.put(question_id, answer);
			  session.setAttribute("all_answers", lhm);
		  }
		  else{
			  lhm.put(question_id, answer);
              session.setAttribute("all_answers", lhm);
		  }
	}
	 else
	    {
	    	if(lhm==null){
	              lhm=new LinkedHashMap();
	              lhm.put(question_id, answer);
	              session.setAttribute("all_answers", lhm);
	          }
	          else{
	              lhm.put(question_id, answer);
	              session.setAttribute("all_answers", lhm);
	          }
	    }
	

	String result=ExamDAO.getQuestion(question_no,subjectid,testid, set);
	out.print(result);

}
%>