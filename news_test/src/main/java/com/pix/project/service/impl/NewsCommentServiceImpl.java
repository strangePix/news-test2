package com.pix.project.service.impl;

import com.pix.project.domain.NewsComment;
import com.pix.project.mapper.NewsCommentMapper;
import com.pix.project.service.NewsCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * TODO
 *
 * @description:
 * @author: 皮克斯
 * @date: 2019-11-27 14:31
 */
@Service
@Transactional
public class NewsCommentServiceImpl implements NewsCommentService {
    @Autowired
    private NewsCommentMapper newsCommentMapper;

    @Override
    public List<NewsComment> showByNewsid(int newsid) {
        return newsCommentMapper.selectByNewsid(newsid);
    }

    @Override
    public boolean insertByNewsid(NewsComment comment) {
        System.out.println("1");
        int success = newsCommentMapper.insertByNewsid(comment);
        if (success <= 0)
            return false;
        else return true;
    }

    @Override
    public boolean deleteByNewsid(int newsid) {
        return newsCommentMapper.deleteByNewsid(newsid)>0;
    }
}
