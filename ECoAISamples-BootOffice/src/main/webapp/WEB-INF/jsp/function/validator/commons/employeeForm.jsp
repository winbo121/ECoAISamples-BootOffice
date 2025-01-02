<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : Commons Validator  예제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<script type="text/javascript"	src="<c:url value="/function/validator/commons/validator.do"/>"></script>

<validator:javascript formName="employee" staticJavascript="false" xhtml="true" cdata="false" />

<script>
	function fnInsert() {
		document.detailForm.action = "<c:url value='/function/validator/commons/insertEmployee.do'/>";
		document.detailForm.submit();
	}

	function fnInsertClient() {
		if (!validateEmployee(document.detailForm)) {
			return;
		} else {
			document.detailForm.submit();
			document.detailForm.action = "<c:url value='/function/validator/commons/insertEmployee.do'/>";
		}
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
			<h1>Commons Validator</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Support</a></span></li>
				<li class="Llast"><span>Comnmons Validator</span></li>
			</ul>
		</div>

	</div>
	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			Apache Commons Validator 를 사용하여 Server-Side의 Validation을 수행한다. <br><br>
			입력폼에 값을 넣지 않고 "등록" 버튼을 누르면 Validation을 수행한 후 메시지가 출력된다. <br>
			버튼에 따라 Server-Side와 Client-Side를 테스트 할 수 있다.<br>
			Validation의 설정은"resource/validator/validator-*.xml" 파일을 참고한다. <br>
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
							<td><form:input path="num" id="num" cssClass="Ltext" />
								<form:errors path="num" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.joblevel" /></th>
							<td>
								<form:select path="joblevelCode" id="joblevelCode">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value" />
								</form:select> &nbsp; &nbsp;
								<form:errors path="joblevelCode" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.name" /></th>
							<td>
								<form:input path="name" id="name" cssClass="Ltext" />&nbsp;&nbsp;
								<form:errors path="name" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.department" /></th>
							<td>
								<form:select path="divisionCode" id="divisionCode" onchange="javascript:fnRetrieveDepartmentCodeList();return false;">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${divisionCodeList}" itemValue="code" itemLabel="value" />
								</form:select> &nbsp; &nbsp;
								<form:errors path="divisionCode" />
								<form:select path="departmentCode" id="departmentCode">
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
							<td>
								<form:select path="skillCode" id="skillCode">
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
								<form:input path="birthdate" id="birthdate"	cssClass="Ltext" maxlength="8" />&nbsp; &nbsp;
								<form:errors path="birthdate" />
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
								<form:input path="ssn" id="ssn" cssClass="Ltext" maxlength="13" />&nbsp; &nbsp;
								<form:errors path="ssn" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.telephone" /></th>
							<td>
								<form:input path="telephone" id="telephone"	cssClass="Ltext" maxlength="11" />&nbsp; &nbsp;
								<form:errors path="telephone" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.postal" /></th>
							<td>
								<form:input path="postal" id="postal" cssClass="Ltext" maxlength="6" />&nbsp; &nbsp;
								<form:errors path="postal" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.address" /></th>
							<td colspan="3">
								<form:input path="address" id="address"	cssClass="Ltext" size="80" />&nbsp; &nbsp;
								<form:errors path="address" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form:form>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnInsert();return false;"><span>등록(Server-Side)</span></a>
		<a class="Lbtn" href="#" onclick="fnInsertClient();return false;"><span>등록(Client-Side)</span></a>
	</div>
</div>