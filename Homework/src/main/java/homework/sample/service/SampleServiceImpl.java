package homework.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import homework.sample.dao.SampleDAO;
 
@Service("sampleService")
public class SampleServiceImpl implements SampleService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="sampleDAO")
    private SampleDAO sampleDAO;
     
    @Override
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
        return sampleDAO.selectBoardList(map);
    }
    @Override
    public void insertBoard(Map<String, Object> map) throws Exception {
        sampleDAO.insertBoard(map);
    }
	@Override
	public void editPasswd(Map<String, Object> map) throws Exception {
		sampleDAO.selectBoardList(map);
		
	}
	@Override
	public Map<String, Object> selectCheckPasswd(Map<String, Object> map) throws Exception {
		
		return sampleDAO.selectcheckPasswd(map);
	}
	@Override
	public void updateTable(Map<String, Object> map) throws Exception {
		sampleDAO.updateTable(map);
	}
	@Override
	public void deleteTable(Map<String, Object> map) {
		sampleDAO.deleteTable(map);
		
	}
 
}