package com.kidzpark;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@SpringBootApplication
@MapperScan(value = {"com.kidzpark.kidzzone.mapper"} )
@MapperScan(value = {"com.kidzpark.board.mapper"} )
@MapperScan(value = {"com.kidzpark.user.mapper"} )
@MapperScan(value = {"com.kidzpark.chat.mapper"} )
@MapperScan(value = {"com.kidzpark.cs.mapper"} )
@MapperScan(value = {"com.kidzpark.admin.mapper"} )
public class KidzparkApplication {

   public static void main(String[] args) {
      SpringApplication.run(KidzparkApplication.class, args);
   }
   
   @Bean
   public  SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
      SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
      sqlSessionFactory.setDataSource(dataSource);
      
      // import org.springframework.core.io.Resource;
      Resource[] res = new PathMatchingResourcePatternResolver()
            .getResources("classpath:mapper/*.xml");
      sqlSessionFactory.setMapperLocations(res);
      
      return sqlSessionFactory.getObject();
   }
   
     
    /**
     * HiddenHttpMethodFilter   
     * <form:from> tag 사용위함
     * import org.springframework.web.filter.HiddenHttpMethodFilter;
     */
    @Bean
    public HiddenHttpMethodFilter hiddenHttpMethodFilter(){
        HiddenHttpMethodFilter filter = new HiddenHttpMethodFilter();
        return filter;
    }

}