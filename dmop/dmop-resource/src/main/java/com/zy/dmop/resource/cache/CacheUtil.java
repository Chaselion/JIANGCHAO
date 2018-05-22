package com.zy.dmop.resource.cache;

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;

import com.zy.dmop.model.Terminal;

import net.sf.json.JSONObject;

public class CacheUtil {
	
	private static Logger log = Logger.getLogger(CacheUtil.class);
	
	public static Terminal geTerminalByNum(String num) {
		List<Object> cache = getModelList(CacheConstant.MODEL_TERMINAL);
		if(cache != null && cache.size() > 0) {
			for(Object o : cache) {
				Terminal t = (Terminal)o;
				if(t != null && t.getTerminalNum() != null 
						&& t.getTerminalNum().equals(num)) {
					return t;
				}
			}
		}
		return null;
	}
	
	/**
	 * 获取某个配置文件的所有信息
	 * @param configName ConfigCache.常量
	 * @return
	 */
	public static Map<String, JSONObject> getConfigValues(String configName){
		if(ConfigCache.getCache().containsKey(configName)){
			return ConfigCache.getCache().get(configName);
		}
		return null;
	}
	
	/**
	 * 直接获取某个配置文件某项某属性的值
	 * @param configName 配置文件名
	 * @param configType 文件中项名
	 * @param key 属性名
	 * @return
	 */
	public static String getConfigValue(String configName, String configType, String key) {
		if(ConfigCache.getCache().containsKey(configName)){
			return ConfigCache.getCache().get(configName).get(configType).getString(key);
		}
		return null;
	}
	
	/**
	 * 获取某个实体的所有缓存
	 * @param modelName ModelCache.常量
	 * @return 无返回空list
	 */
	public static List<Object> getModelList(String modelName){
		List<Object> list = new ArrayList<>();
		Map<String, Map<Integer, Object>> map = ModelCache.getCache();
		if(map.containsKey(modelName)) {
			Map<Integer, Object> index = map.get(modelName);
			Iterator<Map.Entry<Integer, Object>> i = index.entrySet().iterator();
			while(i.hasNext()){
				list.add(i.next().getValue());
			}
		}
		return list;
	}
	
	/**
	 * 根据主键获取单个缓存
	 * @param modelName ModelCache.常量
	 * @param id主键
	 * @return 无返回null
	 */
	public static Object getModel(String modelName, Integer id){
		Object rev = null;
		Map<String, Map<Integer, Object>> map = ModelCache.getCache();
		if(map.containsKey(modelName)) {
			Map<Integer, Object> index = map.get(modelName);
			if(index.containsKey(id)) {
				rev = index.get(id);
			}
		}
		return rev;
	}
	
	/**
	 * 增删改缓存
	 * @param modelName
	 * @param id
	 * @param object 删除时传null值
	 */
	public static void updateModel(String modelName, Integer id, Object object) {
		Map<String, Map<Integer, Object>> map = ModelCache.getCache();
		if(map.containsKey(modelName)) {
			Map<Integer, Object> index = map.get(modelName);
			//null值表示删除
			if(object == null && index.containsKey(id)) {
				index.remove(id);
				log.info("删除缓存_" + modelName + ":id=" + id + ",size=" + index.size());
			}else {				
				if(index.containsKey(id)) {
					index.put(id, object);
					log.info("更新缓存_" + modelName + ":id=" + id + ",size=" + index.size());
				}else {//新纪录,首位插入
					Map<Integer, Object> m = new LinkedHashMap<>();
					m.put(id, object);
					m.putAll(index);
					map.put(modelName, m);
					log.info("新增缓存_" + modelName + ":id=" + id + ",size=" + m.size() + "," + object.toString());
				}
			}
		}
	}
	
	
	/**
	 * 加载配置文件
	 * @param name
	 * @return
	 * @throws URISyntaxException
	 */
	protected static Map<String, JSONObject> loadConfig(String name) throws URISyntaxException{
		Map<String, JSONObject> map = new LinkedHashMap<String, JSONObject>();
		String filePath = ConfigCache.class.getClassLoader().getResource(name+".properties").toURI().getPath();
        Properties prop = new Properties();  
        InputStream in = null;  
        FileOutputStream oFile = null;  
        try {  
            in = new BufferedInputStream(new FileInputStream(filePath));  
            //prop.load(in);//直接这么写，如果properties文件中有汉子，则汉字会乱码。因为未设置编码格式。  
            prop.load(new InputStreamReader(in, "utf-8"));  
            for (String key : prop.stringPropertyNames()) {  
                map.put(key, JSONObject.fromObject(prop.getProperty(key)));
            }  
        } catch (Exception e) {  
        } finally {  
            if (in != null) {  
                try {  
                    in.close();  
                } catch (IOException e) {  
                    System.out.println(e.getMessage());  
                }  
            }  
            if (oFile != null) {  
                try {  
                    oFile.close();  
                } catch (IOException e) {  
                    System.out.println(e.getMessage());  
                }  
            }  
        }  
		return map;
	}
	
	/**
	 * 更新配置文件
	 * @param map
	 * @param key
	 * @throws URISyntaxException
	 * @throws FileNotFoundException
	 */
	protected static void updateConfig(Map<String, JSONObject> map, String key) throws URISyntaxException, FileNotFoundException{
		String filePath = ConfigCache.class.getClassLoader().getResource(key+".properties").toURI().getPath();
		InputStream in = new FileInputStream(filePath);
		Properties props = new Properties();
		try {
			BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath),"utf-8"));
			props.load(new InputStreamReader(in, "utf-8"));
			props.clear();
			for(String k : map.keySet()){
				props.setProperty(k, map.get(k).toString());
			}
			props.store(out, "");
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				in.close();
			} catch (IOException e) {
			}
		}
	}
}
