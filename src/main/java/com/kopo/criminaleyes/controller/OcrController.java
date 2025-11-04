package com.kopo.criminaleyes.controller;

import com.kopo.criminaleyes.dto.OcrDTO;
import com.kopo.criminaleyes.service.IOcrService;
import com.kopo.criminaleyes.service.impl.OcrService;
import com.kopo.criminaleyes.util.CmmUtil;
import com.kopo.criminaleyes.util.DateUtil;
import com.kopo.criminaleyes.util.FileUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;


import java.util.Objects;
import java.util.Optional;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/ocr")
public class OcrController {

    private final IOcrService ocrService;

    final private String FILE_UPLOAD_SAVE_PATH = "C:/upload";

    @GetMapping(value = "uploadImage")
    public String uploadImage() {
        log.info("{}.uploadImage!", this.getClass().getName());

        return "ocr/uploadImage";
    }

    @PostMapping(value = "readImage")
    public String readImage(ModelMap model, @RequestParam(value = "fileupload")MultipartFile mf)
            throws Exception {
        log.info("{}.readImage Start!", this.getClass().getName());

        String res;

        String originalFilename = mf.getOriginalFilename();

        String ext = Objects.requireNonNull(originalFilename).substring(originalFilename.lastIndexOf(".") + 1,
                originalFilename.length()).toLowerCase();

        // 이미지 파일만 업로드되도록 함
        if (ext.equals("jpeg") || ext.equals("jpg") || ext.equals("gif") || ext.equals("png")) {

            // 서버에 저장되는 파일 이름
            // 저장 시 파일명 중복 방지, 특수 문자를 지정할 수 있기 때문에 강제로 영문자 숫자로 구성된 파일명으로 변경 저장한다.
            // 시스템에서 유일한 파일명을 만들기 위해 날짜 값을 파일명으로 만든다.
            String saveFileName = DateUtil.getDateTime("HHmmss") + "." + ext;

            // 웹서버에 업로드될 파일 저장하는 물리적 경로
            String saveFilePath = FileUtil.mkdirForDate(FILE_UPLOAD_SAVE_PATH);

            String fullFileInfo = saveFilePath + "/" + saveFileName;

            // 정상적으로 값이 생성되었는지 로그 찍어서 확인
            log.info("ext : " + ext);
            log.info("saveFileName : " + saveFileName);
            log.info("saveFilePath : " + saveFilePath);
            log.info("fullFileInfo : " + fullFileInfo);

            // 업로드 되는 파일을 서버에 저장
            mf.transferTo(new File(fullFileInfo));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

            OcrDTO pDTO = new OcrDTO();
            String originalFileName = mf.getOriginalFilename();
            pDTO.setOrgFileName(originalFileName);

            pDTO.setFileName(saveFileName);   // 저장되는 파일명
            pDTO.setFilePath(saveFilePath);   // 저장되는 경로
            pDTO.setExt(ext);                // 확장자
            pDTO.setOrgFileName(originalFileName); // 원래이름
            pDTO.setRegId("admin");

            // ocrService.getReadforImageText(pDTO) 결과를 Null 값 체크하여 rDTO 객체에 저장하기
            OcrDTO rDTO = Optional.ofNullable(ocrService.getReadforImageText(pDTO))
                    .orElseGet(OcrDTO::new);

            res = CmmUtil.nvl(rDTO.getTextFromImage()); // 인식 결과

            rDTO = null;
            pDTO = null;

        } else {
            res = "이미지 파일이 아니라서 인식이 불가능합니다.";
        }
        model.addAttribute("res", res);

        log.info("{}.readImage End!", this.getClass().getName());

        return "ocr/readImage";
    }
}
