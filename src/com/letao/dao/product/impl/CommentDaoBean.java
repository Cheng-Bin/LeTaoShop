package com.letao.dao.product.impl;

import org.springframework.stereotype.Repository;

import com.letao.dao.impl.DaoSupport;
import com.letao.dao.product.IComment;
import com.letao.model.product.Comment;

@Repository(value="commentDaoBean")
public class CommentDaoBean extends DaoSupport<Comment> implements IComment {

}
