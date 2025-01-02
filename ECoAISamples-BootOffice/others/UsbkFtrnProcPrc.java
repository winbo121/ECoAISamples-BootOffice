
/*********************************이 력 사 항**********************************
 * 일 자         버 전         작성자        변경사항                         
 *     1.0           자산화        최초작성  
 ******************************************************************************/

package finast.bank.eb.pbc.ebChnl.chnlFtrn.usbkFtrnProcPrc;

import java.math.BigDecimal;

import devon.core.collection.LData;
import devon.core.collection.LMultiData;
import devon.core.exception.LBizException;
import devon.core.exception.LException;
import devon.core.util.LRandomUtils;
import devonx.finast.collection.util.LProtocolInitializeUtil;
import devonx.finast.service.util.LContextUtil;
import devonx.finast.util.DateUtil;
import devonx.finast.util.StringUtil;
import devonx.finast.util.TypeConversion;
import finast.bank.ac.ibc.ac.acInf.AcInf;
import finast.bank.eb.cpbc.ebc.bsnsComm.ftrnServMgCprc.FtrnServMgCCprc;
import finast.bank.eb.cpbc.ebc.bsnsComm.utmnMgCprc.UtmnMgCCprc;
import finast.bank.eb.ebc.ftrnInfo.ftrnIstmMgr.FtrnIstmMgr;
import finast.bank.eb.ebc.ftrnInfo.ftrnServMgr.FtrnServMgr;
import finast.bank.eb.processor.ebPreProc.EbPreProcPssrprocessor;
import finast.bank.util.biz.co.CommSysUtil;
import finast.bank.util.rule.RuleUTL;

public class UsbkFtrnProcPrc {

