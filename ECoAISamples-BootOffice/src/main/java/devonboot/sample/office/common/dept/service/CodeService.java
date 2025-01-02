package devonboot.sample.office.common.dept.service;

import java.util.List;

import devonboot.sample.office.common.model.Code;


/**
 * <pre>
 * 본 클래스는 코드 정보에 대한 CRUD를 담당하는 Service 인터페이스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

public interface CodeService {

	public List<Code> retrieveSkillCodeList();
	public List<Code> retrieveDivisionCodeList();
	public List<Code> retrieveDepartmentCodeList();

    public List<Code> retrieveDepartmentCodeList(Code codeGroup);

	public List<Code> retrieveJobLevelCodeList();
    public List<Code> retrieveCodeList(String string);


}
