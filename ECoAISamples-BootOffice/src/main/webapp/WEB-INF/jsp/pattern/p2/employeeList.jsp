<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : 웹패턴 2 조회 / 수정 / 삭제
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
//<![CDATA[
function fnRetrieveList() {
    document.listForm.searchSkillCode.value=document.searchForm.skillCode.value;
    document.listForm.searchJoblevelCode.value=document.searchForm.joblevelCode.value;
	document.searchForm.action = "<c:url value="/pattern/p2/retrieveEmployeeList.do"/>";
	document.searchForm.submit();
}
function fnCheckStateChanged(checkbox) {
	var node = checkbox.parentNode;
	node.children[0].value = checkbox.checked;  //checkIndex set(true/false)
}
function fnSelectAll(checkbox) {
    if (checkbox.checked) {
        $(".Lcheckbox").attr("checked", true);
    } else {
        $(".Lcheckbox").removeAttr("checked");
    }
}
function fnSave() {
	if (fnValidateCheckBox('update')) return false;
	if (fnValidateNullCheck()) return false;
    document.listForm.action = "<c:url value="/pattern/p2/saveEmployeeList.do"/>";
	document.listForm.submit();
}
function fnDelete() {
	if (fnValidateCheckBox('delete')) return false;	
	var checkIndex = document.getElementsByName("checkIndex");
	for(var i=0; i<checkIndex.length; i++) {
		var firstTD = checkIndex[i].parentNode;
		var checkBox = firstTD.children[0];  // checkBox
		if(checkBox.checked == true) {
			var tr = firstTD.parentNode;
			tr.style.display = "none";
			firstTD.children[2].value = "D";  // actType set(C/U/D)
		}
	}
}
function fnValidateNullCheck() {
    var flag = false;
    if($("input[name=checkData]").length > 0){
        $("input[name=checkData]").each(function(i) {
            var oTr = $(this).parent().parent();
            if (oTr.find("input[name=num]").val() == "") {
                alert("<spring:message code="dev.warn.com.required3"/>");
                oTr.find("input[name=num]").focus();
                flag = true;
                return false;
            }
        });
    }else{
    	flag = true;
    }

    return flag;
}
function fnValidateCheckBox(type) {
    if ($("input[name=checkData]:checked").length == 0) {
    	if(type == 'update' ) {
	        alert("<spring:message code="dev.warn.com.updinfo"/>");
    	} else {
	        alert("<spring:message code="dev.warn.com.delinfo"/>");
    	}
        return true;
    }
}
function fnValidateRetrieve() {
    if (document.listDetailForm.skillCode.value == "" && document.listDetailForm.joblevelCode.value == "") {
        alert("<spring:message code="dev.warn.com.required1"/>");
        return true;
    }
    return false;
}
function fnAdd() {
    $("#empty").hide();

    var joblevelCode = $("#joblevelCode").clone();
    var skillCode = $("#skillCode").clone();
    var table = $("#employeeArea");
    var tr = $("<tr/>");
    var td = $("<td/>");

    tr.append(td.clone().append($("<input/>").attr({"type":"checkbox", "name":"checkData"}).addClass("Lcheckbox").attr("checked",true))
			.append($("<input/>").attr({"type":"hidden", "value":"false", "name":"checkIndex"}))
			.append($("<input/>").attr({"type":"hidden", "value":"C", "name":"actType"})));
    tr.append(td.clone().append($("<input/>").attr({"type":"text", "size":"10", "name":"num"}).addClass("Ltext")));
    tr.append(td.clone().append($("<input/>").attr({"type":"text", "size":"10", "name":"name"}).addClass("Ltext")));
    tr.append(td.clone().append(joblevelCode.attr({"id":"", "name":"joblevelCode"})));
    tr.append(td.clone().append(skillCode.attr({"id":"", "name":"skillCode"})));
    tr.append(td.clone().append($("<input/>").attr({"type":"text", "size":"10", "name":"telephone"}).addClass("Ltext")));
    tr.append(td.clone().append($("<input/>").attr({"type":"text", "size":"10", "name":"birthdate"}).addClass("Ltext")));
    tr.appendTo(table);
}
//]]>
</script>

<div id="LblockBody">
<div id="LblockPageHeader">
<div id="LblockPageTitle">
	<h1>P2 Multi Edit</h1>
</div>

<div id="LblockPageLocation">
	<ul>
	    <li class="Lfirst"><span><a href="#">HOME</a></span></li>
		<li><span><a href="#">UI Pattern</a></span></li>
		<li><span><a href="#">Web Pattern</a></span></li>
	    <li><span><a href="#">P2 Multi Pattern</a></span></li>
	    <li class="Llast"><span>P2-1 Multi Edit</span></li>
	</ul>
