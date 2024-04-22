package com.mtube.mtube.services;

import com.mtube.mtube.repositories.IStorageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import org.springframework.core.env.Environment;

@Service
public class StorageService implements IStorageRepository {

    @Autowired
    private ResourceLoader resourceLoader;

    @Override
    public void saveFile(MultipartFile file, Environment env) {
        try {
            if(file != null) {
                Resource resource = resourceLoader.getResource("classpath:static/music");
                // Get the absolute path
                String absolutePath = resource.getFile().getAbsolutePath();
                Path targetLocation = Paths.get(absolutePath);
                Files.createDirectories(targetLocation);
                targetLocation = Paths.get(absolutePath, file.getOriginalFilename());
                Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
            }
        }
        catch(Exception ex){

        }
    }
}
