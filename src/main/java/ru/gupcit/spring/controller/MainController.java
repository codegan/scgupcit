package ru.gupcit.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ru.gupcit.spring.dao.ApplicationsDaoImpl;
import ru.gupcit.spring.dao.CategoriesDaoImpl;
import ru.gupcit.spring.dao.SystemsDaoImpl;
import ru.gupcit.spring.model.Applications;
import ru.gupcit.spring.model.Categoryes;
import ru.gupcit.spring.model.Systems;

import java.security.Principal;
import java.util.List;

/**
 * Created by zaur on 22.12.16.
 */
@Controller
public class MainController {

    @Autowired
    ApplicationsDaoImpl applicationsDao;
    @Autowired
    CategoriesDaoImpl categoriesDao;
    @Autowired
    SystemsDaoImpl systemsDao;

    @RequestMapping(value = {"/test" }, method = RequestMethod.GET)
    public ModelAndView test() {
        ModelAndView model = new ModelAndView();
        model.setViewName("/test");
        return model;
    }
    @RequestMapping(value = {"/test2" }, method = RequestMethod.GET)
    public ModelAndView test2() {
        ModelAndView model = new ModelAndView();
        model.setViewName("/test2");
        return model;
    }
    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Неправильный логин или пароль");
        }
        model.setViewName("/index");
        return model;
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public ModelAndView getError(Principal user){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ModelAndView model = new ModelAndView();
        if(user!=null){
            model.addObject("errorMsg",userDetails.getAuthorities() + " " + userDetails.getUsername() + " у вас нет доступа к странице");
        }else {
            model.addObject("errorMsg", "у вас нет доступа к странице");
        }
        model.setViewName("/error");
        return model;

    }

    @RequestMapping(value = "/admin/application", method = RequestMethod.GET)
    public String getApplication(Model model){

        List<Applications> allApplications = applicationsDao.getAllApplications();
        int size = allApplications.size();
        model.addAttribute("stat", size);
        model.addAttribute("list", allApplications);
        return "/admin/application";
    }

    @RequestMapping(value = "/admin/administration", method = RequestMethod.GET)
    public ModelAndView getUsers(ModelAndView modelAndView){
        modelAndView.setViewName("/admin/administration");
        return modelAndView;
    }

    @RequestMapping(value = "user/application", method = RequestMethod.GET)
    public String  getUserApplication(Model model){
        List<Applications> applications = applicationsDao.getApplicationsFromUser();
        List<Categoryes> categoryes = categoriesDao.getAllCategoryes();
        List<Systems> systems = systemsDao.getAllSystemses();
        model.addAttribute("app", applications);
        model.addAttribute("categ", categoryes);
        model.addAttribute("syst", systems);
        model.addAttribute("setApp", new Applications());
        return "/user/application";
    }
    @RequestMapping(value= "/user/application/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("setapp") Applications applications){
       applicationsDao.setApplication(applications);
        return "redirect:/user/application";
    }
}
