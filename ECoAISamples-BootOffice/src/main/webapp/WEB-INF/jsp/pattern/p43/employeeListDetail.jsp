<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeListDetail.jsp
 * DESC : 웹패턴 4-3 목록/상세 조회
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

<script type="text/javascript" language="javascript">
//<![CDATA[
$("document").ready(function(event) {
		fnComplete();
	})
function fnComplete() {
	if ($("#updateNum").val() != null) {
		var num = $("#updateNum").val();
		var name = $("#updateName").val();
		$("#updateNum").val("");
		$("#updateName").val("");
		fnDetail(num, name);
	} 
}	
function fnRetrieve() {
	document.listDetailForm.action = "<c:url value="/pattern/p43/retrieveEmployeeList.do"/>";
	document.listDetailForm.submit();
}
function fnDetail(num, name) {
    $("result").val("");
    document.listDetailForm.num.value = num;
    document.listDetailForm.name.value = name;
    var ajax = new xui.ajax("<c:url value='/pattern/p43/retrieveEmployee.do'/>");
	ajax.addQuery("searchNum",num);
	ajax.send();
}
function fnCallback() {
	document.listDetailForm.mode.value =data.mode;
	document.listDetailForm.title.value =data.resultDetail.title;
	document.listDetailForm.nowjob.value =data.resultDetail.nowjob;
	document.listDetailForm.retirement.value =data.resultDetail.retirement;
	document.listDetailForm.workingyear.value =data.resultDetail.workingyear;
	document.listDetailForm.firstdate.value =data.resultDetail.firstdate;
	document.listDetailForm.workingdate.value =data.resultDetail.workingdate;
	document.listDetailForm.marriage.value =data.resultDetail.marriage;
	document.listDetailForm.army.value =data.resultDetail.army;
}
function fnSave() {
    var url = "<c:url value="/pattern/p43/updateEmployeeDetail.do"/>";

    if (document.listDetailForm.mode.value == "insert") {

        url = "<c:url value="/pattern/p43/insertEmployeeDetail.do"/>";
    }

	document.listDetailForm.action = url;
	document.listDetailForm.submit();
}
//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>P4-3 Master/Detail [n:1]</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Web Pattern</a></span></li>
				<li><span><a href="#">P4 Master/Detail Pattern</a></span></li>
				<li class="Llast"><span>P4-3 Master/Detail [n:1]</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
		<form:form modelAttribute="result" name="listDetailForm" id="listDetailForm" method="post" onsubmit="fnRetrieve();return false;">
			<input type="hidden" id="mode" name="mode" value="${param.mode}" />
			<input type="hidden" id="updateNum" name="updateNum" value="${param.updateNum}" />
			<input type="hidden" id="updateName" name="updateName" value="${param.updateName}" />
			<div id="LblockSearch">
				<div>
					<div>
						<div>
							<table summary="<spring:message code="sample.office.employee.empSearch"/>">
								<caption><spring:message code="sample.office.employee.empSearch" /></caption>
								<tbody>
									<tr>
										<th><spring:message code="sample.office.employee.skill" /></th>
										<td>
											<form:select id="skillCode" path="skillCode">
												<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
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
							<input type="image" class="Limage"  src="<c:url value='/resource/images/btn_search.gif'/>" alt="search button" />
						</div>
					</div>
				</div>
			</div>

			<div id="LblockPageSubtitle01" class="LblockPageSubtitle">
				<h2><spring:message code="sample.office.employee.empList" /></h2>
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
					<tbody id="employeeList">
						<c:forEach items="${resultList}" var="result" varStatus="i">
							<c:set var="index" value="${i.index}" />
							<tr style="cursor: pointer" onclick="fnDetail('${result.num}', '${result.name}');">
								<td class="Lfirst">${result.num}</td>
								<td>${result.name}</td>
								<td>${result.joblevelCodeName}</td>
								<td>${result.skillCodeName}</td>
								<td><Tag:phone>${result.telephone}</Tag:phone></td>
								<td class="Llast"><Tag:mask mask="####.##.##">${result.birthdate}</Tag:mask></td>
							</tr>
						</c:forEach>
						<c:if test="${empty resultList}">
							<tr id="empty" style="background-color: #FFFFFF">
								<td height="25" colspan="6"><spring:message code="dev.inf.com.nodata" /></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>

			<div id="LblockPageSubtitle02" class="LblockPageSubtitle">
				<h2><spring:message code="sample.office.employee.detailInfo" /></h2>
			</div>

			<div id="LblockDetail01" class="LblockDetail">
				<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
					<caption><spring:message code="sample.office.employee.detailInfo" /></caption>
					<tbody>
						<tr>
							<th><spring:message code="sample.office.employee.num" /></th>
							<td><input id="num" name="num" type="text" class="Ltext" readonly="readonly" /></td>
							<th><spring:message code="sample.office.employee.name" /></th>
							<td><input id="name" name="name" type="text" class="Ltext" readonly="readonly" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.nowjob" /></th>
							<td><input id="nowjob" name="nowjob" type="text" class="Ltext" /></td>
							<th><spring:message code="sample.office.employee.title" /></th>
							<td><input id="title" name="title" type="text" class="Ltext" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.retirement" /></th>
							<td><input id="retirement" name="retirement" type="text" class="Ltext" /></td>
							<th><spring:message
									code="sample.office.employee.workingyear" /></th>
							<td><input id="workingyear" name="workingyear" type="text" class="Ltext" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.firstdate" /></th>
							<td><input id="firstdate" name="firstdate" type="text" class="Ltext" /></td>
							<th><spring:message
									code="sample.office.employee.workingdate" /></th>
							<td><input id="workingdate" name="workingdate" type="text" class="Ltext" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.marriage" /></th>
							<td><input id="marriage" name="marriage" type="text" class="Ltext" /></td>
							<th><spring:message code="sample.office.employee.army" /></th>
							<td><input id="army" name="army" type="text" class="Ltext" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form:form>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#"><span onclick="fnSave();"><spring:message code="common.label.save" /></span></a>
	</div>

</div>
