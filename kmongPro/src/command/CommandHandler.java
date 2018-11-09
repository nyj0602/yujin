package command;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//인터페이스를 왜 선언? 어디 사용? ***
public interface CommandHandler {
	//결과 Data : request
	//String : View(뷰) JSP페이지
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
