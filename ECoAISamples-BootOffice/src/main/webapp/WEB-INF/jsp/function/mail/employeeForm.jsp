<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : Mail 예제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	function fnSend() {
		$("#mailForm").attr("action", "<c:url value="/function/mail/sendMail.do"/>").attr("target",	"_self").submit();
	}
	function fnCancel() {

		$("input").val("");
		$("mailText").val("");
	}
</script>
<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Mail</h1>
		</div>
		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Support</a></span></li>
				<li class="Llast"><span>Mail</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			사용자가 전자메일 송신/수신을 쉽게 구현할 수 있는 기능을 제공하는 컴포넌트이다. <br>
			<br>
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:mail" target="_blank">mail</a></li>
				<br>
				<li>설정</li>
				- yml 설정 : /resources/application.yml(Prefix: devon.mail)
				<br> - Mail template 파일 : /resources/mail/template1.html
				<br>
				<br>
				<li>테스트 정보</li> - SMTP서버주소: smtp.gmail.com
				<br> - SMTP서버포트: 465
				<br> - 수신자 : devontestmail@gmail.com
				<br> - 수신자 메일의 아이디/암호 : devontestmail@gmail.com / devondevon
				<br>
				<br>
				<li>메일 타입에 따른 본문 작성 예시</li> - TEXT : 예) Hello!
				<br> - HTML : 예)
				&lt;html/&gt;&lt;body/&gt;hello!&lt;/body/&gt;&lt;/html/&gt;
				<br> - TEMPLATE : 예) classpath:mail/template1.html에 위치한 Template
				파일을 메일 본문으로 전송함
				<br>
			</ul>
			<br>
			<br>

		</div>


		<div id="LblockDetail01" class="LblockDetail">
			<form:form modelAttribute="mailInformation" name="mailForm" id="mailForm" method="post">
				<div id="LblockSearch">
					<div>
						<div>
							<div>
								<table summary="<spring:message code="sample.office.employee.empSearch"/>">
									<caption>
										<spring:message code="sample.office.employee.empSearch" />
									</caption>
									<tbody>
										<tr>
											<th>메일 타입 (TEXT , HTML , TEMPLATE)</th>
											<td>
												<form:select id="mailTextTypeCode" path="mailTextTypeCode">
													<form:option value="">
														<spring:message code="common.label.defaultOption" />
													</form:option>
													<form:options items="${mailTextTypeList}" itemValue="textTypeCode" itemLabel="textTypeValue" />
												</form:select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
					<caption>Mail 정보</caption>
					<tbody>
						<tr>
							<th>받는이 Email</th>
							<td><input id="mailAddress" name="mailAddress" type="text" class="Ltext" size="80" value="${mailInformation.mailAddress}" /></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input id="mailSubject" name="mailSubject" type="text" class="Ltext" size="80" value="${mailInformation.mailSubject}" /></td>
						</tr>
						<tr>
							<th>본문</th>
							<td><textarea id="mailText" name="mailText" cols="80" rows="5">${mailInformation.mailText}</textarea></td>
						</tr>
						<tr>
							<th id="ageh">나이(AGE)</th>
							<td id="age"><input id="age" name="age" type="text"	class="Ltext" value="${mailInformation.age}" /></td>
						</tr>
						<tr>
							<th id="nameh">이름(Name)</th>
							<td id="name"><input id="name" name="name" type="text"	class="Ltext" value="${mailInformation.name}" /></td>
						</tr>
					</tbody>
				</table>
			</form:form>
		</div>
		<div id="LblockButton">
			<a class="Lbtn" href="#"><span onclick="fnCancel();return false;">취소</span></a>
			<a class="Lbtn" href="#"><span onclick="fnSend();return false;">보내기</span></a>
		</div>
	</div>
</div>