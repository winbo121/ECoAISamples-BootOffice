<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : SayMessage 예제
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
	function fnRetrieve() {
		if (!fnValidateRequired(document.detailForm.searchNum, "<spring:message code="dev.err.com.noSearchNum"/>"))
			return false;
		document.detailForm.action = "<c:url value='/function/webmvc/saymessage/retrieveEmployee.do'/>";
		document.detailForm.submit();
	}

	function fnSave() {
		document.detailForm.action = "<c:url value='/function/webmvc/saymessage/updateEmployee.do'/>";
		document.detailForm.submit();
	}

	function fnRetrieveDepartmentCodeList() {
		var ajax = new xui.ajax("<c:url value='/common/code/retrievedepartmentCodeList.do'/>");
		ajax.addQuery("codeGroup", document.detailForm.divisionCode.value);
		ajax.bind("departmentCode");
	}
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>SayMessage</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Presentation</a></span></li>
				<li class="Llast"><span>SayMessage</span></li>
			</ul>
		</div>

	</div>
	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			SayMessage는 DevOnFrame에서는 서버에서 설정한 비지니스 메시지가 요청화면 위에서 나타나도록
			하는 기능을 제공한다. <br>
			<br>
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonframe:component:online:taglibrary" target="_blank">SayMessage</a>
				</li>
			</ul>
			<br>
		</div>

		<form:form modelAttribute="employee" name="detailForm" id="detailForm"
			method="post" onsubmit="fnRetrieve();return false;">
			<input type="hidden" id="updateNum" name="updateNum"
				value="${employee.num}" />

			<div id="LblockSearch">
				<div>
					<div>
						<div>
							<table	summary="<spring:message code="sample.office.employee.empSearch"/>">
								<caption>
									<spring:message code="sample.office.employee.empSearch" />
								</caption>
								<colgroup>
									<col style="width: 20%;" />
									<col style="width: 80%;" />
								</colgroup>
								<tbody>
									<tr>
										<th><spring:message code="sample.office.employee.num" /></th>
										<td><input type="text" class="Ltext" name="searchNum" id=searchNum value="${param.searchNum}" /></td>
									</tr>
								</tbody>
							</table>
							<input type="image" class="Limage" src="<c:url value="/resource/images/btn_search.gif"/>"
							onclick="fnRetrieve();return false;" alt="search button" border="0" />

						</div>
					</div>
				</div>
			</div>

			<div id="LblockDetail01" class="LblockDetail">
				<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
					<caption>
						<spring:message code="sample.office.employee.detailInfo" />
					</caption>
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: 20%;" />
						<col style="width: 15%;" />
						<col style="width: 50%;" />
					</colgroup>
					<tbody>
						<tr>
							<th><spring:message code="sample.office.employee.num" /></th>
							<td><c:if test="${empty employee}">
									<input type="text" class="Ltext" id="num" name="num" />
								</c:if>
								<c:if test="${!empty employee}">
									<input type="hidden" class="Ltext" id="num" name="num" value="${employee.num}" /> ${employee.num}
                                </c:if>
                            </td>

							<th><spring:message code="sample.office.employee.joblevel" /></th>
							<td><form:select path="joblevelCode" id="joblevelCode">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value" />
								</form:select>
								<form:errors path="joblevelCode" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.name" /></th>
							<td><input type="text" class="Ltext" id="name" name="name"	value="${employee.name}" /></td>
							<th><spring:message code="sample.office.employee.department" /></th>
							<td>
							<form:select path="divisionCode" id="divisionCode" onchange="javascript:fnRetrieveDepartmentCodeList();return false;">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${divisionCodeList}" itemValue="code" itemLabel="value" />
								</form:select>
								<form:errors path="divisionCode" />
								<form:select path="departmentCode" id="departmentCode">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${departmentCodeList}" itemValue="code" itemLabel="value" />
								</form:select>
								<form:errors path="departmentCode" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.birthdate" /></th>
							<td><input type="text" class="Ltext" id="oBirthDate" name="birthdate" value="${employee.birthdate}" maxlength="8" /></td>
							<th><spring:message code="sample.office.employee.gender" /></th>
							<td>
								<input type="radio" id="sex" name="sex" value="M" <c:if test="${employee.sex eq 'M'}">checked="checked"</c:if> />남
								<input type="radio" id="sex" name="sex" value="F" <c:if test="${employee.sex eq 'F'}">checked="checked"</c:if> />여
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.ssn" /></th>
							<td><input type="text" class="Ltext" id="ssn" name="ssn" value="${employee.ssn}" maxlength="13" /></td>
							<th><label for="lTelephone">전화번호</label></th>
							<td><input type="text" class="Ltext" id="telephone"	name="telephone" value="${employee.telephone}" maxlength="11" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.postal" /></th>
							<td><input type="text" class="Ltext" id="postal" name="postal" value="${employee.postal}" maxlength="6" /></td>
							<th><spring:message code="sample.office.employee.skill" /></th>
							<td>
								<form:select path="skillCode" id="skillCode">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${skillCodeList}" itemValue="code"	itemLabel="value" />
								</form:select>
								<form:errors path="skillCode" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.address" /></th>
							<td colspan="3"><input type="text" class="Ltext" id="address" name="address" size="80" value="${employee.address}" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form:form>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnSave();return false;"><span>
		<spring:message	code="common.label.save" /></span></a>
	</div>
</div>