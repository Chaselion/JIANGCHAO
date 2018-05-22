package com.zy.dmop.api.web.service;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.vo.HistoryDataVO;

public interface HistoryDataService {
	
	public PageResult<HistoryData> pageQueryHistoryData(String upsType,Page page);
	public PageResult<HistoryDataVO> pageQueryHistoryDataVO(String terminalName,Page page,Integer organizationId);
	
	public void deleteHistoryData(long id);
	
	public List<HistoryData> getHistoryDatas();
	public List<HistoryDataVO> getHistoryExcelDatas(Integer organizationId,String startDate,String endDate,String terminal);

}