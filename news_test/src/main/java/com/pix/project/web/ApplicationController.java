package com.pix.project.web;

import com.pix.project.domain.NewsComment;
import com.pix.project.service.NewsCommentService;
import com.pix.project.service.NewsDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * TODO
 *
 * @description:
 * @author: 皮克斯
 * @date: 2019-11-27 14:32
 */
@Controller
public class ApplicationController {

    @Autowired
    private NewsDetailService newsDetailService;
    @Autowired
    private NewsCommentService newsCommentService;


    @GetMapping("/list")
    public String list(String search, Model model) {
        if (search != null) {
            model.addAttribute("list", newsDetailService.showBySearch(search));
        } else {
            model.addAttribute("list", newsDetailService.showAll());
        }
        return "list";
    }

    @GetMapping("/comment")
    public String comment(String newsid, Model model) {

        if(newsid != null){
            int id = Integer.parseInt(newsid);
            model.addAttribute("comments",newsCommentService.showByNewsid(id));
            System.out.println();
            model.addAttribute("title",newsDetailService.selectTitleById(id));
        }
        return "comment";
    }

    @GetMapping("/add")
    public String addComment(String newsid){
        if(newsid == null){
            return "list";
        }
        return "add_comment";
    }

    @ResponseBody
    @PostMapping("/add")
    public boolean addCommentForm(String newsid,NewsComment comment){
        if(comment != null && newsid != null){
            comment.setNewsid(Integer.parseInt(newsid));
            comment.setCreatedate(new Date());
            return newsCommentService.insertByNewsid(comment);
        }
        return false;
    }

    @ResponseBody
    @PostMapping("/delete")
    public boolean delete(int newsid){
        if(newsCommentService.showByNewsid(newsid).size()>0){
            return newsCommentService.deleteByNewsid(newsid)&&newsDetailService.deleteById(newsid);
        }else{
            return newsDetailService.deleteById(newsid);
        }
    }


}
