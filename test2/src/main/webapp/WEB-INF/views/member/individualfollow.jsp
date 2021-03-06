﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="description" content="실시간 기업정보 서비스, 페이지, 정보공유" />

<title>Klaiver 상대방 개인페이지</title>
<link href="../resources/images/favicon.png" rel="shortcut icon"
	type="image/png" />
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Noto+Sans' />
<link rel='stylesheet' type='text/css'
	href='../resources/css/klaiver.css' />

<script src="../resources/js/jquery-1.11.2.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script>
var jb = jQuery.noConflict();
</script>

<script>
     $(document).ready(function () {
    	 
         $('#icon li').mouseenter(function () {
             $(this).find('.cover').stop().fadeIn(200);
         });

         $('#icon li').mouseleave(function () {
             $(this).find('.cover').stop().fadeOut(200);
         });
     });
    </script>
        <script>
    function viewfollower(email){
    	var email = email;
     	var popUrl = "../member/viewfollower?email="+email;
 		var windowW = 400;  // 창의 가로 길이
        var windowH = 400;  // 창의 세로 길이
        var left = Math.ceil((window.screen.width - windowW)/2);
        var top = Math.ceil((window.screen.height - windowH)/2);
		window.open(popUrl,"목록보기","l top="+top+", left="+left+", height="+windowH+", width="+windowW);
    }
    function viewfollowing(email){
    	var email = email;
     	var popUrl = "../member/viewfollowing?email="+email;
 		var windowW = 400;  // 창의 가로 길이
        var windowH = 400;  // 창의 세로 길이
        var left = Math.ceil((window.screen.width - windowW)/2);
        var top = Math.ceil((window.screen.height - windowH)/2);
		window.open(popUrl,"목록보기","l top="+top+", left="+left+", height="+windowH+", width="+windowW);
    }
    </script>
<script>
$(document).ready(function(){
	// submitButton 클릭 이벤트
	$("#submitButton").click(function(){
		var form = $("#formFile")[0];
		var formData = new FormData(form); 
		// 파일
		formData.append("test1", $("#imageFile")[0].files[0]);
		// 문자열
		formData.append("test2", "String 문자열");
		// 숫자
		formData.append("test3", "12345");
		// 내용
		formData.append("test4", "context");
		
		$.ajax({
			url: './insert', 
			// 앞에서 지정한 formData
			data: formData, 
			processData: false, 
			contentType: false, 
			type: 'POST', 
			success: function(data){ 
				location.reload();
				} 
			});
	});
	
});
</script>
    <script>
    // 이미지 클릭시 원본 크기로 팝업 보기
    function doImgPop(img) {
		if(img!='../resources/img/noimg.jpg'){
			img1 = new Image();
			img1.src = (img);
			imgControll(img);
		}
	}
      
    function imgControll(img){ 
     if((img1.width!=0)&&(img1.height!=0)){ 
        viewImage(img); 
      } 
      else{ 
         controller="imgControll('"+img+"')"; 
         intervalID=setTimeout(controller,20); 
      } 
    }
    function viewImage(img){ 
     W=img1.width; 
     H=img1.height; 
     O="width="+W+",height="+H+",scrollbars=yes"; 
     imgWin=window.open("","",O); 
     imgWin.document.write("<body topmargin=0 leftmargin=0>");
     imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;'>");
     imgWin.document.close();
    }
    </script>
<script>
        $(document).ready(function () {
        	$("#search").keypress(
		            function(e) {
		               if (e.which == '13') {
		                  if ($("#search").val() != "") {
		                     var str = $("#search").val();
		                     var regExp =  /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>\#$%&\'\"\\(\=]/gi;
		             	     if(regExp.test(str)){
		             	    	 var keyword = str.replace(regExp, "");
		             	    	document.location.href = "../search/alllist?keyword="
		                            + keyword;
		             	    }else{
		             	    	document.location.href = "../search/alllist?keyword="
		                            + str;
		             	    }
		                     
		                  } else {
		                     alert("검색어를 입력하세요");

		                  }
		                  return false;
		               }
		            });
		         $("#search_btn").click(
		            function() {
		               if ($("#search").val() != "") {
		                  var keyword = $("#search").val();
		                  var str = $("#search").val();
		                  var regExp =  /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>\#$%&\'\"\\(\=]/gi;
		          	     if(regExp.test(str)){
		          	    	 var keyword = str.replace(regExp, "");
		          	    	document.location.href = "../search/alllist?keyword="
		                         + keyword;
		          	    }else{
		          	    	document.location.href = "../search/alllist?keyword="
		                         + str;
		          	    }
		                  return false;
		               } else {
		                  alert("검색어를 입력하세요");
		                  return false;
		               }
		            });
        });
     </script>
