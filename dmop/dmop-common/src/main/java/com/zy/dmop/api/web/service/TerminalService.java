package com.zy.dmop.api.web.service;

import java.io.Serializable;
import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.DeviceClass;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.UpsInfo;
import com.zy.dmop.model.vo.DeviceVo;
import com.zy.dmop.model.vo.TerOrzCusVo;
import com.zy.dmop.model.vo.TerminalStrategyVo;
import com.zy.dmop.util.DatatablePage;

public interface TerminalService {
	/*
	public boolean addUps(Terminal terminal);
	public boolean removeById(Terminal terminal);
	public boolean modifyUpsById(Terminal terminal);
	public List<Terminal> findFreeTerminal();
	public Integer findByTerminalId(String terminal_id);*/
	public Terminal findById(Integer id);
	public PageResult<TerminalStrategyVo> findByPageAndId(String terminalNum, Page page,Integer organizationId );
	public boolean modifyById(Terminal terminal);
	public boolean removeUpsById(Terminal terminal);
	public boolean add(Terminal terminal);
	public List<TerminalStrategyVo> findTerminalMobile(String terminalNum, Integer organizationId );
	//根据终端编号取对应策略
	public int getStrategyId(String terminalId);
	
	public String getTerminalNum(int terminalId);
	public Integer findByTerminalId(String terminalNum);
	public List<Terminal> getTerminalExcel();
	public List<TerminalStrategyVo> getExcelData(Integer organizationId);
	
	//供sim卡分页查询终端
	public PageResult<Terminal> getTerminalPage(final String terminalNum, final Integer terminalModelId,Page page,Integer organizationId);
	
	//
	public List<Terminal> findAll(long organization_id);
	//查询厂商等信息,以及系数
	public List<HistoryData> getUpsInfo(String terminalId);
	
	void updateStrategy(int id, int strategyId);
	//根据终端查询组织客户手机
	public List<TerOrzCusVo> getInfo(String terminalId);
	//得到所有设备
	public List<DeviceClass> getDeviceClass();
	void updateState(String id, Integer state);
	//插入信息
	public void addInfo(UpsInfo upsInfo);
	public void updateInfo(UpsInfo upsInfo);
	public void deleteTerminalByOrg(int organizationId);
	public Boolean isTerminalTrue(String terminalId);
	
	public String getNamefromId(String terminalId);
}
