package com.zy.dmop.baidumap;

import java.net.SocketTimeoutException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.client.utils.URIBuilder;
import org.apache.log4j.Logger;

/**
 * http://api.map.baidu.com/geoconv/v1/?
 * @author 
 *
 */
public class GPS2BaiduCoordConvertor {
	private static Logger log = Logger.getLogger(GPS2BaiduCoordConvertor.class);
	
	private static final int BAIDU_STATUS_SUCC = 0;
	private static final int GROUP_COUNT = 100;
	private HttpUtil httpUtil;

	private String host;
	private String path;
	
private String reresp; 
	
	public String getReresp() {
		return reresp;
	}

	public void setReresp(String reresp) {
		this.reresp = reresp;
	}
	/**
	 *  1：GPS设备获取的角度坐标;
		2：GPS获取的米制坐标、sogou地图所用坐标;
		3：google地图、soso地图、aliyun地图、mapabc地图和amap地图所用坐标
		4：3中列表地图坐标对应的米制坐标
		5：百度地图采用的经纬度坐标
		6：百度地图采用的米制坐标
		7：mapbar地图坐标;
		8：51地图坐标
	 */
	private String from;	// = "1";
	/**
	 * 有两种可供选择：5、6。
		5：bd09ll(百度经纬度坐标),
		6：bd09mc(百度米制经纬度坐标);
	 */
	private String to;		// = "5";
	
	private String ak;		// = "L5rglNsfmEd9D6CQxHGNgTLG";
	
	public void setHttpUtil(HttpUtil httpUtil) {
		this.httpUtil = httpUtil;
	}
	
	public void setHost(String host) {
		this.host = host;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public void setFrom(String from) {
		this.from = from;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public void setAk(String ak) {
		this.ak = ak;
	}

	public List<ConvertCoord> convert(List<ConvertCoord> convertCoords) {
		List<String> coords = getCoordsStr(convertCoords);
		for (int i = 0; i < coords.size();i++) {
			
			convertByGroup(coords.get(i), convertCoords, i);
		}
		return convertCoords;
	}
	
	private void convertByGroup(String coords, List<ConvertCoord> convertCoords, int groupIndex) {
		//log.info("source coordsParam=" + coords);
		
		try {
			URI uri = new URIBuilder()
		        /*.setScheme("http")
		        .setHost("api.map.baidu.com")
		        .setPath("/geoconv/v1/")
		        .setParameter("coords", coords)
		        .setParameter("from", "1")
		        .setParameter("to", "5")
		        .setParameter("ak", "L5rglNsfmEd9D6CQxHGNgTLG")
		        .build();*/
			.setScheme("http")
			.setHost(host)
			.setPath(path)
			.setParameter("coords", coords)
			.setParameter("from", from)
			.setParameter("to", to)
			.setParameter("ak", ak)
			.build();
			
			String resp=null;
			try{
				 resp = httpUtil.sendGetRequest(uri, 2000, 4096);	
				 setReresp(resp);
			}catch(SocketTimeoutException e){
				resp=getReresp();
			}
//			ObjectMapper om = new ObjectMapper();
//			
//			Map maps = om.readValue(resp, Map.class);
			Map maps = JsonUtil.parseJsonMap(resp);
			Integer status = (Integer) maps.get("status");
			if (status == BAIDU_STATUS_SUCC) {
				List results = (List) maps.get("result");
				for (int i = 0; i < results.size(); i++) {
					Map point = (Map) results.get(i);
					Double x = (Double) point.get("x");
					Double y = (Double) point.get("y");
					
					int index = groupIndex * GROUP_COUNT + i;
					ConvertCoord convertCoord = convertCoords.get(index);
					convertCoord.setConvertedLng(x);
					convertCoord.setConvertedLat(y);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
	}
	
	//大于100个点时，返回多个字符串
	private static List<String> getCoordsStr(List<ConvertCoord> convertCoords) {
		List<String> paramStrs = new ArrayList<String>();
		
		StringBuilder sb = new StringBuilder();
		ConvertCoord tmp = null;
		int size = convertCoords.size();
		for (int i = 1; i <= size; i++) {
			tmp = convertCoords.get(i - 1);
			sb.append(tmp.getSrcLng()).append(",").append(tmp.getSrcLat());
			if (i % GROUP_COUNT == 0 || i == size) {
				
				paramStrs.add(sb.toString());
				sb = new StringBuilder();
			} else {
				sb.append(";");
			}
		}
		return paramStrs;
	}
	
	public static void main(String[] args) {
		GPS2BaiduCoordConvertor c = new GPS2BaiduCoordConvertor();
		c.setHost("api.map.baidu.com");
		c.setPath("/geoconv/v1/");
		c.setFrom("1");
		c.setTo("5");
		c.setAk("L5rglNsfmEd9D6CQxHGNgTLG");
		
		HttpUtil httpUtil = new HttpUtil();
		httpUtil.setUseProxy(true);
		httpUtil.setProxyHost("proxynj.zte.com.cn");
		httpUtil.setProxyPort(80);
		httpUtil.setProxyUserName("");
		httpUtil.setProxyPassword("");
		c.setHttpUtil(httpUtil);
		
//		double lng = 114.21892734521;
//		double lat = 29.575429778924;
		double lng = 114.218927;
		double lat = 29.575429;
		
		List<ConvertCoord> coords = new ArrayList<ConvertCoord>();
		ConvertCoord cc = new ConvertCoord();
		cc.setSrcLng(lng);
		cc.setSrcLat(lat);
		coords.add(cc);
		
		cc = new ConvertCoord();
		cc.setSrcLng(lng);
		cc.setSrcLat(lat);
		coords.add(cc);
		
		cc = new ConvertCoord();
		cc.setSrcLng(lng);
		cc.setSrcLat(lat);
		coords.add(cc);
		
		cc = new ConvertCoord();
		cc.setSrcLng(lng);
		cc.setSrcLat(lat);
		coords.add(cc);
		
		c.convert(coords);
		
		for (int i = 0; i < coords.size(); i++) {
		}
	}
}
