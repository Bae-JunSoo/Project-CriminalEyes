<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Criminaleyes | 내 주변 안전 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        #map {
            width: 100%;
            height: 500px;
            margin-top: 20px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body class="bg-light">

<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="/">Criminaleyes</a>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="fw-bold mb-3 text-center">내 주변 안전 지도</h2>
    <p class="text-muted text-center">주소를 검색하면 해당 위치를 기준으로 지도가 표시됩니다.</p>

    <!-- 주소 검색창 -->
    <div class="input-group mb-3">
        <input type="text" id="address" class="form-control" placeholder="주소를 입력하세요">
        <button class="btn btn-primary" id="searchBtn">검색</button>
    </div>

    <!-- 지도 영역 -->
    <div id="map"></div>
</div>

<!-- 푸터 -->
<footer class="bg-dark text-white text-center mt-5 p-3">
    <small>© 2025 Criminaleyes. All Rights Reserved.</small>
</footer>

<!-- Kakao Map API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=992d0fb37a356d0efb02ee5300812c81"></script>
<script>
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780), // 기본 서울 시청 좌표
        level: 5
    };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var geocoder = new kakao.maps.services.Geocoder();
    var marker = new kakao.maps.Marker({ map: map });

    document.getElementById("searchBtn").addEventListener("click", function () {
        var address = document.getElementById("address").value;
        if (!address) {
            alert("주소를 입력하세요.");
            return;
        }

        geocoder.addressSearch(address, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                map.setCenter(coords);
                marker.setPosition(coords);
            } else {
                alert("주소를 찾을 수 없습니다.");
            }
        });
    });
</script>
</body>
</html>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="utf-8"/>--%>
<%--    <title>Kakao 지도 시작하기</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id="map" style="width:500px;height:400px;"></div>--%>
<%--<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=992d0fb37a356d0efb02ee5300812c81"></script>--%>
<%--<script>--%>
<%--    var container = document.getElementById('map');--%>
<%--    var options = {--%>
<%--        center: new kakao.maps.LatLng(33.450701, 126.570667),--%>
<%--        level: 3--%>
<%--    };--%>

<%--    var map = new kakao.maps.Map(container, options);--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>