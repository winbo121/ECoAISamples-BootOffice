<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : fileDownloadList.jsp
 * DESC : 파일다운로드 예제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript" language="javascript">
	function fnRetrieve() {
		document.searchForm.action = "<c:url value="/function/filedownload/retrieveFileDownloadList.do"/>";
		document.searchForm.submit();
	}

	function fnSelectAll(checkbox) {
		if (checkbox.checked) {
			$(".Lcheckbox").attr("checked", true);
		} else {
			$(".Lcheckbox").removeAttr("checked");
		}
	}

	function fnDownload() {
		document.listForm.action = "<c:url value="/function/filedownload/downloadFileList.do"/>";
		document.listForm.submit();
	}

	function fnDelete() {
		document.listForm.action = "<c:url value="/function/filedownload/deleteFileList.do"/>";
		document.listForm.submit();
	}
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>File Download</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Presentation</a></span></li>
				<li class="Llast"><span>File Download</span></li>
			</ul>
		</div>

	</div>

	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			FileDownLoad는 FileUpload를 통하여 저장한 파일의 목록을 보여준다.
			<br>
			<br>
			단건 다운로드시 해당 파일명으로 다운로드 되며, 다건 다운로드시 "FileDownloadArray.zip" 으로 다운로드 된다.
			삭제시 데이터베이스에서 해당 목록을 삭제하며 저장한 파일도 함께 삭제한다.
			<br>
			<br>
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonframe:component:online:filedownload" target="_blank">filedownload</a></li>
				<br>
				<li>설정</li> - Mybatis Mapper 파일 : /resources/sql/h2/sql-fileInfo.xml
			</ul>
			<br>
		</div>

		<form:form modelAttribute="input" name="searchForm" id="searchForm" method="post" onsubmit="fnRetrieve();return false;">
			<div id="LblockSearch">
				<div>
					<div>
						<div>
							<table summary="파일 검색조건">
								<caption>파일 검색조건</caption>
								<colgroup>
									<col style="width: 20%;" />
									<col style="width: 30%;" />
									<col style="width: 20%;" />
									<col style="width: 30%;" />
								</colgroup>
								<tbody>
									<tr>
										<th>파일명</th>
										<td><form:input path="fileName" id="fileName" cssClass="Ltext" /></td>
										<th>업로드일자</th>
										<td>
											<form:input path="uploadDate" id="uploadDate" cssClass="Ltext" size="10" maxlength="8" readonly="readonly"/>
											<a href="#"	onclick="dui.Calendar.open('uploadDate', 'YYYYMMDD'); return false;">	<img class="Lbtn" src="<c:url value="/resource/images/btn_icon_calendar.gif"/>"	alt="날짜" /></a>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="image" class="Limage"	onclick="fnRetrieve();return false;"
								src="<c:url value="/resource/images/btn_search.gif"/>"	alt="search button" border="0" />
						</div>
					</div>
				</div>
			</div>
		</form:form>
		<form:form modelAttribute="resultList" name="listForm" id="listForm" method="post">
			<input type="hidden" name="searchFileName" value="${input.fileName}" />
			<input type="hidden" name="searchUploadDate" value="${input.uploadDate}" />
			<div id="LblockListTable01" class="LblockListTable">
				<div class="Lwrapper">
					<table summary="파일 리스트">
						<caption>파일 리스트</caption>
						<thead>
							<tr>
								<th width="25"><input type="checkbox" class="Lcheckbox"	onclick="fnSelectAll(this)" /></th>
								<th>파일명</th>
								<th>업로드파일경로</th>
								<th>업로드파일명</th>
								<th>파일크기</th>
								<th>업로드일자</th>
							</tr>
						</thead>
						<tbody id="fileInfoArea">
							<c:forEach items="${resultList}" var="result" varStatus="i">
								<c:set var="index" value="${i.index}" />
								<tr class="Lfirst">
									<td class="Lfirst">
										<input type="checkbox" class="Lcheckbox" name="checkIndex" value="${i.index}" />
										<input type="hidden" name="fileName" value="${result.fileName}" />
									</td>
									<td>${result.fileName}</td>
									<td>
										<input type="text" name="uploadFilePath" size="45" class="Ltext"
										value="<c:out value="${result.uploadFilePath}"/>" readonly="readonly" />
									</td>
									<td>${result.uploadFileName}</td>
									<td>${result.fileSize}</td>
									<td>${result.uploadDate}</td>
								</tr>
							</c:forEach>
							<c:if test="${empty resultList && !empty input}">
								<tr id="empty" style="background-color: #FFFFFF">
									<td height="25" colspan="7"><spring:message	code="dev.inf.com.nodata" /></td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>

		</form:form>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#">
			<span onclick="fnDelete();"><spring:message	code="common.label.delete" /></span>
		</a>
		<a class="Lbtn" href="#"><span onclick="fnDownload();">다운로드</span></a>
	</div>

</div>