/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.sanyet.fireball.base.jdbc.BaseDao;
import com.sanyet.fireball.base.jdbc.RowMapper;
import com.sanyet.fireball.base.jdbc.sqlbuilder.DeleteBuilder;
import com.sanyet.fireball.base.jdbc.sqlbuilder.InsertBuilder;
import com.sanyet.fireball.base.jdbc.sqlbuilder.SelectBuilder;
import com.sanyet.fireball.base.jdbc.sqlbuilder.UpdateBuilder;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.szcea.entity.StatDetail;

/**
 * StatDetailDao
 *
 * @author hanjian
 */
@Repository
public class StatDetailDao extends BaseDao<StatDetail> {

    public void create(final StatDetail entity) {
        InsertBuilder insert = new InsertBuilder(StatDetail.TABLE_NAME);
        insert.setAutoIncreaseColumn(StatDetail.COL_ID);
        insert.addColumnValue(StatDetail.COL_STAT_ID, entity.getStatId());
        insert.addColumnValue(StatDetail.COL_ACTIVITY_ID, entity.getActivityId());
        insert.addColumnValue(StatDetail.COL_ACTIVITY_NAME, entity.getActivityName());
        insert.addColumnValue(StatDetail.COL_LOCATION, entity.getLocation());
        insert.addColumnValue(StatDetail.COL_HOLD_FROM, entity.getHoldFrom());
        insert.addColumnValue(StatDetail.COL_HOLD_TO, entity.getHoldTo());
        insert.addColumnValue(StatDetail.COL_SPONSOR, entity.getSponsor());
        insert.addColumnValue(StatDetail.COL_ORGANIZER, entity.getOrganizer());
        insert.addColumnValue(StatDetail.COL_COUNT_TIME, entity.getCountTime());
        insert.addColumnValue(StatDetail.COL_AREA, entity.getArea());
        insert.addColumnValue(StatDetail.COL_VISITOR_COUNT, entity.getVisitorCount());
        insert.addColumnValue(StatDetail.COL_ADD_CONFERENCE, entity.getAddConference());
        insert.addColumnValue(StatDetail.COL_CONF_TYPE, entity.getConfType());
        execute(insert);
        entity.setId(insert.getAutoIncreaseValue());
    }

    public void update(final StatDetail entity) {
        UpdateBuilder update = new UpdateBuilder(StatDetail.TABLE_NAME);
        update.addColumnValue(StatDetail.COL_STAT_ID, entity.getStatId());
        update.addColumnValue(StatDetail.COL_ACTIVITY_ID, entity.getActivityId());
        update.addColumnValue(StatDetail.COL_ACTIVITY_NAME, entity.getActivityName());
        update.addColumnValue(StatDetail.COL_LOCATION, entity.getLocation());
        update.addColumnValue(StatDetail.COL_HOLD_FROM, entity.getHoldFrom());
        update.addColumnValue(StatDetail.COL_HOLD_TO, entity.getHoldTo());
        update.addColumnValue(StatDetail.COL_SPONSOR, entity.getSponsor());
        update.addColumnValue(StatDetail.COL_ORGANIZER, entity.getOrganizer());
        update.addColumnValue(StatDetail.COL_COUNT_TIME, entity.getCountTime());
        update.addColumnValue(StatDetail.COL_AREA, entity.getArea());
        update.addColumnValue(StatDetail.COL_VISITOR_COUNT, entity.getVisitorCount());
        update.addColumnValue(StatDetail.COL_ADD_CONFERENCE, entity.getAddConference());
        update.addColumnValue(StatDetail.COL_CONF_TYPE, entity.getConfType());
        update.setWhereClause(StatDetail.COL_ID + " = ?", entity.getId());
        execute(update);
    }

    public void delete(int id) {
        DeleteBuilder delete = new DeleteBuilder(StatDetail.TABLE_NAME);
        delete.setWhereClause(StatDetail.COL_ID + " = ?", id);
        execute(delete);
    }

    public void deleteByStatId(int StatId) {
        DeleteBuilder delete = new DeleteBuilder(StatDetail.TABLE_NAME);
        delete.setWhereClause(StatDetail.COL_STAT_ID + " = ?", StatId);
        execute(delete);
    }

    public void deleteByStatId(int[] statIds) {
        String idsStr = StringUtil.unite(",", statIds);
        DeleteBuilder delete = new DeleteBuilder(StatDetail.TABLE_NAME);
        delete.setWhereClause(StatDetail.COL_STAT_ID + " IN (" + idsStr + ")");
        execute(delete);
    }
    
    public StatDetail retrieve(int id) {
        SelectBuilder<StatDetail> select = new SelectBuilder<StatDetail>(getRowMapper());
        select.setTable(StatDetail.TABLE_NAME);
        select.setWhereClause(StatDetail.COL_ID + " = ?", id);
        return executeSingle(select);
    }

    public List<StatDetail> getByStatId(int id) {
        SelectBuilder<StatDetail> select = new SelectBuilder<StatDetail>(getRowMapper());
        select.setTable(StatDetail.TABLE_NAME);
        select.setWhereClause(StatDetail.COL_STAT_ID + " = ?", id);
        return execute(select);
    }

    private RowMapper<StatDetail> getRowMapper() {
        return new RowMapper<StatDetail>() {
            public StatDetail mapRow(ResultSet rs, int rowNum) {
                StatDetail entity = new StatDetail();
                try {
                    entity.setId(rs.getInt(StatDetail.COL_ID));
                    entity.setActivityId(rs.getInt(StatDetail.COL_ACTIVITY_ID));
                    entity.setActivityName(rs.getString(StatDetail.COL_ACTIVITY_NAME));
                    entity.setLocation(rs.getString(StatDetail.COL_LOCATION));
                    entity.setHoldFrom(rs.getDate(StatDetail.COL_HOLD_FROM));
                    entity.setHoldTo(rs.getDate(StatDetail.COL_HOLD_TO));
                    entity.setSponsor(rs.getString(StatDetail.COL_SPONSOR));
                    entity.setOrganizer(rs.getString(StatDetail.COL_ORGANIZER));
                    entity.setCountTime(rs.getInt(StatDetail.COL_COUNT_TIME));
                    entity.setArea(rs.getDouble(StatDetail.COL_AREA));
                    entity.setVisitorCount(rs.getInt(StatDetail.COL_VISITOR_COUNT));
                    entity.setAddConference(rs.getInt(StatDetail.COL_ADD_CONFERENCE));
                    entity.setConfType(rs.getString(StatDetail.COL_CONF_TYPE));
                } catch (Exception ex) {
                    throw new RuntimeException("faile to get StatDetail", ex);
                }
                    
                handleAuditFields(entity, rs);
                return entity;
            }
        };
    }
}
