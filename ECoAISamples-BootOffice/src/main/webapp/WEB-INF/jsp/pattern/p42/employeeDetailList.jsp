<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeDetailList.jsp
 * DESC : 웹패턴 4-2 상세 / 목록 조회
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
function fnRetrieve() {
	document.detailForm.action = "<c:url value="/pattern/p42/retrieveEmployee.do"/>";
	document.detailForm.target = "_self";
	document.detailForm.submit();
}
function fnAdd() {
    $("#empty").hide();
    var oTable = $("#achievementArea");
    var oTr = $("<tr/>");
    var oTd = $("<td/>");
    var num = document.listForm.detailNum.value;

    oTr.append(oTd.clone().append($("<input/>").attr({"type":"checkbox",  "name":"checkData"}).addClass("Lcheckbox").attr("checked",true))
              			  .append($("<input/>").attr({"type":"hidden", "value":"C", "name":"actType"}))
              			  .append($("<input/>").attr({"type":"hidden", "value":num, "name":"num"})));
	oTr.append(oTd.clone().append($("<input/>").attr({"type":"text", "class":"Ltext", "size":"10", "maxlength":"4", "name":"yyyy"})));
	oTr.append(oTd.clone().append($("<input/>").attr({"type":"text", "class":"Ltext", "size":"10", "maxlength":"2", "name":"mm"})));
	oTr.append(oTd.clone().append($("<input/>").attr({"type":"text", "class":"Ltext", "size":"10", "name":"value"})));
	oTr.append(oTd.clone().append($("<input/>").attr({"type":"text", "class":"Ltext", "size":"10", "name":"etc"})));
    oTr.appendTo(oTable);
}
function fnSelectAll(check) {
    if (check.checked) {
        $(".Lcheckbox").attr("checked", true);
    } else {
        $(".Lcheckbox").removeAttr("checked");
    }
}
function fnDelete() {
	if (fnValidateCheckBox()) return false;
    var answer = confirm("<spring:message code='dev.cfm.com.delete' />");
    if (answer) {
        if (fnDeleteRow() > 0) {
            fnActType();
        	document.listForm.action = "<c:url value="/pattern/p42/deleteAchievementList.do"/>";
        	document.listForm.target = "_self";
        	document.listForm.submit();
        }
    }
}
function fnValidateCheckBox() {
    if ($("input[name=checkData]:checked").length == 0) {
        alert("<spring:message code='dev.warn.com.delete2' />");
        return true;
    }
}

