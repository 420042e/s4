/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Config.Conexion;
import Entidad.Estudiante;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author WINDOWS 10
 */
@Controller
public class Controlador {
    Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav=new ModelAndView();
    int id;
    List datos;
    
    @RequestMapping("index.htm")
    public ModelAndView Listar()
    {
        String sql = "select * from estudiante";
        datos=this.jdbcTemplate.queryForList(sql);       
        mav.addObject("lista",datos);
        mav.setViewName("index");
        return mav;
    }
    
    @RequestMapping(value="buscarE.htm", method=RequestMethod.GET)
    public ModelAndView Buscar(HttpServletRequest request)
    {
        String sql = "select * from estudiante where id LIKE '%"+request.getParameter("id")+"%' AND first_name LIKE '%"+request.getParameter("first_name")+"%' AND last_name LIKE '%"+request.getParameter("last_name")+"%'";
        datos=this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        mav.setViewName("buscarE");
        return mav;
    }
    
    @RequestMapping(value="agregarE.htm", method=RequestMethod.GET)
    public ModelAndView Agregar()
    {
        String sql = "select code, title from clase";
        datos=this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        
        mav.addObject(new Estudiante());
        mav.setViewName("agregarE");
        return mav;
    }
    
    @RequestMapping(value="agregarE.htm", method=RequestMethod.POST)
    public ModelAndView Agregar(Estudiante e)
    {
        
        GeneratedKeyHolder holder = new GeneratedKeyHolder();
        this.jdbcTemplate.update(new PreparedStatementCreator() {
        public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
            PreparedStatement statement = con.prepareStatement("insert into estudiante(last_name, first_name) values (?,?)", Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, e.getLast_name());
            statement.setString(2, e.getFirst_name());
            return statement;
        }
    }, holder);
        long primaryKey = holder.getKey().longValue();

        /*String sql="insert into estudiante(last_name, first_name) values (?,?)";
        this.jdbcTemplate.update(sql, e.getLast_name(), e.getFirst_name());*/
        
        

        
        String sql2="insert into asiste(id, code) values (?,?)";
        this.jdbcTemplate.update(sql2, primaryKey, e.getCode());
        
        //return new ModelAndView("redirect:/index.htm");
        return new ModelAndView("redirect:/detalleC.htm?code="+e.getCode());
    }
    
    @RequestMapping(value="editarE.htm", method=RequestMethod.GET)
    public ModelAndView Editar(HttpServletRequest request)
    {
        id= Integer.parseInt(request.getParameter("id"));
        String sql = "select * from estudiante where id="+id;
        datos=this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        mav.setViewName("editarE");
        return mav;
    }
    
    @RequestMapping(value="editarE.htm", method=RequestMethod.POST)
    public ModelAndView Editar(Estudiante e){
        String sql="update estudiante set first_name=?, last_name=? where id=?";
        this.jdbcTemplate.update(sql, e.getFirst_name(), e.getLast_name(),id);
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping("deleteE.htm")
    public ModelAndView Delete(HttpServletRequest request) {
        id=Integer.parseInt(request.getParameter("id"));
        String sql="delete from estudiante where id="+id;
        this.jdbcTemplate.update(sql);
        
        String sql2="delete from asiste where id="+id;
        this.jdbcTemplate.update(sql2);
        
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping(value="detalleE.htm", method=RequestMethod.GET)
    public ModelAndView Detalle(HttpServletRequest request)
    {
        id= Integer.parseInt(request.getParameter("id"));
        String sql = "select * from asiste a LEFT JOIN clase e ON a.code=e.code where a.id="+id;
        datos=this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        mav.setViewName("detalleE");
        return mav;
    }
}
