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
	
	$('#pw_new').click(function(){
		var passwords = $('#password').val();
		var checkpaass = $('#confirm_pw').val();
		$.ajax({
			url : "./serchpwtwo",
			type : 'get',
			data : {
				 password : $('#password').val(),
				 checkpass : $('#confirm_pw').val(),
			},
			success : function(data){
			   if(passwords != checkpaass ){
				   alert("입력 정보를 입력해 주세요");
				   return false;
			   }else if(passwords == '' || checkpaass == ''){
				   alert("비밀번호를 입력해 주세요");
				   return false
			   }/*  else{
				   location.href="./";
			   }  */
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
             <p><strong>Klaiver 새로운 비밀 번호를 입력해주세요.</strong></p>
               
                <div class="info_box"> 
                <input type="text" id="email" name="email" value=" ${email}"/>
                     <input class="info" type="password" id="password" name="password" placeholder="새 비밀번호 입력"/>
                    <font name="check1" size="2" color="red"></font>
                    <input class="info" type="password" id="confirm_pw" name="confirm_pw" placeholder="새 비밀번호 확인" />
                    <font name="check" size="2" color="red"></font>
                    
                                  
                </div>
                <button class=join_btn  id="pw_new">확  인</button>
             
        </div>
    </section>
</body>
</html>