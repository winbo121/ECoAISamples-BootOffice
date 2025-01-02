package devonboot.sample.office.uipattern.px2.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.employee.service.EmployeeService;
import devonboot.sample.office.common.model.Code;
import devonboot.sample.office.common.model.Employee;
import devonboot.sample.office.uipattern.px2.model.TreeData;
import devonboot.sample.office.uipattern.px2.model.TreeList;

@Controller
public class TreeListToEditPatternController {

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name = "employeeService")
    private EmployeeService employeeService;


    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;
    
    @RequestMapping(value="/pattern/px2/retrieveEmployeeList.do")
    public String retrieveEmployeeList(ModelMap model) {
        List<Employee> resultList = employeeService.retrieveEmployeeTreeList(new Employee());
        
        ArrayList<TreeList> level1List = new ArrayList<TreeList>();
        ArrayList<TreeList> level2List = new ArrayList<TreeList>();
        ArrayList<TreeList> level3List = new ArrayList<TreeList>();

        String level1 = "";
        String level2 ="";
        
        
        for(int inx=0; inx < resultList.size(); inx++) {
            Employee employee = resultList.get(inx);
            String level1Id = employee.getDivisionCode();
            String level1Data = employee.getDivisionCodeName();
            String level2Id = employee.getDepartmentCode();
            String level2Data = employee.getDepartmentCodeName();
            String level3Id = employee.getNum();
            String level3Data = employee.getName();
            
            //Level1
            if (inx == 0 || !level1.equals(level1Id)) {
                TreeList treeList = new TreeList();
                TreeData treeData = new TreeData();
                treeData.setId(level1Id);
                treeData.setLevel("1");
                treeList.setData(level1Data);
                treeList.setAttr(treeData);
                level1List.add(treeList);
            }

            //Level2
            if (inx == 0 || !level1.equals(level1Id) || !level2.equals(level2Id)) {
                //Level2 - Children
                if (inx > 0) {
                    @SuppressWarnings("unchecked")
					ArrayList<TreeList> level2Child = (ArrayList<TreeList> )level3List.clone();
                    level2List.get(level2List.size()-1).setChildren(level2Child);
                    level3List.clear();

                    //Level1 - Children
                    if (!level1.equals(level1Id)) {
                        @SuppressWarnings("unchecked")
						ArrayList<TreeList> level1Child = (ArrayList<TreeList> )level2List.clone();
                        level1List.get(level1List.size()-2).setChildren(level1Child);
                        level2List.clear();
                    }
                }
                TreeList treeList = new TreeList();
                TreeData treeData = new TreeData();
                treeData.setId(level2Id);
                treeData.setLevel("2");
                treeList.setData(level2Data);
                treeList.setAttr(treeData);
                level2List.add(treeList);
            }

            //Level3
            TreeList treeList = new TreeList();
            TreeData treeData = new TreeData();
            treeData.setId(level3Id);
            treeData.setLevel("3");
            treeList.setData(level3Data);
            treeList.setAttr(treeData);
            level3List.add(treeList);

            level1 = employee.getDivisionCode();
            level2 = employee.getDepartmentCode();
            
        }
        
        model.addAttribute("level1List",level1List);
        return "singleJsonView";
    }
    
    @RequestMapping(value="/pattern/px2/retrieveEmployee.do")
    public String retrieveEmployee(String num, ModelMap model) {
        Employee employee = new Employee();
        employee.setNum(num);
        Employee result = employeeService.retrieveEmployee(employee);
        Code code = new Code();
        code.setCodeGroup(result.getDivisionCode());
        
        model.addAttribute("result", result);
        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
        return "ajaxView";
    }
    
    @RequestMapping(value="/pattern/px2/initializeEmployeeList.do")
    public String initializeEmployeeList(ModelMap model) {
        List<Code> divisionCodeList = codeService.retrieveDivisionCodeList();
        List<Code> joblevelCodeList = codeService.retrieveJobLevelCodeList();
        List<Code> skillCodeList = codeService.retrieveSkillCodeList();

        model.addAttribute("result", new Employee());
        model.addAttribute("divisionCodeList", divisionCodeList);
        model.addAttribute("joblevelCodeList", joblevelCodeList);
        model.addAttribute("skillCodeList", skillCodeList);

        return "pattern/px2/employeeList";
    }
    
    @RequestMapping(value="/pattern/px2/insertEmployee.do")
    public String insertEmployee(Employee employee){
        employeeService.insertEmployee(employee);
        return "ajaxView";
    }

    @RequestMapping(value="/pattern/px2/updateEmployee.do")
    public String updateEmployee(Employee employee) {
        employeeService.updateEmployee(employee);
        return "ajaxView";
    }

    @RequestMapping(value="/pattern/px2/deleteEmployee.do")
    public String deleteEmployee(Employee employee){
        employeeService.deleteEmployee(employee);
        return "ajaxView";
    }
}
