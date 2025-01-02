<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" isErrorPage="true"	session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%---------------------------------------------------------
    파일명 : error.jsp
    프로젝트명 : XXXX 프로젝트

    Copyright(c) 2012 LG CNS,  All rights reserved.

    설 명 : 본 화면은 일반적인 request 요청에 대한 에러메시지를 출력하는 화면입니다.
    작성자 : XXX팀 OOO
-------------------------------------------------------------%>
<div id="LblockBody">
<div id="LblockError">
	<div>
		<h1>오류가 발생하였습니다.</h1>
		<p><c:if test='${exception.code != null}' ></c:if><c:out value="${exception.message}"/><br />
		잠시 후 다시 시도해 주시기 바랍니다.<br />
		문제가 해결되지 않을 경우 서비스데스크로 문의하시기 바랍니다.<br />
		담당자 - 홍길동 대리 (02-6363-0000)
		</p>
	</div>
</div>
</div>