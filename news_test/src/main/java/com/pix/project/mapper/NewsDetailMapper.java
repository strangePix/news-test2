package com.pix.project.mapper;

import com.pix.project.domain.NewsDetail;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TODO
 *
 * @description:
 * @author: 皮克斯
 * @date: 2019-11-27 14:29
 */
@Repository
public interface NewsDetailMapper {
    List<NewsDetail> selectAll();
    List<NewsDetail> selectBySearch(String search);
    String selectTitleById(int id);
    int deleteById(int id);
}
