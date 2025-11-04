package com.kopo.criminaleyes.service.impl;

import com.kopo.criminaleyes.dto.SpamDTO;
import com.kopo.criminaleyes.service.ISpamService;
import com.kopo.criminaleyes.service.ITestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


@Slf4j
@RequiredArgsConstructor
@Service
public class SpamService implements ITestService {

    @Override
    public SpamDTO test(SpamDTO pDTO) {
        return pDTO;
    }
}
