<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeList.jsp
 * DESC : 트리 목록조회
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript" src="<c:url value='/resource/js/jquery/jquery.jstree.js'/>"></script>
<script type="text/javascript" language="javascript">
    //jstree
    $("document").ready(function() {
        $("#LblockTree01").jstree({
            "plugins" : ["themes", "json_data", "ui"],
            "json_data" : {
            "ajax" : {
                "url" : "<c:url value="/pattern/px2/retrieveEmployeeList.do" />",
                }
            }
        }).bind("select_node.jstree", function(event, data) {
            if (data.rslt.obj.attr("level") == 3) {
                fnRetrieveEmployee(data.rslt.obj.attr("id"));
            }
        })
    });

    function fnDelete() {
    	if (!fnValidateRequired(document.detailForm.num, "<spring:message code="dev.warn.com.delinfo"/>")) return false;

        $.ajax({
            type : "POST",
            url : "<c:url value="/pattern/px2/deleteEmployee.do"/>",
            data : $("#detailForm").serialize(),
            success : function() {
                alert("삭제되었습니다.");
                $.jstree._reference("#LblockTree01").refresh();
                $("input").val("");
                $("select").val("");
            }
        });
    }

    function fnSave() {
        if (!fnValidateRequired(document.detailForm.num, "<spring:message code="dev.warn.com.required3"/>")) return false;
        var url = "<c:url value="/pattern/px2/insertEmployee.do"/>";
        if ($("#num").attr("readonly") == "readonly") {
            url = "<c:url value="/pattern/px2/updateEmployee.do"/>";
        }

        $.ajax({
            type : "POST",
            url : url,
            data : $("#detailForm").serialize(),
            success : function() {
                alert("<spring:message code="dev.suc.com.save"/>");
                $.jstree._reference("#LblockTree01").refresh();
            }
        });

    }

    function fnAdd() {
        $(".LblockDetail").find("input,select").each(function() {
            $(this).val("");
            $(this).attr("checked", false);
            $(this).attr("readonly", false);
        });
    }

    function fnRetrieveEmployee(num) {
    	var ajax = new xui.ajax("<c:url value='/pattern/px2/retrieveEmployee.do'/>");
    	ajax.addQuery("num",num);
    	ajax.send("fnCallbackEmployee()");
    }

    function fnCallbackEmployee() {
    	var employee = data.result;
        var sex = employee.sex;
        $("#num").val(employee.num).attr("readonly", true);
        $("#joblevelCode").val(employee.joblevelCode);
        $("#name").val(employee.name);
        $("#divisionCode").val(employee.divisionCode);
        fnRetrieveDepartmentBind(employee.departmentCode, data.departmentCodeList);
        $("#birthdate").val(employee.birthdate);
        $("#ssn").val(employee.ssn);
        if (sex == "M") $("#sexM").attr("checked", true);
        if (sex == "F") $("#sexF").attr("checked", true);
        $("#telephone").val(employee.telephone);
        $("#postal").val(employee.postal);
        $("#skillCode").val(employee.skillCode);
        $("#address").val(employee.address);
    }

    function fnRetrieveDepartmentBind(departmentCode, departmentCodeList) {
    	$("#departmentCode").empty().append("<option value=''>" +"선택하세요" + "</option>" );
    	for(inx = 0; inx < departmentCodeList.length; inx++)
    	{
    		$("#departmentCode").append("<option value='"+ departmentCodeList[inx].code+ "'>" +departmentCodeList[inx].value + "</option>" );
    	}
    	$("#departmentCode").val(departmentCode);
    }

    function fnSuccessSelect(data, oSelect, value) {
        $(oSelect).get(0).options.length = 1;

        $(data).find("code").each(function(i) {
            var value = $(this).text();
            var text = $(data).find("value").eq(i).text();

            $(oSelect).get(0).options[i + 1] = new Option(text, value);
        });

        $("#departmentCode").val(value);
    }

    function fnRetrieveDepartmentCodeList() {
    	var ajax = new xui.ajax("<c:url value='/common/code/retrievedepartmentCodeList.do'/>");
    	ajax.addQuery("codeGroup",document.detailForm.divisionCode.value);
    	ajax.bind("departmentCode");
    }

</script>


<div id="LblockBody">
<div id="LblockPageHeader">
<div id="LblockPageTitle">
	<h1>Pattern Extra PE-2 Tree</h1>
</div>

