package com.kopo.criminaleyes.mapper;

import com.kopo.criminaleyes.dto.MailInfoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMailListMapper {
    List<MailInfoDTO> getMailList() throws Exception;

    void insertMailList(MailInfoDTO pDTO) throws Exception;

    MailInfoDTO selectMailList(MailInfoDTO pDTO) throws Exception;
}
