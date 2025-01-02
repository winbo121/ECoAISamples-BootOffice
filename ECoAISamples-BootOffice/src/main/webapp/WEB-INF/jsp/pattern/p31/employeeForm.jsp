<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : 웹패턴 3-1 조회 / 수정 / 삭제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javaScript" language="javascript">
// <![CDATA[
function fnSave() {
	if (!fnValidateRequired(document.detailForm.num,"<spring:message code="dev.warn.com.required3"/>")) return false;
	
	if(document.detailForm.mode.value == "insert") {
		document.detailForm.action = "<c:url value='/pattern/p31/insertEmployee.do'/>";
	}else{
		document.detailForm.action = "<c:url value='/pattern/p31/updateEmployee.do'/>";
	}
	document.detailForm.submit();
}
function fnRetrieve() {
	document.detailForm.action = "<c:url value='/pattern/p31/retrieveEmployee.do'/>";
	document.detailForm.submit();
}
function fnRetrieveList() {
	document.detailForm.action = "<c:url value='/pattern/p31/retrieveEmployeeList.do'/>";
	document.detailForm.submit();
}
function fnRetrieveDepartmentCodeList() {
	var ajax = new xui.ajax("<c:url value='/common/code/retrievedepartmentCodeList.do'/>");
	ajax.addQuery("codeGroup",document.detailForm.divisionCode.value);
	ajax.bind("departmentCode");
}
// ]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>P3-1 List to Detail</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Web Pattern</a></span></li>
				<li><span><a href="#">P3 List Pattern</a></span></li>
				<li class="Llast"><span>P3-1 List to Detail</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
		<div id="LblockDetail01" class="LblockDetail">
			<form:form modelAttribute="result" name="detailForm" method="post" onsubmit="fnRetrieve();return false;">
				<input type="hidden" name="mode" value="${param.mode}" />
				<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
					<caption><spring:message code="sample.office.employee.detailInfo" /></caption>
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: 20%;" />
						<col style="width: 15%;" />
						<col style="width: 50%;" />
					</colgroup>
					<tbody>
						<tr>
							<th><spring:message code="sample.office.employee.num" /></th>
							<td>
								<c:choose>
									<c:when test="${param.mode != 'update'}">
										<form:input path="num" id="num" cssClass="Ltext"  maxlength="10"/>
									</c:when>
									<c:when test="${param.mode == 'update'}">
										<input name="num" type="hidden" value="${result.num}" /><c:out value="${result.num}" />
									</c:when>
								</c:choose>
							</td>
							<th><spring:message code="sample.office.employee.joblevel" /></th>
							<td>
								<form:select path="joblevelCode" id="joblevelCode">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value" />
								</form:select><br />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.name" /></th>
							<td><form:input path="name" id="name" cssClass="Ltext" /></td>
							<th><spring:message code="sample.office.employee.department" /></th>
							<td>
								<form:select path="divisionCode" id="divisionCode" onchange="javascript:fnRetrieveDepartmentCodeList();return false;">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${divisionCodeList}" itemValue="code" itemLabel="value" />
								</form:select>
								<form:select	path="departmentCode" id="departmentCode">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${departmentCodeList}" itemValue="code" itemLabel="value" />
								</form:select><br />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.birthdate" /></th>
							<td><form:input path="birthdate" id="birthdate" cssClass="Ltext" size="8" maxlength="8" /><a href="#" onclick="dui.Calendar.open('birthdate'); return false;"><img class="Lbtn" src="<c:url value="/resource/images/btn_icon_calendar.gif"/>" alt="날짜" /></a></td>
							<th><spring:message code="sample.office.employee.gender" /></th>
							<td>
								<form:radiobutton path="sex" value="M" label="남" cssClass="Lradio" />
								<form:radiobutton path="sex" value="F" label="여" cssClass="Lradio" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.ssn" /></th>
							<td><form:input path="ssn" id="ssn" cssClass="Ltext" maxlength="13" /></td>
							<th><spring:message code="sample.office.employee.telephone" /></th>
							<td><form:input path="telephone" id="telephone" cssClass="Ltext" maxlength="11" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.postal" /></th>
							<td><form:input path="postal" id="postal" cssClass="Ltext" /></td>
							<th><spring:message code="sample.office.employee.skill" /></th>
							<td>
								<form:select path="skillCode" id="skillCode">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${skillCodeList}" itemValue="code" 	itemLabel="value" />
								</form:select><br /> 
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.address" /></th>
							<td colspan="3"><form:input path="address" id="address" cssClass="Ltext" size="80" maxlength="80" /></td>
						</tr>
					</tbody>
				</table>
			</form:form>
		</div>
	</div>

	<div id="LblockButton">
		<c:choose>
			<c:when test="${param.mode!='update'}">
				<a class="Lbtn" href="#" onclick="fnRetrieveList();"><span><spring:message code="common.label.cancel"/></span></a>
			</c:when>
			<c:when test="${param.mode=='update'}">
				<a class="Lbtn" href="#" onclick="fnRetrieve();"><span><spring:message code="common.label.cancel"/></span></a>
			</c:when>
		</c:choose>
		<a class="Lbtn" href="#" onclick="fnSave();"><span><spring:message code="common.label.save"/></span></a>
	</div>

</div>