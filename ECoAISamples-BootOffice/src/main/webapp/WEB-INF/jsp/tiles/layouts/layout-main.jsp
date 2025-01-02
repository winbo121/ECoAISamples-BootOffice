<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--  meta http-equiv="Cache-Control" content="no-cache; no-store; no-save" -->

<title><tiles:getAsString name="title"/></title>

<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/base.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/global_style.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/global_layout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/main.css'/>" />
<script type="text/javascript" src="<c:url value='/resource/js/dui_prototype.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_effect.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_dragndrop.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_hhmenu.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_tree.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_slidemenu.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_tab.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/dui_calendar.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/jquery/jquery-1.8.3.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/common/office.common.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/common/office.ajax.js'/>"></script>
</head>
<body>

<div id="LblockSkipLink">
	<p><a href="#LblockTopMenu">주메뉴 바로가기</a></p>
	<p><a href="#LblockLeftMenu">서브메뉴 바로가기</a></p>
	<p><a href="#LblockBody">콘텐츠 바로가기</a></p>
</div>

<div id="LblockWrapper">

<tiles:insertAttribute name="header" />

<tiles:insertAttribute name="content" />

<tiles:insertAttribute name="footer" />

</div>

<Tag:saymessage/>
</body>
</html>
