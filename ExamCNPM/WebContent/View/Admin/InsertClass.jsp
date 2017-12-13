<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Class</title>
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
						<li><i class="ace-icon fa fa-home home-icon"></i> <a
							href="HomeAdminForWard">Home</a></li>
							<li><a href="#">Manage Account</a></li>
						<li class="active">Insert Class</li>
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
							Upadate and Delete Account <small> <i
								class="ace-icon fa fa-angle-double-right"></i> Admin can delete
								account user or update account user
							</small>
						</h1>
					</div>


					<div class="">
						<form method="POST" action="UploadAccount?pageid=1">

							File to upload: <input type="file" name="file"> <input
								type="submit" value="Import" Style="background: skyblue">
						</form>
					</div>
					<div class="">
						<h2>List User</h2>
						<table border='1' style="width: 100%"
							class="table table-hover table-bordered table-striped">
							<tr>
								<th>userid</th>
								<th>username</th>
								<th>pass</th>
								<th>fullname</th>
								<th>birthday</th>
								<th>country</th>
								<th>phone</th>
								<th>image</th>
								<th>roleid</th>
								<!-- 								<th></th> -->
								<!-- 								<th></th> -->
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
										<td></td>
										<td>${list.roleid}</td>
										<%-- 									<td><a href="EditAccount?index=${list.userid}&pageid=1">Edit</a></td> --%>
										<%-- 									<td><a href="DeleteAccount?index=${list.userid}&pageid=1" --%>
										<!-- 										onclick="return show_comfirm()">Delete</a></td> -->
									</tr>

								</c:forEach>
							</tbody>
						</table>
						<ul class="pagination">
							<!-- numberpage trong HomeController -->
							<c:if test="${numberpage==1}">
								<li class="disabled"><a href="">&laquo;</a></li>
								<li><a href="InsertClass?pageid=1">1</a></li>
								<li><a href="InsertClass?pageid=2">2</a></li>
								<li><a href="InsertClass?pageid=${numberpage+1}">&raquo;</a></li>
							</c:if>

							<c:if test="${numberpage==maxpageid}">
								<li class="disabled"><a
									href="HomeForward?pageid=${numberpage-1}">&laquo;</a></li>
								<li><a href="InsertClass?pageid=1">1</a></li>
								<li><a href="InsertClass?pageid=2">2</a></li>
								<li class="disabled"><a href="#">&raquo;</a></li>
							</c:if>

							<c:if test="${numberpage>1 && numberpage<maxpageid}">
								<li><a href="InsertClass?pageid=${numberpage-1}">&laquo;</a></li>
								<li><a href="InsertClass?pageid=1">1</a></li>
								<li><a href="InsertClass?pageid=2">2</a></li>
								<li><a href="InsertClass?pageid=${numberpage+1}">&raquo;</a></li>
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