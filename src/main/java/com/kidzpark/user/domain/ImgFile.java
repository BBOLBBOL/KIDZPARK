package com.kidzpark.user.domain;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class ImgFile {
	 public static void save(//UserVo vo,
			HashMap<String,Object> map,
			 HttpServletRequest request) {
	        // 자료실에 파일이 저장될 경로(디렉토리) 지정 없으면 생성
	        String filePath = "C:\\Users\\GGG\\git\\Kidzpark\\src\\main\\resources\\static\\img\\";
	        //upload.path=E:/study/imageTest/

	        File dir = new File(filePath);
	        if (!dir.exists()) {
	            dir.mkdir(); // make directory
	        }

	        // 넘어온 파일 저장(d:\\upload\\) 처리 - 중복파일 처리
	        CheckFileName checkFile = new CheckFileName();

	        // 파일 저장
	        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

	        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

			MultipartFile  multipartFile = null;

	        String u_imgname   = null;
	        String orgFileName = null;
	        String u_imgext    = null;
	        String u_profileimg  = null; // 저장된 실제 파일명

	        // 파일 정보를 저장할 리스트 생성

	        // 넘어온 파일을 한개씩 반복 처리
	        while (iterator.hasNext()) {
	            multipartFile = multipartHttpServletRequest.getFile(iterator.next());

	            if ( !multipartFile.isEmpty() ) {
	            	u_imgname   = multipartFile.getOriginalFilename();
	                orgFileName = u_imgname.substring(0, u_imgname.lastIndexOf('.'));
	                u_imgext    = u_imgname.substring( u_imgname.lastIndexOf('.') );
	              
	                u_profileimg = checkFile.getCheckFileName(filePath, orgFileName, u_imgext);

	                File file = new File(filePath + u_profileimg);
	                try {
	                    multipartFile.transferTo(file); 
	                } catch (IllegalStateException | IOException e) {
	                    e.printStackTrace();
	                }
	                
	            }
	        }
	        
	        map.put("u_profileimg", u_profileimg);
	      //  System.out.println("map2 : " + map);
	       // u_profileimg = vo.getU_id();
	       // vo.setU_profileimg(u_profileimg);
	 }
}
