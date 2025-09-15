<%--
  Created by IntelliJ IDEA.
  User: data8320-13
  Date: 2025-08-29
  Time: 오후 5:07
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Criminaleyes | 메인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Hero 섹션 */
        .hero {
            position: relative;
            width: 100%;
            height: 100vh;
            background-image: url("/images/cre.png");
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: #fff;
            text-align: center;
        }

        .hero h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-shadow: 0px 0px 15px rgba(0, 255, 255, 0.7);
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            color: #cfd8dc;
        }

        .hero button {
            background: #00e5ff;
            color: #000;
            font-size: 1.1rem;
            font-weight: bold;
            padding: 15px 40px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            box-shadow: 0 0 15px #00e5ff;
            transition: all 0.3s ease-in-out;
        }

        .hero button:hover {
            background: #00bcd4;
            box-shadow: 0 0 20px #00bcd4;
        }

        /* 기존 페이지 여백 조정 */
        .main-content {
            margin-top: 80px;
        }
    </style>
</head>
<body class="bg-light">

<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="/">Criminaleyes</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
                <li class="nav-item"><a class="nav-link" href="/signup">회원가입</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero 섹션 -->
<section class="hero">
    <h1>우리 동네 안전 지도,<br>데이터로 한눈에 확인하세요</h1>
    <button onclick="location.href='<%=request.getContextPath()%>/safety/info'">
        내 주변 안전 정보 확인하기
    </button>
</section>

<!-- 메인 컨테이너 -->
<div class="container mt-5 text-center main-content">
    <h1 class="fw-bold mb-3">🚨 Criminaleyes</h1>
    <p class="text-muted mb-4">
        위치 기반 범죄 정보 조회 서비스<br>
        안전한 일상을 위해 최신 범죄 데이터를 제공합니다.
    </p>
</div>

<!-- 카드 섹션 -->
<div class="container mt-5">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card shadow-sm rounded-4 h-100">
                <div class="card-body">
                    <h5 class="card-title">📍 위치 기반 검색</h5>
                    <p class="card-text">내 주변 범죄 발생 현황을 한눈에 확인할 수 있습니다.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow-sm rounded-4 h-100">
                <div class="card-body">
                    <h5 class="card-title">📊 데이터 시각화</h5>
                    <p class="card-text">범죄 유형, 발생 시간, 지역별 통계를 시각적으로 제공합니다.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow-sm rounded-4 h-100">
                <div class="card-body">
                    <h5 class="card-title">⭐ 맞춤 서비스</h5>
                    <p class="card-text">즐겨찾기와 범죄 예방 팁으로 개인 맞춤형 안전 정보를 제공합니다.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 푸터 -->
<footer class="bg-dark text-white text-center mt-5 p-3">
    <small>© 2025 Criminaleyes. All Rights Reserved.</small>
</footer>

</body>
</html>
