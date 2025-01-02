<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : 트랜잭션 예제
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
		document.detailForm.action = "<c:url value='/function/transaction/retrieveEmployee.do'/>";
		document.detailForm.submit();
	}

	function fnSaveXml() {

		if (!fnValidateRequired(document.detailForm.num, "<spring:message code="dev.warn.com.required3"/>"))
			return false;

		var url = "<c:url value='/function/transaction/updateEmployeeXml.do'/>";

		document.detailForm.action = url;
		document.detailForm.submit();
	}

	function fnSaveAnnotation() {

		if (!fnValidateRequired(document.detailForm.num, "<spring:message code="dev.warn.com.required3"/>"))
			return false;

		var url = "<c:url value='/function/transaction/updateEmployeeAnnotation.do'/>";

		document.detailForm.action = url;
		document.detailForm.submit();
	}

	function fnSaveXmlRollbackCase() {

		if (!fnValidateRequired(document.detailForm.num, "<spring:message code="dev.warn.com.required3"/>"))
			return false;

		var url = "<c:url value='/function/transaction/updateEmployeeXmlRollbackCase.do'/>";

		document.detailForm.action = url;
		document.detailForm.submit();
	}

	function fnSaveAnnotationRollbackCase() {

		if (!fnValidateRequired(document.detailForm.num, "<spring:message code="dev.warn.com.required3"/>"))
			return false;

		var url = "<c:url value='/function/transaction/updateEmployeeAnnotationRollbackCase.do'/>";

		document.detailForm.action = url;
		document.detailForm.submit();
	}

	$(function() {
		//division combobox가 선택됐을 때 콤보박스 실행하기.
		$('#divisionCode').change(function() {

			$.ajax({
				url : "dynamicCombobox.do",
				data : {
					divisionCode : $('#divisionCode option:selected').val()
				},
				success : function(data) {
					dataToCombo($('#departmentCode'), data.result);
				}
			});
		});
	});

	function dataToCombo(target, data) {
		var optionArr = [];
		var inx = 0;
		target.empty();

		$(data).each(
				function() {
					optionArr[inx++] = "<option value=" + this.code + ">"
							+ this.value + "</option>";
				});
		target.append(optionArr);
	}

</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Transaction</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Foundation</a></span></li>
				<li class="Llast"><span>Transaction</span></li>
			</ul>
		</div>

	</div>
	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			Transaction 은 DB Access가 발생하는 여러 단위 작업들을 의미있는 그룹으로 묶어서 하나의 작업처럼 일괄
			commit하거나 일괄 rollback 하는 매커니즘을 제공.<br>
			<br>
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:transaction" target="_blank">transaction</a>
				</li>
				<br>
				<li>설정</li>
				- yml 설정 : /resources/application.yml(Prefix: devon.transaction.composite)
				<br>
				<br>
				<li>예제 설명</li>
					아래 예제는 사원의 정보를 조회하여 수정하는 업무이다.
					수정을 할 때 똑같은 업무를 transaction 설정방식(xml, annotation)에 따라 나눠 놓았다.
					(transaction 설정방법에 대한 자세한 설명은 위의 Wiki를 참조하도록 한다.)
					또한 처리 여부에 따라 정상처리 Case 와 Exception 발생 Case를 만들어 놓아 transaction 처리가 확실히 되는지 확인 할 수 있다.<br>
					<br>
					<b>- 정상처리 Case</b> : 신상정보 수정 후 저장을 누른 후 다시 조회해 보면 바뀐 결과값이 반영된 것을 확인할 수 있다.<br>
					<b>- Exception 발생 Case</b> : 신상정보 수정 후 저장을 누르면 임의로 발생시킨 Exception이 작동되어 결과가 rollback이 된다.
					따라서 에러 화면으로 이동하고 다시 값을 조회해 봐도 수정한 값이 반영이 되지 않은 것을 확인할 수 있다.
				<br>
				<br>
			</ul>
		</div>

		<form:form modelAttribute="employee" name="detailForm" id="detailForm"	method="post" onsubmit="fnRetrieve();return false;">
			<input type="hidden" id="updateNum" name="updateNum" value="${employee.num}" />
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
										<th><label for="num">사원번호 (입력 예-10001, 10002, ...)</label></th>
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
			<div id="LblockPageSubtitle01" class="LblockPageSubtitle">
				<h2>신상정보</h2>
			</div>
			<div id="LblockDetail01" class="LblockDetail">
				<table
					summary="<spring:message code="sample.office.employee.detailInfo"/>">
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
							<td>
								<c:if test="${empty employee.num}">
									<input type="text" class="Ltext" id="num" name="num" readonly="readonly"/>
								</c:if>
								<c:if test="${!empty employee.num}">
									<input type="hidden" class="Ltext" id="num" name="num" value="${employee.num}" readonly="readonly"/> ${employee.num}
                                </c:if>
                            </td>

							<th><spring:message code="sample.office.employee.joblevel" /></th>
							<td>
								<form:select path="joblevelCode" id="joblevelCode">
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
							<td><input type="text" class="Ltext" id="name" name="name" value="${employee.name}" /></td>
							<th><spring:message code="sample.office.employee.department" /></th>
							<td>
								<form:select path="divisionCode" id="divisionCode">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${divisionCodeList}" itemValue="code"
										itemLabel="value" />
								</form:select>
								<form:errors path="divisionCode" />

								<form:select path="departmentCode" id="departmentCode">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${departmentCodeList}" itemValue="code"
										itemLabel="value" />
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

		<b>정상 처리 후 commit Case </b>
		<a class="Lbtn" href="#" onclick="fnSaveXml();return false;"><span>xml 저장</span></a>
		<a class="Lbtn" href="#" onclick="fnSaveAnnotation();return false;"><span>@ 저장</span></a>

		<b> || exception 발생 후 rollback Case</b>
		<a class="Lbtn" href="#" onclick="fnSaveXmlRollbackCase();return false;"><span>xml 저장</span></a>
		<a class="Lbtn" href="#" onclick="fnSaveAnnotationRollbackCase();return false;"><span>@ 저장</span></a>
	</div>
</div>