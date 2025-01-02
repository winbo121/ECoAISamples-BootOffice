package devonboot.sample.office.common.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import devonframe.web.servlet.handler.UrlPatternInterceptorAdapter;


/**
 * <pre>
 * 본 클래스는 로그인 여부를 체크하는 Interceptor 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

public class LoginCheckInterceptor extends UrlPatternInterceptorAdapter {

    public boolean checkHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        boolean isLogin = request.getSession().getAttribute("loginUser") != null;

        if(!isLogin) {
        	String ajaxMode = request.getParameter("ajax_mode");
        	if(!"true".equals(ajaxMode)) {
        		response.getWriter().write("<script>" +
        								   "  if(this == top){" +
        								   "    document.location = '"+request.getContextPath()+"/common/login/retrieveLoginForm.do';" +
        								   "  }else{" +
        								   "    top.goToLoginPage();" +
        								   "  }" +
        								   "</script>");
        	}else{
        		response.setContentType("text/json");
        		response.getWriter().write("{\"resultCode\":\"sessionTimeout\", \"resultMessage\":\"User session timeout.\"}");
        	}
        }

        return isLogin;
    }
}
