<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeDetail.jsp
 * DESC : 웹패턴 4-1 조회
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript" language="javascript">
//<![CDATA[
function fnRetrieve() {
	document.detailForm.action = "<c:url value="/pattern/p41/retrieveEmployee.do"/>";
	document.detailForm.target = "_self";
	document.detailForm.submit();
}
function fnSave() {
	var url = "<c:url value="/pattern/p41/updateEmployeeDetail.do"/>";

	if ($("#detailNum").val() == "") {
		url = "<c:url value="/pattern/p41/insertEmployeeDetail.do"/>";
	}
	document.detailForm.action = url;
	document.detailForm.target = "_self";
	document.detailForm.submit();
}
function fnDelete() {
	document.detailForm.action = "<c:url value="/pattern/p41/deleteEmployeeDetail.do"/>";
    document.detailForm.target = "_self";
    document.detailForm.submit();
}
function fnUpdate(value) {
	var target = "popup";
	fnPopup(target);
    document.detailForm.action = "<c:url value="/pattern/p41/employeeFormPopup.do"/>";
    document.detailForm.target = target;
    document.detailForm.submit();
}
function fnPopup(target) {
	window.open("", target, "width=790,height=310");
}
//]]>    
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>P4-1 Master/Detail[1:1]</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Web Pattern</a></span></li>
				<li><span><a href="#">P4 Master/Detail Pattern</a></span></li>
				<li class="Llast"><span>P4-1 Master/Detail[1:1]</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
		<form:form modelAttribute="result" name="detailForm" method="post" onsubmit="fnRetrieve();return false;">
			<input type="hidden" id="detailNum" name="detailNum" value="${resultDetail.num}" />
			<div id="LblockSearch">
				<div>
					<div>
						<div>
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
								<input type="image" class="Limage" src="<c:url value="/resource/images/btn_search.gif"/>" alt="search button" />
						</div>
					</div>
				</div>
			</div>

			<div id="LblockPageSubtitle01" class="LblockPageSubtitle">
				<h2><spring:message code="sample.office.employee.basicInfo"/></h2>
			</div>

			<div id="LblockDetail01" class="LblockDetail">
				<table summary="<spring:message code="sample.office.employee.basicInfo"/>">
					<caption><spring:message code="sample.office.employee.basicInfo"/></caption>
					<tbody>
						<tr>
							<th><spring:message code="sample.office.employee.num"/></th>
							<td><input id="num" name="num" type="text" class="Ltext" value="${result.num}" /></td>
							<th><spring:message code="sample.office.employee.joblevel"/></th>
							<td><input id="joblevelCodeName" name="joblevelCodeName" type="text" class="Ltext" value="${result.joblevelCodeName}" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.name"/></th>
							<td><input id="name" name="name" type="text" class="Ltext" value="${result.name}" /></td>
							<th><spring:message code="sample.office.employee.department"/></th>
							<td><input id="departmentCodeName" name="departmentCodeName" type="text" class="Ltext" value="${result.departmentCodeName}" /></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div id="LblockSubbutton01" class="LblockSubbutton">
				<a class="Lbtn2" href="#"><span onclick="fnUpdate();"><spring:message code="common.label.update"/></span></a>
			</div>
	
			<div id="LblockPageSubtitle02" class="LblockPageSubtitle">
				<h2><spring:message code="sample.office.employee.detailInfo"/></h2>
			</div>
	
			<div id="LblockDetail02" class="LblockDetail">
				<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
					<caption><spring:message code="sample.office.employee.detailInfo"/></caption>
					<tbody>
						<tr>
							<th><spring:message code="sample.office.employee.nowjob"/></th>
							<td><input id="nowjob" name="nowjob" type="text" class="Ltext" value="${resultDetail.nowjob}" /></td>
							<th><spring:message code="sample.office.employee.title"/></th>
							<td><input id="title" name="title" type="text" class="Ltext" value="${resultDetail.title}" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.retirement"/></th>
							<td><input id="retirement" name="retirement" type="text" class="Ltext" value="${resultDetail.retirement}" /></td>
							<th><spring:message code="sample.office.employee.workingyear"/></th>
							<td><input id="workingyear" name="workingyear" type="text" class="Ltext" value="${resultDetail.workingyear}" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.firstdate"/></th>
							<td><input id="firstdate" name="firstdate" type="text" class="Ltext" value="${resultDetail.firstdate}" /></td>
							<th><spring:message code="sample.office.employee.workingdate"/></th>
							<td><input id="workingdate" name="workingdate" type="text" class="Ltext" value="${resultDetail.workingdate}" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.marriage"/></th>
							<td><input id="marriage" name="marriage" type="text" class="Ltext" value="${resultDetail.marriage}" /></td>
							<th><spring:message code="sample.office.employee.army"/></th>
							<td><input id="army" name="army" type="text" class="Ltext" value="${resultDetail.army}" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form:form>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#"><span onclick="fnSave();"><spring:message code="common.label.save"/></span></a>
		<a class="Lbtn" href="#"><span onclick="fnDelete();"><spring:message code="common.label.delete"/></span></a>
	</div>
	
</div>