package devonboot.sample.office.common.menu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import devonframe.web.servlet.handler.UrlPatternInterceptorAdapter;

/**
 *
 *
 * @author DevOn Framework, LG CNS,Inc., devon@lgcns.com
 * @version DevOnFrame 1.0.0
 * @since DevOnFrame 1.0.0
 */
public class MenuInfoInterceptor extends UrlPatternInterceptorAdapter {

    @Override
    public boolean checkHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	HttpSession session = request.getSession(true);
    	
    	String menu1 = null;
    	String menu2 = null;
    	String menu3 = null;
    	String menu4 = null;
    	
    	if(request.getParameter("menu1") != null){
    		menu1 = request.getParameter("menu1");
    		session.removeAttribute("MenuInfoInterceptor_menu1");
    		session.removeAttribute("MenuInfoInterceptor_menu2");
    		session.removeAttribute("MenuInfoInterceptor_menu3");
    		session.removeAttribute("MenuInfoInterceptor_menu4");
    	} else {
    		menu1 = (String) session.getAttribute("MenuInfoInterceptor_menu1");
    	} 
    	
    	if(request.getParameter("menu2") != null){
    		menu2 = request.getParameter("menu2");
    	} else {
    		menu2 = (String) session.getAttribute("MenuInfoInterceptor_menu2");
    	} 
    	
    	if(request.getParameter("menu3") != null){
    		menu3 = request.getParameter("menu3");
    	} else {
    		menu3 = (String) session.getAttribute("MenuInfoInterceptor_menu3");
    	} 

    	if(request.getParameter("menu4") != null){
    		menu4 = request.getParameter("menu4");
    	} else {
    		menu4 = (String) session.getAttribute("MenuInfoInterceptor_menu4");
    	} 

    	session.setAttribute("MenuInfoInterceptor_menu1", menu1);
    	session.setAttribute("MenuInfoInterceptor_menu2", menu2);
    	session.setAttribute("MenuInfoInterceptor_menu3", menu3);
    	session.setAttribute("MenuInfoInterceptor_menu4", menu4);
		 
        return true;
    }

}
