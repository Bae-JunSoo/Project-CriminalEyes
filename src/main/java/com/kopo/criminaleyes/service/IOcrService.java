package com.kopo.criminaleyes.service;

import com.kopo.criminaleyes.dto.OcrDTO;

public interface IOcrService {

    OcrDTO getReadforImageText(OcrDTO pDTO) throws Exception;
}
