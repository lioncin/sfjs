/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sanyet.fireball.szcea.dao.StatDetailDao;
import com.sanyet.fireball.szcea.entity.StatDetail;

/**
 * StatDetailService
 *
 * @author hanjian
 */
@Service
public class StatDetailService {
    private static final Logger logger = LogManager.getLogger(StatDetailService.class);

    @Autowired
    private StatDetailDao statDetailDao;

    public List<StatDetail> getStatDetailByStatId(int statId) {
        try {
            return statDetailDao.getByStatId(statId);
        } catch (Exception ex) {
            logger.error("Failed to search the StatDetail.", ex);
        }
        return null; 
    }
}


