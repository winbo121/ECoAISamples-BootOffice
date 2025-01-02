package devonboot.sample.office.function.filedownload.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonboot.sample.office.common.model.FileInfo;
import devonboot.sample.office.common.model.FileInfoArray;
import devonboot.sample.office.function.filedownload.service.FileDownloadService;
import devonframe.filedownload.view.FileDownloadView;
import devonframe.util.DateUtil;
import devonframe.util.NullUtil;

@Controller
public class FileDownloadController {
    
    
    @Resource(name="fileDownloadService") 
    private FileDownloadService fileDownloadService;
    
    
    @RequestMapping(value="/function/filedownload/retrieveFileDownloadList.do")
    public String retrieveFileDownloadlist(String fileName, String uploadDate, ModelMap model) {
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFileName(fileName);
        if(!NullUtil.isNone(uploadDate)) {
            fileInfo.setUploadDate(DateUtil.toYYYYMMDDDate(uploadDate));
        }

        model.addAttribute("resultList", fileDownloadService.retrieveFileInfoList(fileInfo));
        model.addAttribute("input", fileInfo);
        return "function/filedownload/fileDownloadList";
        
    }
    
    @RequestMapping(value="/function/filedownload/deleteFileList.do")
    public String deleteFileList( FileInfoArray fileInfoArray
    							, String searchFileName
    							, String searchUploadDate
    							, ModelMap model) {
        
        fileDownloadService.deleteFileInfoList(fileInfoArray.getCheckedFileInfoList());
        
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFileName(searchFileName);
        fileInfo.setUploadDate(searchUploadDate);
        model.addAttribute("input", fileInfo);
        return "function/filedownload/fileDownloadList";
        
    }
    
    @RequestMapping(value="/function/filedownload/downloadFileList.do")
    public FileDownloadView downloadFileList(FileInfoArray fileInfoArray, ModelMap model) {
        FileDownloadView fileDownloadView = null;
        
        if(!NullUtil.isNull(fileInfoArray)) {
            List<FileInfo> fileInfoList = fileInfoArray.getCheckedFileInfoList();
            if(fileInfoList.size() == 1) {
                fileDownloadView = new FileDownloadView(fileInfoList.get(0).getUploadFilePath());
            } else {
                String [] uploadFilePath = new String[fileInfoList.size()];
                for(int inx=0; inx < uploadFilePath.length; inx++) {
                    uploadFilePath[inx] = fileInfoList.get(inx).getUploadFilePath();
                }
                fileDownloadView = new FileDownloadView(uploadFilePath,"FileDownloadArray");
            }
        }
        return fileDownloadView;
        
    }
}
