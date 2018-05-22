package com.zy.dmop;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.junit.Test;



public class PermissionBitTest {
	/**
	 * @TODO 在授权的时候根据权限code和bit位，生成权限code.add code.delete code.update code.show code.import code.export
	 */
	
	private static final Map map;
	
	static{
		HashMap<Integer, String> hashMap = new HashMap<>();
		hashMap.put(0, ".px");
		hashMap.put(1, ".py");
		hashMap.put(2, ".update");
		hashMap.put(3, ".delete");
		hashMap.put(4, ".import");
		hashMap.put(5, ".add");
		hashMap.put(6, ".export");
		hashMap.put(7, ".show");
		map = Collections.unmodifiableMap(hashMap);
	}
	
	
	public Set<String> generateDetailPermissionBycodeAndBit (String code,int bit){
		
		String bitStr = Integer.toBinaryString(bit);
		String tmp = "00000000"+bitStr;
		String bitStrFull = tmp.substring(tmp.length()-8, tmp.length());
		String[] bitArray = bitStrFull.split("");
		HashSet<String> hashSet = new HashSet<>();
		for(int i = 0;i<bitArray.length;i++){			
			if("1".equals(bitArray[i])){
				StringBuffer sb = new StringBuffer(code);
				sb.append(map.get(i));
				hashSet.add(sb.toString());
			}
		}
		
		
		
		return hashSet;	
	}
	
	@Test
	public void test(){
		PermissionBitTest bitTest = new PermissionBitTest();
		Set<String> set = bitTest.generateDetailPermissionBycodeAndBit("s", 127);
		
	}
}
