<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeList.jsp
 * DESC : Excel 예제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javaScript" language="javascript">
	// <![CDATA[
	function fnRetrieveList() {
		document.listForm.action = "<c:url value='/function/excel/retrieveEmployeeList.do'/>";
		document.listForm.submit();
	}

	function fnDownload() {
		document.listForm.action = "<c:url value='/function/excel/downloadEmployeeList.do'/>";
		document.listForm.submit();
	}

	function fnUpload() {
		document.uploadForm.action = "<c:url value='/function/excel/uploadEmployeeList.do'/>";
		document.uploadForm.submit();
	}

	// ]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Excel</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Support</a></span></li>
				<li class="Llast"><span>Excel</span></li>
			</ul>
		</div>

	</div>

	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			Excel Upload/DownLoad는 Apache POI 라이브러리를 사용하여 Excel 문서의 업로드와 다운로드 기능을 제공한다.<br>
			<br>
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:excel" target="_blank">excel</a></li>
			</ul>
			<br>
		</div>

		<form:form modelAttribute="input" name="listForm" method="post"
			onsubmit="fnRetrieveList()">
			<input type="hidden" name="num" />

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
									<col style="width: 30%;" />
									<col style="width: 20%;" />
									<col style="width: 30%;" />
								</colgroup>
								<tbody>
									<tr>
										<th>기술 등급</th>
										<td>
											<form:select path="skillCode" id="skillCode">
												<form:option value="">
													<spring:message code="common.label.defaultOption" />
												</form:option>
												<form:options items="${skillCodeList}" itemValue="code"	itemLabel="value" />
											</form:select> <form:errors path="skillCode" />
										</td>
										<th>
											<spring:message	code="sample.office.employee.joblevel" /></th>
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
								</tbody>
							</table>
							<input type="image" class="Limage" src="<c:url value="/resource/images/btn_search.gif"/>" alt="search button" />
						</div>
					</div>
				</div>
			</div>


			<div id="LblockListTable01" class="LblockListTable">
				<div class="Lwrapper">
					<table summary="<spring:message code="sample.office.employee.empList"/>">
						<caption>
							<spring:message code="sample.office.employee.empList" />
						</caption>
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
									<td class="Lfirst"><c:out value="${result.num}" /></td>
									<td><c:out value="${result.name}" /></td>
									<td><c:out value="${result.joblevelCodeName}" /></td>
									<td><c:out value="${result.skillCodeName}" /></td>
									<td><c:out value="${result.telephone}" /></td>
									<td class="Llast"><c:out value="${result.birthdate}" /></td>
								</tr>
							</c:forEach>
							<c:if test="${empty resultList && !empty input}">
								<tr id="empty" style="background-color: #FFFFFF">
									<td colspan="6"><spring:message code="dev.inf.com.nodata" /></td>
								</tr>
							</c:if>
						</tbody>
						<tbody>
					</table>
				</div>
			</div>
		</form:form>
	</div>
	<div id="LblockSubbutton01" class="LblockSubbutton">
		<a class="Lbtn2" href="#" onclick="fnDownload();return false"><span>다운로드</span></a>
	</div>


	<!-- 파일 업로드 Form -->
	<div id="LblockPageSubtitle02" class="LblockPageSubtitle">
		<h2>파일업로드</h2>
		※ 데이터를 조회하여 다운로드 한 후 엑셀파일의 "num" 컬럼을 모두 다른 값으로 수정하여 업로드 <br /> 
		※ 이미 존재하는 값과 중복되면 에러 발생됨
	</div>

	<div id="LblockDetail01" class="LblockDetail">
		<form method="POST" name="uploadForm" enctype="multipart/form-data">
			<table summary="업로드파일정보">
				<caption>업로드파일정보</caption>
				<tbody>
					<tr>
						<th>파일명</th>
						<td><input type="file" id="uploadFile" name="uploadFile" class="Lbtn"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnUpload();return false"><span>업로드</span></a>
	</div>
</div>
