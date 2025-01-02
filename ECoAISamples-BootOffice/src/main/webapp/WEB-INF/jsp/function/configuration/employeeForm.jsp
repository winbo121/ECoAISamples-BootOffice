<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : Configuration 예제
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
function fnRetrieve() {

	document.searchForm.action = "<c:url value='/function/configuration/retrieveConfiguraion.do'/>";
	document.searchForm.submit();
}
function fnInit() {
	document.searchForm.action = "<c:url value='/function/configuration/employeeForm.do'/>";
	document.searchForm.submit();
}

function fnSelected(key) {
	document.searchForm.searchKey.value = key;
}

</script>


<div id="LblockBody">
<div id="LblockPageHeader">
<div id="LblockPageTitle">
	 <h1>Configuration</h1>
</div>

<div id="LblockPageLocation">
	<ul>
		<li class="Lfirst"><span><a href="#">HOME</a></span></li>
		<li><span><a href="#">Function</a></span></li>
		<li><span><a href="#">Foundation</a></span></li>
		<li class="Llast"><span>Configuration</span></li>
    </ul>
</div>

</div>
<div id="LblockBodyMain">

<div id="LblockContent01" class="LblockContent">
	Configuration은 프로젝트에서 자주 수정이 발생하는 설정 값을 별도의 외부 파일로 분리하여 관리하는 기능이다 <br><br>
	<ul>
		<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:configuration" target="_blank">configuration</a> </li><br>
		<li> 설정 </li>
		- yml 설정 : /resources/application.yml(Prefix: devon.config.xml, devon.config.properties, devon.config.yml, devon.config.composite)<br/>
		- property 파일 : /resources/config/configuration/test.properties<br/>
		- XML 파일 : /resources/config/configuration/test.xml<br/>
	</ul>
	<br>
</div>

    <form:form modelAttribute="configuration" name="searchForm" id="searchForm" method="post" >
        <div id="LblockSearch">
            <div>
                <div>
                    <div>
                        <table summary="<spring:message code="sample.office.employee.empSearch"/>">
                            <caption><spring:message code="sample.office.employee.empSearch"/></caption>
                            <tbody>
                                <tr>
                                    <th>Configuration Type</th>
                                    <td>
										<form:select id="propertyKey"  path="propertyKey">
											<form:options items="${codeList}" itemValue="key" itemLabel="value"/>
										</form:select>
										<form:errors path="propertyKey" />
                                    </td>
                                    <th>검색 키</th>
                                    <td><input type="text" id="searchKey" name="searchKey" class="Ltext" value = "${configuration.searchKey}"/></td>
                                    <th>검색 결과</th>
                                    <td><input type="text" id="propertyValue" name="propertyValue" class="Ltext" value = "${configuration.propertyValue}" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="image" class="Limage" onclick="fnRetrieve();return false;" src="<c:url value="/resource/images/btn_search.gif"/>" alt="search button" />
                    </div>
                </div>
            </div>
        </div>
    </form:form>

    <form name="configurationListForm" id="configurationListForm" method="post">
	<div id="LblockBlank01" class="LblockBlank Lclear">
	<div id="LblockListTable01" class="LblockListTable LblockLeft">
	<th>Properties List</th>
		<table summary="사원기본정보">
			<caption>사원기본정보</caption>
            <thead>
                <tr>
                    <th class="Lfirst">key</th>
                    <th class="Llast">value</th>
                </tr>
            </thead>
            <tbody id="propertiesArea">
                <c:forEach items="${propertiesCodeList}" var="result" varStatus="i">

                    <c:set var="index" value="${i.index}" />
                    <tr style="cursor: pointer" onclick="fnSelected('${result.key}');">
                        <td class="Lfirst"><c:out value="${result.key}"/></td>
                        <td class="Llast"><c:out value="${result.value}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
		</table>
	</div>

	<div id="LblockListTable02" class="LblockListTable LblockRight">
	<th>XML List</th>
		<table summary="사원기본정보">
			<caption>사원기본정보</caption>
            <thead>
                <tr>
                    <th class="Lfirst">key</th>
                    <th class="Llast">value</th>
                </tr>
            </thead>
            <tbody id="xmlCodeDltArea">
                <c:forEach items="${xmlCodeList}" var="resultDlt" varStatus="i">
                    <c:set var="index" value="${i.index}" />
                    <tr style="cursor: pointer" onclick="fnSelected('${resultDlt.key}');">
                        <td class="Lfirst"><c:out value="${resultDlt.key}"/></td>
                        <td class="Llast"><c:out value="${resultDlt.value}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
		</table>
	</div>

	</div>

	</form>

</div>
<div id="LblockButton">
	<a class="Lbtn" href="#"><span onclick="fnInit();">초기화</span></a>
</div>
</div>

