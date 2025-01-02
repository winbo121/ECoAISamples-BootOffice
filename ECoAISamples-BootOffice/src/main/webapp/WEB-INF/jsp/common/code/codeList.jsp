<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%---------------------------------------------------------
    파일명 : codeList.jsp
    프로젝트명 : XXXX 프로젝트

    Copyright(c) 2012 LG CNS,  All rights reserved.

    설 명 : 본 화면은 코드 정보를 조회하는 목록 화면입니다.
    작성자 : XXX팀 OOO
-------------------------------------------------------------%>



<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>

<title><spring:message code="sample.common.code.codeManagement"/></title>

<script type="text/javaScript" language="javascript">
// <![CDATA[
function fncRetrieveCodeList() {
	document.pForm.action = "<c:url value='/common/code/retrieveCodeList.do'/>";
	document.pForm.submit();
}
function fncRetrieveCode(code, codeGroup) {
	document.pForm.mode.value = "update";
	document.pForm.code.value = code;
	document.pForm.codeGroup.value = codeGroup;
   	document.pForm.action = "<c:url value='/common/code/retrieveCode.do'/>";
   	document.pForm.submit();
}
function fncRetrieveCodeForm() {
	document.pForm.mode.value = "insert";
	document.pForm.action = "<c:url value='/common/code/retrieveCodeForm.do'/>";
	document.pForm.submit();
}
function checkMessage() {
	if("${param.msg}" == "success") {
		alert("<spring:message code="common.message.processSuccess"/>");
	}
}
// ]]>
</script>

</head>
<body id="LblockBody" onload="checkMessage()">

	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1><spring:message code="sample.common.code.codeManagement"/></h1>
		</div>
	</div>

	<form:form modelAttribute="input" name="pForm" method="post" onsubmit="fncRetrieveCodeList()">
		<input type="hidden" name="code"/>
		<input type="hidden" name="mode"/>

		<div id="LblockBodyMain">
			<div id="LblockSearch">
				<div>
				<div>
				<div>
					<table summary="<spring:message code="sample.common.code.codeSearch"/>">
						<caption><spring:message code="sample.common.code.codeSearch"/></caption>
						<tbody>
							<tr>
								<th width="8%"><label for=codeGroup><spring:message code="sample.common.code.codeGroup"/></label></th>
								<td>
									<form:select path="codeGroup" id="codeGroup">
										<form:option value=""><spring:message code="common.label.defaultOption"/></form:option>
										<form:options items="${codeGroupList}" itemValue="codeGroup" itemLabel="codeGroup" />
									</form:select>
								</td>
								<th class="LsearchTh"><input type="image" class="Limage" src="<c:url value="/images/btn_search.gif"/>" alt="search button" /></th>
							</tr>
						</tbody>
					</table>
				</div>
				</div>
				</div>
			</div><!-- end LblockSearch -->

			<div id="LblockPageSubtitle2" class="LblockPageSubtitle">
				<h2><spring:message code="sample.common.code.codeList"/></h2>
			</div>
			<div id="LblockListTable01" class="LblockListTable">
				<div class="Lwrapper">
					<table summary="<spring:message code="sample.common.code.codeList"/>">
						<caption><spring:message code="sample.common.code.codeList"/></caption>
						<thead>
							<tr>
								<th><spring:message code="sample.common.code"/></th>
								<th><spring:message code="sample.common.code.codeGroup"/></th>
								<th><spring:message code="sample.common.code.codeName"/></th>
								<th class="Llast"><spring:message code="sample.common.code.codeDesc"/></th>
							</tr>
						</thead>
						<tbody>
				  		<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr class="Lfirst">
								<td class="Lfirst"><a href="javascript:fncRetrieveCode('<c:out value="${result.code}"/>', '<c:out value="${result.codeGroup}"/>')"><c:out value="${result.code}"/></a></td>
								<td><c:out value="${result.codeGroup}" /></td>
								<td><c:out value="${result.name}" /></td>
								<td class="Llast"><c:out value="${result.codeDesc}" /></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div><!-- end LblockListTable2 -->
		</div><!-- //end LblockMainBody-->

		<div id="LblockButton">
			<a class="Lbtn" href="#" onclick="fncRetrieveCodeForm();"><span><spring:message code='common.label.create'/></span></a>
		</div>
	</form:form>
</body>
</html>
