<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeList.jsp
 * DESC : 셔틀 목록조회
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
    $("#document").ready(function() {
        fnLoadTable();
    })

    function fnRetrieveList() {
        $("#searchForm").attr("action", "<c:url value="/pattern/px1/retrieveShuttleEmployeeList.do"/>").submit();
    }

    function fnLoadTable() {
        fnSetTableSize();
        $("#employeeeeArea > tr").unbind("click");
        $("#employeeeeDltArea > tr").unbind("click");
        $("#employeeeeArea > tr").bind("click", fnSetBgColor);
        $("#employeeeeDltArea > tr").bind("click", fnSetBgColor);
    }

    function fnSetTableSize() {
        var tableHeight1 = parseInt($("#LblockListTable01").css("height"));
        var tableHeight2 = parseInt($("#LblockListTable02").css("height"));

        if (tableHeight1 <= 100 && tableHeight2 <= 100) {
            $("#LblockBlank01").css("height", "100px");
        } else {
            $("#LblockBlank01").css("height", "");
        }
    }

    function fnSetBgColor() {
        if ($(this).css("background-color") == "rgb(221, 221, 221)" || $(this).css("background-color") == "#dddddd") {
            fnResetBgColor($(this));
        } else {
            fnSetHoverBgColor($(this));
        }
    }

    function fnResetBgColor(obj) {
        obj.css("background-color", "");
        obj.hover(function() {
            $(this).css("background-color", "#EEEEDD");
        }, function() {
            $(this).css("background-color", "#FFFFFF");
        });
    }

    function fnSetHoverBgColor(obj) {
        obj.css("background-color", "#DDDDDD");
        obj.unbind("hover");
    }

    function fnMoveLeft() {
        fnMovePage("#employeeeeDltArea", "#employeeeeArea");
    }

    function fnMoveRight() {
        fnMovePage("#employeeeeArea", "#employeeeeDltArea");
    }

    function fnMoveLeftAll() {
        fnMovePage("#employeeeeDltArea", "#employeeeeArea", "all");
    }

    function fnMoveRightAll() {
        fnMovePage("#employeeeeArea", "#employeeeeDltArea", "all");
    }

    function fnMovePage(originalObject, cloneObject, type) {
        $(originalObject + " > tr").each(function(i) {
            var obj = $(this);
            var num = obj.find("input[name=num]").val();
            if (type == "all" || obj.css("background-color") == "rgb(221, 221, 221)" || obj.css("background-color") == "#dddddd") {

                if ($(cloneObject).find("input[value=" + num + "]").size() > 0) {

                    alert("<spring:message code="dev.warn.com.create"/>");
                } else {
                    var obj = $(this).clone().appendTo($(cloneObject));
                    fnResetBgColor(obj);
                    $(this).remove();
                }
            }
        });

        fnLoadTable();
    }

    function fnSaveList() {
        $("#employeeeeArea").find("input[name=type]").val("current");
        $("#employeeeeDltArea").find("input[name=type]").val("dlt");

        $("#shuttleForm").attr("action", "<c:url value="/pattern/px1/saveShuttleEmployeeList.do"/>").submit();
    }
</script>




<div id="LblockBody">
<div id="LblockPageHeader">
<div id="LblockPageTitle">
	<h1>PX1 Shuttle Pattern</h1>
</div>

<div id="LblockPageLocation">
	<ul>
		<li class="Lfirst"><span><a href="#">HOME</a></span></li>
		<li><span><a href="#">UI Pattern</a></span></li>
		<li><span><a href="#">Web Pattern</a></span></li>
		<li><span><a href="#">Extra Pattern</a></span></li>
		<li class="Llast"><span>PX1 Shuttle Pattern</span></li>
	</ul>
</div>

</div>

