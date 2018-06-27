package com.prx301.finalproject.truyencapnhat.model;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import java.io.Serializable;
import java.util.Set;

@Entity
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GroupEntity", propOrder = {
        "groupId",
        "groupName",
        "groupContact",
        "updates"
})
@Table(name = "TransGroup", schema = "dbo", catalog = "NU_DB")
public class GroupEntity {
    @XmlElement(name = "group-id")
    private int groupId;
    @XmlElement(name = "group-name")
    private String groupName;
    @XmlElement(name = "group-link")
    private String groupContact;
    private Set<UpdateEntity> updates;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "group_id", nullable = false)
    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    @Basic
    @Column(name = "group_name")
    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    @Column(name="group_contact")
    public String getGroupContact() {
        return groupContact;
    }

    public void setGroupContact(String groupContact) {
        this.groupContact = groupContact;
    }

    @OneToMany(mappedBy = "updateGroup")
    public Set<UpdateEntity> getUpdates() {
        return updates;
    }

    public void setUpdates(Set<UpdateEntity> updates) {
        this.updates = updates;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        GroupEntity that = (GroupEntity) o;

        if (groupId != that.groupId) return false;
        if (groupName != null ? !groupName.equals(that.groupName) : that.groupName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }
}