<script>
         function resize(obj) {
             obj.style.height = "1px";
             obj.style.height = (20 + obj.scrollHeight) + "px";
         }
         function autoDate() {
      		var tDay = new Date();
      		var tMonth = tDay.getMonth() + 1;
      		var tDate = tDay.getDate();
      		var tHour = tDay.getHours();
      		var tMinutes = tDay.getMinutes();
      		if (tMonth < 10)
      			tMonth = "0" + tMonth;
      		if (tDate < 10)
      			tDate = "0" + tDate;
      		document.getElementById("regdate").value = tDay.getFullYear() + "년"
      				+ tMonth + "월" + tDate + "일" + tHour + ":" + tMinutes;
      	}
      	function addLoadEvent(func) {
      		var oldonload = window.onload;
      		if (typeof window.onload != 'function') {
      			window.onload = func;
      		} else {
      			window.onload = function() {
      				if (oldonload) {
      					oldonload();
      				}
      				func();
      			}
      		}
      	}

      	addLoadEvent(function() {
      		autoDate();
      	}); 
      	function mod(str){
      		 event.preventDefault();
          	 var sbid = str;
          	var popUrl = "../member/individualBupdate?sbid="+sbid;
   		var popOption = "width=1000, height=360, resizable=no,location=no, scrollbars=no, status=yes;";
   		window.open(popUrl, "수정page", popOption);
         	}
      	function removef(idx){
       		var sbid=idx;
       		var result = confirm('삭제 하시겠습니까?');
       		if(result){    
       		$.ajax({
				url : "../member/delete?sbid="+sbid,
				type : "post",
				data : {
					sbid : idx
				}
			}); 
       		location.reload();
       	 }
      	}
    	function replymod(str){
            var rid = str;
        	var popUrl = "../member/updaterep?rid="+rid;
    		var popOption = "width=1000, height=360, resizable=no,location=no, scrollbars=no, status=yes;";
    		window.open(popUrl, "수정page", popOption);
            }
           	function replyremove(idx){
           		var result = confirm('삭제 하시겠습니까?');
           		if(result) { 
           			$.ajax({
        				url : "../member/replyremove?rid="+idx,
        				type : "post",
        				data : {
        					rid : idx
        				}
        			});
           			location.reload();
           		}

           		
           	}
    </script>
  <script>
   $(document).ready(function(){
	   $("#message").click(function(){
		   var email = $("#userids").val();
			var popUrl = "../notes/fsender?email="+email;
			var popOption = "width=1000, height=360, resizable=no,location=no, scrollbars=no, status=yes;";
			window.open(popUrl, "보내는page", popOption);
	        window.close();
	   });
   });
       	
    </script>
<script type="text/javascript">
	function reload() {
		if (window.opener) {
			window.opener.document.location.href = window.opener.document.URL;
		}
	}
</script>

