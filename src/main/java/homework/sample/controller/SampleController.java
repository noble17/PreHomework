package homework.sample.controller;

import java.util.List;
import java.util.Map;
import javax.swing.JOptionPane;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//import homework.common.common.CommandMap;
import homework.sample.service.SampleService;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
@Controller
public class SampleController {
    @Resource(name="sampleService")
    private SampleService sampleService;
    private static final String EMAIL_PATTERN = 
    		"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
    		+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    private Pattern pattern;
	private Matcher matcher;
	
    @RequestMapping(value="/sample/openBoardList.do")
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/boardList");        
        
        List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
        
        mv.addObject("list", list);
        return mv;
    }
    
    @RequestMapping(value="/sample/insertBoard.do")
    public ModelAndView insertBoard(@RequestParam Map<String,Object> commandMap, RedirectAttributes redirectAttributes) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
    	pattern = Pattern.compile(EMAIL_PATTERN);
    	if(commandMap.get("PW").equals(""))
		{
    		redirectAttributes.addFlashAttribute("message", "<div id = 'messagestyle'>비밀번호를 입력하세요.</div>");
		}
    	else if(validate(commandMap.get("EMAIL").toString()))
        {	
            sampleService.insertBoard(commandMap);
        }
    	
		else  
    	{
    		redirectAttributes.addFlashAttribute("message", "<div id = 'messagestyle'>이메일 형식이 맞지 않습니다.</div>");
    	}
    	return mv;
    }
    @RequestMapping(value="/sample/editPasswd.do")
    public ModelAndView editPassWord(@RequestParam Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/editpasswd");
        mv.addObject("row", commandMap);
        return mv;
    }
    @RequestMapping(value="/sample/updateTable.do")
    public ModelAndView updateTable(@RequestParam Map<String,Object> commandMap, RedirectAttributes redirectAttributes) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
        sampleService.updateTable(commandMap);
        redirectAttributes.addFlashAttribute("message", "<div id = 'messagestyle'>방명록이 수정되었습니다.</div>");
        return mv;
    }
    @RequestMapping(value="/sample/deleteTable.do")
    public ModelAndView deleteTable(@RequestParam Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
        sampleService.deleteTable(commandMap);
        return mv;
    }
    @RequestMapping(value="/sample/checkPasswd.do")
    public ModelAndView checkPasswd(@RequestParam Map<String,Object> commandMap, RedirectAttributes redirectAttributes) throws Exception{
        ModelAndView mv_success = new ModelAndView("/sample/checkPasswd");
        ModelAndView mv_fail = new ModelAndView("/sample/editpasswd");
        Map<String,Object> list = sampleService.selectCheckPasswd(commandMap);
        mv_success.addObject("row", list);
        String temp_success = "<div id = 'messagestyle'>비밀번호가 맞습니다. 수정이가능합니다.</div>";
        String temp_fail = "<div id = 'messagestyle'>비밀번호가 틀렸습니다.</div>";
        if(commandMap.get("passwd").equals(list.get("passwd")))
        {
        	mv_success.addObject("message", temp_success);
        	return mv_success;
        }
        else
        {
        	mv_fail.addObject("message_fail", temp_fail);
        	mv_fail.addObject("row", list);
        	return mv_fail;
        }
        
    }
    public boolean validate(final String hex) {

		matcher = pattern.matcher(hex);
		return matcher.matches();

	}
    
}