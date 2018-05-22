package com.zy.dmop.api.web.service;
import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.OperateLog;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.OperateCusUserVo;

public interface OperateLogService {

void deleteOperateLog(long operateLogId);

public List<OperateLog> getOperateLogs();

public PageResult<OperateCusUserVo> pageQueryOperateLog(String startCreateDateStr,String endCreateDateStr,Page page,Integer organizationId);

public void insertOperateLog(OperateLog operateLog);

public List<OperateCusUserVo> exportOperateLog(Integer organizationId);
//记录增加操作
void addInsert(User user,String content);
//记录删除操作
void addDelete(User user,String content);
//记录查询操作
void addQuery(User user,String content);
//记录修改操作
void addUpdate(User user,String content);
//记录导出操作
void addExport(User user, String content);
//记录导入操作
void addImport(User user, String content);


}