</head>
<body onload="javascript:reload();">
	<header>
		<div id="ci">
			<a href="../home"><img src="../resources/images/ci.png"
				alt="Klaiver" /></a>
		</div>
		<form id="Integrated_search" name="Integrated_search" method="post">
			<input type="text" id="search" name="qa_text" placeholder="ex)기업명, 대표자명, 이메일, 산업군"/>
			<input type="image" id="search_btn"
				src="../resources/images/search_btn.png" alt="검색" />
		</form>
		<ul id="icon">
			<li class="icon1"><a href="../member/individual?keyword=${sessionScope.login}">
			<div class="cover"></div><img src="../resources/images/icon1.png" alt="개인페이지"/>
           <c:if test="${fn:length(updatenewpost) ne 0}">new</c:if>
           </a></li>
			<li class="icon2"><a
				href="../cboard/companylist?userid=${sessionScope.login}"><div
						class="cover"></div> <img src="../resources/images/icon2.png"
					alt="기업페이지" /></a></li>
			<li class="icon3"><a href="../klogin/logout"><div
						class="cover"></div> <img src="../resources/images/icon3.png"
					alt="로그아웃" /></a></li>
		</ul>
	</header>

	<!------------==============================  콘텐츠 영역  ==============================------------>
	<section id="container">
		<div id="paper">
			<!----개인페이지 공통---->
			<div id="top_bg">
				<div id="color_box"></div>
			</div>
			<c:forEach items="${IndividualVO}" var="IndividualVO">
				<div id="individual_profile">

					<div id="individual_img">
					
						<img src="../resources/img/${IndividualVO.profimg}" onclick="doImgPop('../resources/img/${IndividualVO.profimg}')"/> 
					</div>
					<!--개인프로필이미지-->
					<div id="individual_info">
						<!--개인정보-->
						<input type="hidden" value="${sessionScope.login}"> <input
							type="hidden" name=email value="${IndividualVO.email}">
						<div id="individual_name">${IndividualVO.first}
							${IndividualVO.last} ( ${IndividualVO.email} )</div>
						<div id="individual_type">
							<a href="../search/search_home?userid=${IndividualVO.email}">${IndividualVO.company}(
								${IndividualVO.title} )</a>
						</div>
						<div id="individual_loc">${IndividualVO.country},
							${IndividualVO.city}</div>
					</div>

					<div id="commu">
						<div id="follow_btn">
							<c:if test="${IndividualVO.flag eq true}">
								<button id="follow" name="follow"
									onclick="location.href='../follow/delete?userid=${sessionScope.login}&followid=${IndividualVO.email}'">Following</button>
							</c:if>
							<c:if test="${IndividualVO.flag eq false}">
								<button id="follow" name="follow"
									onclick="location.href='../follow/insertFollow?userid=${sessionScope.login}&followid=${IndividualVO.email}'">Follow</button>
							</c:if>
							<input type="hidden" name="userids" id="userids" value="${IndividualVO.email}"/>
							<button type="submit" id="message" name="message">Message</button>
						</div>
						<div id="follow_num_home">
							<!--팔로워/팔로잉-->
							<p>
								개인 팔로워 <span id="follower_num"><a href="#" onclick="viewfollower('${IndividualVO.email}');"> ${followercount}</a> </span>명
							</p>
							<p>
								개인 팔로잉 <span id="following_num"><a href="#" onclick="viewfollowing('${IndividualVO.email}');"> ${followingcount} </a></span>명
							</p>
							<p id="edit">
								<a href="../search/search_home_list?userid=${IndividualVO.email}" onclick="window.open(this.href, '_blank'); return false;">회사
									페이지</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
			<!----개인 콘텐츠---->
			<div id="contents_wrap">

				<div id="_intro">
					<!--개인소개 영역-->
					<c:forEach items="${IndividualVO}" var="IndividualVO">
						<div class="title_box_">자기소개</div>
						<div id="personal_intro">${IndividualVO.introduce}</div>
					</c:forEach>
				</div>
				<div id="share_info">
					<!--정보공유 영역-->
					<div id="share_input">
						<!--입력박스-->
						<form id="formFile" method="post" encType="multipart/form-data">
							<c:forEach items="${IndividualVO}" var="IndividualVO">
								<c:forEach items="${sessionimg}" var="sessionimg">
								
									 <span class="personal_img"><img src="../resources/img/${sessionimg.profimg}" onclick="doImgPop('../resources/img/${sessionimg.profimg}')"/></span> 
								</c:forEach>
								<ul class="title_box">
									<c:forEach items="${sessionidName}" var="sessionidName">
										<li class="name"><input type="hidden" name="warea"
											id="warea" value="${IndividualVO.email}" /> <input
											type="hidden" name="readid" id="readid"
											value="${sessionScope.login}" /> <input type="hidden"
											name="userid" id="userid" value="${sessionScope.login}" /><a href="../member/individual?keyword=${sessionScope.login}">
											${sessionidName.company}(${sessionidName.first}${sessionidName.last})</a></li>
									</c:forEach>
									<li><textarea class="record" name="content" wrap="hard"
											onkeyup="resize(this)"></textarea></li>
									<li class="hashtag"><span><input type="file"
											id="imageFile" /></span></li>
									<li><span></span></li>
									<li><div class="line"></div></li>
								</ul>

								<input type="button" id="submitButton" class="enter"
									name="edit_save" value="글등록">
							</c:forEach>
						</form>
					</div>
					<c:forEach items="${sololist}" var="ScrollBoardVO">
						<div class="data_box">
							<!--등록된 컨텐츠 박스-->

							<ul class="title_box">
								<li>
									<div class="scrolling" data-sbid="${ScrollBoardVO.sbid}">
										<input type="hidden" value="${ScrollBoardVO.sbid}">
									</div>
								</li>
								<c:forEach items="${IndividualVO}" var="IndividualVO">
									<li class="name"><span class="personal_img"><img
									src="../resources/img/${ScrollBoardVO.profimg}" onclick="doImgPop('../resources/img/${ScrollBoardVO.profimg}')"/></span><a
										href="../member/individualfollow?email=${ScrollBoardVO.userid}"><input
											type="hidden" name="userids" id="userids"
											value="${IndividualVO.email}" />
											${ScrollBoardVO.company}(${ScrollBoardVO.first}${ScrollBoardVO.last})</a>


										<c:if test="${ScrollBoardVO.userid eq sessionScope.login}">
											<input type="hidden" id="idx${ScrollBoardVO.sbid}"
												value="${ScrollBoardVO.sbid}" />
											<button type="submit" class="enter" name="edit_save"
												onclick="removef(${ScrollBoardVO.sbid})">삭제</button>
											<button type="submit" class="enter" name="edit_save"
												onclick="mod(${ScrollBoardVO.sbid});">수정</button>
										</c:if></li>
								</c:forEach>
								<li class="hashtag"><span>${ScrollBoardVO.regdate}</span></li>
								<c:if test="${!empty ScrollBoardVO.image}">
									<li class="contents_pt"><img
										src="../resources/img/${ScrollBoardVO.image}"onclick="doImgPop('../resources/img/${ScrollBoardVO.image}')"/></li>
								</c:if>
								<li class="contents_pt"><br></li>
								<li class="cts">${ScrollBoardVO.content}</li>

								

								<li><div class="line"></div></li>
							</ul>
							<form id="repForm" method="POST" action="../member/followreply">
								<ul class="title_box">
									<li><input type="hidden" name="boardid" id="boardid"
										value="${ScrollBoardVO.sbid}"> <input type="hidden"
										name="rep_userid" id="rep_userid"
										value="${sessionScope.login}"> <textarea
											class="record" name="replytext" id="replytext" onkeyup="resize(this)"
											onkeypress="if(event.which=='13')form.submit()"></textarea></li>

									<li>
										<button class="comment_enter" name="edit_save" id="repsubmit">
											<img src="../resources/images/btn_07.jpg" /> 댓글달기
										</button>
									</li>
									<li><div class="line"></div></li>

								</ul>
							</form>
						</div>
						<div class="data_box_rep">
							<ul class="title_box">
								<c:forEach items="${replylist}" var="replylist">
									<c:if test="${ScrollBoardVO.sbid == replylist.boardid}">
										<li><div><span class="personal_img">
										<img src="../resources/img/${ScrollBoardVO.profimg}" onclick="doImgPop('../resources/img/${ScrollBoardVO.profimg}')"/></span>
												<a
													href="../member/individualfollow?email=${replylist.rep_userid}">
													${replylist.boardid}${replylist.company}(${replylist.first}${replylist.last})</a>
												
											</div><br></li>
											<li>${replylist.replytext}</li>

										<li><div>
												<c:if test="${replylist.rep_userid eq sessionScope.login}">
													<input type="button" value="수정" style="margin-right: 10px"
														onclick="replymod(${replylist.rid});">
													<input type="button" value="삭제" style="margin-right: 10px"
														onclick="replyremove(${replylist.rid});">
												</c:if>
												<c:if test="${replylist.rep_userid ne sessionScope.login}">
													&nbsp;
												</c:if>

												<span style="float: right;">${replylist.rep_regdate}</span>
											</div></li>
									</c:if>
									<li class="re_reply${replylist.rid}"></li>

								</c:forEach>

							</ul>
						</div>
					</c:forEach>
					<div class="scrollLocation"></div>


				</div>
			</div>
		</div>

		<!------------==============================  메세지 박스  ==============================------------>
		<!-- 		팔로우리스트  			-->
		<%@ include file="../follow/followlist.jsp" %>
		
