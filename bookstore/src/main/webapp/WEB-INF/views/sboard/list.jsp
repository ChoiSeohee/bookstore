<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- fullCalendar 2.2.5-->
  <link rel="stylesheet" href="/resources/plugins/fullcalendar/fullcalendar.min.css">
  <link rel="stylesheet" href="/resources/plugins/fullcalendar/fullcalendar.print.css" media="print">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="/resources/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
         
<!-- jQuery 2.2.3 -->
<script src="/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="/resources/plugins/chartjs/Chart.min.js"></script>
<!-- Slimscroll -->
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="/resources/plugins/fullcalendar/fullcalendar.min.js"></script>
</head>

<body class="hold-transition skin-blue">

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->


		<div class="col-md-12">
			<div class="box box-danger">
				<div class="box-header">
					<h3 class="box-title">책정보 - 목록보기</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">BNO</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>REGDATE</th>
							<th style="width: 40px">VIEWCNT</th>
						</tr>

						<c:forEach items="${list}" var="boardVO">

							<tr>
								<td>${boardVO.bno}</td>
								<td><a
									href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>
										${boardVO.bookTitle} <strong>[ ${boardVO.replycnt} ]</strong>
								</a></td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.regdate}" /></td>
								<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->
		</div>
	<!-- /.row -->
</section>


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
		location.replace(self.location);
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>

<!-- 차트 시작 -->
<section class="content">
      <div class="row">
        <div class="col-md-5">
           <div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title">장르별 베스트 셀러</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
              
            </div>
            <div class="box-body">
            <div>
              <canvas id="pieChart" style="height:250px"></canvas>
             </div> 
                 <div class="col-md-5">
                 <h5>단위: 만(권)</h5>
                  <ul class="chart-legend clearfix">
                    <li><i class="fa fa-circle-o text-red"></i> 소설</li>
                    <li><i class="fa fa-circle-o text-yellow"></i> 인문</li>
                    <li><i class="fa fa-circle-o text-aqua"></i> 교양/과학</li>
                    <li><i class="fa fa-circle-o text-light-blue"></i> 역사/문화</li>
                    <li><i class="fa fa-circle-o text-gray"></i> 기술/컴퓨터</li>
                  </ul>
                </div>
            </div>
            <!-- /.box-body -->
           </div>
          </div>  
          
          <div class="col-md-7">
          
       
<script type="text/javascript">
$(function(){
      var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
          var pieChart = new Chart(pieChartCanvas);
          var result= new Array();
          
          <c:forEach items="${sale}"  var ="sale">
           result.push("${sale.novel}");
           result.push("${sale.humanities}");
           result.push("${sale.science}");
           result.push("${sale.history_culture}");
           result.push("${sale.technology_computer}");
        </c:forEach>
        
          var PieData = [
            {
              value: Number(result[0]),
              color: "#f56954",
              highlight: "#f56954",
              label: "소설 - 82년생 김지영"
            },
            {
              value: Number(result[1]),
              color: "#f39c12",
              highlight: "#f39c12",
              label: "인문 - 호모 데우스"
            },
            {
              value: Number(result[2]),
              color: "#00c0ef",
              highlight: "#00c0ef",
              label: "교양 과학 - 코스모스"
            },
            {
              value: Number(result[3]),
              color: "#3c8dbc",
              highlight: "#3c8dbc",
              label: "역사/문화 - 설민석의 조선왕조실록"
            },
            {
              value: Number(result[4]),
              color: "#d2d6de",
              highlight: "#d2d6de",
              label: "기술/컴퓨터 - 밑바닥부터 시작하는 딥러닝"
            }
          ];
          var pieOptions = {
            //Boolean - Whether we should show a stroke on each segment
            segmentShowStroke: true,
            //String - The colour of each segment stroke
            segmentStrokeColor: "#fff",
            //Number - The width of each segment stroke
            segmentStrokeWidth: 2,
            //Number - The percentage of the chart that we cut out of the middle
            percentageInnerCutout: 50, // This is 0 for Pie charts
            //Number - Amount of animation steps
            animationSteps: 100,
            //String - Animation easing effect
            animationEasing: "easeOutBounce",
            //Boolean - Whether we animate the rotation of the Doughnut
            animateRotate: true,
            //Boolean - Whether we animate scaling the Doughnut from the centre
            animateScale: false,
            //Boolean - whether to make the chart responsive to window resizing
            responsive: true,
            // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
            maintainAspectRatio: true,
            //String - A legend template
            legendTemplate: "<ul class=\"<name.toLowerCase()-legend\"> for (var i=0; i<segments.length; i++){<li><span style=\"background-color:<segments[i].fillColor\"></span>if(segments[i].label){<segments[i].label}</li>}</ul>"
            };
          //Create pie or douhnut chart
          // You can switch between pie and douhnut using the method below.
          pieChart.Doughnut(PieData, pieOptions);
   
   });
