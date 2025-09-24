<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<%@ page import="com.kopo.criminaleyes.util.CmmUtil" %>

<%@ page import="com.kopo.criminaleyes.dto.MailInfoDTO" %>
<%@ page import="com.kopo.criminaleyes.dto.NoticeDTO" %>
<%
    // NoticeController 함수에서 model 객체에 저장된 값 불러오기
    List<MailInfoDTO> rList = (List<MailInfoDTO>) request.getAttribute("rList");
%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>공지 리스트</title>
    <link rel="stylesheet" href="/css/table.css"/>
    <script type="text/javascript">

        //상세보기 이동
        function doDetail(seq) {
            location.href = "/notice/noticeInfo?nSeq=" + seq;
        }

    </script>
</head>
<body>
<h2>공지사항</h2>
<hr/>
<br/>
<div class="divTable minimalistBlack">
    <div class="divTableHeading">
        <div class="divTableRow">
            <div class="divTableHead">순번</div>
            <div class="divTableHead">제목</div>
            <div class="divTableHead">받는사람</div>
            <div class="divTableHead">등록한일자</div>
        </div>
    </div>
    <div class="divTableBody">
        <%
            for (MailInfoDTO dto : rList) {
        %>
        <div class="divTableRow">
            <div class="divTableCell"><%=CmmUtil.nvl(dto.getMailId())%>
            </div>
            <div class="divTableCell"
                 onclick="doDetail('<%=CmmUtil.nvl(dto.getMailId())%>')"><%=CmmUtil.nvl(dto.getSubject())%>
            </div>
            <div class="divTableCell"><%=CmmUtil.nvl(dto.getRecipientEmail())%>
            </div>
            <div class="divTableCell"><%=CmmUtil.nvl(dto.getSentAt())%>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
<a href="/notice/noticeReg">글쓰기</a>
</body>
</html>