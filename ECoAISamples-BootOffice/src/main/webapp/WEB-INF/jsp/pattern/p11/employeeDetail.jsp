<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeDetail.jsp
 * DESC : 웹패턴 1-1 조회
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script type="text/javaScript" language="javascript">
//<![CDATA[
function fnInsertForm() {
	document.detailForm.action = "<c:url value='/pattern/p11/retrieveEmployeeForm.do'/>";
	document.detailForm.mode.value = "insert";
	document.detailForm.submit();
}
function fnDelete() {
	document.detailForm.action = "<c:url value='/pattern/p11/deleteEmployee.do'/>";
	document.detailForm.submit();
}
function fnRetrieve() {
	var num = document.detailForm.searchNum;
	if (!fnValidateRequired(num,"<spring:message code="dev.err.com.noSearchNum"/>")) return false;
	document.detailForm.action = "<c:url value='/pattern/p11/retrieveEmployee.do'/>";
    document.detailForm.submit();
}
function fnUpdateForm() {
	document.detailForm.action = "<c:url value='/pattern/p11/retrieveEmployeeForm.do'/>";
	document.detailForm.mode.value = "update";
	document.detailForm.submit();
}
// ]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>P1-1 Single View to Edit</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Web Pattern</a></span></li>
				<li><span><a href="#">P1 Single Pattern</a></span></li>
				<li class="Llast"><span>P1-1 Single View to Edit</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
		<div id="LblockSearch">
			<div>
				<div>
					<div>
						<form:form modelAttribute="result" name="detailForm" method="post" onsubmit="fnRetrieve();return false;">
							<input type="hidden" name="mode" value="${param.mode}" />
							<input type="hidden" name="num" value="${result.num}" />

							<table summary="<spring:message code="sample.office.employee.empSearch"/>">
								<caption><spring:message code="sample.office.employee.empSearch" />	</caption>
								<colgroup>
									<col style="width: 20%;" />
									<col style="width: 80%;" />
								</colgroup>
								<tbody>
									<tr>
										<th><spring:message code="sample.office.employee.num" /></th>
										<td><input type="text" class="Ltext" id="searchNum" name=searchNum value="${param.searchNum}" /></td>
									</tr>
								</tbody>
							</table>
							<input type="image" class="Limage" src="<c:url value="/resource/images/btn_search.gif"/>" onclick="fnRetrieve();return false;" alt="search button" />
						</form:form>
					</div>
				</div>
			</div>
		</div>

		<div id="LblockDetail01" class="LblockDetail">
			<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
				<caption><spring:message code="sample.office.employee.detailInfo" /></caption>
				<colgroup>
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col style="width: 40%;" />
				</colgroup>
				<tbody>
					<tr>
						<th><spring:message code="sample.office.employee.num" /></th>
						<td><c:out value="${result.num}" /></td>
						<th><spring:message code="sample.office.employee.joblevel" /></th>
						<td><c:out value="${result.joblevelCodeName}" /></td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.name" /></th>
						<td><c:out value="${result.name}" /></td>
						<th><spring:message code="sample.office.employee.department" /></th>
						<td><c:out value="${result.divisionCodeName}" /> <c:out value="${result.departmentCodeName}" /></td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.birthdate" /></th>
						<td><Tag:mask mask="####-##-##"><c:out value="${result.birthdate}" /></Tag:mask></td>
						<th><spring:message code="sample.office.employee.gender" /></th>
						<td>
							<c:if test="${result.sex =='M'}"><spring:message code="sample.office.employee.man" /></c:if>
							<c:if test="${result.sex =='F'}">	<spring:message code="sample.office.employee.woman" /></c:if>
						</td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.ssn" /></th>
						<td><Tag:mask mask="######-#######"><c:out value="${result.ssn}" /></Tag:mask></td>
						<th><spring:message code="sample.office.employee.telephone" /></th>
						<td><Tag:phone><c:out value="${result.telephone}" /></Tag:phone></td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.postal" /></th>
						<td><Tag:mask mask="###-###"><c:out value="${result.postal}" /></Tag:mask></td>
						<th><spring:message code="sample.office.employee.skill" /></th>
						<td><c:out value="${result.skillCodeName}" /></td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.address" /></th>
						<td colspan="3">${result.address}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnInsertForm();return false;"><span><spring:message code="common.label.create" /></span>	</a>
		<c:choose>
			<c:when test="${empty result}">
			</c:when>
			<c:when test="${not empty result}">
				<a class="Lbtn" href="#" onclick="fnUpdateForm();return false;"><span><spring:message code="common.label.update" /></span>	</a>
				<a class="Lbtn" href="#" onclick="fnDelete();return false;"><span><spring:message code="common.label.delete" /></span></a>
			</c:when>
		</c:choose>
	</div>
	
</div>
