package com.fusion.controller;

import com.fusion.domain.GalleryVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
@Controller
public class GalleryController {

    private static final String ROOTPATH = "C://GalleryImages/";

    @GetMapping("/gallery/galleryPost")
    public String goGalleryPost() {
        return "/WEB-INF/jsp/gallery/galleryPost";
    }

    @PostMapping("/gallery/galleryPost")
    public String galleryPost(GalleryVO galleryVO, @RequestParam MultipartFile[] files) throws IOException {
        galleryVO.setWriter(1);
        String content = new String(Objects.requireNonNull(galleryVO.getContent()).getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

        Pattern pattern = Pattern.compile("#(\\S+)");
        Matcher matcher = pattern.matcher(content);
        List<String> tags = new ArrayList<>();

        while(matcher.find()) {
            tags.add((matcher.group(1)));
        }
        for(String tag : tags) {
            content = content.replace("#" + tag, "");
            log.info("태그 = {}", tag);
        }
        galleryVO.setContent(content);
        log.info(galleryVO.toString());
        for(MultipartFile file : files) {
            if(!file.isEmpty()) {
                String uuid = UUID.randomUUID().toString();
                log.info(file.getName());
                String saveFileName = new String(Objects.requireNonNull(file.getOriginalFilename()).getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
                log.info(saveFileName);
                log.info(file.getContentType());
                log.info(String.valueOf(file.getSize()));
                file.transferTo(new File(ROOTPATH, uuid + "_" + saveFileName));

                File thumbFile = new File(new File(ROOTPATH, "thumb_" + uuid + "_" + saveFileName).toURI());

                Thumbnails.of(new File(ROOTPATH, uuid + "_" + saveFileName)).size(250, 250).toFile(thumbFile);
            }
        }

        return "redirect:/gallery/galleryPost";
    }
}
