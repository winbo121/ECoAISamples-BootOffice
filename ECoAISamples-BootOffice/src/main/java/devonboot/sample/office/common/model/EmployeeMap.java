package devonboot.sample.office.common.model;

import java.util.HashMap;
import java.util.Map;


public class EmployeeMap {
    
    private Map<String, Object> map = new HashMap<String, Object>();

    
    public Map<String, Object> getMap() {
        return map;
    }
    
    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
