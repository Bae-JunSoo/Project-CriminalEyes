<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            // 로그인 화면 이동
            $("#btnLogin").on("click", function () {
                location.href = "/user/login";
            });

            // 아이디 찾기
            $("#btnSearchUserId").on("click", function () {
                let f = document.getElementById("f");

                if (f.userName.value.trim() === "") {
                    alert("이름을 입력하세요.");
                    f.userName.focus();
                    return;
                }

                if (f.email.value.trim() === "") {
                    alert("이메일을 입력하세요.");
                    f.email.focus();
                    return;
                }

                f.submit();
            });

        });
    </script>
</head>

<body class="bg-light">

<!-- 메인 컨테이너 -->
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-sm rounded-4 p-4" style="max-width: 400px; width: 100%;">
        <h3 class="text-center mb-4">아이디 찾기</h3>

        <form id="f" method="post" action="/user/searchUserIdProc">
            <div class="mb-3">
                <label for="userName" class="form-label">이름</label>
                <input type="text" class="form-control" name="userName" id="userName" placeholder="이름을 입력하세요">
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="example@email.com">
            </div>

            <div class="d-grid gap-2">
                <button id="btnSearchUserId" type="button" class="btn btn-primary">아이디 찾기</button>
                <button id="btnLogin" type="button" class="btn btn-secondary">로그인으로 돌아가기</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
