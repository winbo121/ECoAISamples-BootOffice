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
	function fnRetrieveWithJson() {
		var skillCode = jQuery("#skillCode").val();
		var joblevelCode = jQuery("#joblevelCode").val();

		jQuery
				.ajax({
					url : "<c:url value='/function/resultHandler/retrieveEmployeeListWithJson.do'/>",
					type : 'get',
					dataType : 'json',
					contentType : "application/json",
					data : {
						'skillCode' : skillCode,
						'joblevelCode' : joblevelCode
					},
					success : function(data) {
						jQuery("#jsonText").val(JSON.stringify(data));
					},
					error : function(e) {
						alert("exception occured!!");
					}
				});
	}

	function fnRetrieveWithExcel() {

		document.listForm.action = "<c:url value="/function/resultHandler/retrieveEmployeeListWithExcel.do"/>";
		document.listForm.submit();
	}
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>대용량 처리(ResultHandler)</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Persistence</a></span></li>
				<li class="Llast"><span>대용량 처리(ResultHAndler)</span></li>
			</ul>
		</div>

	</div>

	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">

			대용량 Json, Excel처리가 가능하도록하는 ResultHandler를 이용하여 대용량처리를 해본다. <br>
			<br>
			<ul>
				<li>Wiki : <a
					href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:bigdataresolver"
					target="_blank">resultHandler</a>
				</li>
				<br>
				<li>설정</li> 
				- 별도의 설정은 없으며 commonDao의 selectList호출 시 JsonStreamResultHandler, ExcelStreamResultHandler를 통해 결과값을 가져온다.<br />
				- JsonStreamResultHandler : 결과값의 Json데이터를 Response의 Writer를 통해 전달하는 방식이다.
				- ExcelStreamResultHandler : 결과값을 Excel로 변환하여 Response의 Writer를 통해 전달하는 방식이다.
				
			</ul>
			<br>
		</div>
		<div id="LblockDetail01" class="LblockDetail">
			<form:form modelAttribute="input" name="listForm" id="listForm"
				method="post">
				<input type="hidden" id="mode" name="mode" />
				<input type="hidden" id="num" name="num" />
				<div id="LblockSearch">
					<div>
						<div>
							<div>
								<table
									summary="<spring:message code="sample.office.employee.empSearch"/>">
									<caption>
										<spring:message code="sample.office.employee.empSearch" />
									</caption>
									<tbody>
										<tr>
											<th width="65"><label for="lSkillCode"><spring:message
														code="sample.office.employee.skill" /></label></th>
											<td><form:select id="skillCode" path="skillCode">
													<form:option value="">
														<spring:message code="common.label.defaultOption" />
													</form:option>
													<form:options items="${skillCodeList}" itemValue="code"
														itemLabel="value" />
												</form:select></td>
											<th width="65"><label for="lJoblevelCode">직급</label></th>
											<td><form:select id="joblevelCode" path="joblevelCode">
													<form:option value="">
														<spring:message code="common.label.defaultOption" />
													</form:option>
													<form:options items="${joblevelCodeList}" itemValue="code"
														itemLabel="value" />
												</form:select></td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
					</div>
					<div id="LblockButton">
						<b>Json Streaming을 통한 대용량 처리</b> <a class="Lbtn" href="#"
							onclick="fnRetrieveWithJson();return false;"><span>검색</span></a> 
						<b> Excel Streaming을 통한 대용량 처리</b> <a class="Lbtn" href="#"
							onclick="fnRetrieveWithExcel();return false;"><span>검색</span></a>
					</div>
				</div>
				
				<table
					summary="<spring:message code="sample.office.employee.detailInfo"/>">
					<caption>Mail 정보</caption>
					<tbody>
						<tr>
							<th>json 데이터</th>
							<td><textarea id="jsonText" name="jsonText" cols="105"
									rows="20"></textarea></td>
						</tr>
					</tbody>
				</table>
			</form:form>
		</div>

	</div>