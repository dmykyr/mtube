package com.mtube.mtube.repositories;

import org.springframework.core.env.Environment;
import org.springframework.web.multipart.MultipartFile;

public interface IStorageRepository {
    String saveFile(MultipartFile file);
}
