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
    <title>Klaiver | 비밀번호 찾기</title>
    <link href="./resources/images/favicon.png" rel="shortcut icon" type="image/png" />
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Noto+Sans' />
    <link rel='stylesheet' type='text/css' href='./resources/css/main.css' />
 <script src="./resources/js/jquery-1.11.2.js"></script>
	<script>
 
	$(document).ready(function(){		
		var flag = false;
		
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
					 if (success == true) {
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
		  $("#sub_btm").click(function(){
			  $.ajax({
				 url  : "./compareAuthNum",
				 type : "post",
				 data : {
					 "authNum" : $("#sub_min").val()
				 },
				 success : function(success){
					 if(success == true){
					 	alert("성공 입니다.");
						flag = true;							 
					 }
					 else{
						 alert("인증 번호가 틀립니다.");
					 }
				 }
			  });
		  });
		  
		  $("#pw_btm").click(function(){
				 var emails = $('#mail').val();
				 var auth = $('#sub_min').val();
				 $.ajax({
					 type : "get",
					 data : {
						 email : emails
					 } ,success : function(data){
						   if(flag === false){
							 alert("이메일 인증을 해주세요");
							 return false;
						 }else if (email == ''){
							 alert("이메일을 확인해 주세요");
							 return false;							 
						 }else{
							 location.href="./serchpwtwo?email="+emails;
						 }  
					 } 
				  });
				 
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
            <div>
              
            </div>    
        </div>
    </header>
    <section id="container">
        <p id="side">SOCIAL NETWORKING SERVICE KLAIVER</p>
        <p align="center" >
           <a href="<c:url value="/?lang=ko" />" >Korean</a>/
	       <a href="<c:url value="/?lang=en" />">English</a>/
	       <a href="<c:url value="/?lang=jp" />">Japanese</a>    
	         
        </p>
                

        <!------------==============================  회원가입 1단계  ==============================------------>
        
        <div id="Form_box">
            <p><img src="./resources/images/ci.png" alt="Klaiver"/></p>
             <p><strong>Klaiver 비밀번호 찾기 화면 입니다.</strong></p>
                <div class="info_box"> 
                    <input class="info" type="text" id="mail" name="email" placeholder='<spring:message code="site.email"/>' />
                    <input type="hidden" id="h_email" name="h_email" value="${firstemail}">
                    <button class="sub_btn" name="sub_btn1" id="sub_btn1" type="button" title="전송" > 이메일 인증 전송</button>
                    
                    <input class="info half" type="text" id="sub_min" name="sub_min" placeholder="인증번호를 입력해 주세요"/>
                    <div>
                    <button class="sub_btn" name="sub_btm" id="sub_btm" type="button" title="전송" > 확인</button>
                    </div>                   
                </div>
                <button class=join_btn  id="pw_btm">다음</button>
                
             
        </div>
    </section>
</body>
</html>