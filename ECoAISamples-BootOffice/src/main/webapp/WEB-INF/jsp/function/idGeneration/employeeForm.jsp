<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : IDGenerator 예제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script>
	function fnRetrieve() {
		document.detailForm.action = "<c:url value="/function/idGeneration/retrieveIdGeneration.do"/>";
		document.detailForm.submit();
	}
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>IdGeneration</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Support</a></span></li>
				<li class="Llast"><span>IdGeneration</span></li>
			</ul>
		</div>

	</div>
	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			IdGeneration는 시스템을 개발할 때 필요한 유일한 ID를 생성하기 위해 기능을 제공하는 컴포넌트이다. <br>
			<br>
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:idgenerator" target="_blank">idgenerator</a></li>
				<br>
				<li>설정</li> 
				- Java Bean 설정 : devonboot.sample.office.common.config.idgeneration.IdGenerationConfig<br/>
				<br>
				<br>
				<li>IdGeneration 종류</li>
				 - DB Sequence Id : Database의 SEQUENCE를 사용
				<br> - Sequence Id : 날짜 패턴과 시스템 property의 값 등을 이용해 내부적으로 시퀀스를 증가
				<br> - Table Id : 별도의 테이블을 생성하여 keyColumn과 keyColumn에 해당하는
				sequenceColumn의 값을 통해 ID를 생성 및 관리
				<br>
				<br>
			</ul>

			<br>
		</div>

		<form:form modelAttribute="idGeneration" name="detailForm"	id="detailForm" method="post">
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
										<th>IdGeneration가 사용할 Formatter 선택</th>
										<td>
											<form:select id="policyCode" path="policyCode">
												<form:option value="">
													<spring:message code="common.label.defaultOption" />
												</form:option>
												<form:options items="${idPolicyCodeList}" itemValue="policyCode" itemLabel="policyValue" />
											</form:select>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div id="LblockDetail01" class="LblockDetail">
				<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
					<caption>
						<spring:message code="sample.office.employee.detailInfo" />
					</caption>
					<colgroup>
						<col style="width: 30%;" />
						<col style="width: 70%;" />
					</colgroup>
					<tbody>
						<tr>
							<th>IdGeneration 종류</th>
							<th>생성된 ID</th>
						</tr>
						<tr>
							<th>DB Sequence Id :</th>
							<td colspan="3">${idGeneration.dbSequenceIdValue}</td>
						</tr>
						<tr>
							<th>Sequence Id :</th>
							<td colspan="3">${idGeneration.sequenceIdValue}</td>
						</tr>
						<tr>
							<th>Table Id :</th>
							<td>${idGeneration.tableIdValue}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form:form>
	</div>


	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnRetrieve();return false;"><span>조회</span></a>
	</div>

</div>
