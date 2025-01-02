<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeListDetail.jsp
 * DESC : 웹패턴 3-4 목록/상세 조회
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
function fnRetrieveList() {
	document.searchForm.updateNum.value = '';
	document.searchForm.mode.value = '';
	document.searchForm.action = "<c:url value="/pattern/p34/retrieveEmployeeList.do"/>";
	document.searchForm.submit();
}
function fnValidate() {
    if ($("#skillCode").val() == "" && $("#joblevelCode").val() == "") {
        alert("<spring:message code="dev.warn.com.required1"/>");
        return true;
    }
    return false;
}
function fnDelete() {
	if (!fnValidateRequired(document.detailForm.num, "<spring:message code='dev.warn.com.delinfo' />")) return false;
	document.detailForm.action = "<c:url value="/pattern/p34/deleteEmployee.do"/>";
	document.detailForm.submit();
}
function fnAdd() {
	$("#mode").val("");
	
    $("#LblockDetail01").find("input,select").each(function() {
        $(this).val("");        
       
        $(this).attr("checked", false);
        $(this).attr("readonly", false);
    });
    $("#sexM").val("M");
    $("#sexF").val("F");
}
function fnDetail(num) {	
	var ajax = new xui.ajax("<c:url value='/pattern/p34/retrieveEmployeeDetail.do'/>");
	ajax.addQuery("num",num);		
	ajax.send();
}
function fnCallback() {
	document.searchForm.mode.value =data.mode; 
	
	document.detailForm.num.value =data.result.num; 
	document.detailForm.name.value =data.result.name; 
	document.detailForm.birthdate.value =data.result.birthdate; 
	document.detailForm.ssn.value =data.result.ssn; 
	document.detailForm.postal.value =data.result.postal; 
	document.detailForm.address.value =data.result.address; 
	document.detailForm.telephone.value =data.result.telephone;
	document.detailForm.divisionCode.value =data.result.divisionCode;
	document.detailForm.joblevelCode.value =data.result.joblevelCode; 
	document.detailForm.skillCode.value =data.result.skillCode; 
	
	fnRetrieveDepartmentBind(data.result.departmentCode, data.departmentCodeList);
	
  	var sex = data.result.sex;
	
	if (sex == "M") $("#sexM").attr("checked", true);
    if (sex == "F") $("#sexF").attr("checked", true);
}
function fnRetrieveDepartmentBind(departmentCode, departmentCodeList) {
	$("#departmentCode").empty().append("<option value=''>" +"선택하세요" + "</option>" );
	for(inx = 0; inx < departmentCodeList.length; inx++)
	{
		$("#departmentCode").append("<option value='"+ departmentCodeList[inx].code+ "'>" +departmentCodeList[inx].value + "</option>" );
	}
	$("#departmentCode").val(departmentCode);
}
function fnSave() {
	var num = document.detailForm.num;
    var mode = document.searchForm.mode.value;

	if (!fnValidateRequired(num,"<spring:message code="dev.err.com.noSearchNum"/>")) return false;

    var url = "<c:url value="/pattern/p34/insertEmployee.do"/>";
    if (mode == "update") {
        url = "<c:url value="/pattern/p34/updateEmployee.do"/>";
    }

	document.detailForm.action = url;
	document.detailForm.submit();
}

function fnRetrieveDepartmentCodeList() {	
	var ajax = new xui.ajax("<c:url value='/common/code/retrievedepartmentCodeList.do'/>");
	ajax.addQuery("codeGroup",document.detailForm.divisionCode.value);
	ajax.bind("departmentCode");
}
//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>P3-4 List/Detail Edit</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Web Pattern</a></span></li>
				<li><span><a href="#">P3 List Pattern</a></span></li>
				<li class="Llast"><span>P3-4 List/Detail Edit</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
		<div id="LblockSearch">
			<div>
				<div>
					<div>
						<form:form modelAttribute="input" name="searchForm" id="searchForm" method="post" onsubmit="fnRetrieveList();return false;">
							<input type="hidden" id="updateNum" name="updateNum" value="${input.num}"/>
							<input type="hidden" id="mode" name="mode" value="${param.mode}"/>
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
			<form:form modelAttribute="result" name="detailForm" method="post">
				<input type="hidden" name="searchSkillCode" value="${input.skillCode}"/>
				<input type="hidden" name="searchJoblevelCode" value="${input.joblevelCode}"/>
				<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
					<caption><spring:message code="sample.office.employee.detailInfo" /></caption>
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
								<form:input path="num" id="num" cssClass="Ltext" maxlength="10" readonly="true" />
							</td>
							<th><spring:message code="sample.office.employee.joblevel" /></th>
							<td>
								<form:select path="joblevelCode" id="joblevelCode">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value" />
								</form:select><br />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.name" /></th>
							<td><form:input path="name" id="name" cssClass="Ltext" /></td>
							<th><spring:message code="sample.office.employee.department" /></th>
							<td>
								<form:select path="divisionCode" id="divisionCode" onchange="javascript:fnRetrieveDepartmentCodeList();return false;">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${divisionCodeList}" itemValue="code" itemLabel="value" />
								</form:select>
								<form:select	path="departmentCode" id="departmentCode">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${departmentCodeList}" itemValue="code" itemLabel="value" />
								</form:select><br />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.birthdate" /></th>
							<td><form:input path="birthdate" id="birthdate" cssClass="Ltext" size="8" maxlength="8"/><a href="#" onclick="dui.Calendar.open('birthdate'); return false;"><img class="Lbtn" src="<c:url value="/resource/images/btn_icon_calendar.gif"/>" alt="날짜" /></a></td>
							<th><spring:message code="sample.office.employee.gender" /></th>
							<td>
								<form:radiobutton path="sex" id="sexM" value="M" label="남" cssClass="Lradio" />
								<form:radiobutton path="sex" id="sexF" value="F" label="여" cssClass="Lradio" />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.ssn" /></th>
							<td><form:input path="ssn" id="ssn" cssClass="Ltext" maxlength="13"/></td>
							<th><spring:message code="sample.office.employee.telephone" /></th>
							<td><form:input path="telephone" id="telephone" cssClass="Ltext" maxlength="11"/></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.postal" /></th>
							<td><form:input path="postal" id="postal" cssClass="Ltext" /></td>
							<th><spring:message code="sample.office.employee.skill" /></th>
							<td>
								<form:select path="skillCode" id="skillCode">
									<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
									<form:options items="${skillCodeList}" itemValue="code" 	itemLabel="value" />
								</form:select><br /> 
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.address" /></th>
							<td colspan="3"><form:input path="address" id="address" cssClass="Ltext" size="80" maxlength="80" /></td>
						</tr>
					</tbody>
				</table>
			</form:form>
		</div>
	</div>

	<div id="LblockButton">
        <a class="Lbtn" href="#" onclick="fnAdd();return false;"><span><spring:message code="common.label.create"/></span></a>
        <a class="Lbtn" href="#" onclick="fnSave();return false;"><span><spring:message code="common.label.save"/></span></a>
        <a class="Lbtn" href="#" onclick="fnDelete();return false;"><span><spring:message code="common.label.delete"/></span></a>
	</div>

</div>