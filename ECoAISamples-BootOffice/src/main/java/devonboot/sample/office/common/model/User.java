package devonboot.sample.office.common.model;

/**
 * <pre>
 * 본 클래스는 사용자정보를 담는 VO 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */
public class User {

	private String usrId;
	private String usrNm;
	private String usrPw;
	private String regDt;
	private String chngUsrId;
	private String chngDt;
	private String language;
	private String role;
	private String roleNm;
	private String phoneNumber;
	private String name;
	private String password;

	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getUsrId() {
		return this.usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	public String getUsrNm() {
		return this.usrNm;
	}
	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}
	public String getUsrPw() {
		return this.usrPw;
	}
	public void setUsrPw(String usrPw) {
		this.usrPw = usrPw;
	}
	public String getRegDt() {
		return this.regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getChngUsrId() {
		return this.chngUsrId;
	}
	public void setChngUsrId(String chngUsrId) {
		this.chngUsrId = chngUsrId;
	}
	public String getChngDt() {
		return this.chngDt;
	}
	public void setChngDt(String chngDt) {
		this.chngDt = chngDt;
	}
	public String getLanguage() {
		return this.language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getRole() {
		return this.role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getRoleNm() {
		return this.roleNm;
	}
	public void setRoleNm(String roleNm) {
		this.roleNm = roleNm;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
