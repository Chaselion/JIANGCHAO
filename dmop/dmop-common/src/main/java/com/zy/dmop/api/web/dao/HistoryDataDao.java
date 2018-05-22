package com.zy.dmop.api.web.dao;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.HistoryDataVO;


public interface HistoryDataDao {
	
    void deleteHistoryData(Long id);

	public PageResult<HistoryData> pageQueryHistoryData(String upsType,Page page);
	public PageResult<HistoryDataVO> pageQueryHistoryDataVO(String upsType,Page page, List<Integer> aorgIds);


	public List<HistoryData> getHistoryDatas();

	List<HistoryDataVO> getHistoryExcelDatas(List<Integer> aorgIds,String startDate,String endDate,String terminal);
	
	List<HistoryDataVO> getHistory(List<Integer> aorgIds);
	public int getHistorynum(List<Integer> aorgIds);
	
	public List<HistoryData> getAllHistoryDataForCache();
	
	
}