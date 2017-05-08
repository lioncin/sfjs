/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sanyet.fireball.base.entity.SearchParam;
import com.sanyet.fireball.base.entity.SearchResult;
import com.sanyet.fireball.base.jdbc.TxnTemplate;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.szcea.dao.StatConferenceDao;
import com.sanyet.fireball.szcea.dao.StatDetailDao;
import com.sanyet.fireball.szcea.dao.StatisticsDao;
import com.sanyet.fireball.szcea.entity.ConferenceDataSheet;
import com.sanyet.fireball.szcea.entity.StatConference;
import com.sanyet.fireball.szcea.entity.StatDetail;
import com.sanyet.fireball.szcea.entity.Statistics;

/**
 * StatisticsService
 *
 * @author hanjian
 */
@Service
public class StatisticsService {
    private static final Logger logger = LogManager.getLogger(StatisticsService.class);

    @Autowired
    private StatisticsDao statisticsDao;
    @Autowired
    private StatDetailDao statDetailDao;
    @Autowired
    private StatConferenceDao statConferenceDao;

    public void createStatistics(Statistics statistics) {
        if (statistics == null)
            return;
        
        new TxnTemplate() {
            @Override
            public void execute() {
                statisticsDao.create(statistics);
                int statId = statistics.getId();
                List<StatDetail> statDetails = statistics.getStatDetail();
                if (statDetails != null) {
                    for (StatDetail statDetail : statDetails) {
                        statDetail.setStatId(statId);
                        statDetailDao.create(statDetail);
                    }
                }
            }
        }.executeInTransaction();
    }

    public void updateStatistics(Statistics statistics) {
        if (statistics == null)
            return;
        
        new TxnTemplate() {
            @Override
            public void execute() {
                int statId = statistics.getId();
                statDetailDao.deleteByStatId(statId);
                List<StatDetail> statDetails = statistics.getStatDetail();
                if (statDetails != null) {
                    for (StatDetail statDetail : statDetails) {
                        statDetail.setStatId(statId);
                        statDetailDao.create(statDetail);
                    }
                }
                statisticsDao.update(statistics);
            }
        }.executeInTransaction();
    }
    
    public Statistics getStatistics(int id) {
        if (id <= 0)
            return null;

        Statistics statistics = null;
        try {
            statistics = statisticsDao.retrieve(id);
        } catch (Exception ex) {
            throw new RuntimeException("can not get Statistics", ex);
        }
        return statistics;
    }
    
    public Statistics getStatisticsByMore(String year, int byId, String type) {
        if (StringUtil.isEmpty(year) || byId <= 0) {
            return null;
        }

        Statistics statistics = null;
        try {
            statistics = statisticsDao.retrieveByMore(year, byId, type);
        } catch (Exception ex) {
            throw new RuntimeException("can not get Statistics", ex);
        }
        return statistics;
    }
    
    public void deleteStatistics(int id) {
        if (id <= 0) {
            return;
        }
        new TxnTemplate() {
            @Override
            public void execute() {
                statisticsDao.delete(id);
                statDetailDao.deleteByStatId(id);
            }
        }.executeInTransaction();
    }
    
    public void deleteStatistics(int[] ids) {
        if (ids == null || ids.length == 0) {
            return;
        }

        new TxnTemplate() {
            @Override
            public void execute() {
                statisticsDao.delete(ids);
                statDetailDao.deleteByStatId(ids);
            }
        }.executeInTransaction();
    }

    public SearchResult<Statistics> searchStatistics(SearchParam param) {
        try {
            return statisticsDao.search(param);
        } catch (Exception ex) {
            logger.error("Failed to search the Statistics.", ex);
        }
        return null; 
    }

    public List<ConferenceDataSheet> getConferenceDataSheet(SearchParam param) {
        try {
            return statisticsDao.getConferenceDataSheet(param);
        } catch (Exception ex) {
            logger.error("Failed to search the conferenceDataSheet.", ex);
        }
        return null; 
    }
    
    public void creatConferenceDataSheet(Statistics statistics) {
        if (statistics == null)
            return;

        new TxnTemplate() {
            @Override
            public void execute() {
                statisticsDao.create(statistics);
                int statisticsId = statistics.getId();
                List<StatConference> statConferences = statistics.getStatConference();
                if (statConferences != null) {
                    for (StatConference statConference : statConferences) {
                        statConference.setStatId(statisticsId);
                        statConferenceDao.create(statConference);
                    }
                }
            }
        }.executeInTransaction();
    }
    
    public void updateConferenceDataSheet(Statistics statistics) {
        if (statistics == null)
            return;

        new TxnTemplate() {
            @Override
            public void execute() {
                int statisticsId = statistics.getId();
                statisticsDao.update(statistics);
                statConferenceDao.deleteByStatId(statisticsId);
                List<StatConference> statConferences = statistics.getStatConference();
                if (statConferences != null) {
                    for (StatConference statConference : statConferences) {
                        statConference.setStatId(statisticsId);
                        statConferenceDao.create(statConference);
                    }
                }
            }
        }.executeInTransaction();
    }
}