	public LData handleUsbkFtrn (LData usbkFtrnProcTrms) throws LException {

		//return 파라미터 초기화
		LData usbkFtrnProcRslt = new LData(); // 당행이체처리결과

		//호출된 오퍼레이션에서 사용된 파라미터 초기화
		LData utmnVrfcTrms = new LData(); // 이용자검증조건
		LData utmnVrfcRslt = new LData(); // 이용자검증결과
		LData ftrnLmamVrfcTrms = new LData(); // 이체한도검증조건
		LData ftrnLmamVrfcRslt = new LData(); // 이체한도검증결과
		LData acntInqTrms = new LData(); // 계좌조회조건
		LData acntInqRslt = new LData(); // 계좌조회결과
		LData cmmsProdTrms = new LData(); // 수수료산출조건
		LData cmmsProdRslt = new LData(); // 수수료산출결과
		LData ebAcntInfoInqTrms = new LData(); // 전자금융계좌정보조회조건
		LData ebAcntInfoInqRslt = new LData(); // 전자금융계좌정보조회결과
		LData acntPymtProc = new LData(); // 계좌지급처리
		LData acntPymtProcRslt = new LData(); // 계좌지급처리결과
		LData acntInamProc = new LData(); // 계좌입금처리
		LData acntInamProcRslt = new LData(); // 계좌입금처리결과
		LData ftrnIstmReg = new LData(); // 이체내역등록
		LData ftrnServMdfTrms = new LData(); // 이체서비스수정조건
		LData cmmsTrstRegTrms = new LData(); // 수수료거래등록조건
		LData cmmsTrstRegRslt = new LData(); // 수수료거래등록결과
		LData ruleCmmsProdTrms = new LData(); // Rule수수료산출조건
		LData rsaCmmsProdTrms = new LData(); // Rsa수수료산출조건
		LData rsaCmmsProdRslt = new LData(); // Rsa수수료산출결과

		//호출 컴포넌트 초기화
		EbPreProcPssrprocessor ebPreProcPssrprocessor = new EbPreProcPssrprocessor();
		UtmnMgCCprc utmnMgCCprc = new UtmnMgCCprc();
		FtrnServMgCCprc ftrnServMgCCprc = new FtrnServMgCCprc();
		RegAcntMgCCprc regAcntMgCCprc = new RegAcntMgCCprc();
		CmmsInf cmmsInf = new CmmsInf();
		RcvInf rcvInf = new RcvInf();
		FtrnIstmMgr ftrnIstmMgr = new FtrnIstmMgr();
		FtrnServMgr ftrnServMgr = new FtrnServMgr();
		AcInf acInf = new AcInf();
		
		BigDecimal cmms = new BigDecimal(1);

		LContextUtil.setTransParameter("TEBB040211"); //거래 파라미터 세팅

		ebPreProcPssrprocessor.handleEbPre();

		LMultiData acctJrnlInpDmCTX = LContextUtil.getAcctJrnlInpParameter(); //계정분개입력

		
		
		//#GeneralCodeBlock# 변수 정의
		String sv_InamAcntUseYn= utmnVrfcRslt.getString("inamAcntUseYn"); //sv_입금계좌사용여부
		String sv_AcbyInamDgntYn= utmnVrfcRslt.getString("acbyInamDgntYn"); //sv_계좌별입금지정여부

		String sv_FtrnRsltCd= "SM00000"; //sv_이체결과코드
		String sv_FtrnProcStatCd= EbChnlConst.RSVE_FRTN_PROC_REG.getCode(); //sv_이체처리상태코드

		
		
		//#GeneralCodeBlock# 이체거래검증
		utmnVrfcTrms.setString("orgcd", LContextUtil.getSystemHeaderOrgCd());
		utmnVrfcTrms.setString("ebMedmTpcd", LContextUtil.getChannelHeaderEbMedType());
		utmnVrfcTrms.setString("ebId", usbkFtrnProcTrms.getString("ebId"));
		utmnVrfcTrms.setString("type", EbcConst.UTMN_VERIFY_FTRN.getCode());
		LProtocolInitializeUtil.primitiveLMultiInitialize(utmnVrfcTrms);
		utmnVrfcRslt = utmnMgCCprc.verifyUtmn(utmnVrfcTrms); //이용자검증

		
		
		//#GeneralCodeBlock# 이체한도검증 조건
		ftrnLmamVrfcTrms.setBigDecimal("acntFtrnAmt", usbkFtrnProcTrms.getBigDecimal("trstAmt"));
		ftrnLmamVrfcTrms.setString("orgcd", LContextUtil.getSystemHeaderOrgCd());
		ftrnLmamVrfcTrms.setString("ebId", usbkFtrnProcTrms.getString("ebId"));
		ftrnLmamVrfcTrms.setString("ebMedmTpcd", LContextUtil.getChannelHeaderEbMedType());
		LProtocolInitializeUtil.primitiveLMultiInitialize(ftrnLmamVrfcTrms);
		ftrnLmamVrfcRslt = ftrnServMgCCprc.verifyFtrnLmam(ftrnLmamVrfcTrms); //이체한도검증

		
		
		//#GeneralCodeBlock# 출금계좌등록여부조회조건
		acntInqTrms.setString("orgcd", LContextUtil.getSystemHeaderOrgCd());
		acntInqTrms.setString("ebMedmTpcd", LContextUtil.getChannelHeaderEbMedType());
		acntInqTrms.setString("ebId", usbkFtrnProcTrms.getString("ebId"));
		acntInqTrms.setString("regAcntTpcd", EbTmConst.REG_ACNT_TPCD_OUT.getCode());
		acntInqTrms.setString("bankCd", EbcConst.BANK_CD_LG.getCode());
		acntInqTrms.setString("acno", usbkFtrnProcTrms.getString("outamtAcno"));
		LProtocolInitializeUtil.primitiveLMultiInitialize(acntInqTrms);
		acntInqRslt = regAcntMgCCprc.retrieveRegAcnt(acntInqTrms); //등록계좌조회

		
		
		// 수수료 산출
		cmmsProdTrms.setString("cmmsCd", EbChnlConst.CMMS_CD_USB.getCode());
		cmmsProdTrms.setString("aplyDate", LContextUtil.getSystemHeaderTlRqstDttm().substring(0,8));
		String ruleClotYn = CmmsConst.STR_Y.getCode(); //Rule호출여부

		if (StringUtil.isNull(cmmsProdTrms.getString("aplyDate")))
			cmmsProdTrms.setString("aplyDate", CommSysUtil.getSysPrvd().getTrstDate().getTrstDate());

		if (cmmsProdTrms.getInt("objCnt") == 0)
			cmmsProdTrms.setInt("objCnt", 1);

		if (StringUtil.isNull(cmmsProdTrms.getString("primBrNo")))
			cmmsProdTrms.setString("primBrNo", LContextUtil.getChannelHeaderTrstBrcd());

		if (StringUtil.isNull(cmmsProdTrms.getString("tmno")))
			cmmsProdTrms.setString("tmno", LContextUtil.getChannelHeaderTmno());

		if (StringUtil.isNull(cmmsProdTrms.getString("chnlKindCd")))
			cmmsProdTrms.setString("chnlKindCd", LContextUtil.getSystemHeaderChnlTpCd());

		if (StringUtil.isNull(cmmsProdTrms.getString("trstAmtTelcalCd")))
			cmmsProdTrms.setString("trstAmtTelcalCd", CmmsConst.TELCAL_ALL.getCode());
		
		if (ruleClotYn.equals(CmmsConst.STR_Y.getCode())) {
			ruleCmmsProdTrms.setString("cmmsCd", cmmsProdTrms.getString("cmmsCd")); //수수료코드
			ruleCmmsProdTrms.setString("aplyDate", cmmsProdTrms.getString("aplyDate")); //적용일자
			ruleCmmsProdTrms.setString("trstAmtTelcalCd", cmmsProdTrms.getString("trstAmtTelcalCd")); //거래금액통화코드
			ruleCmmsProdTrms.setBigDecimal("prodObjTrstAmt", cmmsProdTrms.getBigDecimal("prodObjTrstAmt")); //산출대상거래금액
			ruleCmmsProdTrms.setInt("objCnt", cmmsProdTrms.getInt("objCnt")); //대상건수

			LMultiData cmmsProdRslt_multi = RuleUTL.invokeRuleService(
					this.getClass().getName(), // 호출하는 클래스명
					"bkCmComputeCmms", //Rule ID
					DateUtil.getCurrentDate("yyyy-MM-dd"), //요청일자
					ruleCmmsProdTrms); //Input 정보

			if (cmmsProdRslt_multi != null && !cmmsProdRslt_multi.isEmpty())
				cmmsProdRslt = cmmsProdRslt_multi.getLData(0);
			if (cmmsProdRslt == null || cmmsProdRslt.isEmpty()) {
				throw new LBizException("EM00009");
			} else {
				if (cmmsProdRslt.getString("errorCd").equals(CmmsConst.ERR_COD_NORM.getCode())) {
					cmmsProdRslt.setString("cmmsCd", cmmsProdRslt.getString("cmmsCd")); //수수료코드
					cmmsProdRslt.setString("normCmmsTelcalCd", cmmsProdRslt.getString("normCmmsTelcalCd")); //정상수수료통화코드
					cmmsProdRslt.setBigDecimal("normCmms", cmmsProdRslt.getBigDecimal("normCmms")); //정상수수료
				} else {
					throw new LBizException(cmmsProdRslt.getString("errorCd"));
				}
			}
		} else {
			rsaCmmsProdTrms = cmmsProdTrms;
			LProtocolInitializeUtil.primitiveLMultiInitialize(rsaCmmsProdTrms);
			rsaCmmsProdRslt = rcvInf.computeRsaCmms(rsaCmmsProdTrms); //Rsa수수료산출
			cmmsProdRslt = rsaCmmsProdRslt;
		}

		
		
		//#GeneralCodeBlock# 당행입금계좌-계좌정보조회조건
		ebAcntInfoInqTrms.setString("trstType", EbTmConst.EB_ACNT_INFO_INAMT.getCode());
		ebAcntInfoInqTrms.setString("acno", usbkFtrnProcTrms.getString("inamAcno"));
		LProtocolInitializeUtil.primitiveLMultiInitialize(ebAcntInfoInqTrms);
		ebAcntInfoInqRslt = rcvInf.retrieveEbAcntInfo(ebAcntInfoInqTrms); //전자금융계좌정보조회


		
		//#GeneralCodeBlock# 이체지급조건
		acntPymtProc.setString("acno", usbkFtrnProcTrms.getString("outamtAcno"));
		acntPymtProc.setString("pswd", usbkFtrnProcTrms.getString("bkbkPswd"));
		acntPymtProc.setString("bkbkRmk", usbkFtrnProcTrms.getString("outamtBkbkLablCtnt"));
		acntPymtProc.setBigDecimal("trstAmt", usbkFtrnProcTrms.getBigDecimal("trstAmt"));
		acntPymtProc.setBigDecimal("trsfAmt", usbkFtrnProcTrms.getBigDecimal("trstAmt"));
		acntPymtProc.setString("clcnMnNm", usbkFtrnProcTrms.getString("clcnMnNm"));
		LProtocolInitializeUtil.primitiveLMultiInitialize(acntPymtProc);
		acntPymtProcRslt = rcvInf.handleAcntPymt(acntPymtProc); //계좌지급처리

		

		//#GeneralCodeBlock# 수신입금처리 조건
		acntInamProc.setString("acno", usbkFtrnProcTrms.getString("inamAcno"));
		acntInamProc.setBigDecimal("trstAmt", usbkFtrnProcTrms.getBigDecimal("trstAmt"));
		acntInamProc.setBigDecimal("trsfAmt", usbkFtrnProcTrms.getBigDecimal("trstAmt"));
		acntInamProc.setString("inamClntNm", usbkFtrnProcTrms.getString("clcnMnNm"));
		acntInamProc.setString("rmkCd", "120"); //수신입금적요코드       
		acntInamProc.setString("bkbkRmk", usbkFtrnProcTrms.getString("inamBkbkLablCtnt"));
		LProtocolInitializeUtil.primitiveLMultiInitialize(acntInamProc);
		acntInamProcRslt = rcvInf.handleAcntInam(acntInamProc); //계좌입금처리



		//#GeneralCodeBlock# 난수번호생성
		int v_ranNum1= LRandomUtils.getRandomNum(1, 30); //v_ranNum1
		int v_ranNum2= LRandomUtils.getRandomNum(1, 30); //v_ranNum2



		//#GeneralCodeBlock# 인터넷뱅킹 계좌이체내역등록-조건
		ftrnIstmReg.setString("ebId", usbkFtrnProcTrms.getString("ebId"));
		ftrnIstmReg.setString("outamtAcno", usbkFtrnProcTrms.getString("outamtAcno"));
		ftrnIstmReg.setString("bankCd", usbkFtrnProcTrms.getString("inamBkcd"));
		ftrnIstmReg.setString("inamAcno", usbkFtrnProcTrms.getString("inamAcno"));
		ftrnIstmReg.setString("crnyCd", LContextUtil.getSystemHeaderCrnyCd());
		ftrnIstmReg.setBigDecimal("acntFtrnAmt", usbkFtrnProcTrms.getBigDecimal("trstAmt"));
		ftrnIstmReg.setString("outamtBkbkLablCtnt", usbkFtrnProcTrms.getString("outamtBkbkLablCtnt"));
		ftrnIstmReg.setString("clcnMnFname", usbkFtrnProcTrms.getString("clcnMnNm"));
		ftrnIstmReg.setString("inamBkbkLablCtnt", usbkFtrnProcTrms.getString("inamBkbkLablCtnt"));
		ftrnIstmReg.setString("thsndTpcd", EbChnlConst.CD_USB.getCode());
		ftrnIstmReg.setString("rmkCd", usbkFtrnProcTrms.getString("rmkCd"));
		ftrnIstmReg.setString("iaddPrtYn", "");
		ftrnIstmReg.setString("ftrnRsltCd", sv_FtrnRsltCd);
		ftrnIstmReg.setString("ftrnProcStatCd", sv_FtrnProcStatCd);
		ftrnIstmReg.setString("fnclShotNetwkType", "");
		ftrnIstmReg.setString("fnclShotProcYn", "");
		ftrnIstmReg.setString("trstUniqNo", "");
		ftrnIstmReg.setString("orgnlGlobId", "");
		ftrnIstmReg.setString("teno", usbkFtrnProcTrms.getString("clcnMnNm"));
		LProtocolInitializeUtil.primitiveLMultiInitialize(ftrnIstmReg);
		ftrnIstmMgr.registFtrnIstm(ftrnIstmReg); //이체내역등록

		

		//#GeneralCodeBlock# 이체한도 차감
		ftrnServMdfTrms.setString("ebId", usbkFtrnProcTrms.getString("ebId"));
		LProtocolInitializeUtil.primitiveLMultiInitialize(ftrnServMdfTrms);
		ftrnServMgr.updateFtrnServ(ftrnServMdfTrms); //이체서비스수정
		if (cmms.compareTo(new BigDecimal(0)) > 0) {

			//#GeneralCodeBlock# 수수료거래등록조건
			cmmsTrstRegTrms.setString("cmmsCd", cmmsProdRslt.getString("cmmsCd")); //수수료코드
			cmmsTrstRegTrms.setString("prlsAcitCd", cmmsProdRslt.getString("prlsAcitCd")); //손익계정과목코드
			cmmsTrstRegTrms.setString("cmmsPrimMethCd", cmmsProdRslt.getString("cmmsPrimMethCd")); //수수료우대방법코드
			cmmsTrstRegTrms.setString("cmmsPrimResnCd", cmmsProdRslt.getString("cmmsPrimResnCd")); //수수료우대사유코드
			cmmsTrstRegTrms.setBigDecimal("normCmms", cmmsProdRslt.getBigDecimal("normCmms")); //정상수수료
			cmmsTrstRegTrms.setBigDecimal("normFert", cmmsProdRslt.getBigDecimal("normFert")); //정상수수료율
			cmmsTrstRegTrms.setBigDecimal("primCmms", cmmsProdRslt.getBigDecimal("primCmms")); //우대수수료
			cmmsTrstRegTrms.setBigDecimal("primFert", cmmsProdRslt.getBigDecimal("primFert")); //우대수수료율
			cmmsTrstRegTrms.setBigDecimal("aplyCmms", cmmsProdRslt.getBigDecimal("aplyCmms")); //적용수수료
			cmmsTrstRegTrms.setString("trstDate", LContextUtil.getSystemHeaderTlRqstDttm().substring(0,8));
			cmmsTrstRegTrms.setString("cmmsCd", EbChnlConst.CMMS_CD_USB.getCode());
			cmmsTrstRegTrms.setString("cmmsBsnsTpcd", EbChnlConst.CMMS_BSNS_TPCD.getCode()); //전자금융
			cmmsTrstRegTrms.setInt("trstObjCnt", 1);
			LProtocolInitializeUtil.primitiveLMultiInitialize(cmmsTrstRegTrms);
			cmmsTrstRegRslt = cmmsInf.registCmmsTrst(cmmsTrstRegTrms); //수수료거래등록



			//#GeneralCodeBlock# 계정분개정보
			//계정분개처리조건 set할 temp LData, LMultiData 선언
			LData tmpAcctJrnlInpComm = new LData(); //tmp계정분개입력공통
			tmpAcctJrnlInpComm.setInt("jrnlAcctNum", 0);
			LMultiData tmpAcctJrnlInpDetlList = new LMultiData();
			LData tmpAcctJrnlInpDetl = new LData(); //tmp계정분개입력상세
			tmpAcctJrnlInpComm.setString("jrnlKindCd", "DE01000002"); //계좌지급
			tmpAcctJrnlInpComm.setString("lnkgTpcd", "1"); //default
			tmpAcctJrnlInpComm.setString("smrySlipYn", "N");
			tmpAcctJrnlInpComm.setString("cnclCrctType", "0"); //취소정정구분코드 - 0:정상, 1:취소, 2:정정

			

			//#GeneralCodeBlock# 계정분개입력상세
			//계정분개입력상세 데이터 set
			tmpAcctJrnlInpComm.setInt("jrnlAcctNum", tmpAcctJrnlInpComm.getInt("jrnlAcctNum")+1);
			tmpAcctJrnlInpDetl.setInt("trstCnt", 0);
			//01.현금 02.대체, 03.타점권
			tmpAcctJrnlInpDetl.setString("trstTypeCd", "02");
			tmpAcctJrnlInpDetl.setString("rsdnTpcd", "");
			tmpAcctJrnlInpDetl.setString("cntzBrNo", "");
			tmpAcctJrnlInpDetl.setInt("jrnlAcctNo", 7);
			tmpAcctJrnlInpDetl.setString("nonlnAcctCd", "");
			tmpAcctJrnlInpDetl.setString("prdCd", "");
			//1.차변, 2.대변
			tmpAcctJrnlInpDetl.setString("docaTpcd", "2");
			tmpAcctJrnlInpDetl.setString("strtChkNo", "");
			tmpAcctJrnlInpDetl.setString("ochkCd1", "");
			tmpAcctJrnlInpDetl.setString("ochkCd2", "");
			tmpAcctJrnlInpDetl.setString("ochkCd3", "");
			tmpAcctJrnlInpDetl.setString("ochkCd4", "");
			tmpAcctJrnlInpDetl.setInt("ochkSfpp", 0);
			tmpAcctJrnlInpDetl.setBigDecimal("ochkAmt1", new BigDecimal(0));
			tmpAcctJrnlInpDetl.setBigDecimal("ochkAmt2", new BigDecimal(0));
			tmpAcctJrnlInpDetl.setBigDecimal("ochkAmt3", new BigDecimal(0));
			tmpAcctJrnlInpDetl.setBigDecimal("ochkAmt4", new BigDecimal(0));
			tmpAcctJrnlInpDetlList.addLData(tmpAcctJrnlInpDetl);
			LData tmpAcctJrnlInpDmCTX = new LData(); //tmp계정분개입력DMCTX
			tmpAcctJrnlInpDmCTX.set("acctJrnlInpCommCTX", tmpAcctJrnlInpComm);
			tmpAcctJrnlInpDmCTX.set("acctJrnlInpDetlCTX", tmpAcctJrnlInpDetlList);
			acctJrnlInpDmCTX.addLData(tmpAcctJrnlInpDmCTX);
			LContextUtil.setAcctJrnlInp(acctJrnlInpDmCTX);
			acInf.handleAcctJrnl(); //계정분개처리
		}

		

		//#GeneralCodeBlock# 출력전문조립
		usbkFtrnProcRslt.setString("ftrnPswd", usbkFtrnProcTrms.getString("ftrnPswd"));
		usbkFtrnProcRslt.setString("mtscMedmTpcd", usbkFtrnProcTrms.getString("mtscMedmTpcd"));
		usbkFtrnProcRslt.setString("otpCardUniqNo", usbkFtrnProcTrms.getString("otpCardUniqNo"));
		usbkFtrnProcRslt.setString("otpCardPswd", usbkFtrnProcTrms.getString("otpCardPswd"));
		usbkFtrnProcRslt.setString("vrfcCd", usbkFtrnProcTrms.getString("vrfcCd"));
		usbkFtrnProcRslt.setString("mtscCardNo", usbkFtrnProcTrms.getString("mtscCardNo"));
		usbkFtrnProcRslt.setString("mtscCardRnnmNoOne", TypeConversion.toString(v_ranNum1));
		usbkFtrnProcRslt.setString("bfTwoCharPswdOne", usbkFtrnProcTrms.getString("bfTwoCharPswdOne"));
		usbkFtrnProcRslt.setString("afTwoCharPswdOne", usbkFtrnProcTrms.getString("afTwoCharPswdOne"));
		usbkFtrnProcRslt.setString("mtscCardRnnmNoTwo", TypeConversion.toString(v_ranNum2));
		usbkFtrnProcRslt.setString("bfTwoCharPswdTwo", usbkFtrnProcTrms.getString("bfTwoCharPswdTwo"));
		usbkFtrnProcRslt.setString("afTwoCharPswdTwo", usbkFtrnProcTrms.getString("afTwoCharPswdTwo"));
		usbkFtrnProcRslt.setString("outamtAcno", usbkFtrnProcTrms.getString("outamtAcno"));
		usbkFtrnProcRslt.setString("bkbkPswd", usbkFtrnProcTrms.getString("bkbkPswd"));
		usbkFtrnProcRslt.setString("outamtBkbkLablCtnt", usbkFtrnProcTrms.getString("outamtBkbkLablCtnt"));
		usbkFtrnProcRslt.setString("inamBkcd", usbkFtrnProcTrms.getString("inamBkcd"));
		usbkFtrnProcRslt.setString("inamAcno", usbkFtrnProcTrms.getString("inamAcno"));
		usbkFtrnProcRslt.setString("rmkCd", usbkFtrnProcTrms.getString("rmkCd"));
		usbkFtrnProcRslt.setString("inamBkbkLablCtnt", usbkFtrnProcTrms.getString("inamBkbkLablCtnt"));
		usbkFtrnProcRslt.setString("clcnMnNm", usbkFtrnProcTrms.getString("clcnMnNm"));
		usbkFtrnProcRslt.setBigDecimal("trstAmt", usbkFtrnProcTrms.getBigDecimal("trstAmt"));
		usbkFtrnProcRslt.setString("aprvPswd", usbkFtrnProcTrms.getString("aprvPswd"));
		usbkFtrnProcRslt.setString("trstUniqNo", "");
		usbkFtrnProcRslt.setString("teno", usbkFtrnProcTrms.getString("teno"));
		LProtocolInitializeUtil.primitiveLMultiInitialize(usbkFtrnProcRslt);
		return usbkFtrnProcRslt;
	}
}