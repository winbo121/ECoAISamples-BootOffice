package devonboot.sample.office.common.menu.model;


public class Menu {
    
    private int menuId;
    
    private String  menuName;
    
    private String menuDescritpion;
    
    private int menuLevel;
    
    private int menuSequence;
    
    private int parentMenuId;
    
    private String useFlag;
    
    private String actionUrl;

    
    public int getMenuId() {
        return menuId;
    }

    
    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    
    public String getMenuName() {
        return menuName;
    }

    
    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    
    public String getMenuDescritpion() {
        return menuDescritpion;
    }

    
    public void setMenuDescritpion(String menuDescritpion) {
        this.menuDescritpion = menuDescritpion;
    }

    
    public int getMenuLevel() {
        return menuLevel;
    }

    
    public void setMenuLevel(int menuLevel) {
        this.menuLevel = menuLevel;
    }

    
    public int getMenuSequence() {
        return menuSequence;
    }

    
    public void setMenuSequence(int menuSequence) {
        this.menuSequence = menuSequence;
    }

    
    public int getParentMenuId() {
        return parentMenuId;
    }

    
    public void setParentMenuId(int parentMenuId) {
        this.parentMenuId = parentMenuId;
    }

    
    public String getUseFlag() {
        return useFlag;
    }

    
    public void setUseFlag(String useFlag) {
        this.useFlag = useFlag;
    }


    
    public String getActionUrl() {
        return actionUrl;
    }


    
    public void setActionUrl(String actionUrl) {
        this.actionUrl = actionUrl;
    }
}
