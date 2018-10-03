package cn.edu.nyist.food.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.alibaba.druid.pool.DruidDataSource;

import cn.edu.nyist.food.front.controller.FrontUserInterceptor;

@Configuration
public class DataSourceConfig extends WebMvcConfigurerAdapter {
	@Autowired
	private Environment en;

	@Bean(name = "dataSource")
	public DataSource getDataSource() {

		DruidDataSource ds = new DruidDataSource();
		ds.setUsername(en.getProperty("spring.datasource.username").trim());
		ds.setPassword(en.getProperty("spring.datasource.password").trim());
		ds.setUrl(en.getProperty("spring.datasource.url").trim());
		ds.setDriverClassName(en.getProperty("spring.datasource.driverClassName").trim());
		return ds;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 配置前端拦截器
		registry.addInterceptor(new FrontUserInterceptor()).addPathPatterns("/front/**");
	}
}
