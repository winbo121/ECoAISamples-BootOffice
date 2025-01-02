package devonboot.sample.office.function.excel.view;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.AbstractView;

import devonframe.exception.BusinessException;
import devonframe.util.FileUtil;


public class ExcelDownloadView extends AbstractView {

	public static final String CONTENT_DISPOSITION = "Content-Disposition";
	public static final String DEFAULT_ENCODING = "utf-8";
	private static final String EXCEL_CONTENT_TYPE = "application/vnd.ms-excel";

	protected String encoding = DEFAULT_ENCODING;
	protected boolean directOpen = false;

	/**
	 * 파일로 보내기 위한 ExcelWorkBook
	 */
	private Workbook workbook;

	/**
	 * 엑셀 파일 생성을 위한 파일명 
	 */
	private String fileAlias = "";


	/**
	 * 생성자
	 *
	 * @param fileAlias 파일명
	 */
	public ExcelDownloadView(Workbook workbook, String fileAlias) {

		if(workbook == null) {
			new BusinessException("workbook cannot be null.");
		}
		this.workbook = workbook;
		this.fileAlias = fileAlias;
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)	throws Exception {
		super.setContentType(EXCEL_CONTENT_TYPE);

		setResponseHeaders(response);
		setResponseHeadersForMulitBrowser(request, response);

		renderBodyContentsToResponse(model, request, response);

		if (response.getOutputStream() != null) {
			response.getOutputStream().flush();
		}
	}

	/**
	 * 기본 Response Header를 설정하는 메소드
	 *
	 * @param response HTTP Response
	 * @throws UnsupportedEncodingException
	 */
	protected void setResponseHeaders(HttpServletResponse response) throws UnsupportedEncodingException {
		response.setContentType(getContentType());

		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
	}

	/**
	 * 멀티 브라우저 지원을 위한 Response Header를 설정하는 메소드
	 *
	 * @param request HTTP Request
	 * @param response HTTP Response
	 * @throws UnsupportedEncodingException
	 */
	protected void setResponseHeadersForMulitBrowser(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		String sUserAgent = request.getHeader("USER-AGENT");
		StringBuilder sb = new StringBuilder();

		if (sUserAgent.indexOf("MSIE 5.5") != -1) {
			sb.append("attachment; filename=\"");
			sb.append(FileUtil.encodeURLEncoding(fileAlias, encoding));
			sb.append("\";");
		} else {
			boolean isChromeOrFirefox = false;
			if (sUserAgent.toLowerCase().indexOf("chrome") != -1) {
				isChromeOrFirefox = true;
			} else if (sUserAgent.toLowerCase().indexOf("firefox") != -1) {
				isChromeOrFirefox = true;
			}
			String openStyle = (this.directOpen) ? "inline" : "attachment";

			if (isChromeOrFirefox) {
				sb.append(openStyle);
				sb.append("; filename=" + "\"=?");
				sb.append(this.encoding);
				sb.append("?Q?");
				sb.append(FileUtil.encodeQuotedPrintable(fileAlias, this.encoding));
				sb.append("?=\";");
			} else {
				sb.append(openStyle);
				sb.append("; filename=\"");
				sb.append(FileUtil.encodeQuotedPrintable(fileAlias, this.encoding).replaceAll("\\+", " "));
				sb.append("\"");
			}
		}

		response.setHeader(CONTENT_DISPOSITION, sb.toString().replaceAll("[\n\r]", ""));

	}

	private void renderBodyContentsToResponse(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) {
		try {
			this.workbook.write(response.getOutputStream());
		} catch (Exception e) {
			throw new BusinessException("Failed to download excel file : " + fileAlias, e);
		}
	}

}
