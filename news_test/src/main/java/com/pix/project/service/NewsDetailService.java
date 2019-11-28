package com.pix.project.service;

import com.pix.project.domain.NewsDetail;

import java.util.List;

/**
 * TODO
 *
 * @description:
 * @author: 皮克斯
 * @date: 2019-11-27 14:30
 */
public interface NewsDetailService {
    List<NewsDetail> showAll();
    List<NewsDetail> showBySearch(String search);
    String selectTitleById(int id);
    boolean deleteById(int id);
}
