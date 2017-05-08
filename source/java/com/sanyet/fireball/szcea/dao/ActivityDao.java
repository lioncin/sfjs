package com.sanyet.fireball.szcea.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

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
import com.sanyet.fireball.customer.entity.Customer;
import com.sanyet.fireball.szcea.entity.Activity;

@Repository
public class ActivityDao extends BaseDao<Activity> {

    
    public void create(final Activity entity) {
        InsertBuilder insert = new InsertBuilder(Activity.TABLE_NAME);
        insert.setAutoIncreaseColumn(Activity.COL_ID);
        insert.addColumnValue(Activity.COL_CODE,entity.getCode());
        insert.addColumnValue(Activity.COL_NAME,entity.getName());
        insert.addColumnValue(Activity.COL_NAME_EN,entity.getName_en());
        insert.addColumnValue(Activity.COL_LOCATION,entity.getLocation());
        insert.addColumnValue(Activity.COL_PREPARE_FROM,entity.getPrepareFrom());
        insert.addColumnValue(Activity.COL_PREPARE_TO,entity.getPrepareTo());
        insert.addColumnValue(Activity.COL_HOLD_FROM,entity.getHoldFrom());
        insert.addColumnValue(Activity.COL_HOLD_TO,entity.getHoldTo());
        insert.addColumnValue(Activity.COL_IS_REGULAR,entity.getIsRegular());
        insert.addColumnValue(Activity.COL_ANNUAL_TIME,entity.getAnnualTime());
        insert.addColumnValue(Activity.COL_HOLD_TIME,entity.getHoldTime());
        insert.addColumnValue(Activity.COL_HAS_NATIONAL_TM,entity.getHasNationalTM());
        insert.addColumnValue(Activity.COL_HAS_INTER_CERT,entity.getHasInterCert());
        insert.addColumnValue(Activity.COL_LEVEL,entity.getLevel());
        insert.addColumnValue(Activity.COL_APPROVER,entity.getApprover());
        insert.addColumnValue(Activity.COL_SPONSOR,entity.getSponsor());
        insert.addColumnValue(Activity.COL_ORGANIZER,entity.getOrganizer());
        insert.addColumnValue(Activity.COL_COUNT_1,entity.getCount_1());
        insert.addColumnValue(Activity.COL_COUNT_2,entity.getCount_2());
        insert.addColumnValue(Activity.COL_COUNT_3,entity.getCount_3());
        insert.addColumnValue(Activity.COL_FEE_SCALE,entity.getFeeScale());
        insert.addColumnValue(Activity.COL_HAS_ADD_ACTIVITY,entity.getHasAddActivity());
        insert.addColumnValue(Activity.COL_ADD_SCALE,entity.getAddScale());
        insert.addColumnValue(Activity.COL_ADD_TIME,entity.getAddTime());
        insert.addColumnValue(Activity.COL_DESCRIPTION,entity.getDescription());
        insert.addColumnValue(Activity.COL_SUBMITTED_BY,entity.getSubmittedBy());
        insert.addColumnValue(Activity.COL_LEGAL_REP,entity.getLegalRep());
        insert.addColumnValue(Activity.COL_BIZ_ADDRESS,entity.getBizAddress());
        insert.addColumnValue(Activity.COL_BIZ_EMAIL,entity.getBizEmail());
        insert.addColumnValue(Activity.COL_BIZ_CONTACT,entity.getBizContact());
        insert.addColumnValue(Activity.COL_BIZ_PHONE,entity.getBizPhone());
        insert.addColumnValue(Activity.COL_DOCUMENTS,entity.getDocuments());
        insert.addColumnValue(Activity.COL_TYPE,entity.getType());
        insert.addColumnValue(Activity.COL_STATUS,entity.getStatus());
        insert.addColumnValue(Activity.COL_REMARKS,entity.getRemarks());
        handleAuditFields(entity, insert);
        execute(insert);
        entity.setId(insert.getAutoIncreaseValue());
    }
    
