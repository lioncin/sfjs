/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.dao;

import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.sanyet.fireball.base.jdbc.BaseDao;
import com.sanyet.fireball.base.jdbc.RowMapper;
import com.sanyet.fireball.base.jdbc.sqlbuilder.DeleteBuilder;
import com.sanyet.fireball.base.jdbc.sqlbuilder.InsertBuilder;
import com.sanyet.fireball.szcea.entity.StatConference;
import com.sanyet.fireball.szcea.entity.Statistics;

/**
 * StatisticsDao
 *
 * @author hanjian
 */
@Repository
public class StatConferenceDao extends BaseDao<Statistics> {

    public void create(final StatConference entity) {
        InsertBuilder insert = new InsertBuilder(StatConference.TABLE_NAME);
        insert.addColumnValue(StatConference.COL_STAT_ID, entity.getStatId());
        insert.addColumnValue(StatConference.COL_TYPE, entity.getType());
        insert.addColumnValue(StatConference.COL_TIME, entity.getTime());
        insert.addColumnValue(StatConference.COL_VISITOR_COUNT, entity.getVisitorCount());
        insert.addColumnValue(StatConference.COL_LEVEL, entity.getLevel());
        insert.addColumnValue(StatConference.COL_REMARKS, entity.getRemarks());
        execute(insert);
    }

    public void deleteByStatId(int statId) {
        DeleteBuilder delete = new DeleteBuilder(StatConference.TABLE_NAME);
        delete.setWhereClause(StatConference.COL_STAT_ID + " = ?", statId);
        execute(delete);
    }
    
    private RowMapper<StatConference> getRowMapper() {
        return new RowMapper<StatConference>() {
            public StatConference mapRow(ResultSet rs, int rowNum) {
                StatConference entity = new StatConference();
                try {
                    entity.setStatId(rs.getInt(StatConference.COL_STAT_ID));
                    entity.setType(rs.getString(StatConference.COL_TYPE));
                    entity.setTime(rs.getInt(StatConference.COL_TIME));
                    entity.setVisitorCount(rs.getInt(StatConference.COL_VISITOR_COUNT));
                    entity.setLevel(rs.getString(StatConference.COL_LEVEL));
                    entity.setRemarks(rs.getString(StatConference.COL_REMARKS));
                } catch (Exception ex) {
                    throw new RuntimeException("faile to get StatConference", ex);
                }
                    
                return entity;
            }
        };
    }
}
