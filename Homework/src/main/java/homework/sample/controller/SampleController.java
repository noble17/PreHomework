package homework.sample.controller;

import java.util.List;
import java.util.Map;
import javax.swing.JOptionPane;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//import homework.common.common.CommandMap;
import homework.sample.service.SampleService;
 
@Controller
public class SampleController {
    @Resource(name="sampleService")
    private SampleService sampleService;
     
    @RequestMapping(value="/sample/openBoardList.do")
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/boardList");        
        
        List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
     
        mv.addObject("list", list);
        return mv;
    }
    
    @RequestMapping(value="/sample/insertBoard.do")
    public ModelAndView insertBoard(@RequestParam Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
        sampleService.insertBoard(commandMap);
        return mv;
    }
    @RequestMapping(value="/sample/editPasswd.do")
    public ModelAndView editPassWord(@RequestParam Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/editpasswd");
        mv.addObject("row", commandMap);
        return mv;
    }
    @RequestMapping(value="/sample/updateTable.do")
    public ModelAndView updateTable(@RequestParam Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
        sampleService.updateTable(commandMap);
        return mv;
    }
    @RequestMapping(value="/sample/deleteTable.do")
    public ModelAndView deleteTable(@RequestParam Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
        sampleService.deleteTable(commandMap);
        return mv;
    }
    @RequestMapping(value="/sample/checkPasswd.do")
    public ModelAndView checkPasswd(@RequestParam Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/checkPasswd");
        Map<String,Object> list = sampleService.selectCheckPasswd(commandMap);
        mv.addObject("row", list);
        if(commandMap.get("passwd").equals(list.get("passwd")))
        {
        	JOptionPane.showMessageDialog(null, "수정이 가능합니다.");
        	return mv;
        }
        else
        {
        	JOptionPane.showMessageDialog(null, "비밀번호가 틀렸습니다.");
        	return (ModelAndView)new ModelAndView("redirect:/sample/openBoardList.do");
        }
        
    }
    
}