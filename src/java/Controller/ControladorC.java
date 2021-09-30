/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Config.Conexion;
import Entidad.Clase;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author WINDOWS 10
 */
@Controller
public class ControladorC {
    Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav=new ModelAndView();
    int code;
    List datos;
    
    @RequestMapping("clases.htm")
    public ModelAndView Listar()
    {
        String sql = "select * from clase";
        datos=this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        mav.setViewName("clases");
        return mav;
    }
    
    @RequestMapping(value="buscarC.htm", method=RequestMethod.GET)
    public ModelAndView Buscar(HttpServletRequest request)
    {
        String sql = "select * from clase where code LIKE '%"+request.getParameter("code")+"%' AND title LIKE '%"+request.getParameter("title")+"%' AND description LIKE '%"+request.getParameter("description")+"%'";
        datos=this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        mav.setViewName("buscarC");
        return mav;
    }
    
    @RequestMapping(value="agregarC.htm", method=RequestMethod.GET)
    public ModelAndView Agregar()
    {
        mav.addObject(new Clase());
        mav.setViewName("agregarC");
        return mav;
    }
    
    @RequestMapping(value="agregarC.htm", method=RequestMethod.POST)
    public ModelAndView Agregar(Clase c)
    {
        String sql="insert into clase(title, description) values (?,?)";
        this.jdbcTemplate.update(sql, c.getTitle(), c.getDescription());
        return new ModelAndView("redirect:/clases.htm");
    }
    
    @RequestMapping(value="editarC.htm", method=RequestMethod.GET)
    public ModelAndView Editar(HttpServletRequest request)
    {
        code= Integer.parseInt(request.getParameter("code"));
        String sql = "select * from clase where code="+code;
        datos=this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        mav.setViewName("editarC");
        return mav;
    }
    
    @RequestMapping(value="editarC.htm", method=RequestMethod.POST)
    public ModelAndView Editar(Clase c){
        String sql="update clase set title=?, description=? where code=?";
        this.jdbcTemplate.update(sql, c.getTitle(), c.getDescription(),code);
        return new ModelAndView("redirect:/clases.htm");
    }
    
    @RequestMapping("deleteC.htm")
    public ModelAndView Delete(HttpServletRequest request) {
        code=Integer.parseInt(request.getParameter("code"));
        String sql="delete from clase where code="+code;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/clases.htm");
    }
    
    @RequestMapping(value="detalleC.htm", method=RequestMethod.GET)
    public ModelAndView Detalle(HttpServletRequest request)
    {
        code= Integer.parseInt(request.getParameter("code"));
        mav.addObject("codigo",code);
        
        String sql = "select * from asiste a LEFT JOIN estudiante e ON a.id=e.id where a.code="+code+ " AND e.id LIKE '%"+request.getParameter("id")+"%' AND e.first_name LIKE '%"+request.getParameter("first_name")+"%' AND e.last_name LIKE '%"+request.getParameter("last_name")+"%'";
        datos=this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        mav.setViewName("detalleC");
        return mav;
    }

    
}
