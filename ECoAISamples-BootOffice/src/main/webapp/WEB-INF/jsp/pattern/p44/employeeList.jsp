<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeList.jsp
 * DESC : 웹패턴 4-4 목록조회
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

<script type="text/javascript" language="javascript">
//<![CDATA[
$("document").ready(function(event) {
	if (document.detailListForm.updateNum.value != "") {
		var num = document.detailListForm.updateNum.value;
		fnDetail(num);
		document.detailListForm.updateNum.value = "";
	}
});
function fnRetrieve() {
	document.detailListForm.updateNum.value = "";
	document.listFrom.action = "<c:url value="/pattern/p44/retrieveEmployeeList.do"/>";
	document.listFrom.target = "_self";
	document.listFrom.submit();
}
function fnDetail(num) {
    document.detailListForm.updateNum.value = num;
    var ajax = new xui.ajax("<c:url value='/pattern/p44/retrieveAchievementList.do'/>");
	ajax.addQuery("num",num);
	ajax.send();
}
function fnCallback() {
	document.detailListForm.updateNum.value = data.updateNum;
	fnSuccess(data.achievementList);
}
function fnSuccess(data) {
    $("#achievementArea > tr:not(#empty)").remove();
    $(data).each(function(i) {
        var num =  data[i].num;
        var yyyy = data[i].yyyy;
        var mm = data[i].mm;
        var value = data[i].value;
        var etc = data[i].etc;
        fnAdd(num, yyyy, mm, value, etc, "U");
    })

    if ($("#achievementArea > tr").length == 1) {
        $("#empty").show();
    }
}
function fnAdd(num, yyyy, mm, value, etc, actType) {
	if (num == "") {
        alert("<spring:message code="dev.warn.com.add" />");
        flag = true;
        return flag;
    }

    $("#empty").hide();

    var type = "hidden";
    if (yyyy == "" || yyyy == undefined) type = "text";
    actType = actType == undefined ? "C" : actType;
    num = num == undefined ? document.detailListForm.updateNum.value : num;
    yyyy = yyyy == undefined ? "" : yyyy;
    mm = mm == undefined ? "" : mm;
    value = value == undefined ? "" : value;
    etc = etc == undefined ? "" : etc;

    var oTable = $("#achievementArea");
    var oTr = $("<tr/>");
    var oTd = $("<td/>");
	
    if(actType == "C" ) {
    	oTr.append(oTd.clone().append($("<input/>").attr({"type":"checkbox",  "name":"checkData"}).addClass("Lcheckbox").attr("checked",true)));
	} else {
	    oTr.append(oTd.clone().append($("<input/>").attr({"type":"checkbox",  "name":"checkData"}).addClass("Lcheckbox").attr("checked",true)));
	}
    
    oTr.append($("<input/>").attr({"type":"hidden", "value":actType, "name":"actType"}));
    oTr.append($("<input/>").attr({"type":"hidden", "value":num, "name":"num"}));
	oTr.append(oTd.clone().append($("<input/>").attr({"type":type, "class":"Ltext", "size":"10", "maxlength":"4", "value":yyyy, "name":"yyyy" })).append(yyyy));
	oTr.append(oTd.clone().append($("<input/>").attr({"type":type, "class":"Ltext", "size":"10", "maxlength":"2", "value":mm, "name":"mm" })).append(mm));
	oTr.append(oTd.clone().append($("<input/>").attr({"type":"text", "class":"Ltext", "size":"10", "value":value, "name":"value" })));
	oTr.append(oTd.clone().append($("<input/>").attr({"type":"text", "class":"Ltext", "size":"10", "value":etc, "name":"etc" })));
    oTr.appendTo(oTable);
}
function fnSave() {
    if (fnValidateNullCheck()) return false;
	document.detailListForm.action = "<c:url value="/pattern/p44/saveAchievementList.do"/>";
	document.detailListForm.submit();
}
function fnValidateNullCheck() {
    var flag = false;

    if (document.detailListForm.updateNum.value == "") {
        alert("<spring:message code="dev.warn.com.save2" />");
        flag = true;
        return flag;
    }

    if ($("input[name=checkData]").length == 0) {
        alert("<spring:message code="dev.warn.com.add2" />");
        flag = true;
        return flag;
    }

    $("input[name=checkData]").each(function(i) {
        var oTr = $(this).parent().parent();
        if (oTr.find("input[name=yyyy]").val() == "") {
            alert("<spring:message code="dev.warn.com.year" />");
            oTr.find("input[name=yyyy]").focus();
            flag = true;
            return false;
        }
    });

    return flag;
}
function fnDelete() {
    if (fnValidateCheckBox()) return false;

    var answer = confirm("<spring:message code="dev.cfm.com.delete" />");
    if (answer) {
        if (fnDeleteRow() > 0) {
            fnActType();
        	document.detailListForm.action = "<c:url value="/pattern/p44/deleteAchievementList.do"/>";
        	document.detailListForm.submit();
        }
    }
}
function fnDeleteRow() {
    var deleteRow = new Array();
    $("input[name=checkData]:checked").each(function(i) {
        var oTr = $(this).parent().parent();
        if (oTr.find("input[name=actType]").val() == "C") {
            if (oTr.is("tr")) {
                deleteRow[i] = oTr;
            }
        }
    });

    $(deleteRow).each(function() {
        $(this).remove();
    });

    if ($("#achievementArea > tr").length == 1) {
        $("#empty").show();
    }

    return $("input[name=checkData]:checked").length;
}
function fnActType() {
    $("input[name=checkData]").each(function() {
        var oTr = $(this).parent().parent();
        oTr.find("input[name=actType]").val("D");

        if (!this.checked) oTr.find("input[name=actType]").val("");
    });
}
function fnValidateCheckBox() {
    if ($("input[name=checkData]:checked").length == 0) {
        alert("<spring:message code="dev.warn.com.delete2" />");
        return true;
    }
}
function fnSelectAll(check) {
    if (check.checked) {
        $(".Lcheckbox").attr("checked", true);
    } else {
        $(".Lcheckbox").removeAttr("checked");
    }
}
//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>P4-4 Master/Detail [n:n]</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Web Pattern</a></span></li>
				<li><span><a href="#">P4 Master/Detail Pattern</a></span></li>
				<li class="Llast"><span>P4-4 Master/Detail [n:n]</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
		<div id="LblockSearch">
			<div>
				<div>
					<div>
						<form:form modelAttribute="result" name="listFrom" id="listFrom" method="post" onsubmit="fnRetrieve();return false;">
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
							<input type="image" class="Limage"  src="<c:url value='/resource/images/btn_search.gif'/>" alt="search button" />
						</form:form>
					</div>
				</div>
			</div>
		</div>

		<div id="LblockPageSubtitle01" class="LblockPageSubtitle">
			<h2><spring:message code="sample.office.employee.empList" /></h2>
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
				<tbody id="employeeList">
					<c:forEach items="${resultList}" var="result" varStatus="i">
						<c:set var="index" value="${i.index}" />
						<tr style="cursor: pointer" onclick="fnDetail('${result.num}');">
							<td class="Lfirst">${result.num}</td>
							<td>${result.name}</td>
							<td>${result.joblevelCodeName}</td>
							<td>${result.skillCodeName}</td>
							<td><Tag:phone>${result.telephone}</Tag:phone></td>
							<td class="Llast"><Tag:mask mask="####.##.##">${result.birthdate}</Tag:mask></td>
						</tr>
					</c:forEach>
					<c:if test="${empty resultList}">
						<tr id="empty" style="background-color: #FFFFFF">
							<td height="25" colspan="6"><spring:message code="dev.inf.com.nodata" /></td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>

		<div id="LblockPageSubtitle02" class="LblockPageSubtitle">
			<h2><spring:message code="sample.office.achievement.valueInfo"/></h2>
		</div>

		<div id="LblockListTable01" class="LblockListTable">
			<form:form modelAttribute="achievementList" name="detailListForm" id="detailListForm" method="post">
				<input type="hidden" id="updateNum" name="updateNum" value="${param.updateNum}" />
				<input type="hidden" name="skillCode" value="${result.skillCode}" />
				<input type="hidden" name="joblevelCode" value="${result.joblevelCode}" />
				<table summary="<spring:message code="sample.office.achievement.valueInfo"/>">
					<caption><spring:message code="sample.office.achievement.valueInfo"/></caption>
					<thead>
					<tr>
						<th width="25"><input type="checkbox" class="Lcheckbox" onclick="fnSelectAll(this)" /></th>
						<th class="Lfirst"><spring:message code="sample.office.achievement.year"/></th>
						<th><spring:message code="sample.office.achievement.month"/></th>
						<th><spring:message code="sample.office.achievement.value"/></th>
						<th class="Llast"><spring:message code="sample.office.achievement.etc"/></th>
					</tr>
					</thead>
					<tbody id="achievementArea">
                        <tr id="empty" style="background-color: #FFFFFF;display:none">
                            <td height="25" colspan="5"><spring:message code="dev.inf.com.nodata"/></td>
                        </tr>
			        </tbody>
				</table>
			</form:form>
		</div>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#"><span onclick="fnSave();return false;"><spring:message code="common.label.save"/></span></a>
		<a class="Lbtn" href="#"><span onclick="fnAdd();return false;"><spring:message code="common.label.create"/></span></a>
		<a class="Lbtn" href="#"><span onclick="fnDelete();return false;"><spring:message code="common.label.delete"/></span></a>
	</div>

</div>
