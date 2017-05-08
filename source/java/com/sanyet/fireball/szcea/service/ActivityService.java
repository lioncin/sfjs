package com.sanyet.fireball.szcea.service;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sanyet.fireball.base.entity.SearchParam;
import com.sanyet.fireball.base.entity.SearchResult;
import com.sanyet.fireball.base.jdbc.TxnTemplate;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.szcea.dao.ActivityDao;
import com.sanyet.fireball.szcea.entity.Activity;

@Service
public class ActivityService {
    private static final Logger logger = LogManager.getLogger(ActivityService.class);
    
    @Autowired
    private ActivityDao activityDao;
    
    public void createActivity(Activity activity) {
        if (activity == null)
            return;
        
        new TxnTemplate() {
            @Override
            public void execute() {
                activityDao.create(activity);
            }
        }.executeInTransaction();
    }
    
    public void updateActivity(Activity activity) {
        if (activity == null) 
            return;
        
        new TxnTemplate() {
            @Override
            public void execute() {
                activityDao.update(activity);
            }
        }.executeInTransaction();
    }
    
    public SearchResult<Activity> searchActivitys(SearchParam sp){
        try {
            return activityDao.search(sp);
        } catch (Exception ex) {
            logger.error("Failed to search the activitys.", ex);
        }
        return null; 
    }
    
    public  Activity getActivity(int id){
        if (id <= 0)
            return null;

        Activity activity = null;
        try {
            
            activity = activityDao.retrieve(id);
        } catch (Exception ex) {
            throw new RuntimeException("can not get examReg", ex);
        }
        return activity;
    }
    
    /**
     * year = YYYY month = mm
     * @param year
     * @param month
     * @return
     */
    public Activity[] getYearMonthActivity(int year, int month, String type) {
        if (year == 0 || month == 0 || year < 1000 || (!"C".equals(type) && !"E".equals(type) && StringUtil.isNotEmpty(type))) {
            return null;
        }
        Activity[] activitys = null;
        try {
            
            activitys = activityDao.retrieveInMonth(year, month , type);
        } catch (Exception ex) {
            throw new RuntimeException("can not get activitys", ex);
        }
        return activitys;
    }
    
    public void deleteActivity(int activityId) {
        if (activityId <= 0)
            return;

        try {
            activityDao.delete(activityId);
        } catch (Exception ex) {
            logger.error(String.format("Failed to delete the activity [%s].", String.valueOf(activityId)), ex);
        }
    }
    
    public void deleteActivitys(int[] activityIds) {
        if (activityIds == null || activityIds.length == 0)
            return;

        try {
            activityDao.delete(activityIds);
        } catch (Exception ex) {
            logger.error(String.format("Failed to delete the activity [%s].", String.valueOf(activityIds)), ex);
        }
    }
    
}
