package com.kopo.criminaleyes.controller;

import com.kopo.criminaleyes.dto.CrimeDTO;
import com.kopo.criminaleyes.mapper.CrimeMapper;
import com.kopo.criminaleyes.service.ICrimeAPIService;
import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class CrimeAPIController {

    private final ICrimeAPIService crimeAPIService;
    private final CrimeMapper crimeMapper;

    @GetMapping("/map/updateCrimeData")
    public String updateCrimeData() {
        JSONArray items = crimeAPIService.fetchCrimeData();
        List<CrimeDTO> list = new ArrayList<>();

        for (int i = 0; i < items.length(); i++) {
            JSONObject obj = items.getJSONObject(i);
            CrimeDTO dto = new CrimeDTO();

            // 아래 키 이름은 실제 API 응답에 따라 수정 필요
            dto.setCrimeType(obj.optString("crimeType"));
            dto.setLat(Double.parseDouble(obj.optString("latitude", "0")));
            dto.setLng(Double.parseDouble(obj.optString("longitude", "0")));
            dto.setRegion(obj.optString("sidoNm"));
            dto.setDescription(obj.optString("crimeOccurPlace"));

            crimeMapper.insertCrime(dto);
            list.add(dto);
        }

        return list.size() + "건의 공공데이터가 DB에 저장되었습니다.";
    }
}