<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.kopo.criminaleyes.util.CmmUtil" %>
<%@ page import="com.kopo.criminaleyes.dto.MailInfoDTO" %>
<%
    // NoticeController 함수에서 model 객체에 저장된 값 불러오기
    MailInfoDTO rDTO = (MailInfoDTO) request.getAttribute("rDTO");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시판 글보기</title>
    <link rel="stylesheet" href="/css/table.css"/>
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>메일 상세보기</h2>
<hr/>
<br/>
<div class="divTable minimalistBlack">
    <div class="divTableBody">
        <div class="divTableRow">
            <div class="divTableCell">제목
            </div>
            <div class="divTableCell"><%=CmmUtil.nvl(rDTO.getSubject())%>
            </div>
        </div>
        <div class="divTableRow">
            <div class="divTableCell">작성일
            </div>
            <div class="divTableCell"><%=CmmUtil.nvl(rDTO.getSentAt())%>
            </div>
        </div>
        <div class="divTableRow">
            <div class="divTableCell">받는사람
            </div>
            <div class="divTableCell"><%=CmmUtil.nvl(rDTO.getRecipientEmail())%>
            </div>
        </div>
        <div class="divTableRow">
            <div class="divTableCell">내용
            </div>
            <div class="divTableCell"><%=CmmUtil.nvl(rDTO.getContent())%>
            </div>
        </div>
    </div>
</div>

</body>
</html>
