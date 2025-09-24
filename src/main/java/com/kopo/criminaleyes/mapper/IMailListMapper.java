package com.kopo.criminaleyes.mapper;

import com.kopo.criminaleyes.dto.MailInfoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMailListMapper {
    List<MailInfoDTO> getMailList() throws Exception;
}
