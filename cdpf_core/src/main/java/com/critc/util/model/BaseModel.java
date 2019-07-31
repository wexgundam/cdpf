package com.critc.util.model;

import java.util.Date;

/**
 * @autho 孔垂云
 * @date 2017/7/15.
 */
public class BaseModel {
    private Integer creatorId;//创建人Id
    private String creatorRealName;//创建人Name
    private Date createdAt;//创建时间
    private Integer lastEditorId;//最后修改人Id
    private String lastEditorRealName;//最后修改人实名
    private Date lastEditedAt;//最后修改时间

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BaseModel baseModel = (BaseModel) o;

        if (creatorId != baseModel.creatorId) return false;
        if (lastEditorId != baseModel.lastEditorId) return false;
        if (creatorRealName != null ? !creatorRealName.equals(baseModel.creatorRealName) : baseModel.creatorRealName != null)
            return false;
        if (createdAt != null ? !createdAt.equals(baseModel.createdAt) : baseModel.createdAt != null) return false;
        if (lastEditorRealName != null ? !lastEditorRealName.equals(baseModel.lastEditorRealName) : baseModel.lastEditorRealName != null)
            return false;
        return lastEditedAt != null ? lastEditedAt.equals(baseModel.lastEditedAt) : baseModel.lastEditedAt == null;
    }

    @Override
    public int hashCode() {
        int result = creatorId;
        result = 31 * result + (creatorRealName != null ? creatorRealName.hashCode() : 0);
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        result = 31 * result + lastEditorId;
        result = 31 * result + (lastEditorRealName != null ? lastEditorRealName.hashCode() : 0);
        result = 31 * result + (lastEditedAt != null ? lastEditedAt.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "BaseModel{" +
                "creatorId=" + creatorId +
                ", creatorRealName='" + creatorRealName + '\'' +
                ", createdAt=" + createdAt +
                ", lastEditorId=" + lastEditorId +
                ", lastEditorRealName='" + lastEditorRealName + '\'' +
                ", lastEditedAt=" + lastEditedAt +
                '}';
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public String getCreatorRealName() {
        return creatorRealName;
    }

    public void setCreatorRealName(String creatorRealName) {
        this.creatorRealName = creatorRealName;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Integer getLastEditorId() {
        return lastEditorId;
    }

    public void setLastEditorId(Integer lastEditorId) {
        this.lastEditorId = lastEditorId;
    }

    public String getLastEditorRealName() {
        return lastEditorRealName;
    }

    public void setLastEditorRealName(String lastEditorRealName) {
        this.lastEditorRealName = lastEditorRealName;
    }

    public Date getLastEditedAt() {
        return lastEditedAt;
    }

    public void setLastEditedAt(Date lastEditedAt) {
        this.lastEditedAt = lastEditedAt;
    }
}
