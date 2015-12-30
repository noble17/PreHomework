package homework.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import homework.common.dao.AbstractDAO;
 
@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{
 
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);
    }
    
    public void insertBoard(Map<String, Object> map) throws Exception{
    	
        insert("sample.insertBoard", map);
    }
    
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectcheckPasswd(Map<String, Object> map) throws Exception{
	
		 return (Map<String, Object>) selectOne("sample.selectcheckPasswd", map);
	}

	public void updateTable(Map<String, Object> map) {
		update("sample.updateTable",map);
		
	}

	public void deleteTable(Map<String, Object> map) {
		delete("sample.deleteTable",map);
	}

}