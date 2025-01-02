<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%---------------------------------------------------------
    파일명 : loginForm.jsp
    프로젝트명 : XXXX 프로젝트

    Copyright(c) 2012 LG CNS,  All rights reserved.

    설 명 : 본 화면은 로그인 정보를 입력받는 화면입니다.
    작성자 : XXX팀 OOO
-------------------------------------------------------------%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/base.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/login.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/import.css'/>" />
<script type="text/javascript" src="<c:url value='/resource/js/dui_prototype.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_effect.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_dragndrop.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_hhmenu.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_tree.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_slidemenu.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_tab.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_calendar.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/common.js'/>"></script>
</head>
<body>
<script type="text/javascript">
//<![CDATA[
	function fnLogin() {
		document.loginForm.action = "<c:url value="/common/login/login.do"/>";
		document.loginForm.submit();
	}
//]]>
</script>

	<form id="loginForm" name="loginForm" method="post" action="<c:url value="/common/login/login.do"/>">
		<input type="hidden" name="redirectUrl" value="${redirectUrl}" />

<div id="LblockLogin" class="LblockLogin">
	<h1>로그인</h1>
	<ul class="menu">
		<li class="Lfirst"><a href="#">Contact</a></li>
		<li class="Lidx1"><a href="#">Help</a></li>
		<li class="Llast"><a href="#">English</a></li>
	</ul>
	<div class="body">
		<fieldset>
			<legend>로그인 계정입력</legend>
			<p class="id"><label for="login_id">아이디</label><input id="usrId" name="usrId" type="text" value="devon"/></p>
			<p class="pw"><label for="login_pw">비밀번호</label><input id="usrPw" name="usrPw" type="password" value="devon"/></p>
			<p class="remember"><input type="checkbox" id="login_remember" checked="checked" /><label for="login_remember">Remember me</label><span style="float:right; margin-right:100px;">${errorMsg}</span></p>
			<p class="btn"><input type="image" src="<c:url value="/resource/images/login_btn.gif" />" /></p>
		</fieldset>
		<div>
			<ul>
				<li class="Lfirst"><a href="#">인증관리센터</a></li>
				<li class="Llast"><a href="#">인증서 가져오기/내보내기</a></li>
			</ul>
			<input type="button" value="공인인증서 로그인" />
		</div>
	</div>
	<div class="footer">
		<img src="<c:url value="/resource/images/login_footer_logo.gif" />" alt="하단로고" />
		<span class="tel">02-6363-0000</span>
		<span class="email">devon@lgcns.com</span>
		<span class="copyright">Copyright ⓒ 2009 LG CNS. All Right Reserved</span>
	</div>
</div>
	</form>

</body>
</html>

