///**
// * 
// */
////Sự kiện khi nhấn tab đăng ký ko có function truyền vào
//function onDangKy(){
//	// ẩn phần đăng nhập 
//	// hiển thị div đăng ký
//	var divDki=document.getElementById("divdangki");
//	var divDnhap=document.getElementById("divdangnhap");
//
//	divDki.style.display="block";
//	divDnhap.style.display="none";
//}
//
////Sự kiện khi nhấn tab đăng nhập 
//function onDangNhap(){
//	// ẩn phần đăng ký 
//	// hiển thị div đăng nhập
//	var divDki=document.getElementById("divdangki");
//	var divDnhap=document.getElementById("divdangnhap");
//
//	divDki.style.display="none";
//	divDnhap.style.display="block";
//}

// validate create test sheet

function KTBatBuocTest(){
	
	var pthongbao=document.getElementById("pthongbao");
	var classid= document.getElementById("classid");
	var timestart= document.getElementById("timestart");	
	var timeend= document.getElementById("timeend");	
	var testtypeid= document.getElementById("testtypeid");	
	var questiontypeid= document.getElementById("questiontypeid");	


	if(classid.value == "" || timestart.value == "" || timeend.value == "" || testtypeid.value == "" ||
			questiontypeid.value == ""){

		frmCreateTest.classid.style.border="solid 2px red";
		frmCreateTest.timestart.style.border="solid 2px red";
		frmCreateTest.timeend.style.border="solid 2px red";
		frmCreateTest.testtypeid.style.border="solid 2px red";
		frmCreateTest.questiontypeid.style.border="solid 2px red";

		pthongbao.style.display="block";
		pthongbao.style.color="red";
		pthongbao.innerHTML="Bạn cần nhập dữ liệu cho các trường đầy đủ <br/>";
		return false;
		
	}else if(classid.selectedIndex==0){
		pthongbao.style.display="block";
		pthongbao.innerHTML="Bạn phải chọn classid <br/>";
		return false;
	}
	else if(testtypeid.selectedIndex==0){
		pthongbao.style.display="block";
		pthongbao.innerHTML="Bạn phải chọn testtypeid <br/>";
		return false;
	}
	else if(questiontypeid.selectedIndex==0){
		pthongbao.style.display="block";
		pthongbao.innerHTML="Bạn phải chọn questiontypeid <br/>";
		return false;
	}
	else{
		pthongbao.display="none";
		return true;
	}
	
}


function KiemTraHopLeTest(){
	return KTBatBuocTest();
}


function ktraBatBuocDangKy() {
	var pthongbao=document.getElementById("pthongbao");
	var username= document.getElementById("username");
	var pass= document.getElementById("pass");	
	var fullname= document.getElementById("fullname");	
	var birthday= document.getElementById("birthday");	
	var country= document.getElementById("country");	
	var phone= document.getElementById("phone");	
	var image= document.getElementById("image");	
	var roleid= document.getElementById("roleid");	

	if(username.value == "" || pass.value == "" || country.value == "" || phone.value == "" ||
			fullname.value == "" || birthday.value == "" || image.value == "" || roleid.value == ""){

		frmInsertAcc.username.style.border="solid 2px red";
		frmInsertAcc.pass.style.border="solid 2px red";
		frmInsertAcc.fullname.style.border="solid 2px red";
		frmInsertAcc.birthday.style.border="solid 2px red";
		frmInsertAcc.country.style.border="solid 2px red";
		frmInsertAcc.phone.style.border="solid 2px red";
		frmInsertAcc.image.style.border="solid 2px red";
		frmInsertAcc.roleid.style.border="solid 2px red";

		pthongbao.style.display="block";
		pthongbao.style.color="red";
		pthongbao.innerHTML="Bạn cần nhập dữ liệu cho các trường đầy đủ <br/>";
		return false;
		
	}else if(roleid.selectedIndex==0){
		pthongbao.style.display="block";
		pthongbao.innerHTML="Bạn phải chọn roleid cho account <br/>";
		return false;
	}
//	else if(!nam.checked && !nu.checked){
//		pthongbao.style.display="block";
//		pthongbao.innerHTML="Bạn phải chọn giới tính";
//		return false;
//	}
	else{
		pthongbao.display="none";
		return true;
	}
}

function KTChieuDai(idTag ,minlength,maxlength){
    var inpputTag=document.getElementById(idTag);
    var tag=inpputTag.value;
    var theP=document.getElementById("pthongbao");
    if(tag.length<minlength|| tag.length>maxlength){
        theP.style.display="block";
        theP.innerHTML="Hãy nhập vào giá trị từ "+minlength+" đến "+ maxlength;
//        theP.style.color="red";
        return false;
    }
    else{
        theP.style.display="none";
        return true;
    }
}

function KTEmail(idTag){
    var inpputTag=document.getElementById(idTag);
    var email=/^([\w\.])+@([a-zA-Z0-9\-])+\.([a-zA-Z]{2,4})(\.[a-zA-Z]{2,4})?$/;
    var theP=document.getElementById("pthongbao");
    var tag=inpputTag.value;
    if(tag.match(email)){
        theP.style.display="none";
        return true;
    }
    else{
        theP.style.display="block";
        theP.innerHTML="Hãy nhập email hợp lệ";
        return false;
    }
}

function KTNumber(idTag){
	var inpputTag=document.getElementById(idTag);
	var phone=document.getElementById("phone");
	var number=/^[0-9]+$/;
	var theP= document.getElementById("pthongbao");
	var tag=inpputTag.value;
	if(tag.match(number)){
        theP.style.display="none";
        return true;
    }
    else{
        theP.style.display="block";
        theP.innerHTML="Hãy nhập số điện thoại là số";
        return false;
    }
}

function KiemTraTuoi(min,max,idTag) {
	var inputTag=document.getElementById(idTag);
	var tuoi=document.getElementById("tuoi");
    var number=/^[0-9]+$/;
    var theP= document.getElementById("pthongbao");
    if(inputTag.value.match(number)){
        theP.style.display="none";
        var intTuoi=parseInt(tuoi.value);
        if(intTuoi>max || intTuoi<min){
        	theP.style.display="block";
            theP.innerHTML="Hãy nhập vào giá trị từ "+min+" đến "+ max;
            return false;
        }else {
        	theP.style.display="none";
        	return true;
        }
    }
    else{
        theP.style.display="block";
        theP.innerHTML="Hãy nhập tất cả đều là số";
        return false;
    }
}

function KiemTraHopLe() {
	return ktraBatBuocDangKy() && KTChieuDai("username",3,30) && KTChieuDai("pass",3,30) && KTNumber("phone");
}
















