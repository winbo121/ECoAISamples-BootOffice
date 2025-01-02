<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : 웹패턴 1-2 조회 / 수정 / 삭제
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
//<![CDATA[
function fnRetrieve() {
	if (!fnValidateRequired(document.detailForm.searchNum,"<spring:message code="dev.err.com.noSearchNum"/>")) return false;
	document.detailForm.action = "<c:url value='/pattern/p12/retrieveEmployee.do'/>";
	document.detailForm.submit();
}
function fnDelete() {
	var answer = confirm("<spring:message code="dev.cfm.com.delete"/>");
	if (answer) {
		document.detailForm.action = "<c:url value='/pattern/p12/deleteEmployee.do'/>";
		document.detailForm.submit();
	}
}
function fnSave() {
	if (!fnValidateRequired(document.detailForm.num, "<spring:message code="dev.warn.com.required3"/>")) return false;
		var url = "<c:url value='/pattern/p12/insertEmployee.do'/>";
    	if (document.detailForm.updateNum.value.length > 0) {
    		url = "<c:url value='/pattern/p12/updateEmployee.do'/>";
        }
	document.detailForm.action = url;
	document.detailForm.submit();
}
function fnInsert() {
	var searchNum = document.detailForm.searchNum;
	var updateNum = document.detailForm.updateNum;

	if (!fnValidateRequired(searchNum,"<spring:message code="dev.err.com.noSearchNum"/>")) return false;

	if (!fnValidateNotRequired(updateNum,"<spring:message code="dev.err.com.requiredSearchNum"/>")) return false;

	document.detailForm.num.value = document.detailForm.searchNum.value;
	document.detailForm.action = "<c:url value='/pattern/p12/insertEmployee.do'/>";
	document.detailForm.submit();
}

function fnReset() {
	document.detailForm.searchNum.value = '';
	document.detailForm.action = "<c:url value='/pattern/p12/employeeForm.do'/>";
	document.detailForm.submit();
}
function fnRetrieveDepartmentCodeList() {
	var ajax = new xui.ajax("<c:url value='/common/code/retrievedepartmentCodeList.do'/>");
	ajax.addQuery("codeGroup",document.detailForm.divisionCode.value);
	ajax.bind("departmentCode");
}
//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>P1-2 Single Edit</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Web Pattern</a></span></li>
				<li><span><a href="#">P1 Single Pattern</a></span></li>
				<li class="Llast"><span>P1-2 Single Edit</span></li>
			</ul>
		</div>

	</div>

	<div id="LblockBodyMain">
		<form:form modelAttribute="result" name="detailForm" id="detailForm" method="post" onsubmit="fnRetrieve();return false;">
			<input type="hidden" id="updateNum" name="updateNum" value="${result.num}" />
			<div id="LblockSearch">
				<div>
					<div>
						<div>
							<table summary="<spring:message code="sample.office.employee.empSearch"/>">
								<caption><spring:message code="sample.office.employee.empSearch" /></caption>
								<colgroup>
									<col style="width: 15%;" />
									<col style="width: 85%;" />
								</colgroup>
								<tbody>
									<tr>
										<th><spring:message code="sample.office.employee.num" /></th>
										<td><input type="text" class="Ltext" name="searchNum" id=searchNum value="${param.searchNum}" /></td>
									</tr>
								</tbody>
							</table>
							<input type="image" class="Limage" src="<c:url value="/resource/images/btn_search.gif"/>" onclick="fnRetrieve();return false;" alt="search button"/>
						</div>
					</div>
				</div>
			</div>

			<div id="LblockDetail01" class="LblockDetail">
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
								<c:if test="${empty result.num}"><input type="text" class="Ltext" id="num" name="num" /></c:if>
								<c:if test="${!empty result.num}"><input type="hidden" class="Ltext" id="num" name="num" value="${result.num}" /> ${result.num}</c:if>
							</td>
							<th><spring:message code="sample.office.employee.joblevel" /></th>
							<td>
								<form:select path="joblevelCode" id="joblevelCode">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value" />
								</form:select>
								</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.name" /></th>
							<td><input type="text" class="Ltext" id="name" name="name" value="${result.name}" /></td>
							<th><spring:message code="sample.office.employee.department" /></th>
							<td>
								<form:select path="divisionCode" id="divisionCode" onchange="javascript:fnRetrieveDepartmentCodeList();return false;">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${divisionCodeList}" itemValue="code" itemLabel="value" />
								</form:select>
								<form:select path="departmentCode" id="departmentCode">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${departmentCodeList}" itemValue="code" itemLabel="value" />
								</form:select>
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.birthdate" /></th>
							<td><input type="text" class="Ltext" id="birthdate" name="birthdate" value="${result.birthdate}" size="8" /><a href="#" onclick="dui.Calendar.open('birthdate'); return false;"><img class="Lbtn" src="<c:url value="/resource/images/btn_icon_calendar.gif"/>" alt="날짜" /></a></td>
							<th><spring:message code="sample.office.employee.gender" /></th>
							<td>
								<form:radiobutton path="sex" value="M" label="남" cssClass="Lradio" />
								<form:radiobutton path="sex" value="F" label="여" cssClass="Lradio" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.ssn" /></th>
							<td><input type="text" class="Ltext" id="ssn" name="ssn" value="${result.ssn}" maxlength="13" /></td>
							<th><label for="lTelephone">전화번호</label></th>
							<td><input type="text" class="Ltext" id="telephone" name="telephone" value="${result.telephone}" maxlength="11" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.postal" /></th>
							<td><input type="text" class="Ltext" id="postal" name="postal" value="${result.postal}" maxlength="6" /></td>
							<th><spring:message code="sample.office.employee.skill" /></th>
							<td>
								<form:select path="skillCode" id="skillCode">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${skillCodeList}" itemValue="code" 	itemLabel="value" />
								</form:select>
								</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.address" /></th>
							<td colspan="3"><input type="text" class="Ltext" id="address" name="address" size="80" maxlength="80" value="${result.address}" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form:form>
	</div>

	<div id="LblockButton">
		<c:choose>
			<c:when test="${empty result}">
			</c:when>
			<c:when test="${not empty result.num}">
				<a class="Lbtn" href="#" onclick="fnDelete();return false;"><span><spring:message code="common.label.delete" /></span></a>
			</c:when>
		</c:choose>
		<a class="Lbtn" href="#" onclick="fnSave();return false;"><span><spring:message code="common.label.save" /></span></a>
		<a class="Lbtn" href="#" onclick="fnReset();return false;"><span><spring:message code="common.label.create" /></span></a>
	</div>

</div>