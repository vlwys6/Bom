package com.spring.bom.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.spring.bom.model.yeah.Bookmark;
import com.spring.bom.model.yeah.UserBookmarkBoard;
import com.spring.bom.service.yeah.BookmarkService;

@Controller
public class Yeah_Controller {

	@Autowired
	private BookmarkService bms;

	@RequestMapping(value = "yeah/bookmark")
	public String bookmark(String ucode, Model model) {
		System.out.println("Yeah_Controller yeah/bookmark 조회 Start...");
		int int_ucode = Integer.parseInt(ucode);
		System.out.println("Yeah_Controller yeah/bookmark int_ucode -> " + int_ucode);
		System.out.println("Yeah_Controller bookmark Start...");
		System.out.println("Yeah_Controller bookmark ucode->" + int_ucode);

		List<UserBookmarkBoard> ubmBoardList = bms.ubmBoardList(int_ucode);
		
		System.out.println("Yeah_Controller ubmBoardList.size()" + ubmBoardList.size());
		model.addAttribute("ucode", int_ucode);
		model.addAttribute("ubmBoardList", ubmBoardList); // 주소가 넘어가기 때문에 
		
		for (int i = 0; i < ubmBoardList.size(); i++) {
			if (ubmBoardList.get(i).getBattach() != null) {
				ubmBoardList.get(i).setBattachSrc(ubmBoardList.get(i).getBattach().substring(6));
				ubmBoardList.get(i).setBattachType(ubmBoardList.get(i).getBattach().substring(0, 5));
				System.out.println("setBattachSrc -> " + ubmBoardList.get(i).getBattachSrc());
				System.out.println("setBattachType -> " + ubmBoardList.get(i).getBattachType());
			}
		}

		return "yeah/bookmark";
	}
	
	@RequestMapping(value = "/yeah/update", method = RequestMethod.GET)
	public String update(@RequestParam("ucode") String ucode, @RequestParam("bcode") String bcode, Model model) {
		Bookmark bd = new Bookmark();
		bd.setUcode(Integer.parseInt(ucode));
		bd.setBcode(Integer.parseInt(bcode));
		System.out.println("Yeah_Controller update bd.ucode -> " + bd.getUcode());
		System.out.println("Yeah_Controller update bd.bcode -> " + bd.getBcode());
		int result = bms.update(bd);
		
		System.out.println("Yeah_Controller update result -> " + result);
		return "forward:bookmark"; // Controller간 data 전달시 활용(Model에 담아서 파라메타 이동)
	}


	@RequestMapping(value = "/yeah/updateAll", method = RequestMethod.GET)
	public String deleteAll(@RequestParam("ucode") String ucode, Model model) {
		int result = bms.updateAll(ucode);
		System.out.println("Yeah_Controller update result -> " + result);
		return "forward:bookmark"; // Controller간 data 전달시 활용(Model에 담아서 파라메타 이동)
	}
	

}
