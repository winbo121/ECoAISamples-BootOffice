<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeList.jsp
 * DESC : 페이지패턴 Scroll 페이지 목록조회
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"  %>
<%@ page import="devonboot.sample.office.common.model.ScrollPagingEmployee" %>
<%@ page import="devonframe.scrollpaging.*" %>
<%@ page import="devonframe.scrollpaging.ui.*" %>
<%@ page import="devonframe.scrollpaging.ScrollPagingUtil" %>

<script type="text/javascript" language="javascript">
//<![CDATA[
$("document").ready(function() {  
	
	jQuery("#target").scroll( function() {
		var elem = jQuery("#target");
	    if ( elem[0].scrollHeight - elem.scrollTop() == elem[0].clientHeight){
		 fnRetrieve();
	    }
    });
});
				
function fnRetrieve() {
	var pageCount = jQuery("#pageCount").val();
	var pageNextYn = jQuery("#pageNextYn").val();
	var pageConditionKey = jQuery("#pageConditionKey").val();
	var pageTotalCount = jQuery("#pageTotalCount").val();

	jQuery.ajax({
		url : "<c:url value='/pattern/pp3/retrieveEmployeeListAjax.do'/>",
		type : 'get',
		dataType : 'json',
		contentType : "application/json",
		data : {
			'pageCount' : pageCount,
			'pageNextYn' : pageNextYn,
			'pageConditionKey' : pageConditionKey,
			'pageTotalCount' : pageTotalCount
		},
		success : function(data) {
			var obj = $("#employeeArea");
			var html = "";

			if (data.resultList.list.length > 0) {
				jQuery("#pageCount").val(data.resultList.pageCount);
				jQuery("#pageNextYn").val(data.resultList.pageNextYn);
				jQuery("#pageConditionKey").val(data.resultList.pageConditionKey);
				jQuery("#pageTotalCount").val(data.resultList.pageTotalCount);

				for (inx = 0; inx < data.resultList.list.length; inx++) {
					var num = data.resultList.list[inx].num;
					var oTr = $("<tr/>").attr({style:"cursor:pointer"}).addClass("Lfirst").bind("click", function(){ fnUpdate(num) });
					var oTd = $("<td/>");
					oTr.append(oTd.clone().addClass("Lfirst").append(num));
					oTr.append(oTd.clone().append(data.resultList.list[inx].name));
					oTr.append(oTd.clone().append(data.resultList.list[inx].joblevelCodeName));
					oTr.append(oTd.clone().append(data.resultList.list[inx].skillCodeName));
					oTr.append(oTd.clone().append(data.resultList.list[inx].telephone));
					oTr.append(oTd.clone().addClass("Llast").append(data.resultList.list[inx].birthdate));
					oTr.appendTo(obj);
				}
			}
		},
		error : function(e) {
			alert("exception occured!!");
		}
	});
}

function fnUpdate(value) {
    document.listForm.num.value = value;
    document.listForm.mode.value = "update";
	document.listForm.action = "<c:url value="/pattern/pp3/retrieveEmployeeForm.do"/>";
	document.listForm.submit();
}
function fnAdd() {
    document.listForm.mode.value = "insert";
	document.listForm.action = "<c:url value="/pattern/pp3/retrieveEmployeeForm.do"/>";
	document.listForm.submit();
}
//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>PP3 Scroll Page</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Page Pattern</a></span></li>
				<li class="Llast"><span>PP3 Scroll Page</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
			<Tag:scrollPaging resultList="${resultList}">
				<Tag:scrollPagingOut value="showJavaScript" />
				<form name="listForm" method="post"	onsubmit="fnRetrieve();return false;">
					<input type="hidden" id="mode" name="mode" />
					<input type="hidden" id="num" name="num" />
					<Tag:scrollPagingAddHiddenParam />
					<div align="right">
						<Tag:scrollPagingOut value="showTotalCountFrame" />
						<Tag:scrollPagingOut value="showCustomPageCount" />
					</div>
					<br>

					<div id="LblockListTable01" class="LblockListTable" >
						
						<div class="Lwrapper" id="target" style="overflow-y:scroll; overmflow-x:hidden; height:300px; ">
							<table summary="사원정보리스트" style="font:100%/1.5em Gulim;">
								<caption>사원정보리스트</caption>
								<thead>
									<tr>
										<th><spring:message code="sample.office.employee.num" /></th>
										<th><spring:message code="sample.office.employee.name" /></th>
										<th><spring:message code="sample.office.employee.joblevel" /></th>
										<th><spring:message code="sample.office.employee.skill" /></th>
										<th><spring:message code="sample.office.employee.telephone" /></th>
										<th class="Llast"><spring:message code="sample.office.employee.birthdate" /></th>
									</tr>
								</thead>
								<tbody id="employeeArea" >
									<c:forEach items="${resultList}" varStatus="i">
										<c:set var="index" value="${i.index}" />
										<tr style="cursor: pointer" onclick="fnUpdate('${resultList[index].num}');">		
											<td class="Lfirst"><c:out value="${resultList[index].num}" /></td>
											<td>${resultList[index].name}</td>
											<td>${resultList[index].joblevelCodeName}</td>
											<td>${resultList[index].skillCodeName}</td>
											<td>${resultList[index].telephone}</td>
											<td class="Llast">${resultList[index].birthdate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</form>
			</Tag:scrollPaging>
		</div>

	<div id="LblockButton">
	    <a class="Lbtn" href="#" onclick="fnAdd();return false"><span><spring:message code="common.label.create"/></span></a>
	</div>

</div>