<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : Exception 예제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script>
function fnDelete() {
	document.detailForm.action = "<c:url value='/function/exception/deleteException.do'/>";
	document.detailForm.submit();
}

function fnUpdate() {
	document.detailForm.action = "<c:url value='/function/exception/updateException.do'/>";
	document.detailForm.submit();
}

function fnInsert() {
	document.detailForm.action = "<c:url value='/function/exception/insertException.do'/>";
	document.detailForm.submit();
}

function fnReset() {
	document.detailForm.action = "<c:url value='/function/exception/employeeForm.do'/>";
	document.detailForm.submit();
}

function fnBusinessExceptionTest() {
	var ajax = new xui.ajax("<c:url value='/function/exception/retrievedepartmentCodeList.do'/>");
	ajax.addQuery("codeGroup",document.detailForm.divisionCodeBusiness.value);
	ajax.addQuery("type","business");
	ajax.bind("departmentCodeBusiness");
}

function fnSystemExceptionTest() {
	var ajax = new xui.ajax("<c:url value='/function/exception/retrievedepartmentCodeList.do'/>");
	ajax.addQuery("codeGroup",document.detailForm.divisionCodeSystem.value);
	ajax.addQuery("type","system");
	ajax.send("fnCallbackSystemException()");
}

function fnCallbackSystemException() {
	$("#divisionCodeSystem").empty().append("<option value=''>" +"선택하세요" + "</option>" );
	for(var inx = 0; inx < data.resultList.length; inx++)
	{
		$("#divisionCodeSystem").append("<option value='"+ data.resultList[inx].code+ "'>" +data.resultList[inx].value + "</option>" );
	}
}

function fnEtcTest(code) {

	var ajax;

	if (code == '404') {
		ajax = new xui.ajax("<c:url value='/function/exception/noMappingUrl.do'/>");
	} else if (code == '500') {
		ajax = new xui.ajax("<c:url value='/function/exception/retrievedepartmentCodeList.do'/>");
		ajax.addQuery("type","system");
	} else if (code == 'parse') {
		ajax = new xui.ajax("<c:url value=''/>");
	} else if (code == 'timeout') {
		ajax = new xui.ajax("http://localhost:10007/context/");
	}

	ajax.send();
}

function fnCallback() {
}
</script>

<div id="LblockBody">
<div id="LblockPageHeader">
<div id="LblockPageTitle">
	 <h1>Exception</h1>
</div>

<div id="LblockPageLocation">
	<ul>
		<li class="Lfirst"><span><a href="#">HOME</a></span></li>
		<li><span><a href="#">Function</a></span></li>
		<li><span><a href="#">Foundation</a></span></li>
		<li class="Llast"><span>Exception</span></li>
    </ul>
</div>

</div>
<div id="LblockBodyMain">
<div id="LblockContent01" class="LblockContent">
	Exception은 ExceptionResolver를 사용하여 Ajax Exception과 Exception을 분리하여 처리합니다.<br /><br />
	<ul>
		<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:exceptionresolver" target="_blank">exception</a> </li>
		<br>
		<li> 설정 </li>
		- yml 설정 : /resources/application.yml(Prefix: devon.resolver.exception)<br/>
	</ul>
	<br />
</div>
<form:form modelAttribute="employee" name="detailForm" id="detailForm" method="post">

<div id="LblockPageSubtitle01" class="LblockPageSubtitle">
	<h2>Exception 처리</h2>
</div>
<div id="LblockDetail01" class="LblockDetail">
	<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
		<caption><spring:message code="sample.office.employee.detailInfo"/></caption>
		<tbody>
			<tr>
				<th>사원명</label></th>
				<td><input id="dEmpNm" name="dEmpNm" type="text" class="Ltext" value="임꺽정" /></td>
				<th><spring:message code="sample.office.employee.skill"/></th>
				<td>
					<input type="radio" class="Lradio" id="dEmpSkillLevel1" name="dEmpSkillLevel" /><label for="dEmpSkillLevel1">초급</label>
					<input type="radio" class="Lradio" id="dEmpSkillLevel2" name="dEmpSkillLevel" checked="checked" /><label for="dEmpSkillLevel2">중급</label>
					<input type="radio" class="Lradio" id="dEmpSkillLevel3" name="dEmpSkillLevel" /><label for="dEmpSkillLevel3">고급</label>
				</td>
			</tr>
			<tr>
				<th><spring:message code="sample.office.employee.address"/></th>
				<td>서울특별시 마포구 상암동 IT센터 22층</td>
				<th>기타사항</th>
				<td><textarea rows="3" cols="40"></textarea></td>
			</tr>
		</tbody>
	</table>

</div>

<div id="LblockSubbutton01" class="LblockSubbutton">
	<a class="Lbtn2" href="#"><span onclick="fnUpdate();">수정(SystemException)</span></a>
	<a class="Lbtn2" href="#"><span onclick="fnDelete();">삭제(BusinessException)</span></a>
	<a class="Lbtn2" href="#"><span onclick="fnInsert();">등록(etc)</span></a>
</div>

<div id="LblockPageSubtitle01" class="LblockPageSubtitle">
	<h2>Ajax Exception 처리</h2>
</div>

<div id="LblockDetail01" class="LblockDetail">
	<table summary="Ajax Exception 처리">
		<caption>Ajax Exception 처리</caption>
		<tbody>
			<tr>
				<th>Business Exception</th>
				<td>
					<form:select path="divisionCode" id="divisionCodeBusiness" onchange="javascript:fnBusinessExceptionTest();return false;">
					<form:option value=""><spring:message code="common.label.defaultOption"/></form:option>
					<form:options items="${divisionCodeList}" itemValue="code" itemLabel="value" />
					</form:select>
					<form:select path="departmentCode" id="departmentCodeBusiness" >
					<form:option value=""><spring:message code="common.label.defaultOption"/></form:option>
					<form:options items="${departmentCodeList}" itemValue="code" itemLabel="value" />
					</form:select>
               </td>
			</tr>
			<tr>
				<th>System Exception</th>
				<td>
					<form:select path="divisionCode" id="divisionCodeSystem" onchange="javascript:fnSystemExceptionTest();return false;">
					<form:option value=""><spring:message code="common.label.defaultOption"/></form:option>
					<form:options items="${divisionCodeList}" itemValue="code" itemLabel="value" />
					</form:select>
					<form:select path="departmentCode" id="departmentCodeSystem" >
					<form:option value=""><spring:message code="common.label.defaultOption"/></form:option>
					<form:options items="${departmentCodeList}" itemValue="code" itemLabel="value" />
					</form:select>
               </td>
			</tr>
			<tr>
				<th>etc Exception</th>
				<td>
	 				<a class="Lbtn" href="#" onclick="fnEtcTest('404');return false;"><span>404</span></a> &nbsp;
 					<a class="Lbtn" href="#" onclick="fnEtcTest('500');return false;"><span>500</span></a> &nbsp;
 					<a class="Lbtn" href="#" onclick="fnEtcTest('parse');return false;"><span>parse Error</span></a> &nbsp;
 					<a class="Lbtn" href="#" onclick="fnEtcTest('timeout');return false;"><span>timeout</span></a>
               </td>
			</tr>
		</tbody>
	</table>
</div>

</form:form>
</div>

    <div id="LblockButton">
        <a class="Lbtn" href="#" onclick="fnReset();return false;"><span>초기화</span></a>
    </div>
</div>