package teste;

import java.util.HashMap;
import java.util.Map;

public class Controller {

    public Map<String, ? extends Object> result() {        
        Map<String, Object> t = new HashMap<String, Object>();
        t.put("oi", "ola");
        return t;
    }

}
