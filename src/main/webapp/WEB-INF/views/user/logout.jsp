<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그아웃 | Criminaleyes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <style>
        /* 페이지 전체 중앙 정렬 */
        body { background-color: #f8f9fa; }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center vh-100">

<div class="card shadow-sm rounded-4 p-4" style="max-width:420px; width:100%;">
    <h3 class="text-center fw-bold mb-3">로그아웃</h3>
    <p class="text-center text-muted mb-4">정말 로그아웃 하시겠습니까?<br>로그아웃하면 보호된 기능에 접근할 수 없습니다.</p>

    <!-- 로그아웃 처리용 폼: POST 방식 (서버가 폼 POST로 로그아웃 처리할 때 사용) -->
    <form id="logoutForm" method="post" action="/user/logout">
        <!-- CSRF 토큰을 서버에서 사용하고 있다면 여기 hidden input으로 추가하세요 -->
        <!-- 예: <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> -->
        <div class="d-grid gap-2">
            <button id="btnLogout" type="button" class="btn btn-danger">로그아웃</button>
            <button id="btnCancel" type="button" class="btn btn-outline-secondary">취소</button>
        </div>
    </form>
</div>

<script>
    /**
     * logoutConfirm(로그아웃 요청을; AJAX로 서버에 /user/logout 요청을 보낸다)
     * - 서버가 JSON 응답을 반환하면 그에 따라 리다이렉트 처리
     * - 서버가 단순 POST 리다이렉트(페이지 이동) 방식이면 form.submit()을 사용
     */
    function logoutConfirm() {
        // AJAX 로그아웃 시도 (비동기)
        $.ajax({
            url: "/user/logout",      // ← 서버 로그아웃 엔드포인트에 맞게 변경
            type: "POST",
            dataType: "JSON",
            data: {},                // 필요하면 CSRF 토큰 등 추가
            success: function(json) {
                // 서버가 { result:1, msg:"로그아웃 되었습니다." } 같은 형식으로 응답하면 처리
                if (json && json.result === 1) {
                    alert(json.msg || "로그아웃 되었습니다.");
                    window.location.href = "/"; // 로그아웃 후 리디렉트 경로
                } else {
                    // 서버가 JSON이 아닌 경우 또는 실패 응답이면 폼으로 제출(서버가 POST 처리할 때)
                    alert(json && json.msg ? json.msg : "로그아웃 처리에 실패했습니다. 페이지로 이동합니다.");
                    document.getElementById("logoutForm").submit();
                }
            },
            error: function(xhr, status, err) {
                // AJAX 실패 시 폼 제출로 폴백
                console.warn("AJAX logout failed:", status, err);
                document.getElementById("logoutForm").submit();
            }
        });
    }

    $(document).ready(function() {
        $("#btnLogout").on("click", function() {
            // 확인 모달 대신 간단한 confirm 사용
            if (confirm("정말 로그아웃 하시겠습니까?")) {
                logoutConfirm();
            }
        });

        $("#btnCancel").on("click", function() {
            // 취소하면 홈으로(또는 이전 페이지로) 돌아감
            window.location.href = "/";
        });
    });
</script>
</body>
</html>
