package com.kopo.criminaleyes.service;

import com.kopo.criminaleyes.dto.UserinfoDTO;

public interface IUserinfoService {

    // 아이디 중복 체크
    UserinfoDTO getUserIdExists(UserinfoDTO pDTO) throws Exception;

    // 이메일 주소 중복 체크 및 인증 값
    UserinfoDTO getEmailExists(UserinfoDTO pDTO) throws Exception;

    // 회원 가입하기(회원정보 등록하기)
    int insertUserInfo(UserinfoDTO pDTO) throws Exception;

    // 로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기
    UserinfoDTO getLogin(UserinfoDTO pDTO) throws Exception;

    // 아이디, 비밀번호 찾기에 활용
    UserinfoDTO searchUserIdOrPasswordProc(UserinfoDTO pDTO) throws Exception;

    // 비밀번호 재설정
    int newPasswordProc(UserinfoDTO pDTO) throws Exception;
}
