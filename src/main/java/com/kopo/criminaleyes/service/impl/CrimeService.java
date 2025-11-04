package com.kopo.criminaleyes.service.impl;

import com.kopo.criminaleyes.dto.CrimeDTO;
import com.kopo.criminaleyes.mapper.CrimeMapper;
import com.kopo.criminaleyes.service.ICrimeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CrimeService implements ICrimeService {

    private final CrimeMapper crimeMapper;

    @Override
    public List<CrimeDTO> getAllCrimes() {
        return crimeMapper.getAllCrimes();
    }
}