<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true"%>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<%  
    response.setHeader("Cache-Control","no-store");  
    response.setHeader("Pragma","no-cache");  
    response.setDateHeader("Expires",0);  
 
    if (request.getProtocol().equals("HTTP/1.1")) {
        response.setHeader("Cache-Control", "no-cache");
    }
%>
<head>
    <meta charset="utf-8" />    
	<meta name="naver-site-verification" content="cd4b9b6e077b4ce24b39fe41469087c945900c46"/>    
    <meta name="description" content="실시간 기업정보 서비스, 페이지, 정보공유" />
    <title>Klaiver 회원가입 | 로그인 | 전체 검색</title>
    <link href="./resources/images/favicon.png" rel="shortcut icon" type="image/png" />
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Noto+Sans' />
    <link rel='stylesheet' type='text/css' href='./resources/css/main.css' />

    <script src="./resources/js/jquery-1.11.2.js"></script>
<script>

$(document).ready(function(){
	$('#login_btn').click(login);
	$("#pw").keypress(function(e) {					
		if (e.which=='13'){
			if ($("#pw").val()!="") {
				login();
			}
			return false;
		}
	});
	$("#search").keypress(function(e) {
               if (e.which == '13') {
                  if ($("#search").val() != "") {
                     var str = $("#search").val();
                     var regExp = /[ \{\}\[\]\/?,;:|\)*~`!^\-_+┼<>\#$%&\'\"\\(\=]/gi;
             	     if(regExp.test(str)){
             	    	 var keyword = str.replace(regExp, "");
             	    	document.location.href = "./unsearch/alllist?keyword="
                            + keyword;
             	    }else{
             	    	document.location.href = "./unsearch/alllist?keyword="
                            + str;
             	    }
                     
                  } else {
                     alert("검색어를 입력해 주세요 ");

                  }
                  return false;
               }
            });
         $("#search_btn").click(function() {
               if ($("#search").val() != "") {
                  var keyword = $("#search").val();
                  var str = $("#search").val();
                  var regExp = /[ \{\}\[\]\/?,;:|\)*~`!^\-_+┼<>\#$%&\'\"\\(\=]/gi;
                  if(regExp.test(str)){
          	    	 var keyword = str.replace(regExp, "");
          	    	document.location.href = "./unsearch/alllist?keyword="
                         + keyword;
          	    }else{
          	    	document.location.href = "./unsearch/alllist?keyword="
                         + str;
          	    }
                  return false;
               } else {
            	   alert(msg1);
                  return false;
               }
            });
});
function login() {
	$.ajax({
		url:'./klogin/login',
		type:'POST',
		data:{
			email 		: $('#email').val(),
			password 	: $('#pw').val()
		},
		success:function(message){
			
			if(message == 'success'){
				location.href="./home";
			}
			else if(message == 'fault'){
				alert("등록되지 않은 이메일 이거나 패스워드가 맞지 않습니다.");
			}
		},
		error:function(){
			alert('error');
		}
	});
}
</script>

<script>
 //이메일 유효성 검사
 $(document).ready(function(){	 
	//회원 가입 버튼 클릭시
		$('#join_btn').click(function(){
			var password = $('#password').val();
			var checkpass = $('#confirm_pw').val();
			var email = $('#mail').val();
			var checkemail = $('#confirm_mail').val();
			
			if(password!=password || email!=checkemail){
				alert("입력정보를 확인해 주세요");
				return false;
			}else if(password == '' || checkpass== ''){
				alert("비밀번호  확인을 해 주세요");
				return false;
			}else if(email == '' || checkemail== ''){
				alert("이메일 을 확인을 해 주세요");
				return false;
			}else{
				$("#stage1").submit();
			}	
		});
	 
  $('#mail').keyup(function (){
	  var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	  
	  var emails = $('#mail').val();
	  
	  if(emails == '' || !regex.test(emails)){
		  $('font[name=mailcheck1]').text('');
		  $('font[name=mailcheck1]').html("이메일 주소가 유효하지 않습니다.");
		  $("#mail").focus();
		  return false;
	  }else if(regex.test(emails)){
		  $('font[name=mailcheck1]').text('');
		  $('font[name=mailcheck1]').html("유요한 이메일 입니다.");
		  $("#mail").focus();
		  return false;
	  }	  
  });
  
  //이메일 체크
  $('#confirm_mail').keyup(function() {		
		if ($('#mail').val() != $('#confirm_mail').val()) {
			$('font[name=mailcheck]').text('');
			$('font[name=mailcheck]').html("메일을 확인해주세요");
			return false;
		} else if ($('#mail').val() == $('#confirm_mail').val()) {
			$('font[name=mailcheck]').text('');
			$('font[name=mailcheck]').html("");
			return false;
		}
	});
  //이메일 인증 
  $("#sub_btn1").click(function(){
	  var emails = $("#mail").val();  
	  $.ajax({
		 url : "./emailsc",
		 type : 'post',
		 data : {
			 email : emails
		 },
		 success : function(success){
			 //false
			 if (success == false) {
					alert("메일을 전송 하였습니다.");
					return false;
			//true
				} else {
				    alert("이메일을 다시 확인하여 주세요");
					return false;			
			}  	
		  } 
	  });  	  
  });
  
  //이메일 인증 버튼 
  $("#sub_bt1").click(function(){
	  $.ajax({
		 url  : "./compareAuthNum",
		 type : "post",
		 data : {
			 "authNum" : $("#sub_min").val()
		 },
		 success : function(success){
			 if(success == true)
			 	alert("성공 입니다.");
			 else
				 alert("인증 번호가 틀립니다.");
		 }
	  });
  });
  
  //pw 체크(특수문자 포함 시켜야됨)
  $('#password').keyup(function() {
	  var pwRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
      var pwnew = $('#password').val();
      if(pwnew.length<8 || pwnew.length>16){
    	  $('font[name=check1]').text('');
		  $('font[name=check1]').html("암호를 8자이상 16자 이하로 설정해 주세요");
		  $("#password").focus();
		  return false;
      }else if(!pwRules.test(pwnew)){
    	  $('font[name=check1]').text('');
		  $('font[name=check1]').html("영문,숫자,특수문자의 조합으로 입력해주세요");
		  $("#password").focus();
		  return false;
      } if(pwRules.test(pwnew)){
    	  $('font[name=check1]').text('');
		  $('font[name=check1]').html("");
		  $("#password").focus();
		  return false;
      }     
  });
  //pw 체크
  $('#confirm_pw').keyup(function() {
		if ($('#password').val() != $('#confirm_pw').val()) {
			$('font[name=check]').text('');
			$('font[name=check]').html("중복확인해주세요");
		} else {
			$('font[name=check]').text('');
			$('font[name=check]').html("확인되었습니다");
		}
	});
 });

</script>

</head>
<body>
    <header>
        <div id="ci">
			<a href="./"><img src="./resources/images/ci.png"
				alt="Klaiver" /></a>
		</div>
        <div id="input_box">
            <input id="login_btn" type="button" title="로그인" value="Login" />
            <span id="enter">
                <input type="password" id="pw" name="pw" placeholder='<spring:message code="site.password"/>' />
	            <input type="email" id="email" name="email" placeholder="<spring:message code="site.email"/>" />
            </span>       
        </div>
    </header>
    <section id="container">
        <p id="side">SOCIAL NETWORKING SERVICE KLAIVER</p>
        <p align="center" >
           <a href="<c:url value="/?lang=ko" />" >Korean</a>/
	       <a href="<c:url value="/?lang=en" />">English</a>/
	       <a href="<c:url value="/?lang=jp" />">Japanese</a>     
        </p>
        
        
        
        <form id="Integrated_search" name="Integrated_search" method="get" action="#">
            <input type="text" id="search" name="qa_text" placeholder="<spring:message code="site.testpro.placeholder"/>"/>
            <input type="image" id="search_btn" src="./resources/images/search_btn.png" alt="검색"/>
        </form>
        

        <!------------==============================  회원가입 1단계  ==============================------------>
        
        <div id="Form_box">
            <p><img src="./resources/images/ci.png" alt="Klaiver"/></p>
             <p><strong><spring:message code="site.klaivertitle"/></strong></p>
            <p><spring:message code="site.title"/></p>
            <form id="stage1" name="commonForm" method="post"> 
                <div class="info_box">
                    <input type="hidden"id="authNums" name="authNums" value="${authNums}">
                    <input class="info" type="text" id="L_name" name="username" placeholder="이름" />
                    <input class="info" type="text" id="mail" name="email" value="${emails}" placeholder='<spring:message code="site.email"/>' />
                    <font name="mailcheck1" size="2" color="red"></font>
                    
                    <input class="info" type="text" id="confirm_mail" name="confirm_mail" placeholder="<spring:message code="site.reemail"/>" />
                    
                    <font name="mailcheck" size="2" color="red"></font>
                    
                    <button class="sub_btn" name="sub_btn1" id="sub_btn1" type="button" title="전송" > 이메일 인증 전송</button>
                    
                    <input class="info half" type="text" id="sub_min" name="sub_min" placeholder="인증번호를 입력해 주세요"/>
                    <div>
                    <button class="sub_btn" name="sub_bt1" id="sub_bt1" type="button" title="전송" > 확인</button>
                    </div>
                    <input class="info" type="password" id="password" name="password" placeholder="<spring:message code="site.password"/>"/>
                    <font name="check1" size="2" color="red"></font>
                    <input class="info" type="password" id="confirm_pw" name="confirm_pw" placeholder="<spring:message code="site.repassword"/>" />
                    <font name="check" size="2" color="red"></font>
                </div>
                <p><a href="#"><spring:message code="site.main"/></a></p>
                <button class="join_btn"  id="join_btn"><spring:message code="site.membership"/></button>
             </form> 
        </div>
    </section>
</body>
</html>