<div id="LblockPageLocation">
	<ul>
		<li class="Lfirst"><span><a href="#">HOME</a></span></li>
		<li><span><a href="#">UI Pattern</a></span></li>
		<li><span><a href="#">Web Pattern</a></span></li>
		<li><span><a href="#">Extra Pattern</a></span></li>
		<li class="Llast"><span>PX2 Tree Pattern</span></li>
	</ul>
</div>

</div>

<div id="LblockBodyMain">
<div id="LblockBlank01" class="LblockBlank Lclear">
<div id="LblockTree01" class="LblockTree LblockLeft" style="width: 270px;"></div>
<div id="LblockDetail01" class="LblockDetail LblockRight">
	<form:form modelAttribute="result" id="detailForm" name="detailForm" method="post">
	    <input type="hidden" name="mode" id="mode" value="c" />
	    <table summary="메뉴정보">
	        <caption>메뉴정보</caption>
	        <colgroup>
	            <col style="width: 25%;" />
	            <col style="width: 75%;" />
	        </colgroup>
	        <tbody>
	            <tr>
	                <th><spring:message code="sample.office.employee.num"/></th>
	                <td><form:input path="num"  id="num" cssClass="Ltext" /></td>
	            </tr>
	            <tr>
	                <th><label for="lJoblevelCodeName">직급</label></th>
	                <td>
						<form:select path="joblevelCode" id="joblevelCode">
							<form:option value=""><spring:message code="common.label.defaultOption"/></form:option>
							<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value" />
						</form:select><br/>
	                </td>
	            </tr>
	            <tr>
	                <th><spring:message code="sample.office.employee.name"/></th>
	                <td><form:input path="name"  id="name" cssClass="Ltext" /></td>
	            </tr>
	            <tr>
	                <th><spring:message code="sample.office.employee.department"/></th>
	                <td>
						<form:select path="divisionCode" id="divisionCode" onchange="javascript:fnRetrieveDepartmentCodeList();return false;">
							<form:option value=""><spring:message code="common.label.defaultOption"/></form:option>
							<form:options items="${divisionCodeList}" itemValue="code" itemLabel="value" />
						</form:select>
						<form:select path="departmentCode" id="departmentCode">
							<form:option value=""><spring:message code="common.label.defaultOption"/></form:option>
							<form:options items="${departmentCodeList}" itemValue="code" itemLabel="value" />
						</form:select><br/>
	                </td>
	            </tr>
	            <tr>
	                <th><spring:message code="sample.office.employee.birthdate"/></th>
	                <td><form:input path="birthdate" id="birthdate" cssClass="Ltext" size="10"/>
	                <a href="#" onclick="dui.Calendar.open('birthdate'); return false;">
	                <img class="Lbtn" src="<c:url value="/resource/images/btn_icon_calendar.gif"/>" alt="날짜" />
	                </a>
	                </td>
	            </tr>
	            <tr>
	                <th><spring:message code="sample.office.employee.gender"/></th>
	                <td>
						<input type="radio" class="Lradio" id="sexM" name="sex" value="M" <c:if test="${result.sex =='M'}">checked</c:if>/> 남
						<input type="radio" class="Lradio" id="sexF" name="sex" value="F" <c:if test="${result.sex =='F'}">checked</c:if>/> 여
	                </td>
	            </tr>
	            <tr>
	                <th>주민번호</th>
	                <td><form:input path="ssn" id="ssn" cssClass="Ltext"/></td>
	            </tr>
	            <tr>
	                <th><spring:message code="sample.office.employee.telephone"/></th>
	                <td><form:input path="telephone" id="telephone" cssClass="Ltext"/></td>
	            </tr>
	            <tr>
	                <th><spring:message code="sample.office.employee.skill"/></th>
	                <td>
					<form:select path="skillCode" id="skillCode">
						<form:option value=""><spring:message code="common.label.defaultOption"/></form:option>
						<form:options items="${skillCodeList}" itemValue="code" itemLabel="value" />
					</form:select><br/>
	                </td>
	            </tr>
	        </tbody>
	    </table>
	</form:form>
</div>

</div>

</div>

<div id="LblockButton">
	<a class="Lbtn" href="#" onclick="fnDelete();return false;"><span><spring:message code="common.label.delete"/></span></a>
	<a class="Lbtn" href="#" onclick="fnSave();return false;"><span><spring:message code="common.label.save"/></span></a>
	<a class="Lbtn" href="#" onclick="fnAdd();return false;"><span><spring:message code="common.label.create"/></span></a>
</div>

</div>