package com.kopo.criminaleyes.mapper;

import com.kopo.criminaleyes.dto.CrimeDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface CrimeMapper {
    List<CrimeDTO> getAllCrimes();

    void insertCrime(CrimeDTO crime);
}