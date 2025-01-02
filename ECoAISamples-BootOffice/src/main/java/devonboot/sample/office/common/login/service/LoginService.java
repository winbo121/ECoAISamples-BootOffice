package devonboot.sample.office.common.login.service;

import java.util.List;

import devonboot.sample.office.common.model.User;

/**
 * <pre>
 * 본 클래스는 로그인 처리를 담당하는 Service 인터페이스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

public interface LoginService {

    public boolean checkUserId(User user);

    public boolean checkUser(User user);
    
    public List<User> testMysql();

}
