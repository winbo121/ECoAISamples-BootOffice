<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : 웹패턴 3-3 조회 / 수정 / 삭제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script>
//<![CDATA[
function fnRetrieveList() {
	if (fnValidate()) return false;
	document.listDetailForm.action = "<c:url value='/pattern/p33/retrieveEmployeeList.do'/>";
	document.listDetailForm.submit();
}
function fnValidate() {
	if ($("#skillCode").val() == "" && $("#joblevelCode").val() == "") {
		alert("<spring:message code="dev.warn.com.required1"/>");
		return true;
	}
	return false;
}
function fnDelete() {
	if (!fnValidateRequired(document.listDetailForm.num, "<spring:message code="dev.warn.com.delinfo"/>")) return false;

  	document.listDetailForm.action = "<c:url value="/pattern/p33/deleteEmployee.do"/>";
  	document.listDetailForm.target = "_self";
  	document.listDetailForm.submit();
}
function fnUpdate(value) {
	if (!fnValidateRequired(document.listDetailForm.num, "<spring:message code="dev.warn.com.updinfo"/>")) return false;
	
	var target = "popup";
    fnPopup(target);
  	document.listDetailForm.action = "<c:url value="/pattern/p33/updateEmployeeFormPopup.do"/>";
  	document.listDetailForm.target = target;
  	document.listDetailForm.submit();
}
function fnAdd() {
	var target = "popup";
	fnPopup(target);
  	document.listDetailForm.action = "<c:url value="/pattern/p33/insertEmployeeFormPopup.do"/>";
  	document.listDetailForm.target = target;
  	document.listDetailForm.submit();
}
function fnPopup(target) {
	window.open("", target, "width=790,height=310");
}
function fnDetail(num) {
	document.listDetailForm.num.value = num;
  	
  	var ajax = new xui.ajax("<c:url value='/pattern/p33/retrieveEmployee.do'/>");
  	ajax.addQuery("num",num);		
  	ajax.send();
}
function fnCallback() {
	innerHTMLToTable($('#targetTable'), data.input);
}
function innerHTMLToTable(target, data) {
	//table의 children인 tr들을 가져온다.
	var trArr = target.find("tr");
	var trSize = trArr.size();

	for (var inx=0; inx<trSize; inx++) {
		//tr의 children인 td들을 가져온다.
		var tdArr = trArr.eq(inx).find("td");
		for(var i=0; i<tdArr.size(); i++) {
			var tdId = tdArr[i].id;
			if (tdId != "") {
				//td에 id가 있을 때, map에서 id와 동일한 key의 value를 찾아 set한다.
				tdArr.eq(i).html(data[tdId]);
			}
		}
	};
	if ($("#sex").text() == "M") $("#sex").text("남");
    if ($("#sex").text() == "F") $("#sex").text("여");
};
//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>P3-3 List/Detail View to Edit</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Web Pattern</a></span></li>
				<li><span><a href="#">P3 List Pattern</a></span></li>
				<li class="Llast"><span>P3-3 List/Detail View to Edit</span></li>
			</ul>
		</div>

	</div>

	<div id="LblockBodyMain">
		<div id="LblockSearch">
			<div>
				<div>
					<div>
						<form:form modelAttribute="input" name="listDetailForm" id="listDetailForm" method="post" onsubmit="fnRetrieveList();return false;">
							<input type="hidden" id="num" name="num" />
							<table summary="<spring:message code="sample.office.employee.empSearch"/>">
								<caption><spring:message code="sample.office.employee.empSearch" /></caption>
								<tbody>
									<tr>
										<th><spring:message code="sample.office.employee.skill" /></th>
										<td>
											<form:select id="skillCode" path="skillCode">
												<form:option value=""><spring:message code="common.label.defaultOption" />											</form:option>
												<form:options items="${skillCodeList}" itemValue="code" itemLabel="value" />
											</form:select>
										</td>
										<th><spring:message code="sample.office.employee.joblevel" /></th>
										<td>
											<form:select id="joblevelCode" path="joblevelCode">
												<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
												<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value" />
											</form:select>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="image" class="Limage" src="<c:url value="/resource/images/btn_search.gif"/>" alt="search button" />
						</form:form>
					</div>
				</div>
			</div>
		</div>

		<div id="LblockPageSubtitle01" class="LblockPageSubtitle">
			<h2>	<spring:message code="sample.office.employee.empList" />	</h2>
		</div>

		<div id="LblockListTable01" class="LblockListTable">
			<table summary="<spring:message code="sample.office.employee.empList"/>">
				<caption><spring:message code="sample.office.employee.empList" /></caption>
				<thead>
					<tr>
						<th class="Lfirst"><spring:message code="sample.office.employee.num" /></th>
						<th><spring:message code="sample.office.employee.name" /></th>
						<th><spring:message code="sample.office.employee.joblevel" /></th>
						<th><spring:message code="sample.office.employee.skill" /></th>
						<th><spring:message code="sample.office.employee.telephone" /></th>
						<th class="Llast"><spring:message code="sample.office.employee.birthdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${resultList}" var="result" varStatus="i">
						<c:set var="index" value="${i.index}" />
						<tr style="cursor: pointer" onclick="fnDetail('${result.num}');">
							<td class="Lfirst">${result.num}</td>
							<td><c:out value="${result.name}" /></td>
							<td><c:out value="${result.joblevelCodeName}" /></td>
							<td><c:out value="${result.skillCodeName}" /></td>
							<td><Tag:phone><c:out value="${result.telephone}" /></Tag:phone></td>
							<td class="Llast"><Tag:mask mask="####-##-##"><c:out value="${result.birthdate}" /></Tag:mask></td>
						</tr>
					</c:forEach>
					<c:if test="${empty resultList && !empty input}">
						<tr id="empty" style="background-color: #FFFFFF">
							<td colspan="6"><spring:message code="dev.inf.com.nodata" /></td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>

		<div id="LblockPageSubtitle02" class="LblockPageSubtitle">
			<h2>	<spring:message code="sample.office.employee.detailInfo" /></h2>
		</div>

		<div id="LblockDetail01" class="LblockDetail">
			<table id="targetTable" summary="<spring:message code="sample.office.employee.detailInfo"/>">
				<caption><spring:message code="sample.office.employee.detailInfo" /></caption>
				<colgroup>
					<col style="width: 20%;" />
					<col style="width: 30%;" />
					<col style="width: 20%;" />
					<col style="width: 30%;" />
				</colgroup>
				<tbody>
					<tr>
						<th><spring:message code="sample.office.employee.num" /></th>
						<td id="num"></td>
						<th><spring:message code="sample.office.employee.joblevel" /></th>
						<td id="joblevelCodeName"></td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.name" /></th>
						<td id="name"></td>
						<th><spring:message code="sample.office.employee.department" /></th>
						<td id="departmentCodeName"></td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.birthdate" /></th>
						<td id="birthdate"></td>
						<th><spring:message code="sample.office.employee.gender" /></th>
						<td id="sex"></td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.ssn" /></th>
						<td id="ssn"></td>
						<th><spring:message code="sample.office.employee.telephone" /></th>
						<td id="telephone"></td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.postal" /></th>
						<td id="postal"></td>
						<th><spring:message code="sample.office.employee.skill" /></th>
						<td id="skillCodeName"></td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.address" /></th>
						<td id="address" colspan="3"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

    <div id="LblockButton">
        <a class="Lbtn" href="#" onclick="fnAdd();return false;"><span><spring:message code="common.label.create"/></span></a>
        <a class="Lbtn" href="#" onclick="fnUpdate();return false;"><span><spring:message code="common.label.update"/></span></a>
        <a class="Lbtn" href="#" onclick="fnDelete();return false;"><span><spring:message code="common.label.delete"/></span></a>
    </div>
</div>