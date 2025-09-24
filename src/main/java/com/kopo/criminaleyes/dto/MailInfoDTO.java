package com.kopo.criminaleyes.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MailInfoDTO {

    private String mailId;

    private String recipientEmail;

    private String subject;

    private String content;

    private String sentAt;
}
