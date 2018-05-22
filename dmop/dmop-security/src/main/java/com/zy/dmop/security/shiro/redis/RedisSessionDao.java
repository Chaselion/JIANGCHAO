package com.zy.dmop.security.shiro.redis;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;

public class RedisSessionDao extends AbstractSessionDAO {  
	  
    private static Logger logger = Logger.getLogger(RedisSessionDao.class);
    /** 
     * shiro-redis的session对象前缀 
     */  
    private RedisManager redisManager;  
      
    /** 
     * The Redis key prefix for the sessions  
     */  
    private String keyPrefix = "shiro_redis_session:";  
      
    @Override  
    public void update(Session session) throws UnknownSessionException {  
        this.saveSession(session);  
    }  
      
    /** 
     * save session 
     * @param session 
     * @throws UnknownSessionException 
     */  
    private void saveSession(Session session) throws UnknownSessionException{  
        if(session == null || session.getId() == null){  
            logger.error("session or session id is null");  
            return;  
        }  
          
//        byte[] key = getByteKey(session.getId());  
//        byte[] value = SerializeUtils.serialize(session);  
//        session.setTimeout(redisManager.getExpire() * 1000);        
        this.redisManager.set(keyPrefix, session.getId(), session);  
    }  
  
    @Override  
    public void delete(Session session) {  
        if(session == null || session.getId() == null){  
            logger.error("session or session id is null");  
            return;  
        }
        
        redisManager.del(keyPrefix, session.getId());  
    }  
  
    //用来统计当前活动的session  
    @Override  
	public Collection<Session> getActiveSessions() {
		// return new ArrayList<Session>();

		List<Session> sessions = new ArrayList<Session>();

		List<Object> values = redisManager.values(this.keyPrefix);
		if (values != null && values.size() > 0) {
			for (Object value : values) {
				Session s = (Session) value;
				sessions.add(s);
			}
		}

		return sessions;
	}
  
    @Override  
    protected Serializable doCreate(Session session) {  
        Serializable sessionId = this.generateSessionId(session);    
        this.assignSessionId(session, sessionId);  
        this.saveSession(session);  
        return sessionId;  
    }  
  
    @Override  
    protected Session doReadSession(Serializable sessionId) {  
        if(sessionId == null){  
            logger.error("session id is null");  
            return null;  
        }  
          
//        Session s = (Session)SerializeUtils.deserialize(redisManager.get(this.getByteKey(sessionId)));  
        Session s = (Session) redisManager.get(this.keyPrefix, sessionId);
        return s;  
    }  
      
    /** 
     * 获得byte[]型的key 
     * @param key 
     * @return 
     */  
//    private byte[] getByteKey(Serializable sessionId){  
//        String preKey = this.keyPrefix + sessionId;  
//        return preKey.getBytes();  
//    }  
  
    public RedisManager getRedisManager() {  
        return redisManager;  
    }  
  
    public void setRedisManager(RedisManager redisManager) {  
        this.redisManager = redisManager;  
          
        /** 
         * 初始化redisManager 
         */  
        //this.redisManager.init();  
    }  
  
    /** 
     * Returns the Redis session keys 
     * prefix. 
     * @return The prefix 
     */  
    public String getKeyPrefix() {  
        return keyPrefix;  
    }  
  
    /** 
     * Sets the Redis sessions key  
     * prefix. 
     * @param keyPrefix The prefix 
     */  
    public void setKeyPrefix(String keyPrefix) {  
        this.keyPrefix = keyPrefix;  
    }  
}  
