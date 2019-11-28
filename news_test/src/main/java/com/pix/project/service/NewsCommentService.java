package com.pix.project.service;

import com.pix.project.domain.NewsComment;

import java.util.List;

/**
 * TODO
 *
 * @description:
 * @author: 皮克斯
 * @date: 2019-11-27 14:30
 */
public interface NewsCommentService {
    List<NewsComment> showByNewsid(int newsid);
    boolean insertByNewsid(NewsComment comment);
    boolean deleteByNewsid(int newsid);
}