function fnDeleteRow() {
    var deleteRow = new Array();
    $("input[name=checkData]:checked").each(function(i) {
        var oTr = $(this).parent().parent();
        if (oTr.find("input[name=actType]").val() == "C") {
            if (oTr.is("tr")) deleteRow[i] = oTr;
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
function fnSave() {
    if (fnValidateNullCheck()) return false;
	document.listForm.action = "<c:url value="/pattern/p42/saveAchievementList.do"/>";
	document.listForm.target = "_self";
	document.listForm.submit();
}

function fnValidateNullCheck() {
    var flag = false;
    if (document.listForm.detailNum.value == "") {
        alert("<spring:message code='dev.warn.com.save2' />");
        flag = true;
        return flag;
    }

    if ($("input[name=checkData]").length == 0) {
        alert("<spring:message code='dev.warn.com.add2' />");
        flag = true;
        return flag;
    }
	$("input[name=checkData]").each(function(i) {
	 	var oTr = $(this).parent().parent();
	    if (oTr.find("input[name=yyyy]").val() == "") {
	    	alert("<spring:message code='dev.warn.com.year' />");
	    	oTr.find("input[name=yyyy]").focus();
	    	flag = true;
	    return false;
	    }
	});
    return flag;
}
function fnUpdate(value) {
    var target = "popup";
    fnPopup(target);
	document.detailForm.action = "<c:url value="/pattern/p42/updateEmployeeFormPopup.do"/>";
	document.detailForm.target = target;
	document.detailForm.submit();
}
function fnPopup(target) {
    window.open("", target, "width=790,height=310");
}
//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>P4-2 Master/Detail[1:n]</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Web Pattern</a></span></li>
				<li><span><a href="#">P4 Master/Detail Pattern</a></span></li>
				<li class="Llast"><span>P4-2 Master/Detail[1:n]</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
		<div id="LblockSearch">
			<div>
				<div>
					<div>
						<form:form modelAttribute="result" name="detailForm" id="detailForm" method="post" onsubmit="fnRetrieve();return false;">
								<table summary="<spring:message code="sample.office.employee.empSearch"/>">
									<caption><spring:message code="sample.office.employee.empSearch" />	</caption>
									<colgroup>
										<col style="width: 20%;" />
										<col style="width: 80%;" />
									</colgroup>
									<tbody>
										<tr>
											<th><spring:message code="sample.office.employee.num" /></th>
											<td><input type="text" class="Ltext" id="searchNum" name=searchNum value="${result.num}" /></td>
										</tr>
									</tbody>
								</table>
								<input type="image" class="Limage" src="<c:url value="/resource/images/btn_search.gif"/>" alt="search button" />
						</form:form>
					</div>
				</div>
			</div>
		</div>

		<div id="LblockPageSubtitle01" class="LblockPageSubtitle">
			<h2><spring:message code="sample.office.employee.basicInfo" /></h2>
		</div>

		<div id="LblockDetail01" class="LblockDetail">
			<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
				<caption><spring:message code="sample.office.employee.detailInfo"/></caption>
				 <colgroup>
		            <col style="width: 25%;" />
		            <col style="width: 25%;" />
		            <col style="width: 25%;" />
		            <col style="width: 25%;" />
		        </colgroup>
				<tbody>
					<tr>
						<th><spring:message code="sample.office.employee.num"/></th>
						<td>${result.num}</td>
						<th><spring:message code="sample.office.employee.joblevel"/></th>
						<td>${result.joblevelCodeName}</td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.name"/></th>
						<td>${result.name}</td>
						<th><spring:message code="sample.office.employee.department"/></th>
						<td>${result.departmentCodeName}</td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.birthdate"/></th>
						<td><Tag:mask mask="####.##.##">${result.birthdate}</Tag:mask></td>
						<th><spring:message code="sample.office.employee.gender"/></th>
						<td>
						<c:if test="${result.sex =='M'}"><spring:message code="sample.office.employee.man"/></c:if> 
						<c:if test="${result.sex =='F'}"><spring:message code="sample.office.employee.woman"/></c:if>
		                </td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.ssn"/></th>
						<td>
						<Tag:mask mask="######-#######">${result.ssn}</Tag:mask>
						</td>
						<th><spring:message code="sample.office.employee.telephone"/></th>
						<td>
						<Tag:phone>${result.telephone}</Tag:phone>
						</td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.postal"/></th>
						<td>
						<Tag:mask mask="###-###">${result.postal}</Tag:mask>
						</td>
						<th><spring:message code="sample.office.employee.skill"/></th>
						<td>${result.skillCodeName}</td>
					</tr>
					<tr>
						<th><spring:message code="sample.office.employee.address"/></th>
						<td colspan="3">${result.address}</td>
					</tr>
				</tbody>
			</table>
		</div>

<c:if test="${!empty result}"> 
		<div id="LblockSubbutton01" class="LblockSubbutton">
			<a class="Lbtn2" href="#"><span onclick="fnUpdate();return false;"><spring:message code="common.label.update"/></span></a>
		</div>
</c:if>

		<div id="LblockPageSubtitle02" class="LblockPageSubtitle">
			<h2><spring:message code="sample.office.achievement.valueInfo"/></h2>
		</div>

		<div id="LblockListTable01" class="LblockListTable">
			<form:form modelAttribute="achievementResultList" name="listForm" id="listForm" method="post">
				<input type="hidden" id="detailNum" name="detailNum" value="${result.num}" />
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
                        <c:forEach items="${achievementResultList}" var="achievementResult" varStatus="i">
                            <c:set var="index" value="${i.index}" />
                            <tr class="Lfirst">
                                <td class="Lfirst">
                                    <input type="checkbox" class="Lcheckbox" id="checkData" name="checkData" value="${i.index}" />
                                    <input type="hidden" name="num" value="${achievementResult.num}" />
                                    <input type="hidden" name="acNum" value="${achievementResult.num}" />
                                    <input type="hidden" name="actType" value="U" />
                                </td>
                                <td><input type="hidden" name="yyyy" value="${achievementResult.yyyy}" /> ${achievementResult.yyyy}</td>
                                <td><input type="hidden" name="mm" value="${achievementResult.mm}" /> ${achievementResult.mm}</td>
                                <td><input type="text" class="Ltext" size="10" value="${achievementResult.value}" name="value" /></td>
                                <td><input type="text" class="Ltext" size="10" value="${achievementResult.etc}" name="etc" /></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty achievementResultList }">
                            <tr id="empty" style="background-color: #FFFFFF">
                                <td height="25" colspan="5"><spring:message code="dev.inf.com.nodata"/></td>
                            </tr>
                        </c:if>
			         </tbody>
				</table>
			</form:form>
		</div>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#"><span onclick="fnAdd();return false;"><spring:message code="common.label.create"/></span></a>
		<a class="Lbtn" href="#"><span onclick="fnSave();return false;"><spring:message code="common.label.save"/></span></a>
		<a class="Lbtn" href="#"><span onclick="fnDelete();return false;"><spring:message code="common.label.delete"/></span></a>
	</div>

</div>