package com.kopo.criminaleyes.controller;

import com.kopo.criminaleyes.dto.MailInfoDTO;
import com.kopo.criminaleyes.dto.NoticeDTO;
import com.kopo.criminaleyes.mapper.IMailListMapper;
import com.kopo.criminaleyes.service.IMailListService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping(value="/mailinfo")
public class MailInfoController {

    private final IMailListService mailListService;

    @GetMapping(value = "/mailList")
    public String mailList(HttpSession session, ModelMap model) throws Exception{

        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info("{}.mailList start!", this.getClass().getName());

        // 로그인된 사용자 아이디는 Session에 저장함
        // 교육용으로 아직 로그인을 구현하지 않았기 때문에 Session에 데이터를 저장하지 않았음
        // 추후 로그인을 구현할 것으로 가정하고, 공지사항 리스트 출력하는 함수에서 로그인 한 것처럼 Session 값을 생성함

        session.setAttribute("SESSION_USER_ID", "USER01");

        // 골지사항 리스트 조회하기
        // JAVA 8 부터 제공되는 Optional 활용하여 NPE(Null Pointer Exception) 처리
        List<MailInfoDTO> rList = Optional.ofNullable(mailListService.getMailList())
                .orElseGet(ArrayList::new);

        // List<NoticeDTO> rList = noticeService.getNoticeList();

        // if (rList == null) {
        //     rList = new ArrayList<>();
        // }

        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("rList", rList);

        // 로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
        log.info(this.getClass().getName()+".mailList end!");

        // 함수 처리가 끝나고 보여줄 JSP 파일명
        // webapp/WEB-INF/views/notice/mailList.jsp
        return "notice/mailList";
    }
}
