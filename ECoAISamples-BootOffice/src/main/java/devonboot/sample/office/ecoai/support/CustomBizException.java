package devonboot.sample.office.ecoai.support;

public class CustomBizException extends IllegalStateException {

	public CustomBizException(String string, Exception e) {
	}
	
	public CustomBizException(String code, String message) {
	}
	
	private static final long serialVersionUID = 1L;

}
