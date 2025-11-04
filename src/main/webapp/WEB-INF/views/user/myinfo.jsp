<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>내 정보 | Criminaleyes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4 fw-bold">내 계정 정보</h2>
    <table class="table table-bordered">
        <tr><th>아이디</th><td>${rDTO.userId}</td></tr>
        <tr><th>이름</th><td>${rDTO.userName}</td></tr>
        <tr><th>이메일</th><td>${rDTO.email}</td></tr>
        <tr><th>주소</th><td>${rDTO.addr1} ${rDTO.addr2}</td></tr>
        <tr><th>가입일</th><td>${rDTO.regDt}</td></tr>
    </table>
    <a href="/" class="btn btn-secondary">메인으로</a>
</div>
</body>
</html>
