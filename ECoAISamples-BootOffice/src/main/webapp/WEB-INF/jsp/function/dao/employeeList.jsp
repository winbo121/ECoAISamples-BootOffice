<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeList.jsp
 * DESC : Custom Dao 예제
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

<script type="text/javascript" language="javascript">
	function fnRetrieve() {
		if (fnValidate())
			return false;
		document.listForm.action = "<c:url value="/function/dao/retrieveEmployeeList.do"/>";
		document.listForm.submit();
	}

	function fnUpdate(num) {
		document.listForm.num.value = num;
		document.listForm.mode.value = "update";
		document.listForm.action = "<c:url value="/function/dao/retrieveEmployeeForm.do"/>";
		document.listForm.submit();
	}

	function fnAdd() {
		document.listForm.mode.value = "insert";
		document.listForm.action = "<c:url value="/function/dao/retrieveEmployeeForm.do"/>";
		document.listForm.submit();
	}
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Custom Dao</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Persistence</a></span></li>
				<li class="Llast"><span>Custom DAO</span></li>
			</ul>
		</div>

	</div>

	<div id="LblockBodyMain">

	<div id="LblockContent01" class="LblockContent">

		데이터를 조회, 입력, 수정하는 과정을 거쳐 persistence layer에 대한 이해를 높인다. <br><br>
		<ul>
			<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:dataaccess" target="_blank">dataaccess</a> </li>
			<br>
			<li> 설정 </li>
			- yml 설정 : /resources/application.yml(Prefix: devon.mybatis)<br/>
		</ul>
		<br>
	</div>
		<form:form modelAttribute="input" name="listForm" id="listForm"
			method="post">
			<input type="hidden" id="mode" name="mode" />
			<input type="hidden" id="num" name="num" />
			<div id="LblockSearch">
				<div>
					<div>
						<div>
							<table summary="<spring:message code="sample.office.employee.empSearch"/>">
								<caption>
									<spring:message code="sample.office.employee.empSearch" />
								</caption>
								<tbody>
									<tr>
										<th width="65">
											<label for="lSkillCode"><spring:message	code="sample.office.employee.skill" /></label>
										</th>
										<td><form:select id="skillCode" path="skillCode">
												<form:option value="">
													<spring:message code="common.label.defaultOption" />
												</form:option>
												<form:options items="${skillCodeList}" itemValue="code"	itemLabel="value" />
											</form:select>
										</td>
										<th width="65"><label for="lJoblevelCode">직급</label></th>
										<td>
											<form:select id="joblevelCode" path="joblevelCode">
												<form:option value="">
													<spring:message code="common.label.defaultOption" />
												</form:option>
												<form:options items="${joblevelCodeList}" itemValue="code"	itemLabel="value" />
											</form:select>
										</td>
										<th class="LsearchTh"><input type="image" class="Limage" onclick="fnRetrieve();return false;"
											src="<c:url value="/resource/images/btn_search.gif"/>"	alt="search button" border="0" /></th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div id="LblockListTable01" class="LblockListTable">
				<div class="Lwrapper">
					<table summary="사원 리스트">
						<caption>사원 리스트</caption>
						<thead>
							<tr>
								<th><spring:message code="sample.office.employee.num" /></th>
								<th><spring:message code="sample.office.employee.name" /></th>
								<th><spring:message code="sample.office.employee.joblevel" /></th>
								<th><spring:message code="sample.office.employee.skill" /></th>
								<th><spring:message code="sample.office.employee.telephone" /></th>
								<th><spring:message code="sample.office.employee.birthdate" /></th>
							</tr>
						</thead>
						<tbody id="oEmployeeArea">
							<c:forEach items="${resultList}" var="result" varStatus="i">
								<c:set var="index" value="${i.index}" />
								<tr class="Lfirst" style="cursor: pointer"	onclick="fnUpdate('<c:out value="${result.num}"/>');">
									<td class="Lfirst">${result.num}</td>
									<td><c:out value="${result.name}" /></td>
									<td><c:out value="${result.joblevelCodeName}" /></td>
									<td><c:out value="${result.skillCodeName}" /></td>
									<td><Tag:phone>
											<c:out value="${result.telephone}" />
										</Tag:phone></td>
									<td class="Llast">
										<Tag:mask mask="####-##-##">
											<c:out value="${result.birthdate}" />
										</Tag:mask>
									</td>
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

		</form:form>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnAdd();return false">
			<span><spring:message code="common.label.create" /></span>
		</a>
	</div>

</div>