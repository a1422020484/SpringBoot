package com.huhy.springboot_easyui.project.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

/**
 * 加载数据源信息
 */

@Configuration
@MapperScan(basePackages = "com.huhy.springboot_easyui.project.dao.pri", sqlSessionTemplateRef  = "test1SqlSessionTemplate")
public class DataSource1Config {
    /**
     * @author huhy
     * @ClassName:DataSource1Config
     * @date 2018/5/9 10:34 
     * @Description: ${todo} 根据配置文件生成相对应的数据源
     */
    @Bean(name = "test1DataSource")
    @ConfigurationProperties(prefix = "spring.datasource.pri")
    @Primary
    public DataSource testDataSource() {
        return DataSourceBuilder.create().build();
    }

    
    /**
     * @author huhy
     * @ClassName:DataSource1Config
     * @date 2018/5/9 10:35 
     * @Description: ${todo}   通过工厂把数据源注入
     */
    @Bean(name = "test1SqlSessionFactory")
    @Primary
    public SqlSessionFactory testSqlSessionFactory(@Qualifier("test1DataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        //指定dao对应的xml的路径，这样可以动态加载，解耦和
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:/mapper/pri/*.xml"));
        return bean.getObject();
    }
    /**
     * @author huhy
     * @ClassName:DataSource1Config
     * @date 2018/5/9 10:36 
     * @Description: ${todo}  给指定数据源加载上事物
     */
  /*  @Bean(name = "test1TransactionManager")
    @Primary
    public DataSourceTransactionManager testTransactionManager(@Qualifier("test1DataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }*/
    /**
     * @author huhy
     * @ClassName:DataSource1Config
     * @date 2018/5/9 10:36 
     * @Description: 把工厂放入template模板中
     */
    @Bean(name = "test1SqlSessionTemplate")
    @Primary
    public SqlSessionTemplate testSqlSessionTemplate(@Qualifier("test1SqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}
