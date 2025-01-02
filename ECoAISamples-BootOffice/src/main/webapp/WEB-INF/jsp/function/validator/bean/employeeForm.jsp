<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : Bean Validator  예제
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
	function fnInsert() {
		document.detailForm.action = "<c:url value='/function/validator/bean/insertEmployee.do'/>";
		document.detailForm.submit();
	}

	function fnInsertAnnotation() {
		document.detailForm.action = "<c:url value='/function/validator/bean/insertEmployeeAnnotation.do'/>";
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
			<h1>Bean Validator</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Support</a></span></li>
				<li class="Llast"><span>Bean Validator</span></li>
			</ul>
		</div>

	</div>
	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			Bean Validator는 Hibernate Validator 를 사용하여 Server-Side의 Validation을	수행한다. <br><br>
			입력폼에 값을 넣지 않고 "등록" 버튼을 누르면 Validation을 수행한 후 메시지가 출력된다. <br>
			Validation의 설정은	"devonframe.sample.uipattern.function.validator.bean.mode.Employee" 클래스를 참고<br>
			<br>
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:validation" target="_blank">validation</a></li><br>
			</ul>
			<br>
		</div>

		<form:form modelAttribute="employee" name="detailForm" id="detailForm"	method="post">
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
							<td><form:input path="num" cssClass="Ltext" />&nbsp;&nbsp;
								<form:errors path="num" delimiter=" " />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.joblevel" /></th>
							<td><form:select path="joblevelCode">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value" />
								</form:select> &nbsp; &nbsp;<form:errors path="joblevelCode" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.name" /></th>
							<td><form:input path="name" cssClass="Ltext" />&nbsp;&nbsp;
							<form:errors path="name" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.department" /></th>
							<td>
								<form:select path="divisionCode" onchange="javascript:fnRetrieveDepartmentCodeList();return false;">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${divisionCodeList}" itemValue="code" itemLabel="value" />
								</form:select> &nbsp; &nbsp;
								<form:errors path="divisionCode" />
								<form:select path="departmentCode" >
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${departmentCodeList}" itemValue="code" itemLabel="value" />
								</form:select> &nbsp; &nbsp;
								<form:errors path="departmentCode" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.skill" /></th>
							<td><form:select path="skillCode">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${skillCodeList}" itemValue="code"	itemLabel="value" />
								</form:select> &nbsp; &nbsp;
								<form:errors path="skillCode" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.birthdate" /></th>
							<td>
								<form:input path="birthdate" cssClass="Ltext" maxlength="8" />&nbsp; &nbsp;
								<form:errors path="birthdate" delimiter=" " />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.gender" /></th>
							<td>
								<form:radiobutton path="sex" value="M" label="남" cssClass="Lradio" />
								<form:radiobutton path="sex" value="F" label="여" cssClass="Lradio" /> &nbsp; &nbsp;
								<form:errors path="sex" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.ssn" /></th>
							<td>
								<form:input path="ssn" cssClass="Ltext" maxlength="13" />&nbsp; &nbsp;
								<form:errors path="ssn" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.telephone" /></th>
							<td>
								<form:input path="telephone"	cssClass="Ltext" maxlength="11" />&nbsp; &nbsp;
								<form:errors path="telephone" delimiter=" " />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.postal" /></th>
							<td>
								<form:input path="postal" cssClass="Ltext" maxlength="6" />&nbsp; &nbsp;
								<form:errors path="postal" delimiter=" " />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.address" /></th>
							<td colspan="3">
								<form:input path="address" cssClass="Ltext" size="80" />&nbsp; &nbsp;
								<form:errors path="address" />
								</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form:form>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnInsert();return false;"><span>등록</span></a>
		<a class="Lbtn" href="#" onclick="fnInsertAnnotation();return false;"><span>등록(@Valid)</span></a>
	</div>
</div>