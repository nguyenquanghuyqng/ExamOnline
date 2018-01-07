<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ page import="java.sql.*" %>
	<%ResultSet resultset =null;%>
	
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Account</title>

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
        <script src="Style/js/validation.js"></script>
    </head>


    <body class="no-skin" style="font-size: 14px;">

        <!-- Insert file notification -->
        <jsp:include page="Notification.jsp" /> 

        <div class="main-container ace-save-state" id="main-container">
            <script type="text/javascript">
                try {
                    ace.settings.loadState('main-container')
                } catch (e) {}

            </script>
            
            <script type="text/javascript">
                $(function () {
                    $(document).on('click', '.btn-add', function (e) {
                        e.preventDefault();

                        var controlForm = $('.controls form:first'),
                            currentEntry = $(this).parents('.entry:first'),
                            newEntry = $(currentEntry.clone()).appendTo(controlForm);

                        newEntry.find('input').val('');
                        controlForm.find('.entry:not(:last) .btn-add')
                            .removeClass('btn-add').addClass('btn-remove')
                            .removeClass('btn-success').addClass('btn-danger')
                            .html('<span class="glyphicon glyphicon-minus"></span>');
                    }).on('click', '.btn-remove', function (e) {
                        $(this).parents('.entry:first').remove();

                        e.preventDefault();
                        return false;
                    });
                });
            </script>
            
             <script>
                $(document).ready(function () {
                    var i = 1;
                    $('#add').click(function () {
                        i++;
                        $('#dynamic_field').append('<tr id="row' + i +
                            '"><td></td><td style="max-width: 51px;"><button type="button" name="remove" id="' +
                            i + '" class="btn btn-danger btn_remove">X</button><input type="checkbox" id="option' + i + '"  style="margin-left: -102px;margin-top: -30px;"/></td></tr>');
                    });
                    $(document).on('click', '.btn_remove', function () {
                        var button_id = $(this).attr("id");
                        $('#row' + button_id + '').remove();
                    });
                    $('#submit').click(function () {
                        $.ajax({
                            url: "name.php",
                            method: "POST",
                            data: $('#add_name').serialize(),
                            success: function (data) {
                                alert(data);
                                $('#add_name')[0].reset();
                            }
                        });
                    });
                });
            </script>

			<!-- Insert file menu -->
            <jsp:include page="MenuAdmin.jsp" />  

            <div class="main-content">

                <div class="main-content-inner">
                    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                        <ul class="breadcrumb">
                            <li><i class="ace-icon fa fa-home home-icon"></i> <a href="HomeAdminForWard">Home</a></li>
                            <li><a href="#">Manage Account</a></li>
						<li class="active">Insert Account</li>
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
                                Insert Account <small> <i
							class="ace-icon fa fa-angle-double-right"></i> Admin can insert
							user
						</small>
                            </h1>
                        </div>

                        <div class="form-group" style="margin:30px">
                            <h2>Insert account</h2>
                            <div id="thongbao">
                                <p id="pthongbao"></p>
                            </div>
                            <form action="InsertAccount?pageid=1" method="post" name="frmInsertAcc" class="form-horizontal">
                            	
                                <br> Username:
                                <br> <input type="text" name="username" id="username" style="border: 1px solid #00ffc1"><br>
                                <br> PassWord:
                                <br> <input type="text" name="pass" id="pass" style="border: 1px solid #00ffc1"><br>
                                <br> Fullname:
                                <br> <input type="text" name="fullname" id="fullname" style="border: 1px solid #00ffc1"><br>
                                <br> Birthday:
                                <br> <input type="date" name="birthday" id="birthday" style="border: 1px solid #00ffc1"><br>
                                <br> Country:
                                <br> <input type="text" name="country" id="country" style="border: 1px solid #00ffc1"><br>
                                <br> Phone:
                                <br> <input type="text" name="phone" id="phone" style="border: 1px solid #00ffc1"><br>
                                <br> Image:
                                <br> <input type="text" name="image" id="image" style="border: 1px solid #00ffc1"><br>
                                <br> Roleid:
                                <br> <%
								   	try{
									//Class.forName("com.mysql.jdbc.Driver").newInstance();
									Class.forName("com.mysql.jdbc.Driver");
									Connection connection = 
								         DriverManager.getConnection
// 								         ("jdbc:mysql://localhost:3306/examonline","root","1234");
// 								          ("jdbc:mysql://node16816-examonlinevn.kilatiron.com/examonline?useUnicode=true&characterEncoding=UTF-8","root","PSSmqz60857");
									         ("jdbc:mysql://node10595-examonline.fr-1.paas.massivegrid.net/examonline?useUnicode=true&characterEncoding=UTF-8","root","BSOxar77141");								
								       Statement statement = connection.createStatement() ;
								
								       resultset =statement.executeQuery("select roleid from roles") ;
								%>
									
								        <select id="roleid" name="roleid" style="border: 1px solid #00ffc1">
								        <option>Choose roleid</option>
								        <%  while(resultset.next()){ %>
								            <option selected><%= resultset.getString(1)%></option>
								        <% } %>
								        </select>
							
									<%
								        }
								        catch(Exception e)
								        {
								             out.println("wrong entry"+e);
								        }
									%>
								<br><br>
								Classid:
								<br>
								<%
									    try{
									//Class.forName("com.mysql.jdbc.Driver").newInstance();
									Class.forName("com.mysql.jdbc.Driver");
									Connection connection = 
								         DriverManager.getConnection
// 								         ("jdbc:mysql://localhost:3306/examonline","root","1234");
// 								         ("jdbc:mysql://node16816-examonlinevn.kilatiron.com/examonline?useUnicode=true&characterEncoding=UTF-8","root","PSSmqz60857");
								
													         ("jdbc:mysql://node10595-examonline.fr-1.paas.massivegrid.net/examonline?useUnicode=true&characterEncoding=UTF-8","root","BSOxar77141");								       Statement statement = connection.createStatement() ;
								
								       resultset =statement.executeQuery("select classid from classes") ;
									%>
									
								        <select id="classid" name="classid" style="border: 1px solid #00ffc1">
								        <%  while(resultset.next()){ %>
								            <option selected><%= resultset.getString(1)%></option>
								        <% } %>
								        </select>
							
									<%
								        }
								        catch(Exception e)
								        {
								             out.println("wrong entry"+e);
								        }
									%>
								<br><br>
								Subjectid:
								<br>
								<%
									    try{
									//Class.forName("com.mysql.jdbc.Driver").newInstance();
									Class.forName("com.mysql.jdbc.Driver");
									Connection connection = 
								         DriverManager.getConnection
// 								         ("jdbc:mysql://localhost:3306/examonline","root","1234");
// 								         ("jdbc:mysql://node16816-examonlinevn.kilatiron.com/examonline?useUnicode=true&characterEncoding=UTF-8","root","PSSmqz60857");
													         ("jdbc:mysql://node10595-examonline.fr-1.paas.massivegrid.net/examonline?useUnicode=true&characterEncoding=UTF-8","root","BSOxar77141");								
								       Statement statement = connection.createStatement() ;
								
								       resultset =statement.executeQuery("select subjectid from subjects") ;
									%>
									
								        <select id="subjectid" name="subjectid" style="border: 1px solid #00ffc1">
								        <%  while(resultset.next()){ %>
								            <option selected><%= resultset.getString(1)%></option>
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
								<br>
								
                                <input type="submit" value="Save" style="background: skyblue;" onclick="return KiemTraHopLe()"><br>
                            </form>
                        </div>

                    </div>
                </div>
                <!-- /.page-header -->


            </div>
            <!-- /.page-content -->
        </div>


        <!-- /.main-content -->

         <!--     Include file Footer -->
<%-- 		<jsp:include page="Footer.jsp" /> --%>
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
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i> </a>
      
        <!-- /.main-container -->

    </body>

    </html>