<!-- 		팔로우리스트  			-->
	</section>
</body>
<script>
	jb(document)
			.ready(
					function() {
						var scrollEventFlag = false;
						var lastScrollTop = 0;
						jb(window)
								.scroll(
										function() {
											
											var currentScrollTop = jb(window)
													.scrollTop();
											var scrollpercent = (document.body.scrollTop + document.documentElement.scrollTop)
													/ (document.documentElement.scrollHeight - document.documentElement.clientHeight);
											console.log(scrollpercent);
											if (scrollpercent >= 0.999
													&& !scrollEventFlag) {
												console.log(scrollpercent);
												scrollEventFlag = true;
												var lastbno = jb(
														".scrolling:last")
														.attr("data-sbid");
												var sessionid = jb("#userids").val();
												var id = jb("#userid").val();
												console.log(lastbno);
												console.log(sessionid);
												
												jb.ajax({
															type : 'POST',
															url : '../member/soloDownScroll',
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "POST"
															},
															dataType : 'json',
															data : {
																sbid : lastbno,
																sessionid : sessionid
															},
															success : function(
																	data) {
																var str = "";
																if (data != "") {
																	jb(data)
																			.each(
																					function() {
																						console.log(this);
																						console.log(this.sbid);
																						var id = jb("#userid").val();
																						if(this.image != "" && this.image != "undefined" && this.image != null){
																							var imageStr = "<img src='../resources/img/"+this.image+"' onclick=doImgPop('../resources/img/"+this.image+"')>";
																						}else{
																							imageStr="<br>";
																						}
																						if(id==this.userid){
																							var btnstr = "<button type='submit' class='enter' name='edit_save' onclick='removef("+this.sbid+");'>삭제</button><button type='submit' class='enter' name='edit_save' onclick='mod("+this.sbid+");'>수정</button>";
																						}else{
																							btnstr ="";
																						}
																						str +="<div class='data_box'>" 
																								+"<div class=" + "'title_box'" + "><li>"
																								+ "<div class=" +  "'scrolling'" + " data-sbid='" + this.sbid +"'>"
																								+ "<input type='hidden'id='ssbid' value='" + this.sbid +"'>"
																								+ "</div></li>"
																								+ "<li class='name'>"
																								+"<span class='personal_img'><img src='../resources/img/" + this.profimg +"' onclick=doImgPop('../resources/img/"+this.profimg+"')></span>"
																								+"<a href='../member/individualfollow?email="+this.userid+"'>"
																								+this.company+"("+this.first+this.last+")"
																								+ "</a>"
																								+ btnstr
																								+"</li>"
																								+ "<li class='hashtag'><span>"
																								+ this.regdate
																								+ "</span></li>"
																								+ "<li class='contents_pt'>"
																								+ imageStr
																								+ "</li>"
																								+ "<li class='cts'>"
																								+ this.content
																								+ "</li>"
																								
																								+"<form id='repForm' method='POST' action='../member/followreply'>"
																								+"<ul class='title_box'>"
																								+"<li><input type='hidden' name='boardid' id='boardid' value='" + this.sbid +"'>"
																								+"<input type='hidden' name='rep_userid' id='rep_userid' value='"+id+"'>"
																								+"<textarea class='record comment_re' name='replytext' id='replytext' onkeyup='resize(this)' onkeypress='if(event.which==13)form.submit()'></textarea></li>"
																								+"<li>"
																								+"<button type='submit' class='comment_enter' name='edit_save' onfocus='this.value=''' id='rep'>"
																								+"<img src='../resources/images/btn_07.jpg' /> 댓글달기</button>"
																								+"</li>"
																								+"<li><div class='line'></div></li>"
																								+"</ul></form>"
																								+"</div>";
																					});// each
																	// 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.   
																	jb(".scrollLocation").append(str);
																	jb.ajax({
																		type : 'POST',
																		url : '../member/DownScrollrep',
																		data : {
																			boardid : lastbno,
																			sessionid : sessionid
																		},
																		success : function(data) {
																				if (data != null) {
																					var rep_str="";
																					jb(data).each(function() {
																						var rid = this.rid;
																						var boardid = this.boardid;
																						var	replytext = this.replytext;
																						var rep_userid = this.rep_userid;
																						var rep_regdate = this.rep_regdate; 
																						var profimg = this.profimg;
																						var company = this.company;
																						var first = this.first;
																						var last = this.last;
																						if(id == rep_userid){
																							var buttonadd="<input type='button' value='수정' style='margin-right:10px' onclick='replymod("+rid+");'>"
																							+"<input type='button' value='삭제' style='margin-right:10px' onclick='replyremove("+rid+");'>"
																						}else{
																							buttonadd="&nbsp;";
																						}
																						rep_str +="<div class='data_box_rep'>"	
																							+"<li><div><div><span class='personal_img'>"
																							+"<img src='../resources/img/"+profimg+"' onclick=doImgPop('../resources/img/"+profimg+"')></span>"
																							+"<a href='../member/individualfollow?email="+rep_userid+"'>"+company+"("+first+last+")</a></div></li>"
																							+"<li><br><div>"
																							+"<li>"+replytext+"</li>"
																							+buttonadd
																							+"<span style='float: right;'>"+rep_regdate+"</span></div></li>"
																							+"<li class='re_reply"+rid+"'></li></div>";
																							
																					});
																				}
																				jb(".scrollLocation").append(rep_str);
																			}
																		}); 
																} 
															}
														});
													
											} else if (scrollpercent < 0.999) {
												scrollEventFlag = false;
											} else if (false) {
												lastScrollTop = currentScrollTop;
											}

										});// scroll event
					});
</script>
</html>