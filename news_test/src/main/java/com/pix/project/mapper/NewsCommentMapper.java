package com.pix.project.mapper;

import com.pix.project.domain.NewsComment;
import org.apache.ibatis.annotations.Param;
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
public interface NewsCommentMapper {
    List<NewsComment> selectByNewsid(int newsid);
    int insertByNewsid(@Param("comment") NewsComment comment);
    int deleteByNewsid(int newsid);
}
