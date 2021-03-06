<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Test Sheet</title>


            <!-- Meta-Tags -->
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="keywords" content="Scholar Vision Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
            <script type="application/x-javascript">
                addEventListener("load", function() {
                    setTimeout(hideURLbar, 0);
                }, false);

                function hideURLbar() {
                    window.scrollTo(0, 1);
                }

            </script>

            <!-- Bootstrap-CSS -->
            <link href="Style/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />

            <!-- Font-awesome-CSS -->
            <link href="Style/css/font-awesome.css" rel="stylesheet">

            <!-- Flex-slider-CSS -->
            <link rel="stylesheet" href="Style/css/flexslider.css" type="text/css" media="screen" />

            <!-- Owl-carousel-CSS -->
            <link href="Style/css/owl.carousel.css" rel="stylesheet">

            <!-- Index-Page-CSS -->
            <link href="Style/css/style.css" rel="stylesheet" type="text/css" media="all" />

            <!-- Headings-font -->
            <link href="Style/css/font2.css" rel="stylesheet">

            <!-- Body-font -->
            <link href="Style/css/font.css" rel="stylesheet" type="text/css">

            <link href="Style/css/user.css" rel="stylesheet" type="text/css" />
            <script type="text/javascript" src="Style/js/countdown.js"></script>
        </head>

        <body>

            <div id="home">
                <div class="banner-overlay-agileinfo">
                    <div class="topheader" style="height: 60px; background: #77b178">
                        <div class="col-md-9 top-header-agile-left" style="margin-top: 20px;">
                            <div class="infoarea" style="color: blue">
                                <span> <i class="fa fa-envelope-o"></i>Email:
							ic@hcmute.edu.vn
						</span>
                            </div>
                        </div>
                        <div class="col-md-3 top-header-agile-left" style="margin-top: 0px;">

                            <div class="dropdown">
                                <a class="btn dropdown-toggle pull-right user" type="button" data-toggle="dropdown"> <i class="glyphicon glyphicon-user"></i>
							Luu Quang Trung <span class="caret"></span>
						</a>
                                <ul class="dropdown-menu" style="width: 300px;">
                                    <li><a href="#">Account Settings <span
									class="glyphicon glyphicon-cog pull-right"></span>
							</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Messages <span class="badge pull-right">
										42 </span>
							</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Sign Out <span
									class="glyphicon glyphicon-log-out pull-right"></span>
							</a></li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="top-header-agile" style="background: white">
                        <div class="col-md-6 top-header-agile-left nav-collapse ">
                            <!--p style="color: skyblue;font-size: 22px">TRƯỜNG ĐẠI HỌC</p>
                    <P style="color: skyblue;font-size: 22px">SƯ PHẠM KỸ THUẬT THÀNH PHỐ HỒ CHÍ MÌNH</P-->
                            <h1>
                                <a href="#"> <img class="img-responsive"
							src="Style/images/spkt.jpg">
						</a>
                            </h1>
                        </div>

                        <div class="col-md-6 top-header-agile-right text-md-center ">
                            <div class="span7">
                                <div class="title_bloginfo" style="color: red">
                                    <h3 style="padding: 10px; text-align: center;">THE EXAM PERFORMANCE PROGRAM</h3>
                                    <h4 style="padding: 10px;">INFORMATION TECHNOLOGY CENTER</h4>
                                </div>
                                <div class="infoarea" style="text-align: center;">
                                    <span> <i class="fa fa-phone"></i>Call Us: (+84 - 8)
								38968641 - (+84 - 8) 38961333
							</span>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>


            </div>
            <!-- //banner -->
            <!-- about -->
            <div class="col-md-12" style="border: 1px solid #0F8A19;"></div>
            <div class="about-w3layouts">
                <div class="container">
                    <div class="row">
                        <div class="panel panel-default col-md-4 " data-toggle="tooltip" data-placement="top">
                            <div class="panel-body text-center" style="font-size: 35px;">
                                <span id="showmns">00</span> <span id="showmns">:</span> <span id="showscs">00</span> </br>
                                <button class="btn btn-primary" id="btnct" onclick="countdownTimer()">
							<i class="fa fa-play" aria-hidden="true"></i> START
						</button>
                            </div>
                        </div>
                        <div class="col-md-8 panel panel-default" style="padding-left: 100px;">
                            <form action="TestSheetController" method="post">
                                <h2>
                                    <%=request.getAttribute("msg") != null ? request.getAttribute("msg") : " "%>
                                </h2>
                                <c:forEach items="${listquiz}" var="list">
                                    <% System.out.println(pageContext.findAttribute("list")); %>
                                        <p>${list.number}.${list.contentquestion}</p>
                                        <input type="radio" name="ans[${list.number}]" value="A">${list.option1}
                                        <br />
                                        <input type="radio" name="ans[${list.number}]" value="B">${list.option2}
                                        <br />
                                        <input type="radio" name="ans[${list.number}]" value="C">${list.option3}
                                        <br />
                                        <input type="radio" name="ans[${list.number}]" value="D">${list.option4}
                                        <br />

                                </c:forEach>
                                <br> <input type="submit" value="TagScript">
                            </form>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!-- //about -->

                <!--/services-->
                <div class="services-w3-agileits w3agileits-ref">
                    <div class="col-md-6 services-left">



                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-6  "></div>
                <div class="clearfix"></div>
            </div>
            <!--//services-->
            <!-- agile_testimonials -->
            <div class="test">
                <div class="container"></div>
            </div>
            <!-- //agile_testimonials -->

            <!--footer-->
            <div class="footer w3layouts">
                <div class="container">
                    <div class="footer-row w3layouts-agile">
                        <div class="col-md-5 footer-grids w3l-agileits">
                            <h6>
                                <a href="#">ABOUT US</a>
                            </h6>
                            <p>
                                <span style="color: rgb(255, 255, 255); font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none;">
							The HCMC University of Technology and Education will become a top
							center of training, research, creativity, innovation and
							entrepreneurship in Vietnam, on a par with regional and worldwide
							prestigious universities.&nbsp;</span> <br> <a href="http://hcmute.edu.vn/ArticleId/4d16f05e-8abd-48f5-9874-f6b587d1b514/tam-nhin-su-mang-muc-tieu" target="_blank">Read More »</a>
                            </p>
                            <div class="top-header-agile-right">
                                <ul>
                                    <li><a href="#"> <i class="fa fa-twitter"
									aria-hidden="true"></i>
							</a></li>
                                    <li><a href="https://www.facebook.com/hcmute.spkt/?fref=ts">
									<i class="fa fa-facebook" aria-hidden="true"></i>
							</a></li>
                                    <li><a href="#"> <i class="fa fa-linkedin"
									aria-hidden="true"></i>
							</a></li>
                                    <li><a href="#"> <i class="fa fa-dribbble"
									aria-hidden="true"></i>
							</a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-3 footer-grids w3l-agileits">
                            <h3 style="text-transform: uppercase;">info</h3>
                            <ul>
                                <li><a href="http://hcmute.edu.vn/TopicId/05b5495a-b97d-4d68-a031-f9f32d18e4e9/tin-tuc-su-kien" target="_blank">News - Events</a></li>
                                <br>
                                <li><a href="http://hcmute.edu.vn/TopicId/54273ff8-c1b0-4544-a3d8-a9f1a80bf6ce/tuyen-sinh" target="_blank">Admissions</a></li>
                                <br>
                                <li><a href="http://hcmute.edu.vn/TopicId/fdbda501-ddfe-4eac-b060-2ccf1792e0dc/thong-bao" target="_blank">Notification</a></li>
                                <br>
                                <li><a href="http://hcmute.edu.vn/TopicId/e5cfd25e-c3d1-465b-a62b-087bb26e3b06/hoc-bong-viec-lam" target="_blank">Scholarships - jobs</a></li>
                            </ul>
                        </div>

                        <div class="col-md-4 footer-grids w3l-agileits">
                            <div class="contact-info">
                                <h3 class="nopadding" style="text-transform: uppercase;">Contact us
                                </h3>
                                <p>
                                    No 1 Vo Van Ngan Street, Linh Chieu Ward, Thu Duc District, Ho Chi Minh City <br> <i class="fa fa-phone-square"></i> Phone: (+84 - 8) 38968641 - (+84 - 8) 38961333 <br> <i class="fa fa-envelope"></i> E-mail: <a class="mail-link" href="mailto: ic@hcmute.edu.vn"> ic@hcmute.edu.vn</a> <br>
                                </p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!--//footer-->
            <!-- copy-right -->
            <div class="copyright-wthree">
                <p>
                    Copyright @ 2017 Tests Online . All Rights Reserved | Design by <a href="#"> Huy_Trung_Hoàng </a>
                </p>
            </div>
            <!-- //copy-right -->

            <a href="#home" class="scroll" id="toTop" style="display: block;">
		<span id="toTopHover" style="opacity: 1;"> </span>
	</a>
            <!-- //smooth scrolling -->



            <script type="text/javascript" src="Style/js/jquery-2.1.4.min.js"></script>
            <!-- flexSlider -->
            <script defer src="Style/js/jquery.flexslider.js"></script>
            <script type="text/javascript">
                $(window).load(function() {
                    $('.flexslider').flexslider({
                        animation: "slide",
                        start: function(slider) {
                            $('body').removeClass('loading');
                        }
                    });
                });

            </script>
            <!-- //flexSlider -->
            <!-- requried-jsfiles-for owl -->
            <script src="Style/js/owl.carousel.js"></script>
            <!-- 	Countdown-Timer-JavaScript -->
            <script src="Style/js/simplyCountdown.js"></script>
            <!-- //Countdown-Timer-JavaScript -->


            <!-- start-smoth-scrolling -->
            <script type="text/javascript" src="Style/js/move-top.js"></script>
            <script type="text/javascript" src="Style/js/easing.js"></script>
            <script src="Style/js/bootstrap.js"></script>
            <!-- //for bootstrap working -->


        </body>

        </html>
