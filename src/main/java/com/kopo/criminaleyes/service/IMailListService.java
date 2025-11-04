package com.kopo.criminaleyes.service;

import com.kopo.criminaleyes.dto.MailInfoDTO;
import com.kopo.criminaleyes.dto.NoticeDTO;

import java.util.List;

public interface IMailListService {

    List<MailInfoDTO> getMailList() throws Exception;

    void insertMailList(MailInfoDTO pDTO) throws Exception;

    MailInfoDTO selectMailList(MailInfoDTO pDTO) throws Exception;

}
