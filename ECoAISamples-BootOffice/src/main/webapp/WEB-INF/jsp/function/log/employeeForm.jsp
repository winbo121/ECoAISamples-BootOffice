<%@page import="devonframe.util.HtmlUtil"%>
<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : Log 예제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style type="text/css">
.log_msg {
	text-align:left !important;
}
</style>

<script>
	function fnRetrieve() {
		document.listForm.action = "<c:url value="/function/log/retrieveLogDbList.do"/>";
		document.listForm.submit();
	}
	function fnAdd() {
		document.listForm.action = "<c:url value="/function/log/insertLogDb.do"/>";
		document.listForm.target = "_self";
		document.listForm.submit();
	}
</script>
<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Log</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Foundation</a></span></li>
				<li class="Llast"><span>Log</span></li>
			</ul>
		</div>

	</div>

	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			Log는 시스템 개발 또는 운용 시 발생할 수 있는 어플리케이션 내부 정보를 시스템 외부 저장소에 기록하여 시스템의 상황을
			쉽게 파악할 수 있게 지원하는 서비스.<br />
			<br />
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:log" target="_blank">log</a>
				</li>
				<br>
				<li>설정</li> 
				- yml 설정 : /resources/application.yml(Prefix: devon.log)
				<br> - log4j 설정 : resources/log4j2-spring.xml
				<br>
				<br>
				<li>로그 호출 예제</li> LOGGER.error(" error 테스트 : ");
				<br> LOGGER.debug(" debug 테스트: ");
				<br> LOGGER.info(" info 테스트: ");
				<br> LOGGER.warn(" warn 테스트 : ");
				<br>
				<br>
			</ul>
		</div>

		<form:form modelAttribute="logDbList" name="listForm" id="listForm" method="post">

			<div id="LblockSearch"></div>

			<div id="LblockPageSubtitle01" class="LblockPageSubtitle">
				<h2>Log DB List</h2> (시간의 단위는 ms 을 사용함.)
			</div>

			<div id="LblockListTable01" class="LblockListTable">
				<table summary="사원 신상발령정보">
					<caption>Log DB</caption>
					<thead>
						<tr>
							<th class="Lfirst">Seq</th>
							<th>로그 발생 라인</th>
							<th>로그레벨</th>
							<th>메세지</th>
							<th>로그 발생 클래스</th>
							<th>로그 발생 메소드</th>
							<th class="Llast">로그 발생 라인</th>
						</tr>
					</thead>
					<tbody id="logDbArea">
						<c:forEach items="${logDbList}" var="result" varStatus="i">
							<c:set var="index" value="${i.index}" />
							<tr class="Lfirst">
								<td>${result.eventId}</td>
								<td>${result.timestmp}</td>
								<td>${result.levelString}</td>
								<td class="log_msg">${result.formattedMessage}</td>
								<td>${result.callerFilename}</td>
								<td>${result.callerMethod}</td>
								<td class="Llast">${result.callerLine}</td>
							</tr>
						</c:forEach>
						<c:if test="${empty logDbList}">
							<tr id="empty" style="background-color: #FFFFFF">
								<td height="25" colspan="8"><spring:message	code="dev.inf.com.nodata" /></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</form:form>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#"><span onclick="fnAdd();return false;">Log 실행</span></a>
	</div>

</div>
