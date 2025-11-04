package com.kopo.criminaleyes.mapper;

import com.kopo.criminaleyes.dto.MailDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface IMailMapper {
    // 기능 1: 메일 발송 이력 저장하기
    void insertMailInfo(MailDTO pDTO) throws Exception;

    // 기능 2: 메일 발송 리스트 전체 가져오기
    List<MailDTO> getMailList() throws Exception;

    // 기능 3: 특정 메일 1개의 상세 정보 가져오기
    MailDTO getMailDetail(MailDTO pDTO) throws Exception;

}
