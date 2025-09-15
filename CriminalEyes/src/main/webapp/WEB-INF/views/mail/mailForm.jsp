<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>메일 작성하기</title>
    <link rel="stylesheet" href="/css/table.css"/>
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        // HTML 문서가 로딩된 후 실행됨
        $(document).ready(function () {

            // 버튼 클릭했을 때, 발생되는 이벤트 생성 (onclick 이벤트와 동일함)
            $("#btnSend").on("click", function () {

                // ajax 호출해서 폼 등록하기
                $.ajax({
                    url: "/mail/sendMail", // 요청 URL
                    type: "post",          // 전송방식은 Post
                    dataType: "JSON",      // 응답 결과는 JSON으로 받기
                    data: $("#f").serialize(), // form 태그 내 input 등 객체를 자동으로 전송할 형태로 변환하여 전달
                    success: function (json) {
                        // 요청 성공 시 실행
                        alert(json.msg); // 서버에서 전달된 메시지 출력
                    }
                })
            })
        })
    </script>
</head>
<body>
<h2>메일 작성하기</h2>
<hr/>
<br/>

<form id="f">
    <div class="divTable minimalistBlack">
        <div class="divTableBody">

            <!-- 받는 사람 -->
            <div class="divTableRow">
                <div class="divTableCell">받는사람</div>
                <div class="divTableCell">
                    <input type="text" name="toMail" maxlength="100" style="width: 95%"/>
                </div>
            </div>

            <!-- 메일 제목 -->
            <div class="divTableRow">
                <div class="divTableCell">메일제목</div>
                <div class="divTableCell">
                    <input type="text" name="title" maxlength="100" style="width: 95%"/>
                </div>
            </div>

            <!-- 메일 내용 -->
            <div class="divTableRow">
                <div class="divTableCell">메일내용</div>
                <div class="divTableCell">
                    <textarea name="contents" style="width: 95%; height: 400px"></textarea>
                </div>
            </div>
        </div>
    </div>

    <!-- 버튼 영역 -->
    <div>
        <button id="btnSend" type="button">메일 발송</button>
        <button type="reset">다시 작성</button>
    </div>
</form>
</body>
</html>
