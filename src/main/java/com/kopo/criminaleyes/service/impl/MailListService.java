package com.kopo.criminaleyes.service.impl;

import com.kopo.criminaleyes.dto.MailInfoDTO;
import com.kopo.criminaleyes.mapper.IMailListMapper;
import com.kopo.criminaleyes.service.IMailListService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class MailListService implements IMailListService {

    private final IMailListMapper mailListMapper;
    @Override
    public List<MailInfoDTO> getMailList() throws Exception {

        log.info("MailListService getMailList start!");

        return mailListMapper.getMailList();
    }

}
