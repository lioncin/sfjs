/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.sanyet.fireball.base.entity.SearchParam;
import com.sanyet.fireball.base.entity.SearchResult;
import com.sanyet.fireball.base.jdbc.BaseDao;
import com.sanyet.fireball.base.jdbc.RowMapper;
import com.sanyet.fireball.base.jdbc.sqlbuilder.DeleteBuilder;
import com.sanyet.fireball.base.jdbc.sqlbuilder.InsertBuilder;
import com.sanyet.fireball.base.jdbc.sqlbuilder.SelectBuilder;
import com.sanyet.fireball.base.jdbc.sqlbuilder.UpdateBuilder;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.szcea.entity.ConferenceDataSheet;
import com.sanyet.fireball.szcea.entity.Statistics;

/**
 * StatisticsDao
 *
 * @author hanjian
 */
@Repository
public class StatisticsDao extends BaseDao<Statistics> {

    public void create(final Statistics entity) {
        InsertBuilder insert = new InsertBuilder(Statistics.TABLE_NAME);
        insert.setAutoIncreaseColumn(Statistics.COL_ID);
        insert.addColumnValue(Statistics.COL_STAT_YEAR, entity.getStatYear());
        insert.addColumnValue(Statistics.COL_REMARKS, entity.getRemarks());
        insert.addColumnValue(Statistics.COL_SUBMITTED_BY, entity.getSubmittedBy());
        insert.addColumnValue(Statistics.COL_FILED_BY, entity.getFiledBy());
        insert.addColumnValue(Statistics.COL_PHONE_NO, entity.getPhoneNo());
        insert.addColumnValue(Statistics.COL_TYPE, entity.getType());
        handleAuditFields(entity, insert);
        execute(insert);
        entity.setId(insert.getAutoIncreaseValue());
    }

    public void update(final Statistics entity) {
        UpdateBuilder update = new UpdateBuilder(Statistics.TABLE_NAME);
        handleAuditFields(entity, update);
        update.addColumnValue(Statistics.COL_STAT_YEAR, entity.getStatYear());
        update.addColumnValue(Statistics.COL_REMARKS, entity.getRemarks());
        update.addColumnValue(Statistics.COL_SUBMITTED_BY, entity.getSubmittedBy());
        update.addColumnValue(Statistics.COL_FILED_BY, entity.getFiledBy());
        update.addColumnValue(Statistics.COL_PHONE_NO, entity.getPhoneNo());
        update.addColumnValue(Statistics.COL_TYPE, entity.getType());
        update.setWhereClause(Statistics.COL_ID + " = ?", entity.getId());
        execute(update);
    }

    public Statistics retrieve(int id) {
        SelectBuilder<Statistics> select = new SelectBuilder<Statistics>(getRowMapper());
        select.setTable(Statistics.TABLE_NAME);
        select.setWhereClause(Statistics.COL_ID + " = ?", id);
        return executeSingle(select);
    }

    public Statistics retrieveByMore(String year, int byId, String type) {
        SelectBuilder<Statistics> select = new SelectBuilder<Statistics>(getRowMapper());
        select.setTable(Statistics.TABLE_NAME);
        select.setWhereClause(Statistics.COL_STAT_YEAR + " = ? AND " + Statistics.COL_SUBMITTED_BY + " = ? AND " + Statistics.COL_TYPE + " =?", year, byId, type);
        return executeSingle(select);
    }
    
    public void delete(int id) {
        DeleteBuilder delete = new DeleteBuilder(Statistics.TABLE_NAME);
        delete.setWhereClause(Statistics.COL_ID + " = ?", id);
        execute(delete);
    }

    public void delete(int[] ids) {
        String idsStr = StringUtil.unite(",", ids);
        DeleteBuilder delete = new DeleteBuilder(Statistics.TABLE_NAME);
        delete.setWhereClause(Statistics.COL_ID + " IN (" + idsStr + ")");
        execute(delete);
    }

    public SearchResult<Statistics> search(SearchParam param) {
        String orderByColumn = param.getOrderByColumn();
        if (StringUtil.isEmpty(orderByColumn)) {
            param.setOrderBy(Statistics.COL_CREATED_AT, SearchParam.DESCENDING);
        }
        SelectBuilder<Statistics> select = new SelectBuilder<Statistics>(getRowMapper());
        select.setQuery(getSql("statistics", "searchStatistics", param), param);
        return search(select);
    }

    public List<ConferenceDataSheet> getConferenceDataSheet(SearchParam param) {
        SelectBuilder<ConferenceDataSheet> select = new SelectBuilder<ConferenceDataSheet>(getConferenceDataSheetMapper());
        select.setQuery(getSql("statistics", "getConferenceDataSheet", param), param);
        return execute(select);
    }
    
    private RowMapper<Statistics> getRowMapper() {
        return new RowMapper<Statistics>() {
            public Statistics mapRow(ResultSet rs, int rowNum) {
                Statistics entity = new Statistics();
                try {
                    entity.setId(rs.getInt(Statistics.COL_ID));
                    entity.setStatYear(rs.getString(Statistics.COL_STAT_YEAR));
                    entity.setSubmittedBy(rs.getInt(Statistics.COL_SUBMITTED_BY));
                    entity.setFiledBy(rs.getString(Statistics.COL_FILED_BY));
                    entity.setPhoneNo(rs.getString(Statistics.COL_PHONE_NO));
                    entity.setType(rs.getString(Statistics.COL_TYPE));
                    entity.setRemarks(rs.getString(Statistics.COL_REMARKS));
                } catch (Exception ex) {
                    throw new RuntimeException("faile to get statistics", ex);
                }
                    
                handleAuditFields(entity, rs);
                return entity;
            }
        };
    }
    
    private RowMapper<ConferenceDataSheet> getConferenceDataSheetMapper() {
        return new RowMapper<ConferenceDataSheet>() {
            public ConferenceDataSheet mapRow(ResultSet rs, int rowNum) {
                ConferenceDataSheet entity = new ConferenceDataSheet();
                try {
                    entity.setLevel(rs.getString(ConferenceDataSheet.COL_LEVEL));
                    entity.setStatId(rs.getInt(ConferenceDataSheet.COL_STAT_ID));
                    entity.setgTime(rs.getInt(ConferenceDataSheet.COL_G_TIME));
                    entity.setgVisitorCount(rs.getInt(ConferenceDataSheet.COL_G_VISITOR_COUNT));
                    entity.setoTime(rs.getInt(ConferenceDataSheet.COL_O_TIME));
                    entity.setoVisitorCount(rs.getInt(ConferenceDataSheet.COL_O_VISITOR_COUNT));
                    entity.setbTime(rs.getInt(ConferenceDataSheet.COL_B_TIME));
                    entity.setbVisitorCount(rs.getInt(ConferenceDataSheet.COL_B_VISITOR_COUNT));
                    entity.setzTime(rs.getInt(ConferenceDataSheet.COL_Z_TIME));
                    entity.setzVisitorCount(rs.getInt(ConferenceDataSheet.COL_Z_VISITOR_COUNT));
                    entity.setSubtotalTime(rs.getInt(ConferenceDataSheet.COL_SUBTOTAL_TIME));
                    entity.setSubtotalVisitorCount(rs.getInt(ConferenceDataSheet.COL_SUBTOTAL_VISITOR_COUNT));
                    entity.setRemarks(rs.getString(ConferenceDataSheet.COL_REMARKS));
                } catch (Exception ex) {
                    throw new RuntimeException("faile to get conferenceDataSheet", ex);
                }
                return entity;
            }
        };
    }
}
