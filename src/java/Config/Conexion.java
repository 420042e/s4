/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;

import java.sql.DriverManager;
import java.sql.SQLException;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author WINDOWS 10
 */
public class Conexion {
    public DriverManagerDataSource Conectar() {
        DriverManagerDataSource datasource = new DriverManagerDataSource();
        try{
            
            datasource.setDriverClassName("com.mysql.jdbc.Driver");
            datasource.setUrl("jdbc:mysql://localhost:3306/scheduledh");
            datasource.setUsername("root");
            datasource.setPassword("");
            return datasource;
        } catch (Exception e) {
         System.out.println("La base de datos no está conectada");
         return null;
       } 
        /*DriverManagerDataSource datasource = new DriverManagerDataSource();
        datasource.setDriverClassName("com.mysql.jdbc.Driver");
        datasource.setUrl("jdbc:mysql://localhost:3306/scheduledh");
        datasource.setUsername("root");
        datasource.setPassword("");
        return datasource;*/
    }
}
