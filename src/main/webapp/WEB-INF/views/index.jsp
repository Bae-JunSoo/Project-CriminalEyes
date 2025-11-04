<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
        .hero::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.55);
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-shadow: 0 0 20px rgba(0, 229, 255, 0.9);
            position: relative;
            z-index: 1;
        }
        .hero p {
            font-size: 1.3rem;
            color: #cfd8dc;
            margin-bottom: 2rem;
            position: relative;
            z-index: 1;
        }
        .hero button {
            background: #00e5ff;
            color: #000;
            font-size: 1.2rem;
            font-weight: bold;
            padding: 15px 40px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            box-shadow: 0 0 15px #00e5ff;
            transition: all 0.3s ease-in-out;
            position: relative;
            z-index: 1;
        }
        .hero button:hover {
            background: #00bcd4;
            box-shadow: 0 0 20px #00bcd4;
            transform: scale(1.05);
        }
        .card {
            border: none;
            border-radius: 20px;
            transition: all 0.3s ease;
            background: #fff;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        .card-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: #0a192f;
        }
        footer {
            background: #0a192f;
            color: #fff;
        }
    </style>
</head>
<body>

<!-- 네비게이션 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/">Criminaleyes</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <c:choose>
                    <c:when test="${not empty sessionScope.SS_USER_ID}">
                        <!-- 로그인 상태 -->
                        <li class="nav-item">
                            <span class="nav-link fw-bold text-info">${sessionScope.SS_USER_NAME}님</span>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/myinfo">내 정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/logout">로그아웃</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <!-- 비로그인 상태 -->
                        <li class="nav-item">
                            <a class="nav-link" href="/user/login">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/signup">회원가입</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero -->
<section class="hero">
    <h1>우리 동네 안전 지도</h1>
    <p>데이터로 확인하는 실시간 범죄 현황</p>
    <button onclick="location.href='<%=request.getContextPath()%>/safety/info'">
        내 주변 안전 정보 확인하기
    </button>
</section>

<!-- 카드 섹션 -->
<div class="container mt-5">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <div class="card-body text-center">
                    <h5 class="card-title">📍 위치 기반 검색</h5>
                    <p class="card-text text-muted">내 주변 범죄 발생 현황을 한눈에 확인할 수 있습니다.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <div class="card-body text-center">
                    <h5 class="card-title">📊 데이터 시각화</h5>
                    <p class="card-text text-muted">범죄 유형, 발생 시간, 지역별 통계를 시각적으로 제공합니다.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <div class="card-body text-center">
                    <h5 class="card-title">⭐ 맞춤 서비스</h5>
                    <p class="card-text text-muted">즐겨찾기와 범죄 예방 팁으로 개인 맞춤형 안전 정보를 제공합니다.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 푸터 -->
<footer class="text-center mt-5 p-4">
    <small>© 2025 Criminaleyes. 데이터 기반 지역 안전 플랫폼</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
