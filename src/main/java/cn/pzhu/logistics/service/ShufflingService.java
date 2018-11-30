package cn.pzhu.logistics.service;

import cn.pzhu.logistics.pojo.Shuffling;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface ShufflingService {
    List<Shuffling> selectAllFromShuffling();
    Boolean deleteById(Integer id);
    Boolean insertImage(Shuffling shuffling, MultipartFile multipartFile) throws IOException;
}
