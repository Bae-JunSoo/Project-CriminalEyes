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
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=84a966ed78c5ee7334ec7decce7e8358&libraries=services"></script>

<script>
    // ✅ 지도 초기 설정
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780), // 기본 서울시청 좌표
        level: 5
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var geocoder = new kakao.maps.services.Geocoder();
    var marker = new kakao.maps.Marker({ map: map });

    // ✅ 주소 검색 기능
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

    // ✅ DB에서 범죄 데이터 불러오기 (추가된 부분)
    fetch('/map/crime')
        .then(res => res.json())
        .then(data => {
            console.log("범죄 데이터:", data);

            if (data.length === 0) {
                console.warn("DB에 범죄 데이터가 없습니다. /map/updateCrimeData 먼저 실행하세요.");
                return;
            }

            data.forEach(c => {
                // 좌표 확인
                if (!c.lat || !c.lng) return;

                // 마커 생성
                const crimeMarker = new kakao.maps.Marker({
                    position: new kakao.maps.LatLng(c.lat, c.lng),
                    map: map
                });

                // 정보창 생성
                const infoWindow = new kakao.maps.InfoWindow({
                    content: `
                        <div style="padding:5px; text-align:center; width:160px;">
                            <b>${c.crimeType}</b><br>
                            ${c.region}<br>
                            <span style="font-size:12px;color:gray;">${c.description}</span>
                        </div>`
                });

                kakao.maps.event.addListener(crimeMarker, 'click', () => {
                    infoWindow.open(map, crimeMarker);
                });
            });
        })
        .catch(err => {
            console.error("데이터 불러오기 실패:", err);
            alert("범죄 데이터를 불러오는 중 오류가 발생했습니다.");
        });
</script>
</body>
</html>
