package com.zy.dmop.resource.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.OperateLog;
import com.zy.dmop.model.HistoryData;

public class HistoryDataRowMapper implements RowMapper<HistoryData>{

	@Override
	public HistoryData mapRow(ResultSet rs, int rowNum) throws SQLException {
		HistoryData historyData = new HistoryData();
		long id = rs.getLong("id");
		Integer buzzer = rs.getInt("buzzer");
		Integer customId = rs.getInt("custom_id");
		Integer deviceId = rs.getInt("device_id");
		Integer enduranceTime = rs.getInt("endurance_time");
		Integer shutDownState = rs.getInt("shut_down_state");
		String terminalId = rs.getString("terminal_id");
		Integer testYOrN = rs.getInt("test_y_or_n");
		Integer workingState = rs.getInt("working_state");
		Double dumpEnergy = rs.getDouble("dump_energy");
		Double innerTemperature = rs.getDouble("inner_temperature");
		Double inputFrequency = rs.getDouble("input_frequency");
		String upsFactoryInfo = rs.getString("ups_factory_info");
		String upsHardware = rs.getString("ups_hardware");
		String upsSerial = rs.getString("ups_serial");
		String upsType = rs.getString("ups_type");
		Double workLoad = rs.getDouble("work_load");
		Date createDateTime=rs.getDate("create_Date_Time");
		Date logTime=rs.getDate("log_time");
		
		historyData.setId(id);
		historyData.setBuzzer(buzzer);
		historyData.setCustomId(customId);
		historyData.setDeviceId(deviceId);
		historyData.setEnduranceTime(enduranceTime);
		historyData.setShutDownState(shutDownState);
		historyData.setTerminalId(terminalId);
		historyData.setTestYOrN(testYOrN);
		historyData.setWorkingState(workingState);
		historyData.setDumpEnergy(dumpEnergy);
		historyData.setInnerTemperature(innerTemperature);
		historyData.setInputFrequency(inputFrequency);
		historyData.setUpsFactoryInfo(upsFactoryInfo);
		historyData.setUpsHardware(upsHardware);
		historyData.setUpsSerial(upsSerial);
		historyData.setUpsType(upsType);
		historyData.setWorkLoad(workLoad);
		historyData.setCreateDateTime(createDateTime);
		historyData.setLogTime(logTime);
		return historyData;
	}

}
