package com.zy.dmop.api.web.dao;

import java.io.Serializable;
import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.DeviceClass;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.UpsInfo;
import com.zy.dmop.model.vo.TerOrzCusVo;
import com.zy.dmop.model.vo.TerminalStrategyVo;


public interface TerminalDao {

	public int deleteUpsById(Terminal terminal);

	public Terminal selectById(Integer id);
	public int updateById(Terminal terminal);
	public int insert(Terminal terminal);
	
	//根据终端编号取对应策略
	public int getStrategyId(String terminalNum);
	
	public String getTerminalNum(int terminalId);
	public PageResult<TerminalStrategyVo> pageQueryAlarm(String terminalNum, Page page,List<Integer> orgIds);
	public Integer selectIdByTerminalId(String terminalNum);
	public List<Terminal> getTerminalExcel();
	public List<TerminalStrategyVo> getTerminalMobile(String terminalNum,List<Integer> orgIds);
	public PageResult<Terminal> getTerminalPage(String terminalNum, Integer terminalModelId, Page page,List<Integer> orgIds);
	
	
	public List<Terminal> listAll(List<Integer> orgIds);
	public List<HistoryData> getUpsInfo(String terminalId);
	void updateStrategy(int id, int strategyId);
	public List<TerminalStrategyVo> getExcelData(List<Integer> aorgIds);
	public List<TerOrzCusVo> getInfo(String terminalId);
	//得到设备类别
	public List<DeviceClass> getDeviceClass();
	void updateState(String id, Integer state);
	public void addInfo(UpsInfo upsInfo);
	public void updateInfo(UpsInfo upsInfo);
	public void deleteTerminalByOrg(int organizationId);
	public Boolean isTerminalTrue(String terminalId);
	
	public String getNamefromId(String terminalId);
	//终端缓存方法
	public List<Terminal> getAllTerminalForCache();
	
}