<div id="LblockBodyMain">
    <form:form modelAttribute="input"  id="searchForm" name="searchForm"  method="post">
        <div id="LblockSearch">
            <div>
                <div>
                    <div>
                        <table summary="<spring:message code="sample.office.employee.empSearch"/>">
                            <caption><spring:message code="sample.office.employee.empSearch"/></caption>
                            <tbody>
                                <tr>
                                    <th><spring:message code="sample.office.employee.skill"/></th>
                                    <td>
										<form:select path="skillCode">
											<form:option value =""><spring:message code="common.label.defaultOption"/></form:option>
											<form:options items="${skillCodeList}" itemValue="code" itemLabel="value"/>
										</form:select>
                                    </td>
                                    <th><spring:message code="sample.office.employee.joblevel"/></th>
                                    <td>
                                        <form:select path="joblevelCode">
                                        	<form:option value =""><spring:message code="common.label.defaultOption"/></form:option>
											<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value"/>
										</form:select>
                                    </td>
                                    <th><spring:message code="sample.office.employee.name"/></th>
                                     <td><form:input path="name" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="image" class="Limage" onclick="fnRetrieveList();return false;" src="<c:url value="/resource/images/btn_search.gif"/>" alt="search button" />
                    </div>
                </div>
            </div>
        </div>
    </form:form>

    <form name="shuttleForm" id="shuttleForm" method="post">
    <input type="hidden" name="searchSkillCode" value="<c:out value="${input.skillCode}"/>" />
    <input type="hidden" name="searchJoblevelCode" value="<c:out value="${input.joblevelCode}"/>" />
    <input type="hidden" name="searchName" value="<c:out value="${input.name}"/>" />
	<div id="LblockBlank01" class="LblockBlank Lclear">
	<div id="LblockListTable01" class="LblockListTable LblockLeft">
		<table summary="사원기본정보">
			<caption>사원기본정보</caption>
            <thead>
                <tr>
                    <th class="Lfirst">사원명</th>
                    <th><spring:message code="sample.office.employee.joblevel"/></th>
                    <th><spring:message code="sample.office.employee.num"/></th>
                    <th class="Llast">부서</th>
                </tr>
            </thead>
            <tbody id="employeeeeArea">
                <c:forEach items="${resultList}" var="result" varStatus="i">

                    <c:set var="index" value="${i.index}" />
                    <tr style="cursor: pointer;">
                        <td class="Lfirst">
                            <input type="hidden" name="num" value="<c:out value="${result.num}"/>" />
                            <input type="hidden" name="type" value="current" /> <c:out value="${result.name}"/>
                        </td>
                        <td><c:out value="${result.joblevelCodeName}"/></td>
                        <td><c:out value="${result.num}"/></td>
                        <td class="Llast"><c:out value="${result.departmentCodeName}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
		</table>
	</div>

	<div id="LblockShuttleButton01" class="LblockShuttleButton">
		<p><a href="#" onclick="fnMoveRight();return false;"><img src="<c:url value="/resource/images/shuttleButton_r.gif"/>" alt="오른쪽으로 이동" /></a></p>
		<p><a href="#" onclick="fnMoveLeft();return false;"><img src="<c:url value="/resource/images/shuttleButton_l.gif"/>" alt="왼쪽으로 이동" /></a></p>
		<p><a href="#" onclick="fnMoveRightAll();return false;"><img src="<c:url value="/resource/images/shuttleButton_ra.gif"/>" alt="오른쪽으로 모두이동" /></a></p>
		<p><a href="#" onclick="fnMoveLeftAll();return false;"><img src="<c:url value="/resource/images/shuttleButton_la.gif"/>" alt="왼쪽으로 모두이동" /></a></p>
	</div>

	<div id="LblockListTable02" class="LblockListTable LblockRight">
		<table summary="사원기본정보">
			<caption>사원기본정보</caption>
            <thead>
                <tr>
                    <th class="Lfirst">사원명</th>
                    <th><spring:message code="sample.office.employee.joblevel"/></th>
                    <th><spring:message code="sample.office.employee.num"/></th>
                    <th class="Llast">부서</th>
                </tr>
            </thead>
            <tbody id="employeeeeDltArea">
                <c:forEach items="${resultListDlt}" var="resultDlt" varStatus="i">
                    <c:set var="index" value="${i.index}" />
                    <tr style="cursor: pointer;">
                        <td class="Lfirst">
                            <input type="hidden" name="num" value="<c:out value="${resultDlt.num}"/>" />
                            <input type="hidden" name="type" value="dlt" /> <c:out value="${resultDlt.name}"/>
                        </td>
                        <td><c:out value="${resultDlt.joblevelCodeName}"/></td>
                        <td><c:out value="${resultDlt.num}"/></td>
                        <td class="Llast"><c:out value="${resultDlt.departmentCodeName}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
		</table>
	</div>

	</div>

	</form>

</div>

<div id="LblockButton">
	<a class="Lbtn" href="#"><span onclick="fnSaveList();return false;"><spring:message code="common.label.save"/></span></a>
</div>

</div>

