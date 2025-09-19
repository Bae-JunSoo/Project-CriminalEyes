<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입 | CriminalEyes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 주소 API -->
    <script type="text/javascript">
        let userIdCheck = "Y";  // 아이디 중복 여부
        let emailAuthNumber = "";  // 이메일 인증번호

        $(document).ready(function () {
            let f = document.getElementById("f");

            // 아이디 중복체크
            $("#btnUserId").on("click", function () {
                userIdExists(f);
            });

            // 이메일 중복체크
            $("#btnEmail").on("click", function () {
                emailExists(f);
            });

            // 우편번호 찾기
            $("#btnAddr").on("click", function () {
                kakaoPost(f);
            });

            // 회원가입
            $("#btnSend").on("click", function () {
                doSubmit(f);
            });
        });

        // 아이디 중복 체크
        function userIdExists(f) {
            if (f.userId.value === "") {
                alert("아이디를 입력하세요.");
                f.userId.focus();
                return;
            }

            $.ajax({
                url: "/user/getUserIdExists",
                type: "post",
                dataType: "JSON",
                data: $("#f").serialize(),
                success: function (json) {
                    if (json.existsYn === "Y") {
                        alert("이미 가입된 아이디가 존재합니다.");
                        f.userId.focus();
                    } else {
                        alert("사용 가능한 아이디입니다.");
                        userIdCheck = "N";
                    }
                }
            });
        }

        // 이메일 중복 체크
        function emailExists(f) {
            if (f.email.value === "") {
                alert("이메일을 입력하세요.");
                f.email.focus();
                return;
            }

            $.ajax({
                url: "/user/getEmailExists",
                type: "post",
                dataType: "JSON",
                data: $("#f").serialize(),
                success: function (json) {
                    if (json.existsYn === "Y") {
                        alert("이미 가입된 이메일입니다.");
                        f.email.focus();
                    } else {
                        alert("인증번호가 이메일로 발송되었습니다.");
                        emailAuthNumber = json.authNumber;
                    }
                }
            });
        }

        // 카카오 주소 API
        function kakaoPost(f) {
            new daum.Postcode({
                oncomplete: function (data) {
                    f.addr1.value = "(" + data.zonecode + ") " + data.address;
                }
            }).open();
        }

        // 회원가입 제출
        function doSubmit(f) {
            if (f.userId.value === "") {
                alert("아이디를 입력하세요.");
                f.userId.focus();
                return;
            }
            if (userIdCheck !== "N") {
                alert("아이디 중복 체크를 완료해주세요.");
                return;
            }
            if (f.userName.value === "") {
                alert("이름을 입력하세요.");
                f.userName.focus();
                return;
            }
            if (f.password.value === "" || f.password2.value === "") {
                alert("비밀번호를 입력하세요.");
                f.password.focus();
                return;
            }
            if (f.password.value !== f.password2.value) {
                alert("비밀번호가 일치하지 않습니다.");
                return;
            }
            if (f.email.value === "") {
                alert("이메일을 입력하세요.");
                return;
            }
            if (f.authNumber.value === "" || f.authNumber.value !== emailAuthNumber) {
                alert("이메일 인증번호가 일치하지 않습니다.");
                return;
            }
            if (f.addr1.value === "") {
                alert("주소를 입력하세요.");
                return;
            }
            if (f.addr2.value === "") {
                alert("상세 주소를 입력하세요.");
                return;
            }

            $.ajax({
                url: "/user/insertUserInfo",
                type: "post",
                dataType: "JSON",
                data: $("#f").serialize(),
                success: function (json) {
                    alert(json.msg);
                    if (json.result === 1) {
                        location.href = "/user/login";
                    }
                }
            });
        }
    </script>
</head>
<body class="bg-light d-flex align-items-center justify-content-center vh-100">

<div class="card shadow-sm p-4 rounded-4" style="width: 500px;">
    <h2 class="text-center fw-bold mb-4">회원가입</h2>
    <form id="f">
        <div class="mb-3">
            <label class="form-label">아이디</label>
            <div class="input-group">
                <input type="text" name="userId" class="form-control" placeholder="아이디 입력">
                <button id="btnUserId" type="button" class="btn btn-outline-secondary">중복체크</button>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">이름</label>
            <input type="text" name="userName" class="form-control" placeholder="이름 입력">
        </div>
        <div class="mb-3">
            <label class="form-label">비밀번호</label>
            <input type="password" name="password" class="form-control" placeholder="비밀번호 입력">
        </div>
        <div class="mb-3">
            <label class="form-label">비밀번호 확인</label>
            <input type="password" name="password2" class="form-control" placeholder="비밀번호 확인">
        </div>
        <div class="mb-3">
            <label class="form-label">이메일</label>
            <div class="input-group">
                <input type="email" name="email" class="form-control" placeholder="이메일 입력">
                <button id="btnEmail" type="button" class="btn btn-outline-secondary">중복체크</button>
            </div>
            <input type="text" name="authNumber" class="form-control mt-2" placeholder="메일 인증번호 입력">
        </div>
        <div class="mb-3">
            <label class="form-label">주소</label>
            <div class="input-group">
                <input type="text" name="addr1" class="form-control" placeholder="주소">
                <button id="btnAddr" type="button" class="btn btn-outline-secondary">우편번호 찾기</button>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">상세 주소</label>
            <input type="text" name="addr2" class="form-control" placeholder="상세 주소 입력">
        </div>
        <button id="btnSend" type="button" class="btn btn-primary w-100">회원가입</button>
    </form>
</div>

</body>
</html>
