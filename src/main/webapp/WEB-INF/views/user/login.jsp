<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 | CriminalEyes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // 회원가입
            $("#btnUserReg").on("click", function () {
                location.href = "/user/userRegForm";
            });

            // 아이디 찾기
            $("#btnSearchUserId").on("click", function () {
                location.href = "/user/searchUserId";
            });

            // 비밀번호 찾기
            $("#btnSearchPassword").on("click", function () {
                location.href = "/user/searchPassword";
            });

            // 로그인
            $("#btnLogin").on("click", function () {
                let f = document.getElementById("f");

                if (f.userId.value === "") {
                    alert("아이디를 입력하세요.");
                    f.userId.focus();
                    return;
                }
                if (f.password.value === "") {
                    alert("비밀번호를 입력하세요.");
                    f.password.focus();
                    return;
                }

                $.ajax({
                    url: "/user/loginProc",  // 보통 loginProc 소문자로 사용
                    type: "post",
                    dataType: "JSON",
                    data: $("#f").serialize(),
                    success: function (json) {
                        alert(json.msg);
                        if (json.result === 1) {
                            // 로그인 성공 → 메인 페이지 이동
                            location.href = "/";
                        } else {
                            // 로그인 실패
                            $("#userId").focus();
                        }
                    }
                });
            });
        });
    </script>
</head>

<body class="bg-light d-flex align-items-center justify-content-center vh-100">

<div class="card shadow-sm p-4 rounded-4" style="width: 400px;">
    <h2 class="text-center fw-bold mb-4">로그인</h2>
    <form id="f">
        <div class="mb-3">
            <label class="form-label">아이디</label>
            <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디 입력">
        </div>
        <div class="mb-3">
            <label class="form-label">비밀번호</label>
            <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호 입력">
        </div>
        <button id="btnLogin" type="button" class="btn btn-primary w-100 mb-3">로그인</button>
        <div class="d-flex justify-content-between">
            <button id="btnUserReg" type="button" class="btn btn-outline-secondary btn-sm">회원가입</button>
            <button id="btnSearchUserId" type="button" class="btn btn-outline-secondary btn-sm">아이디 찾기</button>
            <button id="btnSearchPassword" type="button" class="btn btn-outline-secondary btn-sm">비밀번호 찾기</button>
        </div>
    </form>
</div>

</body>
</html>
