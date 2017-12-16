<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
	<%@ page import="java.sql.*" %>
	<%ResultSet resultset =null;%>
    
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Exam</title>
        <meta name="description" content="overview &amp; stats" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <!-- bootstrap & fontawesome -->
        <link rel="stylesheet" href="Style/css/bootstrap.min.css" />
        <link rel="stylesheet" href="Style/css/font-awesome.min.css" />


        <!-- page specific plugin styles -->
        <link rel="stylesheet" href="Style/js/jquery-ui.custom.min.css" />
        <link rel="stylesheet" href="Style/css/fullcalendar.min.css" />


        <!-- text fonts -->
        <link rel="stylesheet" href="Style/css/fonts.googleapis.com.css" />

        <!-- ace styles -->
        <link rel="stylesheet" href="Style/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

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

    </head>

    <body class="no-skin" style="font-size: 14px;">

        <jsp:include page="NotificationExam.jsp"></jsp:include>

        <div class="main-container ace-save-state" id="main-container">
            <script type="text/javascript">
                try {
                    ace.settings.loadState('main-container')
                } catch (e) {}

            </script>

			<!-- 			Insert menu -->
            <jsp:include page="MenuExam.jsp"></jsp:include>

            <div class="main-content">

                <div class="main-content-inner">
                    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                        <ul class="breadcrumb">
                            <li>
                                <i class="ace-icon fa fa-home home-icon"></i>
                                <a href="#">Manage Exam</a>
                            </li>
                            <li class="active">Edit Exam</li>
                        </ul>
                        <!-- /.breadcrumb -->

                        <div class="nav-search" id="nav-search">
                            <form class="form-search">
                                <span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
                            </form>
                        </div>
                        <!-- /.nav-search -->
                    </div>

                    <div class="page-content">
                        <!-- /.ace-settings-container -->


                        <div class="page-header">
                            <h1>
                                Edit Exam
                                <small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									Manage Exam can edit test sheet
								</small>
                            </h1>
                        </div>
                        
                        
                        <div class="">
						<h2>List User</h2>
						<table border='1' style="width: 100%"
							class="table table-hover table-bordered table-striped" id ="simple-table">
							<tr style="background: skyblue">
								<th>testtypename</th>
								<th>classname</th>
								<th>subjectname</th>
								<th>datetimestart</th>
								<th>datetimeend</th>
								<th>numberquestion</th>
								<th>time</th>

								<th>
									<button type="button" id="AddNewUser" style="background:#40ff00" onclick="return AddNewUser()">Add
										User</button>
								</th>
							</tr>
							<tbody id="myTable">
								<c:forEach items="${listexam}" var="list">

									<tr>
										<td>${list.testtypename}</td>
										<td>${list.classname}</td>
										<td>${list.subjectname}</td>
										<td>${list.datetimestart}</td>
										<td>${list.datetimeend}</td>
										<td>${list.numberquestion}</td>
										<td>${list.time}</td>
										<%--<td><a href="EditAccount?index=${list.userid}&pageid=1">Edit</a></td> --%>

<!-- 										<td><a href="DeleteAccount?pageid=1" onclick="return show_comfirm()">Delete</a></td> -->
										<td class="center">
											<div class="hidden-sm hidden-xs action-buttons">

												<a class="skyblue" href="#" id="myBtn"> 
												<i class="ace-icon fa fa-pencil bigger-130" > </i>
												</a> <a class="skyblue"
													href="DeleteAccount?pageid=1"
													onclick="return show_comfirm()"> 
													<i class="ace-icon fa fa-trash-o bigger-130"> </i>
												</a>
											</div>
										</td>

									</tr>
									<script type="text/javascript">

									$(document).ready(function() {
										$("#myBtn${list.userid}").click(function() {
											$("#myModal_2").modal();
										});
									});
									
							        var table = document.getElementById("simple-table"),rindex;
									
									for(var i =1 ; i < table.rows.length; i++)
									{
										 table.rows[i].onclick = function()
										{
											rindex = this.rowIndex;		
											document.getElementById("userid").value = this.cells[0].innerHTML;
											document.getElementById("username").value = this.cells[1].innerHTML;
											document.getElementById("pass").value = this.cells[2].innerHTML;
											document.getElementById("fullname").value = this.cells[3].innerHTML;
											document.getElementById("birthday").value = this.cells[4].innerHTML;
											document.getElementById("country").value = this.cells[5].innerHTML;
											document.getElementById("phone").value = this.cells[6].innerHTML;
											document.getElementById("image").value = this.cells[7].innerHTML;
											document.getElementById("roleid").value = this.cells[8].innerHTML;
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
								<li><a href="UpdateandDeleteAccount?pageid=1">1</a></li>
								<li><a href="UpdateandDeleteAccount?pageid=2">2</a></li>
								<li><a href="UpdateandDeleteAccount?pageid=${numberpage+1}">&raquo;</a></li>
							</c:if>

							<c:if test="${numberpage==maxpageid}">
								<li class="disabled"><a
									href="HomeForward?pageid=${numberpage-1}">&laquo;</a></li>
								<li><a href="UpdateandDeleteAccount?pageid=1">1</a></li>
								<li><a href="UpdateandDeleteAccount?pageid=2">2</a></li>
								<li class="disabled"><a href="#">&raquo;</a></li>
							</c:if>

							<c:if test="${numberpage>1 && numberpage<maxpageid}">
								<li><a href="UpdateandDeleteAccount?pageid=${numberpage-1}">&laquo;</a></li>
								<li><a href="UpdateandDeleteAccount?pageid=1">1</a></li>
								<li><a href="UpdateandDeleteAccount?pageid=2">2</a></li>
								<li><a href="UpdateandDeleteAccount?pageid=${numberpage+1}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>

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

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
        </div>
        <!-- /.main-container -->

    </body>

    </html>
