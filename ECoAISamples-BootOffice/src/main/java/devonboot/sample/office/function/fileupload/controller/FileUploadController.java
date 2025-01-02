package devonboot.sample.office.function.fileupload.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import devonboot.sample.office.common.model.FileInfo;
import devonboot.sample.office.function.fileupload.service.FileUploadService;
import devonframe.fileupload.model.UploadFileInfo;
import devonframe.message.saymessage.SayMessage;
import devonframe.util.DateUtil;

@Controller
public class FileUploadController {
    
	@Autowired
	@Qualifier("fileUpload")
	private devonframe.fileupload.FileUpload fileUpload;
    
    @Resource(name="fileUploadService") 
    private FileUploadService fileUploadService;
    
    
    @RequestMapping(value="/function/fileupload/fileUploadForm.do")
    public String fileUploadForm(ModelMap model) {
        model.addAttribute("fileInfo", new FileInfo());
        return "function/fileupload/fileUploadForm";
        
    }
    
    @RequestMapping(value="/function/fileupload/insertFileInfo.do")
    public String insertFileInfo(MultipartFile uploadFile, ModelMap model) {
        
        FileInfo fileInfo = new FileInfo();
        UploadFileInfo uploadFileInfo = fileUpload.upload(uploadFile);

        fileInfo.setFileName(uploadFileInfo.getClientFileName());
        fileInfo.setUploadFilePath(uploadFileInfo.getServerPath());
        fileInfo.setUploadFileName(uploadFileInfo.getServerFileName());
        fileInfo.setFileSize(uploadFileInfo.getSize());
        fileInfo.setUploadDate(DateUtil.getDate("yyyyMMdd"));
        
        fileUploadService.insertFileInfo(fileInfo);
        SayMessage.setMessage("성공적으로 저장하였습니다.");
        
        model.addAttribute("fileInfo", fileInfo);
        
        return "function/fileupload/fileUploadForm";
        
    }
}
