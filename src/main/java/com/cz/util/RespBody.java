package com.cz.util;

import java.util.HashMap;
import java.util.Map;

/**
 * RespBody resp = new RespBody();
 * resp.put("username","zhangsan");
 * 
 * 最后转为json
 * 
 * {
 * 		code : 200,
 * 		message : "响应成功",
 * 		date : {
 * 			username : "zhangsan"
 * 		}
 * }
 * 
 *  RespBody resp = new RespBody();
 *  List list = new .....();
 *  list.add(1);
 *  list.add(2);
 *  
 *  resp.put("list",list);
 * 
 * 最后转为json
 * 
 * {
 * 		code : 200,
 * 		message : "响应成功",
 * 		date : {
 * 			list : [1,2]
 * 		}
 * }
 * 
 * @author 
 *
 */
public class RespBody {
	private int code;
	private String message;
	private Map<String, Object> date = new HashMap<String, Object>();
	
	/**
	 * 把要用json显示的数据放入到 map里
	 * @param key  
	 * @param value
	 */
	public void put(String key,Object value){
		this.date.put(key, value);
	}
	
	
	/**
	 * 默认响应成功 状态码 200
	 */
	public RespBody(){
		this.code = 200;
		this.message = "响应成功";
	}
	
	public RespBody(int code,String message){
		this.code = code;
		this.message = message;
	}
	
	public int getCode() {
		return code;
	}
	
	/**
	 * 修改状态码
	 * @param code
	 */
	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}
	
	/**
	 * 修改响应信息
	 * @param message
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getDate() {
		return date;
	}
	
}