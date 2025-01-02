<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : SavedToken 예제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script>
	function fnRetrieve() {
		if (!fnValidateRequired(document.detailForm.searchNum, "<spring:message code="dev.err.com.noSearchNum"/>"))
			return false;
		document.detailForm.action = "<c:url value='/function/webmvc/savedtoken/retrieveEmployee.do'/>";
		document.detailForm.submit();
	}

	function fnSave() {
		document.detailForm.action = "<c:url value='/function/webmvc/savedtoken/updateEmployee.do'/>";
		document.detailForm.submit();
	}

	function fnRetrieveDepartmentCodeList() {
		var ajax = new xui.ajax("<c:url value='/common/code/retrievedepartmentCodeList.do'/>");
		ajax.addQuery("codeGroup", document.detailForm.divisionCode.value);
		ajax.bind("departmentCode");
	}

<c:if test="${not empty resultMsg}" >
	alert("${resultMsg}");
</c:if>

</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Savedtoken</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Presentation</a></span></li>
				<li class="Llast"><span>SavedToken</span></li>
			</ul>
		</div>

	</div>
	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			SavedToken은 재전송 방지와 CSRF(Cross Site Request Forgery)를 방지를 위한 컴포넌트이다.
			<br>
			사원번호로 검색후 저장 버튼을 클릭하면 Controller에서 2초간 Sleep 한다. 2초가
			지나가기 전에 저장버튼을 한번 더 클릭하면 재전송 방지 오류메시지를 확인 할 수 있다.
			<br>
			<br>
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:savedtoken" target="_blank">savedtoken</a></li>
				<br>
				<li>설정</li> - yml 설정 : /resources/application.yml(Prefix: devon.interceptor.saved-token)
				<br>
			</ul>
			<br>
		</div>

		<form:form modelAttribute="employee" name="detailForm" id="detailForm"	method="post" onsubmit="fnRetrieve();return false;">
			<Tag:savedToken scope="request" />
			<input type="hidden" id="updateNum" name="updateNum" value="${employee.num}" />
			<div id="LblockSearch">
				<div>
					<div>
						<div>
							<table summary="사원 검색 조건">
								<caption>사원 검색조건</caption>
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
				<table summary="사원 상세정보">
					<caption>사원 상세정보</caption>
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
                                </c:if></td>
							<th><spring:message code="sample.office.employee.joblevel" /></th>
							<td><form:select path="joblevelCode" id="joblevelCode">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${joblevelCodeList}" itemValue="code"	itemLabel="value" />
								</form:select>
								<form:errors path="joblevelCode" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.name" /></th>
							<td><input type="text" class="Ltext" id="name" name="name"  value="${employee.name}" /></td>
							<th>부서</th>
							<td>
							<form:select path="divisionCode" id="divisionCode" onchange="javascript:fnRetrieveDepartmentCodeList();return false;">
									<form:option value="">
										<spring:message code="common.label.defaultOption" />
									</form:option>
									<form:options items="${divisionCodeList}" itemValue="code"	itemLabel="value" />
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
		<a class="Lbtn" href="#" onclick="fnSave();return false;">
			<span><spring:message	code="common.label.save" /></span>
		</a>
	</div>
</div>