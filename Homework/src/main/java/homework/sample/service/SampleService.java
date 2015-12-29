package homework.sample.service;

import java.util.List;
import java.util.Map;

public interface SampleService {
	 
    List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
    void insertBoard(Map<String, Object> map) throws Exception;
    void editPasswd(Map<String, Object> map) throws Exception;
    void updateTable(Map<String, Object> map) throws Exception;
	Map<String, Object> selectCheckPasswd(Map<String, Object> map) throws Exception;
	void deleteTable(Map<String, Object> commandMap);
}