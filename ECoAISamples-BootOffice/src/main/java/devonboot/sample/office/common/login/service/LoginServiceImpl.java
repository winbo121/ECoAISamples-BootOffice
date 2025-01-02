package devonboot.sample.office.common.login.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonboot.sample.office.common.model.User;
import devonframe.dataaccess.CommonDao;
import devonframe.security.crypto.DigestManager;


/**
 * <pre>
 * 본 클래스는 로그인 처리를 담당하는 ServiceImpl 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Resource(name = "commonDao")
	private CommonDao commonDao;

    public boolean checkUserId(User user) {
        int count = ((Integer)commonDao.select("Login.checkUserId", user)).intValue();
        return count == 1;
    }

    public boolean checkUser(User user) {
        String digestedPw = DigestManager.digest(user.getUsrPw(), "SHA-512");

        user.setUsrPw(digestedPw);

        int count = ((Integer)commonDao.select("Login.checkUser", user)).intValue();

        return count == 1;
    }

	@Override
	public List<User> testMysql() {
		List<User> testMysql = commonDao.selectList("Mysql.testMysql");
		return testMysql;
	}
}