    public void update(final Activity entity) {
        UpdateBuilder update = new UpdateBuilder(Activity.TABLE_NAME);
        update.addColumnValue(Activity.COL_CODE,entity.getCode());
        update.addColumnValue(Activity.COL_NAME,entity.getName());
        update.addColumnValue(Activity.COL_NAME_EN,entity.getName_en());
        update.addColumnValue(Activity.COL_LOCATION,entity.getLocation());
        update.addColumnValue(Activity.COL_PREPARE_FROM,entity.getPrepareFrom());
        update.addColumnValue(Activity.COL_PREPARE_TO,entity.getPrepareTo());
        update.addColumnValue(Activity.COL_HOLD_FROM,entity.getHoldFrom());
        update.addColumnValue(Activity.COL_HOLD_TO,entity.getHoldTo());
        update.addColumnValue(Activity.COL_IS_REGULAR,entity.getIsRegular());
        update.addColumnValue(Activity.COL_ANNUAL_TIME,entity.getAnnualTime());
        update.addColumnValue(Activity.COL_HOLD_TIME,entity.getHoldTime());
        update.addColumnValue(Activity.COL_HAS_NATIONAL_TM,entity.getHasNationalTM());
        update.addColumnValue(Activity.COL_HAS_INTER_CERT,entity.getHasInterCert());
        update.addColumnValue(Activity.COL_LEVEL,entity.getLevel());
        update.addColumnValue(Activity.COL_APPROVER,entity.getApprover());
        update.addColumnValue(Activity.COL_SPONSOR,entity.getSponsor());
        update.addColumnValue(Activity.COL_ORGANIZER,entity.getOrganizer());
        update.addColumnValue(Activity.COL_COUNT_1,entity.getCount_1());
        update.addColumnValue(Activity.COL_COUNT_2,entity.getCount_2());
        update.addColumnValue(Activity.COL_COUNT_3,entity.getCount_3());
        update.addColumnValue(Activity.COL_FEE_SCALE,entity.getFeeScale());
        update.addColumnValue(Activity.COL_HAS_ADD_ACTIVITY,entity.getHasAddActivity());
        update.addColumnValue(Activity.COL_ADD_SCALE,entity.getAddScale());
        update.addColumnValue(Activity.COL_ADD_TIME,entity.getAddTime());
        update.addColumnValue(Activity.COL_DESCRIPTION,entity.getDescription());
        update.addColumnValue(Activity.COL_SUBMITTED_BY,entity.getSubmittedBy());
        update.addColumnValue(Activity.COL_LEGAL_REP,entity.getLegalRep());
        update.addColumnValue(Activity.COL_BIZ_ADDRESS,entity.getBizAddress());
        update.addColumnValue(Activity.COL_BIZ_EMAIL,entity.getBizEmail());
        update.addColumnValue(Activity.COL_BIZ_CONTACT,entity.getBizContact());
        update.addColumnValue(Activity.COL_BIZ_PHONE,entity.getBizPhone());
        update.addColumnValue(Activity.COL_DOCUMENTS,entity.getDocuments());
        update.addColumnValue(Activity.COL_TYPE,entity.getType());
        update.addColumnValue(Activity.COL_STATUS,entity.getStatus()); 
        update.addColumnValue(Activity.COL_REMARKS,entity.getRemarks());
        handleAuditFields(entity, update);
        update.setWhereClause(Activity.COL_ID + " = ?", entity.getId());
        execute(update);
    }
    
    public SearchResult<Activity> search(SearchParam param) {
        String orderByColumn = param.getOrderByColumn();
        if (StringUtil.isEmpty(orderByColumn)) {
            param.setOrderBy(Customer.COL_CREATED_AT, SearchParam.DESCENDING);
        }
        SelectBuilder<Activity> select = new SelectBuilder<Activity>(getRowMapper());
        select.setQuery(getSql("activity", "searchActivitys", param), param);
        return search(select);
    }
    
    public Activity retrieve(int id) {
        SelectBuilder<Activity> select = new SelectBuilder<Activity>(getRowMapper());
        select.setTable(Activity.TABLE_NAME);
        select.setWhereClause(Activity.COL_ID + " = ?", id);
        return executeSingle(select);
    }
    
    /**
     * year = YYYY month = mm
     * @param year
     * @param month
     * @return
     */
    public Activity[] retrieveInMonth(int year, int month, String type) {
        String m = "";
        if (month < 10) {
            m = String.valueOf(year) + "0" +String.valueOf(month);
        } else {
            m = String.valueOf(year) + String.valueOf(month);
        }
        String whereType = "";
        if (StringUtil.isNotEmpty(type)) {
            whereType = "and type = '" + type + "' ";
        }
        SelectBuilder<Activity> select = new SelectBuilder<Activity>(getRowMapper());
        select.setTable(Activity.TABLE_NAME);
        String where = Activity.COL_STATUS + " = 'A'"
                + "and (date_format(" + Activity.COL_HOLD_FROM + ", '%Y%m') = '" + m + "' or date_format(" + Activity.COL_HOLD_TO + ", '%Y%m') = '" + m + "' "
                + "or ('" + m + "' > date_format(" + Activity.COL_HOLD_FROM + ", '%Y%m') and '" + m + "' < date_format(" + Activity.COL_HOLD_TO + ", '%Y%m'))) "
                + whereType;
        select.setWhereClause(where);
        return executeArray(select);
    }
    