</div>

</div>

<div id="LblockBodyMain">
    <form:form modelAttribute="input"  name="searchForm" id="searchForm" method="post" onsubmit="fnRetrieveList();return false;">
        <div id="LblockSearch">
            <div>
                <div>
                    <div>
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
										<form:select id="skillCode" path="skillCode">
											<form:option value =""><spring:message code="common.label.defaultOption"/></form:option>
											<form:options items="${skillCodeList}" itemValue="code" itemLabel="value"/>
										</form:select>
                                    </td>
                                    <th><spring:message code="sample.office.employee.joblevel"/></th>
                                    <td>
                                        <form:select id="joblevelCode" path="joblevelCode">
                                        	<form:option value =""><spring:message code="common.label.defaultOption"/></form:option>
											<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value"/>
										</form:select>
                                    </td>
                                    <th class="LsearchTh"><input type="image" class="Limage" src="<c:url value="/resource/images/btn_search.gif"/>" alt="search button"/>
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
	</form:form>
	<form:form modelAttribute="resultList"  name="listForm" id="listForm" method="post">
	<input type="hidden" name="searchSkillCode" value="${input.skillCode}"/>
	<input type="hidden" name="searchJoblevelCode" value="${input.joblevelCode}"/>
        <div id="LblockListTable01" class="LblockListTable">
            <div class="Lwrapper">
                <table summary="<spring:message code="sample.office.employee.empList"/>">
                    <caption><spring:message code="sample.office.employee.empList"/></caption>
                    <thead>
                        <tr>
                            <th width="25"><input type="checkbox" class="Lcheckbox" onclick="fnSelectAll(this)" /></th>
                            <th><spring:message code="sample.office.employee.num"/></th>
                            <th><spring:message code="sample.office.employee.name"/></th>
                            <th><spring:message code="sample.office.employee.joblevel"/></th>
                            <th><spring:message code="sample.office.employee.skill"/></th>
                            <th><spring:message code="sample.office.employee.telephone"/></th>
                            <th><spring:message code="sample.office.employee.birthdate"/></th>
                        </tr>
                    </thead>
                    <tbody id="employeeArea">
                        <c:forEach items="${resultList}" var="result" varStatus="status">
                            <c:set var="index" value="${status.index}" />
                            <tr>
                                <td class="Lfirst">
                                    <input type="checkbox" class="Lcheckbox" name="checkData" value="${index}" onclick="fnCheckStateChanged(this)" />
                                    <input type="hidden" name="checkIndex" value="false" />
                                    <input type="hidden" name="actType" value="U" />
                                    <input type="hidden" name="num" value="${result.num}" />
                                </td>
                                <td>${result.num}</td>
                                <td><input type="text" class="Ltext"  id= "name" name="name" value="${result.name}"  size="10" maxlength="10" /></td>
                                <td>
                                	<select id="joblevelCode" name="joblevelCode">
                                		<c:forEach items="${joblevelCodeList}" var="joblevel" >
                                			<option value="${joblevel.code}" <c:if test="${result.joblevelCode == joblevel.code}">selected="selected"</c:if>><c:out value="${joblevel.value}"/></option>
                                		</c:forEach>
                                	</select>
                                </td>
                                <td>
                                    <select id="skillCode" name="skillCode">
                                		<c:forEach items="${skillCodeList}" var="skill" >
                                			<option value="${skill.code}" <c:if test="${result.skillCode == skill.code}">selected="selected"</c:if>><c:out value="${skill.value}"/></option>
                                		</c:forEach>
                                	</select>
                                </td>
                                <td><input type="text" class="Ltext" id="telephone" name="telephone" value="${result.telephone}" size="12" maxlength="11" /></td>
                                <td><input type="text" class="Ltext" id="birthdate" name="birthdate" value="${result.birthdate}" size="10"  maxlength="8" />
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty resultList && !empty input}">
                            <tr id="empty" style="background-color:#FFFFFF">
                                <td height="25" colspan="7"><spring:message code="dev.inf.com.nodata"/></td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </form:form>
</div>
	
	<div id="LblockButton">
		<a class="Lbtn" href="#"><span onclick="fnDelete();"><spring:message code="common.label.delete"/></span></a>
		<a class="Lbtn" href="#"><span onclick="fnSave();"><spring:message code="common.label.save"/></span></a>
		<a class="Lbtn" href="#"><span onclick="fnAdd();"><spring:message code="common.label.create"/></span></a>
	</div>

</div>