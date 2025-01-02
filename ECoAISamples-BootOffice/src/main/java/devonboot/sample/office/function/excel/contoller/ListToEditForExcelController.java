package devonboot.sample.office.function.excel.contoller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.function.excel.model.EmployeeForExcel;
import devonboot.sample.office.function.excel.service.EmployeeServiceForExcel;
import devonboot.sample.office.function.excel.view.ExcelDownloadView;
import devonframe.excel.reader.ExcelReader;
import devonframe.excel.writer.ExcelWriter;
import devonframe.fileupload.FileUpload;
import devonframe.fileupload.model.UploadFileInfo;

@Controller
public class ListToEditForExcelController {

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name = "employeeServiceForExcel")
    private EmployeeServiceForExcel employeeService;

    @Resource(name = "fileUpload")
    private FileUpload fileUpload;

    @RequestMapping(value="/function/excel/retrieveEmployeeList.do")
    public String retrieveEmployeeList(EmployeeForExcel input, ModelMap model){

        List<EmployeeForExcel> resultList = employeeService.retrieveEmployeeList(input);

        model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        return "function/excel/employeeList";
    }
    
    @RequestMapping(value="/function/excel/uploadEmployeeList.do")
    public String uploadEmployeeList(MultipartFile uploadFile){
        
        UploadFileInfo uploadFileInfo = fileUpload.upload(uploadFile);
        
        ExcelReader excelReader = new ExcelReader();
        
        List<EmployeeForExcel> resultList = excelReader.read(EmployeeForExcel.class, uploadFileInfo.getServerPath());
        
        for(EmployeeForExcel employee: resultList) {
            employeeService.insertEmployee(employee);
        }
        
        return "redirect:/function/excel/retrieveEmployeeList.do";
    }
    
    @RequestMapping(value="/function/excel/downloadEmployeeList.do")
    public ExcelDownloadView downloadEmployeeList(EmployeeForExcel input){

        List<EmployeeForExcel> resultList = employeeService.retrieveEmployeeList(input);
        
        ExcelWriter excelWriter = new ExcelWriter(ExcelWriter.XLSX);
        excelWriter.createSheet(resultList, "Employee List");
        
        Workbook workbook = excelWriter.getWorkbook();
        
        return new ExcelDownloadView(workbook, "EmployList.xlsx");        
    }

    @RequestMapping(value="/function/excel/insertEmployee.do")
    public String insertEmployee(EmployeeForExcel input, ModelMap model, RedirectAttributes redirectAttributes){
        employeeService.insertEmployee(input);
        return "redirect:/function/excel/retrieveEmployeeList.do";
    }

}
