package devonboot.sample.office.function.fileupload.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonboot.sample.office.common.model.FileInfo;
import devonframe.dataaccess.CommonDao;

@Service("fileUploadService")
public class FileUploadServiceImpl implements FileUploadService {
    
    @Resource(name = "commonDao")
    private CommonDao commonDao;

    public void insertFileInfo(FileInfo fileInfo) {
        commonDao.insert("FileInfo.insertFileInfo", fileInfo);
    }

}
