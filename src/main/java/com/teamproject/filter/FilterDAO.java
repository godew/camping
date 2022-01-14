package com.teamproject.filter;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface FilterDAO {
	
	@Select("select itemid, latitude, longitude, itemname, itemimage, itemprice from item")
	List<MapDTO> selectMap();
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter from item where locale like '%가평%'")
	List<MapDTO> selectOriginal();
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter from item order by itemprice asc")
	List<MapDTO> selectUnderPrice();
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter from item order by itemprice desc")
	List<MapDTO> selectUpPrice();
	
	@Select("select itemid, itemname, locale, itemprice, itemimage, filter from item where areacode = #{areaCode}")
	List<MapDTO> selectArea(String areaCode);
	
	

}
