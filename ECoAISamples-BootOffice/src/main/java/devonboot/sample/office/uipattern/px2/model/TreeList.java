package devonboot.sample.office.uipattern.px2.model;

import java.util.ArrayList;
import java.util.List;


public class TreeList {
    
    String data;
    
    TreeData attr = new TreeData();
    
    List<TreeList> children = new ArrayList<TreeList>();
    
    
    
    public String getData() {
        return data;
    }


    
    public void setData(String data) {
        this.data = data;
    }

    
    public TreeData getAttr() {
        return attr;
    }

    
    public void setAttr(TreeData attr) {
        this.attr = attr;
    }

    public List<TreeList> getChildren() {
        return children;
    }

    public void setChildren(List<TreeList> children) {
        this.children = children;
    }

    public void clear() {
        this.data = "";
        this.attr = new TreeData();
        this.children.clear();
    }
    
    public TreeList clone() {
        TreeList result = new TreeList();
        result.setData(this.data);
        result.getAttr().setId(this.attr.getId());
        result.getAttr().setLevel(this.attr.getLevel());
        result.getChildren().addAll(this.children);
        return result;
        
    }
}

