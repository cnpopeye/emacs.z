#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
 (>>>POINT<<<)
 AUTHOR: (>>>USER_NAME<<<)  
 HOST: (>>>AUTHOR<<<)
 PATH: (>>>DIR<<<)(>>>FILE<<<)
 DATE: (>>>ISO_DATE<<<) (>>>TIME<<<)  
 (>>>POINT<<<)
   
 INTRODUCTION:
    专门处理本controller中protocol buffer相关


 (>>>POINT<<<)    
 CHANGLOG:
    # FORMAT: DATE TIME AUTHOR COMMENT
    # etc. (>>>ISO_DATE<<<) (>>>TIME<<<) (>>>USER_NAME<<<)  # comment on here.
    (>>>POINT<<<)
    <<changelog write on here>> 
    
  (>>>POINT<<<)
'''

import sys
sys.path.append("..")
from  database import get_mongo_handler, get_redis_handler

mongo = get_mongo_handler()
redis = get_redis_handler()


### inner method

def __insert(data):
    "return ObjectId if success insert <data> "
    ret = None
    try:
        if data is not None:
            ret = mongo.(>>>FILE_SANS<<<).insert(data, w=1)
    except Exception,e:
        print e
    return ret

def __update(filters = None, setter = None):
    "return True if found and updated, else False"
    ret = False
    try:
        if filters is not None and setter is not None:
            res = mongo.(>>>FILE_SANS<<<).update(filters, setter, w=1)
            if res['err'] is None and res['n']>0 and res['updatedExisting']:
                ret = True
    except Exception,e:
        print e
    return ret

def __find(filters={}, fields=None):
    "return Cursor if found, else None"
    ret = None
    try:
        if filters is not None:
            cur = mongo.(>>>FILE_SANS<<<).find( filters, fields)
            if cur.count()>0:
                ret = cur
    except Exception,e:
        print e
        
    return ret

def __find_one(filter={}, fields=None):
    "return data if found, else None"
    ret = None
    try:
        if filter is not None:
            cur = mongo.(>>>FILE_SANS<<<).find(filter, fields).limit(1)
            if cur.count()>0:
                ret = cur[0]
    except Exception, e:
        print e
    return ret


def __remove(filters):
    "return True if found and removed, else False"
    ret = False
    try:
        if filters is not None:
            res = mongo.(>>>FILE_SANS<<<).remove(filters)
            if res['err'] is None and res['n']>0:
                ret = True
    except Exception,e:
        print e
    return ret

def __result(_ret):
    ret = {"ret":1, "msg":""}
    if not _ret:
        ret["msg"] = "inner error!"
    elif not _ret.matched_count:
        ret["msg"] = "not found record!"
    elif not ret.modified_count:
        ret["msg"] = "update faild!"
    else:
        ret["ret"] = 0
    return ret

# main function
if __name__ == '__main__':
    pass

>>>TEMPLATE-DEFINITION-SECTION<<<
