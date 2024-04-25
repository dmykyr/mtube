package com.mtube.mtube.controllers;

import com.mtube.mtube.models.Track;
import com.mtube.mtube.repositories.IStorageRepository;
import com.mtube.mtube.repositories.ITrack;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.List;

@Controller
public class TracksController {

    @Autowired
    ITrack service;

    @Autowired
    Environment env;

    @Autowired
    IStorageRepository storageService;

    @RequestMapping("/")
    public String registerForm(Model model){
        List<Track> tracks = service.getTracks("public");
        model.addAttribute("tracks", tracks);
        return "tracklist";
    }

    @RequestMapping(value = "/addtrack", method = RequestMethod.POST)
    public RedirectView addTrack(@RequestParam("title") String title,
                                 @RequestParam("artist") String artist,
                                 @RequestParam("audiopath") MultipartFile audiopath,
                                 @RequestParam("trackstatus") String trackstatus,
                                 HttpSession session ){
        try {
            int userid = (int) session.getAttribute("LoggedId");
            if(userid == 0) return new RedirectView("login");
            String path = "";
            if(audiopath != null){
                path = storageService.saveFile(audiopath);
            }
            Track track = new Track(0, title, artist, userid,path, new Date(), trackstatus);
            service.addTrack(track);
            return new RedirectView("/");
        }
        catch(Exception ex){
            return new RedirectView("/");
        }
    }

    @RequestMapping(value = "/change-track-status", method = RequestMethod.POST)
    public RedirectView changeTrackStatus(
            Model model,
            @RequestParam("trackId") int trackId,
            @RequestParam("status") String curStatus)
    {
        String updStatus = curStatus.equals("public") ? "private" : "public";
        service.changeStatus(trackId, updStatus);
        return new RedirectView("profile");
    }

    @RequestMapping(value = "/delete-track", method = RequestMethod.POST)
    public RedirectView deleteTrack(
            Model model,
            @RequestParam("trackId") int trackId)
    {
        service.deleteTrack(trackId);
        return new RedirectView("profile");
    }
}
