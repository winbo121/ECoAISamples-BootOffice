<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : fileUploadForm.jsp
 * DESC : 파일업로드 예제
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
	function fnSave() {
		document.detailForm.action = "<c:url value='/function/fileupload/insertFileInfo.do'/>";
		document.detailForm.submit();
	}

	function fnReset() {
		document.detailForm.action = "<c:url value='/function/fileupload/fileUploadForm.do'/>";
		document.detailForm.submit();
	}
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>File Upload</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">Function</a></span></li>
				<li><span><a href="#">Presentation</a></span></li>
				<li class="Llast"><span>File Upload</span></li>
			</ul>
		</div>

	</div>
	<div id="LblockBodyMain">

		<div id="LblockContent01" class="LblockContent">
			FileUpload는 FileUploadPloicy를 적용하여 파일을 지정한 폴더에 저장한다.<br>
			upload된 파일 정보는 File DownLoad 메뉴를 통해 확인할 수 있습니다. <br>
			<br>
			<ul>
				<li>Wiki : <a href="http://www.dev-on.com/devonframe/wiki/doku.php?id=devonboot:component:online:fileupload" target="_blank">fileupload</a>	</li>
				<br>
				<li>설정</li> 
				- yml 설정 : /resources/application.yml(Prefix: devon.resolver.exception)<br/>
			    - Mybatis Mapper 파일 : /resources/sql/h2/function/sql-fileInfo.xml
				<br>
			</ul>
			<br>
			allow pattern : * , deny pattern : *.ext, *.jsp
		</div>

		<form name="detailForm" id="detailForm" method="post" enctype="multipart/form-data">
			<div id="LblockDetail01" class="LblockDetail">
				<table summary="파일 상세정보">
					<caption>파일 상세정보</caption>
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: 35%;" />
						<col style="width: 15%;" />
						<col style="width: 35%;" />
					</colgroup>
					<tbody>
						<tr>
							<th>파일선택</th>
							<td colspan="3"><input type="file" id="uploadFile"	name="uploadFile" class="Lbtn"></td>
						</tr>
						<tr>
							<th>파일명</th>
							<td>${fileInfo.fileName}</td>
							<th>파일크기</th>
							<td>${fileInfo.fileSize}Bytes</td>
						</tr>
						<tr>
							<th>업로드파일경로</th>
							<td colspan="3">${fileInfo.uploadFilePath}</td>
						</tr>
						<tr>
							<th>업로드파일명</th>
							<td>${fileInfo.uploadFileName}</td>
							<th>업로드일자</th>
							<td>${fileInfo.uploadDate}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>

	<div id="LblockButton">
		<c:choose>
			<c:when test="${empty fileInfo.fileName}">
				<a class="Lbtn" href="#" onclick="fnSave();return false;">
				<span><spring:message code="common.label.save" /></span></a>
			</c:when>
		</c:choose>
		<a class="Lbtn" href="#" onclick="fnReset();return false;"><span>초기화</span></a>
	</div>
</div>