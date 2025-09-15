package com.kopo.criminaleyes.service;

import com.kopo.criminaleyes.dto.MailDTO;

public interface IMailService {

    // 메일 발송
    int doSendMail(MailDTO mDTO);
}
