package com.zy.dmop.security.shiro.redis;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.data.redis.core.HashOperations;

public class RedisManager {

//	private RedisTemplate<byte[], byte[]> shiroRedisTemplate;
	
	@Resource(name="shiroRedisTemplate")
	private HashOperations<String, Object, Object> hashOps;
	
//	private String host = "127.0.0.1";
//
//	private int port = 6379;
//
//	// 0 - never expire
//	private int expire = 0;
//
//	// timeout for jedis try to connect to redis server, not expire time! In
//	// milliseconds
//	private int timeout = 0;
//
//	private String password = "";
//
//	private static JedisPool jedisPool = null;

	public RedisManager() {

	}

	/**
	 * 初始化方法
	 */
//	public void init() {
//		if (jedisPool == null) {
//			if (password != null && !"".equals(password)) {
//				jedisPool = new JedisPool(new JedisPoolConfig(), host, port, timeout, password);
//			} else if (timeout != 0) {
//				jedisPool = new JedisPool(new JedisPoolConfig(), host, port, timeout);
//			} else {
//				jedisPool = new JedisPool(new JedisPoolConfig(), host, port);
//			}
//
//		}
//	}

	/**
	 * get value from redis
	 * 
	 * @param key
	 * @return
	 */
	public Object get(String key, Object hashKey) {
		return hashOps.get(key, hashKey);
		
		
//		byte[] value = null;
//		Jedis jedis = jedisPool.getResource();
//		try {
//			value = jedis.get();
//		} finally {
//			jedisPool.returnResource(jedis);
//		}
//		return value;
	}

	/**
	 * set
	 * 
	 * @param key
	 * @param value
	 * @return
	 */
	public void set(String key, Object hashKey, Object value) {
		hashOps.put(key, hashKey, value);
		
//		Jedis jedis = jedisPool.getResource();
//		try {
//			jedis.set(key, value);
//			if (this.expire != 0) {
//				jedis.expire(key, this.expire);
//			}
//		} finally {
//			jedisPool.returnResource(jedis);
//		}
//		return value;
	}

	/**
	 * set
	 * 
	 * @param key
	 * @param value
	 * @param expire
	 * @return
	 */
//	public byte[] set(String key, Object hashKey, Object value, int expire) {
//		hashOps.put(key, hashKey, value);
//		//hashOps.getOperations().exp
//		
//		Jedis jedis = jedisPool.getResource();
//		try {
//			jedis.set(key, value);
//			if (expire != 0) {
//				jedis.expire(key, expire);
//			}
//		} finally {
//			jedisPool.returnResource(jedis);
//		}
//		return value;
//	}

	/**
	 * del
	 * 
	 * @param key
	 */
	public void del(String key, Object hashKey) {
		hashOps.delete(key, hashKey);
		
//		Jedis jedis = jedisPool.getResource();
//		try {
//			jedis.del(key);
//		} finally {
//			jedisPool.returnResource(jedis);
//		}
	}

	/**
	 * flush
	 */
	public void flushDB(String key) {
//		Jedis jedis = jedisPool.getResource();
//		try {
//			jedis.flushDB();
//		} finally {
//			jedisPool.returnResource(jedis);
//		}
	}

	/**
	 * size
	 */
	public int dbSize(String key) {
		return hashOps.keys(key).size();
		
//		Long dbSize = 0L;
//		Jedis jedis = jedisPool.getResource();
//		try {
//			dbSize = jedis.dbSize();
//		} finally {
//			jedisPool.returnResource(jedis);
//		}
//		return dbSize;
	}

	/**
	 * keys
	 * 
	 * @param regex
	 * @return
	 */
	public Set<Object> keys(String key) {
		return hashOps.keys(key);
		
//		Set<byte[]> keys = null;
//		Jedis jedis = jedisPool.getResource();
//		try {
//			keys = jedis.keys(pattern.getBytes());
//		} finally {
//			jedisPool.returnResource(jedis);
//		}
//		return keys;
	}

	public List<Object> values(String key) {
		return hashOps.values(key);
	}

//	public String getHost() {
//		return host;
//	}
//
//	public void setHost(String host) {
//		this.host = host;
//	}
//
//	public int getPort() {
//		return port;
//	}
//
//	public void setPort(int port) {
//		this.port = port;
//	}
//
//	public int getExpire() {
//		return expire;
//	}
//
//	public void setExpire(int expire) {
//		this.expire = expire;
//	}
//
//	public int getTimeout() {
//		return timeout;
//	}
//
//	public void setTimeout(int timeout) {
//		this.timeout = timeout;
//	}
//
//	public String getPassword() {
//		return password;
//	}
//
//	public void setPassword(String password) {
//		this.password = password;
//	}

}
