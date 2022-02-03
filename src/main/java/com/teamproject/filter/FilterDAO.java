package com.teamproject.filter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface FilterDAO {
	
	@Select("select itemid, latitude, longitude, itemname, itemimage, itemprice from item")
	List<MapDTO> selectMap();
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter, distance from item where areacode=5001")
	List<MapDTO> select();
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter, distance from item where areacode=#{areacode}")
	List<MapDTO> selectOriginal(String areacode);
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter, distance from item where areacode=#{areacode} order by itemprice asc")
	List<MapDTO> selectUnderPrice(String areacode);
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter, distance from item where areacode=#{areacode} order by itemprice desc ")
	List<MapDTO> selectUpPrice(String areacode);
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter, distance from item where areacode = #{areaCode}")
	List<MapDTO> selectArea(String areaCode);
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter, distance from item where areacode=#{areacode} order by distance asc")
	List<MapDTO> selectPlace(String areacode);
	
	@Select("select A.areacode, A.itemPrice, A.filter, A.itemid, B.maxpeople, C.* from item A join item_room B " + 
			"on A.itemId = B.itemId and A.itemId = ${itemId} " + 
			"join calendar C " + 
			"on B.itemRoomId = C.itemroomId " + 
			"where month = #{firstMonth} and filter like '%${checkLabel}%'")
	ArrayList<FilterDTO> submitSearch(String itemId);
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter, distance from item where areacode=#{areacode} and #{minPrice} <= itemprice and itemprice <= #{maxPrice}" )
	List<FilterDTO> selectFirstList(HashMap<String, String> map);
	

	@Select("select areacode, itemid, itemname, locale, itemprice, itemimage, filter, distance from item where itemid=#{itemId}")
	ArrayList<FilterDTO> search1(String itemId);
	
	@Select("select A.areacode, A.itemPrice, A.filter, A.itemid, B.maxpeople, C.* from item A join item_room B " + 
			"on A.itemId = B.itemId and A.itemId = ${itemId} " + 
			"join calendar C " + 
			"on B.itemRoomId = C.itemroomId " + 
			"where month between #{firstMonth} and #{secondMonth} and filter like '%${checkLabel}%'")
	List<FilterDTO> selectFirstList2(HashMap<String, String> map);
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter, distance from item where areacode=#{areacode}")
	List<FilterDTO> mainSelectArea(HashMap<String, String> map);
	

	@Select("select A.areacode, A.itemPrice, A.filter, A.itemid, B.maxpeople, C.* from item A join item_room B " + 
			"on A.itemId = B.itemId and A.itemId = ${itemId} " + 
			"join calendar C " + 
			"on B.itemRoomId = C.itemroomId " + 
			"where month = #{firstMonth}")
	ArrayList<FilterDTO> submitSearch3(HashMap<String, String> map);
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter, distance from item where itemid=#{itemid}")
	ArrayList<FilterDTO> search2(String itemId);
	

	@Select("select A.areacode, A.itemPrice, A.filter, A.itemid, B.maxpeople, C.* from item A join item_room B " + 
			"on A.itemId = B.itemId and A.itemId = ${itemId} " + 
			"join calendar C " + 
			"on B.itemRoomId = C.itemroomId " + 
			"where month between #{firstMonth} and #{secondMonth}")
	ArrayList<FilterDTO> mainSelectArea2(HashMap<String, String> map);
	



	
	

}
