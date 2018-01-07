<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
		<%@ page import="java.sql.*" %>
			<%ResultSet resultset =null;%>

				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html>

				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
					<title>Update Delete Question</title>


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

					<!-- Show thông báo ra màn hình -->
					<script type="text/javascript">
						function show_comfirm() {
							var comfirmBox;
							comfirmBox = confirm("Are you sure to delete this Question?");
							if (comfirmBox == true) {
								return true;
							} else {
								return false;
							}
						}
					</script>

					<!-- Search -->
					<script>
						$(document).ready(
							function () {
								$("#myInput").on(
									"keyup",
									function () {
										var value = $(this).val().toLowerCase();
										$("#myTable tr").filter(
											function () {
												$(this).toggle(
													$(this).text().toLowerCase()
														.indexOf(value) > -1)
											});
									});
							});
					</script>


				</head>

				<body class="no-skin" style="font-size: 14px;">
					<div id="navbar" class="navbar navbar-default          ace-save-state">
						<div class="navbar-container ace-save-state" id="navbar-container">
							<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
								<span class="sr-only">Toggle sidebar</span>

								<span class="icon-bar"></span>

								<span class="icon-bar"></span>

								<span class="icon-bar"></span>
							</button>

							<div class="navbar-header pull-left">
								<a href="#" class="navbar-brand">
									<small>
										<i class="fa fa-leaf"></i>
										HCMUTE
									</small>
								</a>
							</div>

							<div class="navbar-buttons navbar-header pull-right" role="navigation">
								<ul class="nav ace-nav">
									<li class="purple dropdown-modal">
										<a data-toggle="dropdown" class="dropdown-toggle" href="#">
											<i class="ace-icon fa fa-bell icon-animated-bell"></i>
											<span class="badge badge-important">8</span>
										</a>

										<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
											<li class="dropdown-header">
												<i class="ace-icon fa fa-exclamation-triangle"></i> 8 Notifications
											</li>

											<li class="dropdown-content">
												<ul class="dropdown-menu dropdown-navbar navbar-pink">
													<li>
														<a href="#">
															<div class="clearfix">
																<span class="pull-left">
																	<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
																	New Comments
																</span>
																<span class="pull-right badge badge-info">+12</span>
															</div>
														</a>
													</li>

													<li>
														<a href="#">
															<i class="btn btn-xs btn-primary fa fa-user"></i>
															Bob just signed up as an editor ...
														</a>
													</li>

													<li>
														<a href="#">
															<div class="clearfix">
																<span class="pull-left">
																	<i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
																	New Orders
																</span>
																<span class="pull-right badge badge-success">+8</span>
															</div>
														</a>
													</li>

													<li>
														<a href="#">
															<div class="clearfix">
																<span class="pull-left">
																	<i class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
																	Followers
																</span>
																<span class="pull-right badge badge-info">+11</span>
															</div>
														</a>
													</li>
												</ul>
											</li>

											<li class="dropdown-footer">
												<a href="#">
													See all notifications
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</li>
										</ul>
									</li>

									<li class="green dropdown-modal">
										<a data-toggle="dropdown" class="dropdown-toggle" href="#">
											<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
											<span class="badge badge-success">5</span>
										</a>

										<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
											<li class="dropdown-header">
												<i class="ace-icon fa fa-envelope-o"></i> 5 Messages
											</li>

											<li class="dropdown-content">
												<ul class="dropdown-menu dropdown-navbar">
													<li>
														<a href="#" class="clearfix">
															<img src="Style/images/avatar.png" class="msg-photo" alt="Alex's Avatar" />
															<span class="msg-body">
																<span class="msg-title">
																	<span class="blue">Alex:</span>
																	Ciao sociis natoque penatibus et auctor ...
																</span>

																<span class="msg-time">
																	<i class="ace-icon fa fa-clock-o"></i>
																	<span>a moment ago</span>
																</span>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="clearfix">
															<img src="Style/images/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
															<span class="msg-body">
																<span class="msg-title">
																	<span class="blue">Susan:</span>
																	Vestibulum id ligula porta felis euismod ...
																</span>

																<span class="msg-time">
																	<i class="ace-icon fa fa-clock-o"></i>
																	<span>20 minutes ago</span>
																</span>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="clearfix">
															<img src="Style/images/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
															<span class="msg-body">
																<span class="msg-title">
																	<span class="blue">Bob:</span>
																	Nullam quis risus eget urna mollis ornare ...
																</span>

																<span class="msg-time">
																	<i class="ace-icon fa fa-clock-o"></i>
																	<span>3:15 pm</span>
																</span>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="clearfix">
															<img src="Style/images/avatar2.png" class="msg-photo" alt="Kate's Avatar" />
															<span class="msg-body">
																<span class="msg-title">
																	<span class="blue">Kate:</span>
																	Ciao sociis natoque eget urna mollis ornare ...
																</span>

																<span class="msg-time">
																	<i class="ace-icon fa fa-clock-o"></i>
																	<span>1:33 pm</span>
																</span>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="clearfix">
															<img src="Style/images/avatar5.png" class="msg-photo" alt="Fred's Avatar" />
															<span class="msg-body">
																<span class="msg-title">
																	<span class="blue">Fred:</span>
																	Vestibulum id penatibus et auctor ...
																</span>

																<span class="msg-time">
																	<i class="ace-icon fa fa-clock-o"></i>
																	<span>10:09 am</span>
																</span>
															</span>
														</a>
													</li>
												</ul>
											</li>

											<li class="dropdown-footer">
												<a href="inbox.html">
													See all messages
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</li>
										</ul>
									</li>

									<li class="light-blue dropdown-modal">
										<a data-toggle="dropdown" href="#" class="dropdown-toggle">
											<img class="nav-user-photo" src="Style/images/user.jpg" alt="Jason's Photo" />
											<span class="user-info">
												<small>Welcome,</small>
												Jason
											</span>

											<i class="ace-icon fa fa-caret-down"></i>
										</a>

										<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
											<li>
												<a href="#">
													<i class="ace-icon fa fa-cog"></i>
													Settings
												</a>
											</li>

											<li>
												<a href="#">
													<i class="ace-icon fa fa-user"></i>
													Profile
												</a>
											</li>

											<li class="divider"></li>

											<li>
												<a href="HomePage">
													<i class="ace-icon fa fa-power-off"></i>
													Logout
												</a>
											</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
						<!-- /.navbar-container -->
					</div>

					<div class="main-container ace-save-state" id="main-container">
						<script type="text/javascript">
							try {
								ace.settings.loadState('main-container')
							} catch (e) { }
						</script>

						<script>
							$(document).ready(function () {
								var i = 0;
								$('#add').click(function () {
									i++;
									var n = document.getElementById('number').value;
									var left = document.getElementsByTagName('textarea').length;
									if (left != 0) {
										if (n >= left) {
											i = n - Math.abs(n - left);
											for (i; i < n; i++) {
												$('#dynamic_field').append('<tr id="row' + i +
													'"><td><textarea style="height:80px, width=80%" name="option' +
													i + '" id="option' + i +
													'" placeholder="Enter Option Content" class="form-control name_list" required></textarea></td><td style="max-width: 51px;"><button style="opacity: 0;"></button><input type="checkbox" id="optioncb[]" name="optionCheck' +
													i +
													'" style="margin-left: -93px;margin-top: -33px;"/></td></tr>'
												);
											}
										} else {
											i = left;
											for (i; i >= n; i--) {
												$('#row' + i + '').remove();
											}
										}
									}
								});

								$('#edit').click(function () {
									var n = document.getElementById('number').value;
									for (i; i < n; i++) {
										$('#dynamic_field').append('<tr id="row' + i +
											'"><td><textarea style="height:80px, width=80%" name="option' +
											i + '" id="option' + i +
											'" placeholder="' + '" class="form-control name_list" required></textarea></td><td style="max-width: 51px;"><button style="opacity: 0;"></button><input type="checkbox" id="optioncb[]" name="optionCheck' +
											i +
											'" style="margin-left: -93px;margin-top: -33px;"/></td></tr>'
										);
									}
								});
								$(document).on('click', '.btn_remove', function () {
									var button_id = $(this).attr("id");
									$('#row' + button_id + '').remove();
								});

								$('#insert').click(function () {
									$.ajax({
										url: "InsertQuestion",
										method: "POST",
										data: $('#addquestion').serialize(),
										success: function (data) {
											alert(data);
											$('#addquestion')[0].reset();
										}
									});
								});
							});
						</script>
						<div id="sidebar" class="sidebar responsive ace-save-state">
							<script type="text/javascript">
								try {
									ace.settings.loadState('sidebar')
								} catch (e) { }
							</script>

							<div class="sidebar-shortcuts" id="sidebar-shortcuts">
								<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
									<button class="btn btn-success">
										<i class="ace-icon fa fa-signal"></i>
									</button>

									<button class="btn btn-info">
										<i class="ace-icon fa fa-pencil"></i>
									</button>

									<button class="btn btn-warning">
										<i class="ace-icon fa fa-users"></i>
									</button>

									<button class="btn btn-danger">
										<i class="ace-icon fa fa-cogs"></i>
									</button>
								</div>

								<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
									<span class="btn btn-success"></span>

									<span class="btn btn-info"></span>

									<span class="btn btn-warning"></span>

									<span class="btn btn-danger"></span>
								</div>
							</div>
							<!-- /.sidebar-shortcuts -->

							<ul class="nav nav-list">
								<li class="">
									<a href="HomeQuestion">
										<i class="menu-icon fa fa-tachometer"></i>
										<span class="menu-text">Home</span>
									</a>

									<b class="arrow"></b>
								</li>

								<li class="open">
									<a href="#QuestionManager" class="dropdown-toggle">
										<i class="menu-icon fa fa-list"></i>
										<span class="menu-text"> Questions </span>

										<b class="arrow fa fa-angle-down"></b>
									</a>

									<b class="arrow"></b>

									<ul class="submenu">
										<li class="">
											<a href="InsertQuestion">
												<i class="menu-icon fa fa-caret-right"></i>
												Insert Question
											</a>

											<b class="arrow"></b>
										</li>

										<li class="active">
											<a href="UpdateDeleteQuestion?pageid=1">
												<i class="menu-icon fa fa-caret-right"></i>
												Update & Delete Question
											</a>

											<b class="arrow"></b>
										</li>
									</ul>
								</li>

								<li class="">
									<a href="#" class="dropdown-toggle">
										<i class="menu-icon fa fa-pencil-square-o"></i>
										<span class="menu-text"> Question Types </span>

										<b class="arrow fa fa-angle-down"></b>
									</a>

									<b class="arrow"></b>

									<ul class="submenu">
										<li class="">
											<a href="InsertQuestionType">
												<i class="menu-icon fa fa-caret-right"></i>
												Insert Question Types
											</a>

											<b class="arrow"></b>
										</li>

										<li class="">
											<a href="UpdateDeleteQuestionType?pageid=1">
												<i class="menu-icon fa fa-caret-right"></i>
												Update & Delete Question Types
											</a>

											<b class="arrow"></b>
										</li>
									</ul>
								</li>


								<li class="">
									<a href="CalendarQuestion">
										<i class="menu-icon fa fa-calendar"></i>

										<span class="menu-text">
											Calendar

										</span>
									</a>

									<b class="arrow"></b>
								</li>
							</ul>
							<!-- /.nav-list -->
							<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
								<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left"
								 data-icon2="ace-icon fa fa-angle-double-right"></i>
							</div>
						</div>

						<div class="main-content">

							<div class="main-content-inner">
								<div class="breadcrumbs ace-save-state" id="breadcrumbs">
									<ul class="breadcrumb">
										<li>
											<i class="ace-icon fa fa-home home-icon"></i>
											<a href="HomeQuestion">Home</a>
										</li>
										<li class="active">
											<a href="">Questions</a>
										</li>
										<li class="active">
											<a href="">Update & Delete Questions</a>
										</li>
									</ul>
									<!-- /.breadcrumb -->

									<div class="nav-search" id="nav-search">
										<form class="form-search">
											<span class="input-icon">
												<input type="text" placeholder="Search ..." class="nav-search-input" id="myInput" autocomplete="off" />
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
											Update & Delete Questions
											<small>
												<i class="ace-icon fa fa-angle-double-right"></i>
												overview &amp; stats
											</small>
										</h1>
									</div>
									<!--                     Show dữ liệu lên bảng -->
									<div class="" id="UpdateDeleteQuestion ">
										<h2 align="center">QUESTIONS </h2>


										<!-- 						<table class="table" id="makeEditable" border='1' style="width: 100%" class="table table-hover table-bordered table-striped"> -->
										<table class="table table-hover" id="makeEditable" style=" width: 100%;max-width: 100%;
                        margin-bottom: 20px; border-collapse: collapse; border-spacing: 0;">

											<tr>
												<th>QuestionID</th>
												<th>QuestionType</th>
												<th class="text-center">Content</th>
												<th class="text-center">Options</th>
												<th>Answer </th>
												<th>MediaID</th>

												<!-- <th /> <th /> -->
												<th>
													<button type="button" id="AddNewQuestion" class="btn btn-xs btn-info" onclick="return AddNewQuestion()">AddQuestion</button>
												</th>
											</tr>
											<tbody id="myTable">
												<c:forEach items="${questions}" var="list">

													<tr class="text-center">
														<td>${list.questionid}</td>
														<td>${list.questiontype}</td>
														<td>${list.contentquestion}</td>
														<td>${list.options}</td>
														<td>${list.correctoption}</td>
														<td>${list.mediaid}</td>
														<td class="text-center" style="text-align: center !important;">
															<div class="btn-group">
																<!-- <a href="EditAQuestion?index=${list.questionid}&pageid=1" data-toggle="tooltip" title="" class="btn btn-xs btn-success" data-original-title="Edit" ><i class="fa fa-pencil" > </i>
                                                </a> -->
																<a href="myBtn${list.questionid}" name="edit" data-toggle="tooltip" title="" class="btn btn-xs btn-success" data-original-title="Edit">
																	<i class="fa fa-pencil"> </i>
																</a>
																<a href="DeleteQuestion?index=${list.questionid}&pageid=1" data-toggle="tooltip" title="" class="btn btn-xs btn-danger" data-original-title="Delete"
																 onclick="return show_comfirm()">
																	<i class="fa fa-trash-o "> </i>
																</a>
															</div>
														</td>

													</tr>
													<script type="text/javascript">
														$(document).ready(function () {
															$("#myBtn${list.questionid}").click(function () {
																$("#myModal_2").modal();
																alert("mem vao dc edit");
															});
														});

														var table = document.getElementById("simple-table"),
															rindex;

														for (var i = 1; i < table.rows.length; i++) {
															table.rows[i].onclick = function () {
																rindex = this.rowIndex;
																document.getElementById("questionid").value = this.cells[0].innerHTML;
																document.getElementById("questiontype").value = this.cells[1].innerHTML;
																document.getElementById("contentquestion").value = this.cells[2].innerHTML;
																document.getElementById("options").value = this.cells[3].innerHTML;
																document.getElementById("correctoption").value = this.cells[4].innerHTML;
																document.getElementById("mediaid").value = this.cells[5].innerHTML;
															};
														}
													</script>
												</c:forEach>
											</tbody>
										</table>
										<ul class="pagination">
											<!-- numberpage trong HomeController -->
											<c:if test="${numberpage==1}">
												<li class="disabled">
													<a href="">&laquo;</a>
												</li>
												<li>
													<a href="UpdateDeleteQuestion?pageid=1">1</a>
												</li>
												<li>
													<a href="UpdateDeleteQuestion?pageid=2">2</a>
												</li>
												<li>
													<a href="UpdateDeleteQuestion?pageid=${numberpage+1}">&raquo;</a>
												</li>
											</c:if>

											<c:if test="${numberpage==maxpageid}">
												<li class="disabled">
													<a href="HomeForward?pageid=${numberpage-1}">&laquo;</a>
												</li>
												<li>
													<a href="UpdateDeleteQuestion?pageid=1">1</a>
												</li>
												<li>
													<a href="UpdateDeleteQuestion?pageid=2">2</a>
												</li>
												<li class="disabled">
													<a href="#">&raquo;</a>
												</li>
											</c:if>

											<c:if test="${numberpage>1 && numberpage<maxpageid}">
												<li>
													<a href="UpdateDeleteQuestion?pageid=${numberpage-1}">&laquo;</a>
												</li>
												<li>
													<a href="UpdateDeleteQuestion?pageid=1">1</a>
												</li>
												<li>
													<a href="UpdateDeleteQuestion?pageid=2">2</a>
												</li>
												<li>
													<a href="UpdateDeleteQuestion?pageid=${numberpage+1}">&raquo;</a>
												</li>
											</c:if>
										</ul>
									</div>
								</div>


							</div>
						</div>
						<!-- /.page-header -->

					</div>
					<!-- /.page-content -->
					</div>

					<div class="modal fade" id="myModal_2" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header" style="padding: 0px 10px; background:skyblue">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h2>
										<span class="glyphicon glyphicon-user"></span> Edit Question
									</h2>
								</div>
								<div class="modal-body" style="padding: 40px 50px;">
									<form action="SaveEditQuestion?pageid=1" method="POST" name="frmInsertAcc">
										<div class="form-group">
											<label for="questionid">Question ID</label>
											<input type="text" class="form-control" name="questionid" id="questionid" placeholder="Question ID" value="${list.questiontypename}"
											 disabled/>
										</div>
										<div class="form-group">
											<label class="control-label" for="appointmentfor">Subject</label>
											<br>
											<%
											try{
										//Class.forName("com.mysql.jdbc.Driver").newInstance();
										Class.forName("com.mysql.jdbc.Driver");
										Connection connection = 
											DriverManager.getConnection
// 											("jdbc:mysql://localhost:3306/examonline","root","1234");
					//						("jdbc:mysql://node16816-examonlinevn.kilatiron.com/examonline?useUnicode=true&characterEncoding=UTF-8","root","PSSmqz60857");
											("jdbc:mysql://node10595-examonline.fr-1.paas.massivegrid.net/examonline?useUnicode=true&characterEncoding=UTF-8","root","BSOxar77141");									
										Statement statement = connection.createStatement() ;
									
										resultset =statement.executeQuery("select * from subjects") ;
										%>

												<select id="subjectid" name="subjectid" style="border: 1px solid #00ffc1">
													<%  while(resultset.next()){ %>
														<option selected value="<%= resultset.getString(1)%>">
															<%= resultset.getString(2)%>
														</option>
														<% } %>
												</select>

												<%
											}
											catch(Exception e)
											{
												out.println("wrong entry"+e);
											}
										%>

										</div>
										<div class="form-group">
											<label for="questiontype">Questiontype</label>
											<input type="text" class="form-control" name="questiontype" id="questiontype" placeholder="Questiontype">
											<br>
											<%
														    try{
														//Class.forName("com.mysql.jdbc.Driver").newInstance();
														Class.forName("com.mysql.jdbc.Driver");
														Connection connection = 
													         DriverManager.getConnection
//  													         ("jdbc:mysql://localhost:3306/examonline","root","1234");
//													         ("jdbc:mysql://node16816-examonlinevn.kilatiron.com/examonline?useUnicode=true&characterEncoding=UTF-8","root","PSSmqz60857");
													         ("jdbc:mysql://node10595-examonline.fr-1.paas.massivegrid.net/examonline?useUnicode=true&characterEncoding=UTF-8","root","BSOxar77141");													
													       Statement statement = connection.createStatement() ;
													
													       resultset =statement.executeQuery("select * from questiontypes") ;
														%>

												<select id="questiontypeid1" name="questiontypeid1" style="border: 1px solid #00ffc1">
													<%  while(resultset.next()){ %>
														<option selected class="dropdown" value="<%= resultset.getString(1)%>">
															<%= resultset.getString(2)%>
														</option>
														<% } %>
												</select>

												<%
													        }
													        catch(Exception e)
													        {
													             out.println("wrong entry"+e);
													        }
														%>
										</div>
										<div class="form-group">
											<label for="contentquestion">Content</label>
											<input type="text" class="form-control" name="contentquestion" id="contentquestion" placeholder="Content" value="${list.contentquestion}">
										</div>
										<div class="form-group">
											<label class="control-label" for="appointmentfor">Number of Options</label>
											<input type="text" id="number" name="number" value="1" placeholder="Content" class="form-control input-md">
										</div>
										<div class="form-group">
											<label for="options">Options</label>
											<div class="form-group">


												<div class="control-group" id="fields">
													<label class="control-label" for="option">Option</label>
													<form action="InsertOption?pageid=1" method="post" name="add_name" id="add_name">
														<br>
														<%
															try{
														//Class.forName("com.mysql.jdbc.Driver").newInstance();
														Class.forName("com.mysql.jdbc.Driver");
														Connection connection = 
															DriverManager.getConnection
// 															("jdbc:mysql://localhost:3306/examonline","root","1234");
									//						("jdbc:mysql://node10593-onlineexam.fr-1.paas.massivegrid.net/examonline?useUnicode=true&characterEncoding=UTF-8","root","PSSmqz60857");
													         ("jdbc:mysql://node10595-examonline.fr-1.paas.massivegrid.net/examonline?useUnicode=true&characterEncoding=UTF-8","root","BSOxar77141");													
														Statement statement = connection.createStatement() ;
													
														resultset =statement.executeQuery("select * from options where questionid=${list.questiontid}") ;
														%>

															<table class="table table-bordered" id="dynamic_field">
																<% int i =0; while(resultset.next()){ %>
																	<tr>
																		<td>
																			<textarea style="height:80px, width=80%" name="option" +i id="option" +i placeholder="Enter Option Content" class="form-control name_list"
																			 required value="<%= resultset.getString(1)%>"><%= resultset.getString(2)%></textarea>
																		</td>
																		<td style="max-width: 51px;">
																			<button type="button" name="add" id="add" class="btn btn-success">
																				<strong>+</strong>
																			</button>
																			<input type="checkbox" id="optioncb[]" name="optionCheck" +i value="<%= resultset.getString(3)%>" style="margin-left: -93px;margin-top: -33px;"
																			/>
																		</td>
																	</tr>
																	<% } %>
															</table>
															<%
															}
															catch(Exception e)
															{
																out.println("wrong entry"+e);
															}
														%>
													</form>
													<br>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="media">Mediaid</label>
											<input type="file" class="form-control" name="media" id="media" placeholder="File">
										</div>
										<button type="submit" class="btn btn-success btn-block" onclick="return KiemTraHopLe()">
											<span class="glyphicon glyphicon-ok"></span> Save
										</button>
									</form>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
										<span class="glyphicon glyphicon-remove"></span> Cancel
									</button>

								</div>
							</div>

						</div>
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