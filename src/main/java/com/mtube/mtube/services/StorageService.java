package com.mtube.mtube.services;

import com.mtube.mtube.repositories.IStorageRepository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class StorageService implements IStorageRepository {
    @Override
    public String saveFile(MultipartFile file) {
        try {
            File musicFolder = new File("src/main/resources/static/music");
            Path fileStorageLocation = Paths.get(musicFolder.getAbsolutePath());

            if (!Files.exists(fileStorageLocation)) {
                Files.createDirectories(fileStorageLocation);
            }

            Path filePath = fileStorageLocation.resolve(file.getOriginalFilename());

            file.transferTo(filePath.toFile());

            return "/music/" + file.getOriginalFilename();
        } catch (Exception e) {
            return "";
        }
    }
}
