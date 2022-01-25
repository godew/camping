package com.teamproject.filter;

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
	

	
	

}
