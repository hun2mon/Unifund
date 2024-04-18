package com.uni.fund.crew.dao;

import java.util.Map;

public interface CrewDAO {

	

	int crewOverlay(String crew_name);

	int crewCreateDo(Map<String, String> param);

}
