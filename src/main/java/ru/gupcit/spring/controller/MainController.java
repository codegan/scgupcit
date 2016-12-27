package ru.gupcit.spring.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

/**
 * Created by zaur on 22.12.16.
 */
@Controller
public class MainController {
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
    public ModelAndView getApplication(){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", userDetails.getUsername());
        modelAndView.setViewName("/admin/application");
        return modelAndView;
    }

    @RequestMapping(value = "/admin/users", method = RequestMethod.GET)
    public ModelAndView getUsers(ModelAndView modelAndView){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        modelAndView.addObject("user", userDetails.getUsername());
        modelAndView.setViewName("/admin/users");
        return modelAndView;
    }

    @RequestMapping(value = "/admin/organizations", method = RequestMethod.GET)
    public ModelAndView getOrganizations(ModelAndView modelAndView){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        modelAndView.addObject("user", userDetails.getUsername());
        modelAndView.setViewName("/admin/organizations");
        return modelAndView;
    }

    @RequestMapping(value = "user/application", method = RequestMethod.GET)
    public ModelAndView getUserApplication(){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", userDetails.getUsername());
        modelAndView.setViewName("/user/application");
        return modelAndView;
    }
}
