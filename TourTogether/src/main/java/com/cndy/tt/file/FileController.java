package com.cndy.tt.file;

import java.io.IOException;
import java.net.InetAddress;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FileController {
	private static final String UPLOADIMG = "/static/uploadimg/";
	
	@Autowired
	ServletContext servletContext;
	
	@ResponseBody
	@RequestMapping(value="diary/fileUpload.do", method=RequestMethod.POST)
	public String fileUpload(MultipartHttpServletRequest multipartRequest) throws IOException{
		String webappRoot = servletContext.getRealPath("/");
		System.out.println("FileController webappRoot: "+ webappRoot); 
		
		String filePath = webappRoot + UPLOADIMG;
		
		//실제 저장 파일명 , 원본 파일명 DB 저장 처리
		Map<String, String> fileNames = new HandlerFile(multipartRequest, filePath).getUploadFileName();
		System.out.println("FileController fileName: "+fileNames.toString());
		
		String localIP = InetAddress.getLocalHost().getHostAddress();
		String url = "http://"+ localIP + ":"+ multipartRequest.getServerPort()
						+ "/tour_together" + UPLOADIMG + fileNames.get("saveFileName");
		System.out.println("FileController url: "+url);
		
		return url;
	}
}