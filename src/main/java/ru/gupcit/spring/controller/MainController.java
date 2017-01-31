package ru.gupcit.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.gupcit.spring.dao.ApplicationsDaoImpl;
import ru.gupcit.spring.dao.CategoriesDaoImpl;
import ru.gupcit.spring.dao.SystemsDaoImpl;
import ru.gupcit.spring.model.Applications;
import ru.gupcit.spring.model.Categoryes;
import ru.gupcit.spring.model.Systems;
import ru.gupcit.spring.model.Users;
import ru.gupcit.spring.service.AuthenticationService;

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

    @Autowired
    AuthenticationService authenticationService;

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
    public String getUsers(Model model){
        model.addAttribute("usersList", authenticationService.usersList());
        return "/admin/administration";
    }
    @RequestMapping(value= "/admin/administration/user/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("setUser") Users users){
       authenticationService.addUser(users);
        return "redirect:/admin/administration";
    }

    @RequestMapping(value = "user/application", method = RequestMethod.GET)
    public String  getUserApplication(Model model){
        List<Applications> applications = applicationsDao.getApplicationsFromUser();
        List<Categoryes> categoryes = categoriesDao.getAllCategoryes();
        List<Systems> systems = systemsDao.getAllSystemses();
        Users users = authenticationService.getUsersDao();
        model.addAttribute("app", applications);
        model.addAttribute("categ", categoryes);
        model.addAttribute("syst", systems);
        model.addAttribute("setApp", new Applications());
        model.addAttribute("userinfo", users);
        return "/user/application";
    }
    @RequestMapping(value= "/user/application/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("setapp") Applications applications){
       applicationsDao.setApplication(applications);
        return "redirect:/user/application";
    }

    @RequestMapping("/admin/application/edit/{id}")
    public String editBook(@PathVariable("id") int id){
         applicationsDao.setApplicationDateEnd(id);
        return "redirect:/admin/application";
    }

    @RequestMapping(value = "/admin/application/excel", method= RequestMethod.GET)
    public ModelAndView excel() {
        System.out.println("ExcelPDFController excel is called");

        List<Applications> applicationses = applicationsDao.getAllApplications();

        //excelDocument - look excel-pdf-config.xml
        return new ModelAndView("excelDocument", "modelObject", applicationses);

    }

    @RequestMapping(value = "/admin/application/pdf", method= RequestMethod.GET)
    public ModelAndView pdf() {

        System.out.println("ExcelPDFController pdf is called");

        List<Applications> applicationses = applicationsDao.getAllApplications();
        //pdfDocument - look excel-pdf-config.xml
        return new ModelAndView("pdfDocument", "modelObject", applicationses);

    }
}
