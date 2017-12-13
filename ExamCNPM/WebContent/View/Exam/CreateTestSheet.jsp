<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	   <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <%@ page import="java.sql.*" %>
	<%ResultSet resultset =null;%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Test Sheet</title>
<meta name="description" content="overview &amp; stats" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<meta name="description" content="overview &amp; stats" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="Style/css/bootstrap.min.css" />
<link rel="stylesheet" href="Style/css/font-awesome.min.css" />


<!-- page specific plugin styles -->
<link rel="stylesheet" href="Style/js/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="Style/css/fullcalendar.min.css" />


<!-- text fonts -->
<link rel="stylesheet" href="Style/css/fonts.googleapis.com.css" />

<!-- ace styles -->
<link rel="stylesheet" href="Style/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />

<link rel="stylesheet" href="Style/css/ace-skins.min.css" />
<link rel="stylesheet" href="Style/css/ace-rtl.min.css" />

<!-- ace settings handler -->
<script src="Style/js/ace-extra.min.js"></script>

<link rel="stylesheet " href="Style/css/template.css" type="text/css ">

<script src="Style/js/jquery-2.1.4.min.js"></script>

<script src="Style/js/bootstrap.min.js"></script>

<!-- ace scripts -->
<script src="Style/js/ace-elements.min.js"></script>
<script src="Style/js/ace.min.js"></script>
<script src="Style/js/validation.js"></script>



</head>

<body class="no-skin" style="font-size: 14px;">

		 <!-- Insert file  -->
        
		<jsp:include page="NotificationExam.jsp"></jsp:include>
		
	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.loadState('main-container')
			} catch (e) {
			}
		</script>

			<!-- 			Insert menu -->
            <jsp:include page="MenuExam.jsp"></jsp:include>

		<div class="main-content">

			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Manage
								Exam</a></li>
						<li class="active">Create Exam</li>
					</ul>
					<!-- /.breadcrumb -->

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" autocomplete="off" /> <i
								class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</form>
					</div>
					<!-- /.nav-search -->
				</div>

				<div class="page-content">
					<!-- /.ace-settings-container -->


					<div class="page-header">
						<h1>
							Create Exam <small> <i
								class="ace-icon fa fa-angle-double-right"></i> Manger Exam can
								create exam
							</small>
						</h1>
					</div>


					<div class="col-md-5 top-header-agile-left table-responsive" style="margin: 30px">
						<h2>Create Exam</h2>
						<div id="thongbao">
							<p id="pthongbao"></p>
						</div>
						
						<form action="CreateTestSheet" method="post" name="frmCreateTest">
						
							<br>Test id : <br>
							<input type="text" name="testid" id="testid" placeholder="Enter testid"><br>
						
							<br> Class id : <br> 
							<%
							    try{
							//Class.forName("com.mysql.jdbc.Driver").newInstance();
							Class.forName("com.mysql.jdbc.Driver");
							Connection connection = 
						         DriverManager.getConnection
						            ("jdbc:mysql://localhost:3306/examonline","root","1234");
						
						       Statement statement = connection.createStatement() ;
						
						       resultset =statement.executeQuery("select classid from classes") ;
							%>
							
						        <select id="classid" name="classid">
						        <%  while(resultset.next()){ %>
						            <option><%= resultset.getString(1)%></option>
						        <% } %>
						        </select>
					
							<%
						        }
						        catch(Exception e)
						        {
						             out.println("wrong entry"+e);
						        }
							%>
							<br>
							
							<br> Date time start: <br> 
							<input type="datetime-local" name="timestart" id="timestart"/><br> 
							<br> Date time end: <br> 
							<input type="datetime-local" name="timeend" id="timeend"/><br> 
							
							<br> Test type id: <br>
							<%
							    try{
							//Class.forName("com.mysql.jdbc.Driver").newInstance();
							Class.forName("com.mysql.jdbc.Driver");
							Connection connection = 
						         DriverManager.getConnection
						            ("jdbc:mysql://localhost:3306/examonline","root","1234");
						
						       Statement statement = connection.createStatement() ;
						
						       resultset =statement.executeQuery("select testtypeid from testtypes") ;
							%>
							
						        <select id="testtypeid" name="testtypeid">
						        <%  while(resultset.next()){ %>
						            <option><%= resultset.getString(1)%></option>
						        <% } %>
						        </select>
					
							<%
						        }
						        catch(Exception e)
						        {
						             out.println("wrong entry"+e);
						        }
							%>
							<br>
							
							
							
							<br> Subject id: <br> 
							<%
							    try{
							//Class.forName("com.mysql.jdbc.Driver").newInstance();
							Class.forName("com.mysql.jdbc.Driver");
							Connection connection = 
						         DriverManager.getConnection
						            ("jdbc:mysql://localhost:3306/examonline","root","1234");
						
						       Statement statement = connection.createStatement() ;
						
						       resultset =statement.executeQuery("select subjectid from subjects") ;
							%>
							
						        <select id="subjectid" name="subjectid">
						        <%  while(resultset.next()){ %>
						            <option><%= resultset.getString(1)%></option>
						        <% } %>
						        </select>
					
							<%
						        }
						        catch(Exception e)
						        {
						             out.println("wrong entry"+e);
						        }
							%>
							<br> 
							
							<br> Number of question :<br>
							<input type="number" name="number" id="number" min="1" placeholder="Enter number of question"><br>
							
							<br> Time : <br>
							<input type="time" name="time" id="time" min="1"><br>
							
							<br> <input type="submit"

								value="Create Test Sheet" style="background: skyblue"
								onclick="return KiemTraHopLeTest()">

						</form>
					</div>
					
					
<!-- 					<div class="col-md-5 top-header-agile-right"> -->
<%-- 						<jsp:include page="NewCalender.jsp"></jsp:include> --%>
<!-- 					</div>	 -->

				</div>
			</div>
			<!-- /.page-header -->

		</div>
		<!-- /.page-content -->
	</div>

	<!-- /.main-content -->

	<div class="footer">
		<div class="footer-inner">
			<div class="footer-content">
				<span class="bigger-120"> <span class="blue bolder">HCMUTE</span>
					Application &copy; 2016-2017
				</span> &nbsp; &nbsp; <span class="action-buttons"> <a href="#">
						<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
				</a> <a href="#"> <i
						class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
				</a> <a href="#"> <i
						class="ace-icon fa fa-rss-square orange bigger-150"></i>
				</a>
				</span>
			</div>
		</div>
	</div>

	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	</div>
	<!-- /.main-container -->

</body>

</html>
