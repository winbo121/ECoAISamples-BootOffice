<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : Message 예제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript" language="javascript">
	function fnRetrieve() {
		document.messageForm.action = "<c:url value='/function/message/retrieveMessage.do'/>";
		document.messageForm.submit();
	}
</script>


<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Message</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Foundation</a></span></li>
				<li class="Llast"><span>Message</span></li>
			</ul>
		</div>

	</div>
	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			프로젝트 수행 시 사용되는 각종 Message를 통합 관리함으로써 일관성을 유지하며 유지 및 관리가 용이하게 하는 컴포넌트. <br>
			<br>
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:message" target="_blank">message</a></li><br>
				<li>설정</li> 
				- yml 설정 : /resources/application.yml(Prefix: devon.message)
				<br> - Message Properties 파일 : /resources/message/message-*.xml
				<br>
				<br>
				<li>메시지 정보 (샘플)</li> &nbsp;&nbsp;errors.required = {0} 은(는) 필수 입력값입니다.
				<br> &nbsp;&nbsp;errors.required = {0} is required.
				<br> &nbsp;&nbsp;dev.inf.com.nodata = 검색된 내용이 없습니다.
				<br> &nbsp;&nbsp;dev.inf.com.nodata = no such data found.
				<br>
			</ul>
			<br>
		</div>

		<form:form modelAttribute="message" name="messageForm" id="messageForm"
			method="post">
			<div id="LblockListTable01" class="LblockListTable">
				<div class="Lwrapper">
					<table summary="사원 리스트">
						<caption>사원 리스트</caption>
						<thead>
							<tr>
								<th class="Lfirst">File/DB</th>
								<th>언어</th>
								<th>메세지 key</th>
								<th>{}의 대체 메세지</th>
								<th class="Llast">메세지</th>
							</tr>
						</thead>
						<tbody>
							<tr class="Lfirst">
								<td class="Lfirst"><form:select id="messageTypeCode" path="messageTypeCode">
									<form:options items="${messageTypeCodeList}" itemValue="code" itemLabel="value" />
									</form:select> <form:errors path="LocaleCode" /></td>
								<td><form:select id="LocaleCode" path="LocaleCode">
										<form:options items="${localeCodeList}" itemValue="code" itemLabel="value" />
									</form:select> <form:errors path="LocaleCode" /></td>
								<td><input type="text" id="key" name="key" size="20" class="Ltext" value="${message.key}" /></td>
								<td class="Llast"><input type="text" id="resolveArgument" name="resolveArgument" size="10" class="Ltext" value="${message.resolveArgument}" /></td>
								<td><input type="text" id="message" name="message"	size="40" class="Ltext" value="${message.message}" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</form:form>

	</div>
	<div id="LblockButton">
		<a class="Lbtn" href="#"><span onclick="fnRetrieve();">조회</span></a>
	</div>
</div>