    public void delete(int id) {
        DeleteBuilder delete = new DeleteBuilder(Activity.TABLE_NAME);
        delete.setWhereClause(Activity.COL_ID + " = ?", id);
        execute(delete);
    }

    public void delete(int[] ids) {
        String idsStr = StringUtil.unite(",", ids);
        DeleteBuilder delete = new DeleteBuilder(Activity.TABLE_NAME);
        delete.setWhereClause(Activity.COL_ID + " IN (" + idsStr + ")");
        execute(delete);
    }
    
    private RowMapper<Activity> getRowMapper() {
        return new RowMapper<Activity>() {
            public Activity mapRow(ResultSet rs, int rowNum) {
                Activity entity = new Activity();
                
                try {
                    entity.setId(rs.getInt(Activity.COL_ID));
                    entity.setCode(rs.getString(Activity.COL_CODE));
                    entity.setName(rs.getString(Activity.COL_NAME));
                    entity.setName_en(rs.getString(Activity.COL_NAME_EN));
                    entity.setLocation(rs.getString(Activity.COL_LOCATION));
                    entity.setPrepareFrom(rs.getDate(Activity.COL_PREPARE_FROM));
                    entity.setPrepareTo(rs.getDate(Activity.COL_PREPARE_TO));
                    entity.setHoldFrom(rs.getDate(Activity.COL_HOLD_FROM));
                    entity.setHoldTo(rs.getDate(Activity.COL_HOLD_TO));
                    entity.setIsRegular(rs.getString(Activity.COL_IS_REGULAR));
                    entity.setAnnualTime(rs.getInt(Activity.COL_ANNUAL_TIME));
                    entity.setHoldTime(rs.getInt(Activity.COL_HOLD_TIME));
                    entity.setHasNationalTM(rs.getString(Activity.COL_HAS_NATIONAL_TM));
                    entity.setHasInterCert(rs.getString(Activity.COL_HAS_INTER_CERT));
                    entity.setLevel(rs.getString(Activity.COL_LEVEL));
                    entity.setApprover(rs.getString(Activity.COL_APPROVER));
                    entity.setSponsor(rs.getString(Activity.COL_SPONSOR));
                    entity.setOrganizer(rs.getString(Activity.COL_ORGANIZER));
                    entity.setCount_1(rs.getDouble(Activity.COL_COUNT_1));
                    entity.setCount_2(rs.getDouble(Activity.COL_COUNT_2));
                    entity.setCount_3(rs.getInt(Activity.COL_COUNT_3));
                    entity.setFeeScale(rs.getDouble(Activity.COL_FEE_SCALE));
                    entity.setHasAddActivity(rs.getString(Activity.COL_HAS_ADD_ACTIVITY));
                    entity.setAddScale(rs.getDouble(Activity.COL_ADD_SCALE));
                    entity.setAddTime(rs.getInt(Activity.COL_ADD_TIME));
                    entity.setDescription(rs.getString(Activity.COL_DESCRIPTION));
                    entity.setSubmittedBy(rs.getString(Activity.COL_SUBMITTED_BY));
                    entity.setLegalRep(rs.getString(Activity.COL_LEGAL_REP));
                    entity.setBizAddress(rs.getString(Activity.COL_BIZ_ADDRESS));
                    entity.setBizEmail(rs.getString(Activity.COL_BIZ_EMAIL));
                    entity.setBizContact(rs.getString(Activity.COL_BIZ_CONTACT));
                    entity.setBizPhone(rs.getString(Activity.COL_BIZ_PHONE));
                    entity.setDocuments(rs.getString(Activity.COL_DOCUMENTS));
                    entity.setType(rs.getString(Activity.COL_TYPE));
                    entity.setStatus(rs.getString(Activity.COL_STATUS));
                    entity.setRemarks(rs.getString(Activity.COL_REMARKS));
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
                handleAuditFields(entity, rs);

                return entity;
            }
        };
    }
}
