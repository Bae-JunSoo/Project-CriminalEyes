package com.kopo.criminaleyes.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CrimeDTO {
    private int crimeId;          // PK
    private String crimeType;     // 범죄유형
    private double lat;           // 위도
    private double lng;           // 경도
    private String region;        // 지역명
    private String description;   // 설명
    private String occurredAt;    // 발생 일시
}
