package devonboot.sample.office.ecoai.support;

import java.util.List;

import org.springframework.stereotype.Service;

@Service("tfDngbllTrnsfrCnclService")
public interface TfDngbllTrnsfrCnclService {

	TfDngbllTrnsfrCnclResultVO processDomesticTransfer(TfDngbllTrnsfrCnclVO domesticTransferVo);

	List<TfDngbllTrnsfrCnclResultVO> selectTfDngbllTrnsfrCnclList(TfDngbllTrnsfrCnclVO tfDngbllTrnsfrCnclVo);

	TfDngbllTrnsfrCnclResultVO selectTfDngbllTrnsfrCncl(TfDngbllTrnsfrCnclVO tfDngbllTrnsfrCnclVo);

}
