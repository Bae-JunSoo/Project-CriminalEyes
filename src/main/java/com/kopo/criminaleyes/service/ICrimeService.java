package com.kopo.criminaleyes.service;

import com.kopo.criminaleyes.dto.CrimeDTO;
import java.util.List;

public interface ICrimeService {
    List<CrimeDTO> getAllCrimes();
}