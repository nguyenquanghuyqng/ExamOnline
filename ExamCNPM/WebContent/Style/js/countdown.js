var timer=60;//1200;
var min=0;
var sec=0;
function countdownTimer() {
 
	min=parseInt(timer/60);
  	sec=parseInt(timer%60);

  	if(timer<1){
		alert("Time out");
        //location.assign("/src/Controller/TestSheetController");
		document.getElementById("test").action="/ExamCNPM/TestSheetController";
		document.getElementById("test").method = 'POST';
		document.getElementById("test").submit();
    }  
  
  // display the time in page, and auto-calls this function after 1 seccond

  document.getElementById("time").innerHTML = "<span id='showmns'>"+min.toString()+"</span> <span id='showmns'>:</span>" +
  		"<span id='showscs'>"+sec.toString()+"</span></br>";
  timer--;
  setTimeout(function(){ countdownTimer(); }, 1000);
}