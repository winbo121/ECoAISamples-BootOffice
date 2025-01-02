package devonboot.sample.office.common.user.service;

import java.util.List;

import devonboot.sample.office.common.model.User;


/**
 * <pre>
 * 본 클래스는 사용자 정보에 대한 CRUD를 담당하는 Service 인터페이스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

public interface UserService {

	public User retrieveUser(User user);
	public List<User> retrieveUserList(User user);

	public void insertUser(User user);
	public void updateUser(User user);
	public void deleteUser(User user);

}
