<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%---------------------------------------------------------
    파일명 : codeForm.jsp
    프로젝트명 : XXXX 프로젝트

    Copyright(c) 2012 LG CNS,  All rights reserved.

    설 명 : 본 화면은 코드 정보를 수정하는 입력 화면입니다.
    작성자 : XXX팀 OOO
-------------------------------------------------------------%>



<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>

<title><spring:message code="sample.common.code.codeManagement"/></title>

<script type="text/javaScript" language="javascript">
// <![CDATA[
function fncInsertCode() {
	document.pForm.action = "<c:url value='/common/code/insertCode.do'/>";
	document.pForm.submit();
}
function fncUpdateCode() {
	document.pForm.action = "<c:url value='/common/code/updateCode.do'/>";
	document.pForm.submit();
}
function fncDeleteCode() {
	document.pForm.action = "<c:url value='/common/code/deleteCode.do'/>";
	document.pForm.submit();
}
function fncRetrieveCodeList() {
	document.pForm.action = "<c:url value='/common/code/retrieveCodeList.do'/>";
	document.pForm.submit();
}
// ]]>
</script>

</head>
<body id="LblockBody">

	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1><spring:message code="sample.common.code.codeManagement"/></h1>
		</div>
	</div>

	<div id="LblockPageSubtitle" class="LblockPageSubtitle">
		<h2><spring:message code="sample.common.code.codeDetail"/></h2>
	</div>

	<form:form modelAttribute="codeVO" name="pForm" method="post">

		<div id="LblockBodyMain">
			<div id="LblockDetail" class="LblockDetail">
				<table summary="<spring:message code="sample.common.code.codeDetail"/>">
					<caption><spring:message code="sample.common.code.codeDetail"/></caption>
					<tbody>
						<tr>
							<th><spring:message code="sample.common.code.codeGroup"/></th>
							<td>
								<c:choose>
									<c:when test="${param.mode=='insert'}">
										<form:input id="codeGroup" path="codeGroup"/>
									</c:when>
									<c:when test="${param.mode=='update'}">
										<c:out value="${codeVO.codeGroup}" /><form:hidden path="codeGroup"/>
									</c:when>
								</c:choose>
							</td>
							<th><spring:message code="sample.common.code"/></th>
							<td>
								<c:choose>
									<c:when test="${param.mode=='insert'}">
										<form:input id="code" path="code"/>
									</c:when>
									<c:when test="${param.mode=='update'}">
										<c:out value="${codeVO.code}" /><form:hidden path="code"/>
									</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.common.code.codeName"/></th>
							<td><form:input id="name" path="name"/></td>
							<th><spring:message code="sample.common.code.codeDesc"/></th>
							<td><form:input id="codeDesc" path="codeDesc"/></td>
						</tr>
					</tbody>
				</table>
			</div><!-- end LblockDetail1 -->
		</div><!-- //end LblockMainBody-->

		<div id="LblockButton">
			<c:choose>
				<c:when test="${param.mode=='insert'}">
					<a class="Lbtn" href="#" onclick="fncInsertCode();"><span><spring:message code='common.label.save'/></span></a>
				</c:when>
				<c:when test="${param.mode=='update'}">
					<a class="Lbtn" href="#" onclick="fncUpdateCode();"><span><spring:message code='common.label.save'/></span></a>
					<a class="Lbtn" href="#" onclick="fncDeleteCode();"><span><spring:message code='common.label.delete'/></span></a>
				</c:when>
			</c:choose>
			<a class="Lbtn" href="#" onclick="fncRetrieveCodeList();"><span><spring:message code='common.label.list'/></span></a>
		</div>
	</form:form>
</body>
</html>
