package com.kopo.criminaleyes.service.impl;

import com.kopo.criminaleyes.service.ICrimeAPIService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@Service
public class CrimeAPIService implements ICrimeAPIService {

    // ✅ 인증키 포함된 전체 URL로 변경
    private static final String API_URL =
            "https://api.odcloud.kr/api/3074462/v1/uddi:161740bd-8ec5-4734-9a3d-f7a2cde34942"
                    + "?serviceKey=c22e8c688bdd1fe47203b384a30409acf6973a68ec97ff67974fb08462159367"
                    + "&page=1"
                    + "&perPage=100"
                    + "&returnType=JSON";

    @Override
    public JSONArray fetchCrimeData() {
        try {
            URL url = new URL(API_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), "UTF-8")
            );
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();

            System.out.println("응답 JSON: " + sb.toString()); // ✅ 응답 확인 로그

            JSONObject json = new JSONObject(sb.toString());
            JSONArray data = json.getJSONArray("data");

            return data;

        } catch (Exception e) {
            e.printStackTrace();
            return new JSONArray();
        }
    }
}
