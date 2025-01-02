<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : Crypto 예제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script>
	function fnEcryption() {
		document.detailform.action = "<c:url value='/function/crypto/retrieveEcryption.do'/>";
		document.detailform.submit();
	}

	function fnDecryption() {
		document.detailform.action = "<c:url value='/function/crypto/retrieveDecryption.do'/>";
		document.detailform.submit();
	}
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Crypto</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Support</a></span></li>
				<li class="Llast"><span>Crypto</span></li>
			</ul>
		</div>

	</div>
	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			사용자가 지정한 알고리즘을 사용하여 암/복호화 기능을 제공하는 컴포넌트이다.
			<br>
			<br>
			- 본 페이지의 컴포넌트 예시는 '양방향 암/복호화(대칭키)' 이다.
			<br>
			- 암/복호화를 위한 key는 bean 의 설정으로 등록되어 있다.(설정파일 위치 : spring/context-configuration.xml)
			<br>
			<br>
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:encryption" target="_blank">encryption</a></li>
				<br>
				<li>설정</li> 
				- yml 설정 : /resources/application.yml(Prefix: devon.security.crypto)<br/>
			</ul>
			<br>
		</div>


		<form:form modelAttribute="crypto" name="detailform" id="detailform" method="post">
			<div id="LblockSearch">
				<div>
					<div>
						<div>
							<table summary="<spring:message code="sample.office.employee.empSearch"/>">
								<caption>
									<spring:message code="sample.office.employee.empSearch" />
								</caption>
								<colgroup>
									<col style="width: 20%;" />
									<col style="width: 80%;" />
								</colgroup>
								<tbody>
									<tr>
										<th><label for="num">문자열</label></th>
										<td colspan="3">
											<input type="text" class="Ltext" name="cryptoText" id=cryptoText size="20" value="${cryptoText}" />
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div id="LblockPageSubtitle01" class="LblockPageSubtitle">
				<h2>암호화/복호화</h2>
			</div>
			<div id="LblockDetail01" class="LblockDetail">
				<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
					<caption>
						<spring:message code="sample.office.employee.detailInfo" />
					</caption>
					<colgroup>
						<col style="width: 25%;" />
						<col style="width: 25%;" />
						<col style="width: 25%;" />
						<col style="width: 25%;" />
						<col style="width: 25%;" />
					</colgroup>
					<tbody>
						<tr>
							<th>AES 암호화</th>
							<td>
								<input type="text" class="Ltext" id="ecryptionAesText"	name="ecryptionAesText" size="30" value="${crypto.ecryptionAesText}" readOnly="readonly" />
							</td>
							<th>AES 복호화</th>
							<td>
								<input type="text" class="Ltext" id="decryptionAesText"	name="decryptionAesText" size="30" value="${crypto.decryptionAesText}" readOnly="readonly" />
							</td>
						</tr>
						<tr>
							<th>DES 암호화</th>
							<td>
								<input type="text" class="Ltext" id="ecryptionDesText"	name="ecryptionDesText" size="30" value="${crypto.ecryptionDesText}" readOnly="readonly" />
							</td>
							<th>DES 복호화</th>
							<td>
								<input type="text" class="Ltext" id="decryptionDesText"	name="decryptionDesText" size="30" value="${crypto.decryptionDesText}" readOnly="readonly" />
							</td>
						</tr>
						<tr>
							<th>ARIA 암호화</th>
							<td>
								<input type="text" class="Ltext" id="ecryptionAriaText"	name="ecryptionAriaText" size="30" value="${crypto.ecryptionAriaText}" readOnly="readonly" />
							</td>
							<th>ARIA 복호화</th>
							<td>
								<input type="text" class="Ltext" id="decryptionAriaText" name="decryptionAriaText" size="30" value="${crypto.decryptionAriaText}" readOnly="readonly" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form:form>
	</div>


	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnEcryption();return false;"><span>암호화</span></a>
		<a class="Lbtn" href="#" onclick="fnDecryption();return false;"><span>복호화</span></a>
	</div>
</div>