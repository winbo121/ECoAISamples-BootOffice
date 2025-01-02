<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeFormPopup.jsp
 * DESC : 웹패턴 4-1 입력 / 수정 팝업
 * VER  : v1.0
 * Copyright 2012 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>


<script type="text/javaScript" language="javascript">
//<![CDATA[
$("document").ready(function() {
    fnComplete();
})
function fnUpdate() {
	document.detailForm.action = "<c:url value="/pattern/p41/updateEmployee.do"/>";
	document.detailForm.submit();    
}
function fnComplete() {
    if (document.detailForm.mode.value == "complete") {
        $(opener.location).attr("href", "javascript:fnRetrieve()");
        setTimeout("window.close()", 50);
    }
}
function fnCancel() {
    window.close();
}
function fnRetrievedepartmentCodeList() {
	var ajax = new xui.ajax("<c:url value='/common/code/retrievedepartmentCodeList.do'/>");
	ajax.addQuery("codeGroup",document.detailForm.divisionCode.value);
	ajax.bind("departmentCode");
}
//]]>
</script>

<div id="LblockPopupMain">

	<div id="LblockPageTitle">
		<h1><spring:message code="sample.office.employee.detailInfo" /></h1>
	</div>

	<div id="LblockMainBody">
		<div id="LblockDetail01" class="LblockDetail">
			<div>
				<div>
					<form:form modelAttribute="result" name="detailForm" id="detailForm" method="post">
						<input type="hidden" id="mode" name="mode" value="${mode}"/>
						<table summary="<spring:message code="sample.office.employee.empSearch"/>">
							<caption><spring:message code="sample.office.employee.empSearch"/></caption>
							<tbody>
								<tr>
									<th><spring:message code="sample.office.employee.num"/></th>
									<td><input type="text" class="Ltext" id="num" name="num" size="10" value="${result.num}" /></td>
									<th><spring:message code="sample.office.employee.joblevel" /></th>
					                <td>
					                <form:select id="joblevelCode"  path="joblevelCode">
											<form:option value =""><spring:message code="common.label.defaultOption"/></form:option>
											<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value"/>
									</form:select>
					                </td>
								<tr>
									<th><spring:message code="sample.office.employee.name"/></th>
									<td><input type="text" class="Ltext" id="name" name="name" size="10" value="${result.name}" /></td>
									<th><spring:message code="sample.office.employee.department" /></th>
									<td>
									<form:select id="divisionCode"  path="divisionCode" onchange="javascript:fnRetrieveDepartmentCodeList();return false;">
											<form:option value =""><spring:message code="common.label.defaultOption"/></form:option>
											<form:options items="${divisionCodeList}" itemValue="code" itemLabel="value"/>
									</form:select>
					                <form:select id="departmentCode"  path="departmentCode">
											<form:option value =""><spring:message code="common.label.defaultOption"/></form:option>
											<form:options items="${departmentCodeList}" itemValue="code" itemLabel="value"/>
										    </form:select>
									</td>
								</tr>
							</tbody>
						</table>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#"><span onclick="fnCancel();return false;"><spring:message code="common.label.cancel"/></span></a>
		<a class="Lbtn" href="#"><span onclick="fnUpdate();return false;"><spring:message code="common.label.save"/></span></a>
	</div>
</div>