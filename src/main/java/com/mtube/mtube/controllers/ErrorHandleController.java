package com.mtube.mtube.controllers;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorHandleController implements ErrorController {
    @RequestMapping("/error")
    public String handleDefaultError(Model model) {
        model.addAttribute(
                "errorMessage",
                "We're sorry, but something went wrong. We've been notified about this issue and we'll take a look at it shortly.");
        model.addAttribute("redirectUrl", "/");
        model.addAttribute("redirectMessage", "Return to Home");
        return "error";
    }

    @RequestMapping("/errorLogin")
    public String handleLoginError(Model model) {
        model.addAttribute(
                "errorMessage",
                "It seems you're not logged in. To get access to this feature, please log in to your account.");
        model.addAttribute("redirectUrl", "/login");
        model.addAttribute("redirectMessage", "Login");
        return "error";
    }
}

