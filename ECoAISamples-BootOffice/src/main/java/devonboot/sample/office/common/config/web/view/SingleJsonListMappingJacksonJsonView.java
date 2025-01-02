package devonboot.sample.office.common.config.web.view;

import java.util.Map;

import org.springframework.web.servlet.view.json.MappingJackson2JsonView;


public class SingleJsonListMappingJacksonJsonView extends MappingJackson2JsonView{

    @Override
    protected Object filterModel(Map<String, Object> model)
    {	
       Object result = super.filterModel(model);
       if (!(result instanceof Map))
       {
          return result;
       }
       
       @SuppressWarnings("rawtypes")
       Map map = (Map) result;
       if (map.size() == 1)
       {
          return map.values().toArray()[0];
       }
       return map;
    }

}
