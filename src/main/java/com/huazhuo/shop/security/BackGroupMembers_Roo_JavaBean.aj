// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.security;


privileged aspect BackGroupMembers_Roo_JavaBean {
    
    public BackGroups BackGroupMembers.getPermissionGroup() {
        return this.permissionGroup;
    }
    
    public void BackGroupMembers.setPermissionGroup(BackGroups permissionGroup) {
        this.permissionGroup = permissionGroup;
    }
    
    public BackUser BackGroupMembers.getUser() {
        return this.user;
    }
    
    public void BackGroupMembers.setUser(BackUser user) {
        this.user = user;
    }
    
}