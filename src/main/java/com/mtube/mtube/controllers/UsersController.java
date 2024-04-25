package com.mtube.mtube.controllers;

import com.mtube.mtube.models.Track;
import com.mtube.mtube.models.User;
import com.mtube.mtube.repositories.ITrack;
import com.mtube.mtube.repositories.IUser;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import java.util.Base64;
import java.util.Date;
import java.util.List;

@Controller
public class UsersController {

    @Autowired
    IUser service;

    @Autowired
    ITrack trackService;

    @Autowired
    IUser userService;

    @RequestMapping("/profile")
    public String profile(Model model, HttpSession session){
        int userId = 0;
        try {
            userId = (int) session.getAttribute("LoggedId");
        } catch (Exception e) {
            return "redirect:/errorLogin";
        }

        User user = userService.getById(userId);
        if(user == null) { return "redirect:/error"; }

        List<Track> trackList = trackService.getUserTracks(userId);
        model.addAttribute("trackList", trackList);
        model.addAttribute("user", user);
        return "index";
    }

    @RequestMapping("/register")
    public String registerForm(Model model){
        return "register";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public RedirectView register(@RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("avatar") MultipartFile avatar){
        try {
            if (avatar != null) {
                byte[] bytes = avatar.getBytes();
                String base64 = Base64.getEncoder().encodeToString(bytes);
                User user = new User(0, email, password, base64, new Date());

                if(service.register(user)){
                    return new RedirectView("login");
                } else {
                    return  new RedirectView("error");
                }
            }
            return new RedirectView("register");
        }
        catch (Exception e) {
            return new RedirectView("error");
        }
    }

    @RequestMapping("/login")
    public String loginForm(Model model){
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public RedirectView login(@RequestParam("email") String email,
                              @RequestParam("password") String password,
                              HttpSession session){
        try {
            User user = service.login(email, password);
            if(user != null){
                session.setAttribute("LoggedEmail", user.getEmail());
                session.setAttribute("LoggedId", user.getId());
                return new RedirectView("profile");
            }
            return new RedirectView("register");
        }
        catch (Exception e) {
            return new RedirectView("error");
        }
    }
}
