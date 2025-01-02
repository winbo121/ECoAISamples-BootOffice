<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeList.jsp
 * DESC : 웹패턴 3-1 목록조회
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

<script type="text/javaScript" language="javascript">
//<![CDATA[
function fnRetrieveList() {
	document.searchForm.action = "<c:url value='/pattern/p31/retrieveEmployeeList.do'/>";
	document.searchForm.submit();
}
function fnDetail(num) {
	document.searchForm.num.value = num;
   	document.searchForm.action = "<c:url value='/pattern/p31/retrieveEmployee.do'/>";
   	document.searchForm.submit();
}
function fnInsertForm() {
	document.searchForm.mode.value = "insert";
	document.searchForm.action = "<c:url value='/pattern/p31/retrieveEmployeeForm.do'/>";
	document.searchForm.submit();
}
//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>P3-1 List to Detail</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Web Pattern</a></span></li>
				<li><span><a href="#">P3 List Pattern</a></span></li>
				<li class="Llast"><span>P3-1 List to Detail</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
        <div id="LblockSearch">
            <div>
                <div>
                    <div>
						<form:form modelAttribute="input" name="searchForm" method="post" onsubmit="fnRetrieveList();return false;">
					    	<input type="hidden" id="mode" name="mode" />
					    	<input type="hidden" id="num" name="num" />
							<table summary="<spring:message code="sample.office.employee.empSearch"/>">
								<caption><spring:message code="sample.office.employee.empSearch"/></caption>
						        <colgroup>
						            <col style="width: 20%;" />
						            <col style="width: 30%;" />
						            <col style="width: 20%;" />
						            <col style="width: 30%;" />
						        </colgroup>
								<tbody>
									<tr>
										<th><spring:message code="sample.office.employee.skill"/></th>
										<td>
											<form:select path="skillCode" id="skillCode">
												<form:option value=""><spring:message code="common.label.defaultOption"/></form:option>
												<form:options items="${skillCodeList}" itemValue="code" itemLabel="value" />
											</form:select>
										</td>
										<th><spring:message code="sample.office.employee.joblevel"/></th>
										<td>
											<form:select path="joblevelCode" id="joblevelCode">
												<form:option value=""><spring:message code="common.label.defaultOption"/></form:option>
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

		<div id="LblockListTable01" class="LblockListTable">
			<div class="Lwrapper">
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
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr class="Lfirst">
								<td class="Lfirst"><a href="javascript:fnDetail('<c:out value="${result.num}"/>')"><c:out value="${result.num}" /></a></td>
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
		</div>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnInsertForm();"><span><spring:message code='common.label.create'/></span></a>
	</div>

</div>