package devonboot.sample.office.common.practice.service;

import devonboot.sample.office.common.practice.model.MiniUser;



/**
 * @Class Name : MiniUserService.java
 * @Description : MiniUser Service class
 * @Modification Information
 *
 * @author author
 * @since 2024-03-13
 * @version 1.0
 * @see
 *  
 *  Copyright (C) LG CNS All rights reserved.
 */

public interface MiniUserService {

	/**
	 * @description MINI_USER을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MiniUser
	 */
	public void insertMiniUser(MiniUser miniUser);
	
	/**
	 * @description MINI_USER을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MiniUser
	 */
	public void deleteMiniUser(MiniUser miniUser);

	/**
	 * @description MINI_USER을 조회한다.
	 * @param miniUser - 조회할 정보가 담긴 MiniUser
	 * @return 조회한 MINI_USER
	 */
	public MiniUser retrieveMiniUser(MiniUser miniUser);
	
	/**
	 * @description MINI_USER을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MiniUser
	 */
	public void updateMiniUser(MiniUser miniUser);
}
