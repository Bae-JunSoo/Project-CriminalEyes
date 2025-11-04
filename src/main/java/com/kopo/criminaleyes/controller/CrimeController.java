package com.kopo.criminaleyes.controller;

import com.kopo.criminaleyes.dto.CrimeDTO;
import com.kopo.criminaleyes.mapper.CrimeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class CrimeController {

    private final CrimeMapper crimeMapper;

    // DB의 모든 범죄 데이터를 JSON 형태로 반환
    @GetMapping("/map/crime")
    public List<CrimeDTO> getCrimeList() {
        return crimeMapper.getAllCrimes();
    }
}
