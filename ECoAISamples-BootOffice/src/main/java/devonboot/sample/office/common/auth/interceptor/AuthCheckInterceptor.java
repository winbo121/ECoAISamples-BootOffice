package devonboot.sample.office.common.auth.interceptor;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.support.MessageSourceAccessor;

import devonboot.sample.office.common.model.User;
import devonframe.web.servlet.handler.UrlPatternInterceptorAdapter;

/**
 * <pre>
 * 본 클래스는 관리자 권한을 체크하는 Interceptor 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

public class AuthCheckInterceptor extends UrlPatternInterceptorAdapter{

	@Resource(name="messageSourceAccessor")
	private MessageSourceAccessor messageSourceAccessor;

    public boolean checkHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		User loginUser = (User) request.getSession().getAttribute("loginUser");
		
		if (loginUser == null || !"00001".equals(loginUser.getRole())) {
			if(request.getServletPath().startsWith("/system")) {

				sendErrorPage(request, response);
				return false;
			}
		}

        return true;
    }

	private void sendErrorPage(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String ajaxMode = request.getParameter("devonopen_ajax_mode");
		String errorMessage = messageSourceAccessor.getMessage("common.message.noAuth", new Object[]{request.getServletPath()});
		if(!"true".equals(ajaxMode)) {
			throw new RuntimeException(errorMessage);

		}else{
			response.setContentType("text/json");
			response.getWriter().write("{\"resultCode\":\"error\", \"resultMessage\":\""+errorMessage+"\"}");
		}
	}
}
