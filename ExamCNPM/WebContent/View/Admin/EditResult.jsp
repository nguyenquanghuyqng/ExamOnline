<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
	<%@ page import = "java.io.*,java.util.*" %>
	<%@ page import = "javax.servlet.*,java.text.*" %>
	    <%@ page import="java.sql.*" %>
	<%ResultSet resultset =null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Result</title>
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

<!-- Show thông báo ra màn hình -->
<script type="text/javascript">
	function show_comfirm() {
		var comfirmBox;
		comfirmBox = confirm("Bạn có chắc chắn muốn xóa kết quả ?");
		if (comfirmBox == true) {
			return true;
		} else {
			return false;
		}
	}
</script>



</head>


<body class="no-skin" style="font-size: 14px;">
    
    <!-- Insert file notification -->
        <jsp:include page="Notification.jsp" /> 

	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.loadState('main-container')
			} catch (e) {
			}
		</script>

        <!-- Insert file menu -->
        <jsp:include page="MenuAdmin.jsp" />  

		<div class="main-content">

			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
						</li>

						<li><a href="#">Manage Result</a></li>
						<li><a href="#">View Result</a></li>
						<li class="active">Edit Result</li>
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
							View Result <small> <i
								class="ace-icon fa fa-angle-double-right"></i> overview &amp;
								stats
							</small>
						</h1>
					</div>


					<div class="">
						<h2>List User</h2>
						Date : <input type="date" id="date" name="date">
                 
                 		<span style="margin-left: 50px;">Class : </span>
                 		 <%
							    try{
							//Class.forName("com.mysql.jdbc.Driver").newInstance();
							Class.forName("com.mysql.jdbc.Driver");
							Connection connection = 
						         DriverManager.getConnection
						            ("jdbc:mysql://localhost:3306/examonline","root","1234");
						
						       Statement statement = connection.createStatement() ;
						
						       resultset =statement.executeQuery("select classname from classes") ;
							%>
							
						        <select id="class" name="class">
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
							<hr>
							 <% 
// 								 Date dNow = new Date();
// 						         SimpleDateFormat ft = 
// 						         new SimpleDateFormat ("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
// 						         out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
				       		%>
					        
						<br>
						<table border='1' style="width: 100%"
							class="table table-hover table-bordered table-striped" id="simple-table">
							<tr style="background: skyblue">
								<th>resultid</th>
								<th>userid</th>
								<th>username</th>
								<th>fullname</th>
								<th>point</th>
								<th>testid</th>
								<th></th>
<!-- 								<th></th> -->
							</tr>
							<tbody id="myTable">
								<c:forEach items="${result}" var="list">

									<tr>
										<td>${list.resultid}</td>
										<td>${list.userid}</td>
										<td>${list.username}</td>
										<td>${list.fullname}</td>
										<td>${list.point}</td>
										<td>${list.testid}</td>
<%-- 										<td><a href="EditResult?index=${list.userid}&pageid=1">Edit</a></td> --%>
<%-- 										<td><a href="DeleteResult?index=${list.userid}&pageid=1" --%>
<!-- 											onclick="return show_comfirm()">Delete</a></td> -->

										<td class="center">
											<div class="hidden-sm hidden-xs action-buttons">
												<a class="skyblue"
													href="#" id="myBtn${list.resultid }"> 
													<i class="ace-icon fa fa-pencil bigger-130" > </i>
												</a> <a class="skyblue"
													href="DeleteResult?index=${list.resultid }&pageid=1"
													onclick="return show_comfirm()"> <i
													class="ace-icon fa fa-trash-o bigger-130"> </i>
												</a>
											</div>
										</td>
										
											
									</tr>
									<script type="text/javascript">
											$(document).ready(function() {
												$("#myBtn${list.resultid}").click(function() {
													$("#myModal").modal();
												});
											});
											
									        var table = document.getElementById("simple-table"),rindex;
											
											for(var i =1 ; i < table.rows.length; i++)
											{
												 table.rows[i].onclick = function()
												{
													rindex = this.rowIndex;		
													document.getElementById("resultid").value = this.cells[0].innerHTML;
													document.getElementById("userid").value = this.cells[1].innerHTML;
													document.getElementById("username").value = this.cells[2].innerHTML;
													document.getElementById("fullname").value = this.cells[3].innerHTML;
													document.getElementById("point").value = this.cells[4].innerHTML;
													document.getElementById("testid").value = this.cells[5].innerHTML;
												};
											}
									</script>
								</c:forEach>
							</tbody>
						</table>
						<ul class="pagination">
							<!-- numberpage trong HomeController -->
							<c:if test="${numberpage==1}">
								<li class="disabled"><a href="">&laquo;</a></li>
								<li><a href="EditResult?pageid=1">1</a></li>
								<li><a href="EditResult?pageid=2">2</a></li>
								<li><a href="EditResult?pageid=${numberpage+1}">&raquo;</a></li>
							</c:if>

							<c:if test="${numberpage==maxpageid}">
								<li class="disabled"><a href="">&laquo;</a></li>
								<li><a href="EditResult?pageid=1">1</a></li>
								<li><a href="EditResult?pageid=2">2</a></li>
								<li class="disabled"><a href="#">&raquo;</a></li>
							</c:if>

							<c:if test="${numberpage>1 && numberpage<maxpageid}">
								<li><a href="EditResult?pageid=${numberpage-1}">&laquo;</a></li>
								<li><a href="EditResult?pageid=1">1</a></li>
								<li><a href="EditResult?pageid=2">2</a></li>
								<li><a href="EditResult?pageid=${numberpage+1}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>

				</div>
			</div>
			<!--/.page-header -->
		</div>
		<!-- /.page-content -->
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" >
				<div class="modal-header" style="padding: 0px 10px; background:skyblue">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2>
						<span class="glyphicon glyphicon-user"></span> Edit Result
					</h2>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form action="UpdateResult?pageid=1" method="POST" name="frmInsertAcc">
						<div class="form-group">
							<label for="usrname">Result ID</label> 
							<input type="text" class="form-control" name="resultid" id ="resultid" placeholder="Result Test ID" >
						</div>
						<div class="form-group">
							<label for="psw">User ID</label> 
							<input type="text" class="form-control" name="userid" id="userid" placeholder="User ID">
						</div>

						<div class="form-group">
							<label for="usrname">Username</label> 
							<input type="text" class="form-control" name="username" id="username" placeholder="Username" disabled>
						</div>
						<div class="form-group">
							<label for="psw">Fullname</label> <input
								type="text" class="form-control" name="fullname" id="fullname"
								placeholder="Fullname" disabled>
						</div>
						<div class="form-group">
							<label for="usrname">Point</label> 
							<input type="text" class="form-control" name="point" id="point" placeholder="Point">
						</div>
						<div class="form-group">
							<label for="psw">Testid</label> <br>
							<%
							    try{
							//Class.forName("com.mysql.jdbc.Driver").newInstance();
							Class.forName("com.mysql.jdbc.Driver");
							Connection connection = 
						         DriverManager.getConnection
						            ("jdbc:mysql://localhost:3306/examonline","root","1234");
						
						       Statement statement = connection.createStatement() ;
						
						       resultset =statement.executeQuery("select testid from tests") ;
							%>
							
						        <select id="testid" name="testid">
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
						</div>

						<button type="submit" class="btn btn-success btn-block" >
							<span class="glyphicon glyphicon-ok"></span> Save
						</button>
<!-- 						<input type="submit" value="Save"> -->
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>

				</div>
			</div>

		</div>
	</div>



	<!-- /.main-content -->

	 <!--     Include file Footer -->
<%-- 	<jsp:include page="Footer.jsp" /> --%>
 <div class="footer">
            <div class="footer-inner">
                <div class="footer-content">
                    <span class="bigger-120">
							<span class="blue bolder">HCMUTE</span> Application &copy; 2016-2017
                    </span>

                    &nbsp; &nbsp;
                    <span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
                </div>
            </div>
        </div>

	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	<!-- /.main-container -->

</body>

</html>
