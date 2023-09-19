package com.semi.travelpalette.user.domain;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class UserMypageDto {
    private String userid;
    private String content;
    private String createdate;
    private String type;

    public String getUserid() {
        return userid;
    }

    public void setUserid(final String userid) {
        this.userid = userid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(final String content) {
        this.content = content;
    }

    public String getCreatedate() {
        return this.createdate;
    }

    public void setCreatedate(final Date createdate) {
        LocalDateTime localDateTime = LocalDateTime.ofInstant(createdate.toInstant(), ZoneId.systemDefault());
        this.createdate = localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public String getType() {
        return type;
    }

    public void setType(final String type) {
        this.type = type;
    }
}
