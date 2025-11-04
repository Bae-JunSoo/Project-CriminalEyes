package com.kopo.criminaleyes.service;

import com.kopo.criminaleyes.dto.MailInfoDTO;
import com.kopo.criminaleyes.mapper.IMailListMapper;
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

    @Override
    public void insertMailList(MailInfoDTO pDTO) throws Exception {

        log.info("MailListService insertMailList start!");

        mailListMapper.insertMailList(pDTO);

    }

    @Override
    public MailInfoDTO selectMailList(MailInfoDTO pDTO) throws Exception {

        log.info("MailListService selectMailList start!");

        return mailListMapper.selectMailList(pDTO);
    }
}
