package devonboot.sample.office;

import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import devonboot.common.DevOnApplication;
import devonboot.common.annotation.DevOnBootApplication;


@DevOnBootApplication
public class DevOnOfficeApplication extends SpringBootServletInitializer { 

	public static void main(String[] args) {
		DevOnApplication.run(DevOnOfficeApplication.class, args);
	}
}
