package command;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ImguploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String uri = request.getRequestURI();
		//
		String saveDirectory = String.format(
				"%s%s%s",
				request.getRealPath("/m"),
				File.separator,
				"upload"
				) ;
		System.out.println(saveDirectory);
		File sdir = new File(saveDirectory);
		if( !sdir.exists()) sdir.mkdirs();
		
		int maxPostSize = 1024*1024*5;
		String encoding = "UTF-8"; 
		
		MultipartRequest mrequest = new MultipartRequest(
				request, 
				saveDirectory,
				maxPostSize, 
				encoding, 
				new DefaultFileRenamePolicy()
				);
		//String name = mrequest.getParameter("file");
		File uploadFile = mrequest.getFile("upload");		// input 태그의 name인 upload
		long uploadFile_length = uploadFile.length();		// 업로드된 파일 크기
		
		String originalFileName = mrequest.getOriginalFileName("upload");		//원본파일명
		String filesystemFileName = mrequest.getFilesystemName("upload");		//중복처리된 파일명
		
		
		
		return "/WEB-INF/view/talent_register/insert_fourth.jsp";
	}

	
}
