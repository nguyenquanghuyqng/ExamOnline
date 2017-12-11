<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
	<%@ page import="java.sql.*" %>
	<%ResultSet resultset =null;%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Delete Acount</title>

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

<!-- Show thông báo ra màn hình -->
<script type="text/javascript">
	function show_comfirm() {
		var comfirmBox;
		comfirmBox = confirm("Bạn có chắc chắn muốn xóa tài khoản?");
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
			function() {
				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#myTable tr").filter(
									function() {
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
			<button type="button" class="navbar-toggle menu-toggler pull-left"
				id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<div class="navbar-header pull-left">
				<a href="HomeAdminForWard" class="navbar-brand"> <small>
						<i class="fa fa-leaf"></i> HCMUTE
				</small>
				</a>
			</div>

			<div class="navbar-buttons navbar-header pull-right"
				role="navigation">
				<ul class="nav ace-nav">
					<li class="purple dropdown-modal"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i
							class="ace-icon fa fa-bell icon-animated-bell"></i> <span
							class="badge badge-important">8</span>
					</a>

						<ul
							class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i
								class="ace-icon fa fa-exclamation-triangle"></i> 8 Notifications
							</li>

							<li class="dropdown-content">
								<ul class="dropdown-menu dropdown-navbar navbar-pink">
									<li><a href="#">
											<div class="clearfix">
												<span class="pull-left"> <i
													class="btn btn-xs no-hover btn-pink fa fa-comment"></i> New
													Comments
												</span> <span class="pull-right badge badge-info">+12</span>
											</div>
									</a></li>

									<li><a href="#"> <i
											class="btn btn-xs btn-primary fa fa-user"></i> Bob just
											signed up as an editor ...
									</a></li>

									<li><a href="#">
											<div class="clearfix">
												<span class="pull-left"> <i
													class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
													New Orders
												</span> <span class="pull-right badge badge-success">+8</span>
											</div>
									</a></li>

									<li><a href="#">
											<div class="clearfix">
												<span class="pull-left"> <i
													class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
													Followers
												</span> <span class="pull-right badge badge-info">+11</span>
											</div>
									</a></li>
								</ul>
							</li>

							<li class="dropdown-footer"><a href="#"> See all
									notifications <i class="ace-icon fa fa-arrow-right"></i>
							</a></li>
						</ul></li>

					<li class="green dropdown-modal"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i
							class="ace-icon fa fa-envelope icon-animated-vertical"></i> <span
							class="badge badge-success">5</span>
					</a>

						<ul
							class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i
								class="ace-icon fa fa-envelope-o"></i> 5 Messages</li>

							<li class="dropdown-content">
								<ul class="dropdown-menu dropdown-navbar">
									<li><a href="#" class="clearfix"> <img
											src="Style/images/avatar.png" class="msg-photo"
											alt="Alex's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Alex:</span>
													Ciao sociis natoque penatibus et auctor ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>a moment
														ago</span>
											</span>
										</span>
									</a></li>

									<li><a href="#" class="clearfix"> <img
											src="Style/images/avatar3.png" class="msg-photo"
											alt="Susan's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Susan:</span>
													Vestibulum id ligula porta felis euismod ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>20 minutes
														ago</span>
											</span>
										</span>
									</a></li>

									<li><a href="#" class="clearfix"> <img
											src="Style/images/avatar4.png" class="msg-photo"
											alt="Bob's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Bob:</span>
													Nullam quis risus eget urna mollis ornare ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>3:15 pm</span>
											</span>
										</span>
									</a></li>

									<li><a href="#" class="clearfix"> <img
											src="Style/images/avatar2.png" class="msg-photo"
											alt="Kate's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Kate:</span>
													Ciao sociis natoque eget urna mollis ornare ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>1:33 pm</span>
											</span>
										</span>
									</a></li>

									<li><a href="#" class="clearfix"> <img
											src="Style/images/avatar5.png" class="msg-photo"
											alt="Fred's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Fred:</span>
													Vestibulum id penatibus et auctor ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>10:09 am</span>
											</span>
										</span>
									</a></li>
								</ul>
							</li>

							<li class="dropdown-footer"><a href="inbox.html"> See
									all messages <i class="ace-icon fa fa-arrow-right"></i>
							</a></li>
						</ul></li>

					<li class="light-blue dropdown-modal"><a
						data-toggle="dropdown" href="#" class="dropdown-toggle"> <img
							class="nav-user-photo" src="Style/images/user.jpg"
							alt="Jason's Photo" /> <span class="user-info"> <small>Welcome,</small>
								Jason
						</span> <i class="ace-icon fa fa-caret-down"></i>
					</a>

						<ul
							class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="#"> <i class="ace-icon fa fa-cog"></i>
									Settings
							</a></li>

							<li><a href="profile.html"> <i
									class="ace-icon fa fa-user"></i> Profile
							</a></li>

							<li class="divider"></li>

							<li><a href="HomePage"> <i
									class="ace-icon fa fa-power-off"></i> Logout
							</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- /.navbar-container -->
	</div>

	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.loadState('main-container')
			} catch (e) {
			}
		</script>

		<div id="sidebar" class="sidebar responsive ace-save-state">
			<script type="text/javascript">
				try {
					ace.settings.loadState('sidebar')
				} catch (e) {
				}
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
					<span class="btn btn-success"></span> <span class="btn btn-info"></span>

					<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
				</div>
			</div>
			<!-- /.sidebar-shortcuts -->

			<ul class="nav nav-list">

				<li class="active"><a href="HomeAdminForWard"> <i
						class="menu-icon fa fa-tachometer"></i> <span class="menu-text">Home
							Admin</span>
				</a> <b class="arrow"></b></li>

				<!-- fa-desktop: là sử dụng font-awesome để lấy các icon -->
				<li class=""><a href="#" class="dropdown-toggle"> <i
						class="menu-icon fa fa-desktop"></i> <span class="menu-text">
							Manage Account </span> <b class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					<ul class="submenu">
						<li class=""><a href="InsertAccount"> <i
								class="menu-icon fa fa-caret-right"></i> Insert Account <b
								class="arrow"></b>
						</a> <b class="arrow"></b>
						<li class=""><a href="UpdateandDeleteAccount?pageid=1"> <i
								class="menu-icon fa fa-caret-right"></i> Update and Delete
								Account
						</a> <b class="arrow"></b></li>

						<li class=""><a href="InsertClass?pageid=1"> <i
								class="menu-icon fa fa-caret-right"></i> Insert Class
						</a> <b class="arrow"></b></li></li>

			</ul>
			</li>

			<li class=""><a href="#" class="dropdown-toggle"> <i
					class="menu-icon fa fa-pencil-square-o"></i> <span
					class="menu-text"> Manage Result </span> <b
					class="arrow fa fa-angle-down"></b>
			</a> <b class="arrow"></b>

				<ul class="submenu">
					<li class=""><a href="#ViewResult?pageid=1"
						class="dropdown-toggle"> <i
							class="menu-icon fa fa-caret-right"></i> View Result
					</a> <b class="arrow"></b>
						<ul class="submenu">
							<li class=""><a href="AccountHaveResult?pageid=1"> <i
									class="menu-icon fa fa-caret-right"></i> List of account have
									result
							</a> <b class="arrow"></b></li>

							<li class=""><a href="CandidateDontHaveExam"> <i
									class="menu-icon fa fa-caret-right"></i> List of account did
									not contest
							</a> <b class="arrow"></b></li>
						</ul></li>

					<li class=""><a href="EditResult?pageid=1"> <i
							class="menu-icon fa fa-caret-right"></i> Edit Result
					</a> <b class="arrow"></b></li>

				</ul></li>

			<li class=""><a href="Calendar"> <i
					class="menu-icon fa fa-calendar"></i> <span class="menu-text">
						Calendar <span class="badge badge-transparent tooltip-error"
						title="2 Important Events"> <i class="ace-icon "></i>
					</span>
				</span>
			</a> <b class="arrow"></b></li>

			</ul>
			<!-- /.nav-list -->

			<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
				<i id="sidebar-toggle-icon"
					class="ace-icon fa fa-angle-double-left ace-save-state"
					data-icon1="ace-icon fa fa-angle-double-left"
					data-icon2="ace-icon fa fa-angle-double-right"></i>
			</div>
		</div>

		<div class="main-content">

			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
						</li>

						<li><a href="#">Manage Account</a></li>
						<li class="active">Update and Delete Account</li>
					</ul>
					<!-- /.breadcrumb -->

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon"> <input class="nav-search-input"
								id="myInput" type="text" placeholder="Search ..."
								autocomplete="off"> <i
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
							Upadate and Delete Account <small> <i
								class="ace-icon fa fa-angle-double-right"></i> Admin can delete
								account user or update account user
							</small>
						</h1>
					</div>

					<div class="">
						<h2>List User</h2>
						<table border='1' style="width: 100%"
							class="table table-hover table-bordered table-striped" id ="simple-table">
							<tr style="background: skyblue">
								<th>userid</th>
								<th>username</th>
								<th>pass</th>
								<th>fullname</th>
								<th>birthday</th>
								<th>country</th>
								<th>phone</th>
								<th>image</th>
								<th>roleid</th>
								<!--                                         <th></th> -->
								<!--                                         <th></th> -->

								<th>
									<button type="button" id="myBtn" style="background:#40ff00">Add
										User</button>
								</th>
							</tr>
							<tbody id="myTable">
								<c:forEach items="${account}" var="list">

									<tr>
										<td>${list.userid}</td>
										<td>${list.username}</td>
										<td>${list.pass}</td>
										<td>${list.fullname}</td>
										<td>${list.birthday}</td>
										<td>${list.country}</td>
										<td>${list.phone}</td>
										<td>${list.image}</td>
										<td>${list.roleid}</td>
										<%--                                                 <td><a href="EditAccount?index=${list.userid}&pageid=1">Edit</a></td> --%>

										<%--                                                 <td><a href="DeleteAccount?index=${list.userid}&pageid=1" onclick="return show_comfirm()">Delete</a></td> --%>
										<td class="center">
											<div class="hidden-sm hidden-xs action-buttons">

												<a class="skyblue"
													href="EditAccount?index=${list.userid}&pageid=1"> <i
													class="ace-icon fa fa-pencil bigger-130"> </i>
												</a> <a class="skyblue"
													href="DeleteAccount?index=${list.userid}&pageid=1"
													onclick="return show_comfirm()"> <i
													class="ace-icon fa fa-trash-o bigger-130"> </i>
												</a>
											</div>
										</td>

									</tr>

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

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-sm-9">
							<div class="space"></div>

							<div id="calendar"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.page-content -->
	</div>



	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" >
				<div class="modal-header" style="padding: 0px 10px; background:skyblue"">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2>
						<span class="glyphicon glyphicon-user"></span> Add new user
					</h2>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form action="InsertAccount?pageid=1" method="POST" name="frmInsertAcc">
						<div class="form-group">
							<label for="usrname">Username</label> <input type="text"
								class="form-control" name="username" id ="username"
								placeholder="Username">
						</div>
						<div class="form-group">
							<label for="psw">Password</label> <input
								type="text" class="form-control" name="pass" id="pass"
								placeholder="Password">
						</div>


						<div class="form-group">
							<label for="usrname">Fullname</label> <input
								type="text" class="form-control" name="fullname" id="fullname"
								placeholder="Fullname">
						</div>
						<div class="form-group">
							<label for="psw">Birthday</label> <input
								type="text" class="form-control" name="birthday" id="birthday"
								placeholder="Birthday">
						</div>
						<div class="form-group">
							<label for="usrname"> Country</label> <input type="text"
								class="form-control" name="country" id="country"
								placeholder="Country">
						</div>
						<div class="form-group">
							<label for="psw">Phone</label> <input
								type="text" class="form-control" name="phone" id="phone"
								placeholder="Phone">
						</div>
						<div class="form-group">
							<label for="psw">Image</label> <input
								type="text" class="form-control" name="image" id="image"
								placeholder="Image">
						</div>
						<div class="form-group">
							<label for="psw">Roleid</label><br>
							<select name="roleid" id="roleid">
								<option>Choose roleid for account</option>
                    			<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
                    		</select>
						</div>

						<button type="submit" class="btn btn-success btn-block"  onclick="return KiemTraHopLe()">
							<span class="glyphicon glyphicon-ok"></span> Save
						</button>
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
	<script>
		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#myModal").modal();
			});
		});
	</script>

	<script>
        var table = document.getElementById("simple-table"),rindex;
		
		for(var i =1 ; i < table.rows.length; i++)
		{
			 table.rows[i].onclick = function()
			{
				rindex = this.rowIndex;		
				document.getElementByID("Courseid").value = this.cells[0].innerHTML;
				document.getElementByID("Coursename").value = this.cells[1].innerHTML;
				document.getElementByID("Coursetime").value = this.cells[2].innerHTML;
				document.getElementByID("Coursemoney").value = this.cells[3].innerHTML;
				
			};
		}

	</script>

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
