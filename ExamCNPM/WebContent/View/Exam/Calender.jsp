<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calender</title>


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
                                <a href="#">Home</a>
                            </li>
                            <li class="active">Manage Exam</li>
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
                                Manage Exam
                                <small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									overview &amp; stats
								</small>
                            </h1>
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

        <!-- basic scripts -->

        <script src="Style/js/jquery-2.1.4.min.js"></script>

        <script type="text/javascript">
            if ('ontouchstart' in document.documentElement) document.write("<script src='Style/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");

        </script>
        <script src="Style/js/bootstrap.min.js"></script>

        <!-- page specific plugin scripts -->
        <script src="Style/js/jquery-ui.custom.min.js"></script>
        <script src="Style/js/jquery.ui.touch-punch.min.js"></script>
        <script src="Style/js/moment.min.js"></script>
        <script src="Style/js/fullcalendar.min.js"></script>
        <script src="Style/js/bootbox.js"></script>

        <!-- ace scripts -->
        <script src="Style/js/ace-elements.min.js"></script>
        <script src="Style/js/ace.min.js"></script>

        <!-- inline scripts related to this page -->
        <script type="text/javascript">
            jQuery(function($) {

                /* initialize the external events
                	-----------------------------------------------------------------*/

                $('#external-events div.external-event').each(function() {

                    // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                    // it doesn't need to have a start or end
                    var eventObject = {
                        title: $.trim($(this).text()) // use the element's text as the event title
                    };

                    // store the Event Object in the DOM element so we can get to it later
                    $(this).data('eventObject', eventObject);

                    // make the event draggable using jQuery UI
                    $(this).draggable({
                        zIndex: 999,
                        revert: true, // will cause the event to go back to its
                        revertDuration: 0 //  original position after the drag
                    });

                });




                /* initialize the calendar
                -----------------------------------------------------------------*/

                var date = new Date();
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();


                var calendar = $('#calendar').fullCalendar({
                    //isRTL: true,
                    //firstDay: 1,// >> change first day of week 

                    buttonHtml: {
                        prev: '<i class="ace-icon fa fa-chevron-left"></i>',
                        next: '<i class="ace-icon fa fa-chevron-right"></i>'
                    },

                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    events: [{
                            title: 'All Day Event',
                            start: new Date(y, m, 1),
                            className: 'label-important'
                        },
                        {
                            title: 'Long Event',
                            start: moment().subtract(5, 'days').format('YYYY-MM-DD'),
                            end: moment().subtract(1, 'days').format('YYYY-MM-DD'),
                            className: 'label-success'
                        },
                        {
                            title: 'Some Event',
                            start: new Date(y, m, d - 3, 16, 0),
                            allDay: false,
                            className: 'label-info'
                        }
                    ],


                    editable: true,
                    droppable: true, // this allows things to be dropped onto the calendar !!!
                    drop: function(date) { // this function is called when something is dropped

                        // retrieve the dropped element's stored Event Object
                        var originalEventObject = $(this).data('eventObject');
                        var $extraEventClass = $(this).attr('data-class');


                        // we need to copy it, so that multiple events don't have a reference to the same object
                        var copiedEventObject = $.extend({}, originalEventObject);

                        // assign it the date that was reported
                        copiedEventObject.start = date;
                        copiedEventObject.allDay = false;
                        if ($extraEventClass) copiedEventObject['className'] = [$extraEventClass];

                        // render the event on the calendar
                        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                        // is the "remove after drop" checkbox checked?
                        if ($('#drop-remove').is(':checked')) {
                            // if so, remove the element from the "Draggable Events" list
                            $(this).remove();
                        }

                    },
                    selectable: true,
                    selectHelper: true,
                    select: function(start, end, allDay) {

                        bootbox.prompt("New Event Title:", function(title) {
                            if (title !== null) {
                                calendar.fullCalendar('renderEvent', {
                                        title: title,
                                        start: start,
                                        end: end,
                                        allDay: allDay,
                                        className: 'label-info'
                                    },
                                    true // make the event "stick"
                                );
                            }
                        });


                        calendar.fullCalendar('unselect');
                    },
                    eventClick: function(calEvent, jsEvent, view) {

                        //display a modal
                        var modal =
                            '<div class="modal fade">\
			  <div class="modal-dialog">\
			   <div class="modal-content">\
				 <div class="modal-body">\
				   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
				   <form class="no-margin">\
					  <label>Change event name &nbsp;</label>\
					  <input class="middle" autocomplete="off" type="text" value="' + calEvent.title + '" />\
					 <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Save</button>\
				   </form>\
				 </div>\
				 <div class="modal-footer">\
					<button type="button" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
				 </div>\
			  </div>\
			 </div>\
			</div>';


                        var modal = $(modal).appendTo('body');
                        modal.find('form').on('submit', function(ev) {
                            ev.preventDefault();

                            calEvent.title = $(this).find("input[type=text]").val();
                            calendar.fullCalendar('updateEvent', calEvent);
                            modal.modal("hide");
                        });
                        modal.find('button[data-action=delete]').on('click', function() {
                            calendar.fullCalendar('removeEvents', function(ev) {
                                return (ev._id == calEvent._id);
                            })
                            modal.modal("hide");
                        });

                        modal.modal('show').on('hidden', function() {
                            modal.remove();
                        });


                    }

                });


            })

        </script>


    </body>

    </html>
