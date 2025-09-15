<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kopo.criminaleyes.dto.UserinfoDTO" %>
<%@ page import="com.kopo.criminaleyes.util.CmmUtil" %>

<%
    String sUserName = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME")); // 로그인한 회원 이름
    String sUserId = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID")); // 로그인한 회원 아이디
%>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>로그인하기</title>
    <link rel="stylesheet" href="/css/table.css"/>
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        // HTML로딩이 완료되고, 실행됨
        $(document).ready(function () {
            // 버튼 클릭했을때, 발생되는 이벤트 생성( onclick 이벤트와 동일함)
            $("#btnSend").on("click", function () {
                location.href = "/html/index.html";
            })
        })
    </script>
</head>

<body>
<div class="divTable minimalistBlack">
    <div class="divTableBody">
        <div class="divTableRow">
            <div class="divTableCell">로그인된 사용자이름</div>
            <div class="divTableCell"><%=sUserName%>님이 로그인하였습니다.</div>
        </div>
        <div class="divTableRow">
            <div class="divTableCell">로그인된 사용자아이디</div>
            <div class="divTableCell"><%=sUserId%> 입니다.</div>
        </div>
    </div>
</div>
<br/><br/>
<button id="btnSend" type="button">메인 화면 이동</button>
</body>
</html>