</script> 
<!-- 차트 끝-->
      
<!-- 달력 시작 -->
 <section class="content">
 	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-danger">
				<div class="box-header">
					<h3 class="box-title">이달의 베스트장르(매월 15일 선정)</h3>
				</div>
				<!-- /.box-header -->
      
              <!-- THE CALENDAR -->
              <div id="calendar"></div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
        </div>
      <!-- /.row -->
    </section>
</div>        
</div>
</section>
<!-- wrapper end -->   
        
<script type="text/javascript">
  $(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex: 1070,
          revert: true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        });

      });
    }

    ini_events($('#external-events div.external-event'));

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var day= new Array();
    
    var color= "#f56954";
         <c:forEach items="${sale}"  var ="sale">   
           day.push("${sale.novel}");
           day.push("${sale.humanities}");
           day.push("${sale.science}");
           day.push("${sale.history_culture}");
           day.push("${sale.technology_computer}");
        </c:forEach>

        var whoBest = day[0];

        for(var i=1; i<6; i++)
       {
           if(day[i] > whoBest)
          {
             whoBest = day[i];
          }
           else
              {
              whoBest=whoBest;
              }
       } 

        if(whoBest == day[0])
       {
          color = "#f56954";
       }
        else if (whoBest == day[1])
       {
           color = "#f39c12";
       }
        else if (whoBest == day[2])
      { 
          color = "#00c0ef";
   
      }
        else if (whoBest == day[3])
      {
          color = "#3c8dbc";
   
      }
        else if (whoBest == day[4])
      {
   
          color = "#d2d6de";
      }
    var date = new Date();
    var d = date.getDate(),
        m = date.getMonth(),
        y = date.getFullYear();
    
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      buttonText: {
        today: 'today',
        month: 'month',
        week: 'week',
        day: 'day'
      },
      //Random default events
      events: [
        {
          title: whoBest+'권 판매',
          start: new Date(y,m,15),
          end: new Date(y,m,16),
          allDay: false,
          backgroundColor: color, //Success (green)
          borderColor: color //Success (green)
        }
      ],
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar !!!
      drop: function (date, allDay) { // this function is called when something is dropped

        // retrieve the dropped element's stored Event Object
        var originalEventObject = $(this).data('eventObject');

        // we need to copy it, so that multiple events don't have a reference to the same object
        var copiedEventObject = $.extend({}, originalEventObject);

        // assign it the date that was reported
        copiedEventObject.start = date;
        copiedEventObject.allDay = allDay;
        copiedEventObject.backgroundColor = $(this).css("background-color");
        copiedEventObject.borderColor = $(this).css("border-color");

        // render the event on the calendar
        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

        // is the "remove after drop" checkbox checked?
        if ($('#drop-remove').is(':checked')) {
          // if so, remove the element from the "Draggable Events" list
          $(this).remove();
        }

      }
    });

    /* ADDING EVENTS */
    var currColor = color; //Red by default
    //Color chooser button
    var colorChooser = $("#color-chooser-btn");
    $("#color-chooser > li > a").click(function (e) {
      e.preventDefault();
      //Save color
      currColor = $(this).css("color");
      //Add color effect to button
      $('#add-new-event').css({"background-color": currColor, "border-color": currColor});
    });
    $("#add-new-event").click(function (e) {
      e.preventDefault();
      //Get value and make sure it is not null
      var val = $("#new-event").val();
      if (val.length == 0) {
        return;
      }

      //Create events
      var event = $("<div />");
      event.css({"background-color": currColor, "border-color": currColor, "color": "#fff"}).addClass("external-event");
      event.html(val);
      $('#external-events').prepend(event);

      //Add draggable funtionality
      ini_events(event);

      //Remove event from text input
      $("#new-event").val("");
    });
  });
</script>

<!-- 달력 끝 -->
</body>

</html>

 <%@ include file="../include/footer.jsp" %>