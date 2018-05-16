package com.huhy.springboot_easyui.easyui.common;

/**
 *
 */
public enum AttachmentType {
    AVATAR("头像"), PUBLIC("公共目录");

    public String alias;

    AttachmentType(String alias) {
        this.alias = alias;
    }

    @Override
    public String toString() {
        return alias;
    }
}
