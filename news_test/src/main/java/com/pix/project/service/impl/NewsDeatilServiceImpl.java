package com.pix.project.service.impl;

import com.pix.project.domain.NewsDetail;
import com.pix.project.mapper.NewsDetailMapper;
import com.pix.project.service.NewsDetailService;
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
public class NewsDeatilServiceImpl implements NewsDetailService {
    @Autowired
    private NewsDetailMapper newsDetailMapper;

    @Override
    public List<NewsDetail> showAll() {
        return newsDetailMapper.selectAll();
    }

    @Override
    public List<NewsDetail> showBySearch(String search) {
        search = "%" + search + "%";
        return newsDetailMapper.selectBySearch(search);
    }

    @Override
    public String selectTitleById(int id) {
        return newsDetailMapper.selectTitleById(id);
    }

    @Override
    public boolean deleteById(int id) {
        return newsDetailMapper.deleteById(id)>0;
    }
}
