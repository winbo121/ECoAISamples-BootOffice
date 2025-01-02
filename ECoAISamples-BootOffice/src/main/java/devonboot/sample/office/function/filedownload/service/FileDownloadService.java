package devonboot.sample.office.function.filedownload.service;

import java.util.List;

import devonboot.sample.office.common.model.FileInfo;


public interface FileDownloadService {

    public void deleteFileInfoList(List<FileInfo> fileInfoList);
    
    public List<FileInfo> retrieveFileInfoList(FileInfo fileInfo);
    
    
}

