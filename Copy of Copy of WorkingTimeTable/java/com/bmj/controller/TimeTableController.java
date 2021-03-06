package com.bmj.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bmj.entity.CompanyPerson;
import com.bmj.entity.SaveTime;
import com.bmj.entity.TimeTable;
import com.bmj.entity.Users;
import com.bmj.service.CompanyPersonService;
import com.bmj.service.TimeTableService;
import com.google.gson.Gson; 
@Controller
public class TimeTableController {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(TimeTableController.class);
	}
	
	private String[] color = {"#000000", "#ff0000", "#00ff00", "#0000ff", "#ffff00", "#00ffff", "#ff00ff"};
	
	@Autowired
	CompanyPersonService service2;
	@Autowired
	TimeTableService service;
	
	/*스케쥴 추가하기.....!*/
	@RequestMapping(value="/addTimeTable", method = RequestMethod.GET)
	public String saveExternal(@RequestParam String list, HttpSession session) {
		logger.trace("수업 : " + list);
		Gson gson = new Gson();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ArrayList templ = new ArrayList();
		// ArrayList에 gson으로 List 저장.
		templ = gson.fromJson(list, ArrayList.class);
		Date date = new Date();
		TimeTable timetable = new TimeTable();
		Users user = (Users)session.getAttribute("addUser");
		logger.trace("수업 : User " + user);
		CompanyPerson companyperson = service2.selectCompanyPersonByUserId(user.getUserId());
		int companyCode = companyperson.getCompanyCode();
		
		logger.trace("Gson : " + templ);
		for(int i = 0; i < templ.size(); i++) {
			com.google.gson.internal.LinkedTreeMap map = (com.google.gson.internal.LinkedTreeMap)templ.get(i);
			logger.trace("수업 Map : " + map);
			logger.trace("수업 확인 Id : " +map.get("title"));
			StringTokenizer st1 = new StringTokenizer(map.get("title").toString(), "@@");
			int id = Integer.parseInt(st1.nextToken());
			logger.trace("수업 확인 Data : " + date);
			try {
				date = formatter.parse(map.get("start").toString());
			} catch (java.text.ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			logger.trace("수업 확인 Start : " + map.get("start"));
			String start = map.get("start").toString();
			logger.trace("수업 확인 End : " + map.get("end"));
			String end = map.get("end").toString();
			timetable.setCompanyCode(companyCode);
			timetable.setMemberId(id);
			timetable.setWorkingDate(date);
			timetable.setWorkingStart(start);
			timetable.setWorkingEnd(end);
			logger.trace("수업 111111111 : " + timetable);
		
			int result = service.insertTimeTable(timetable);
		}		
		// 여기 나중에 수정...!
		return "calendar/register";
	}
	
	/*모든 스케쥴 조회하기*/
	@RequestMapping(value="/viewCalendar")
	public String viewCalendar() {
		return "calendar/viewCalendar";
	}
	
	private String settingTime(String time) {
		StringBuilder builder = new StringBuilder();
		builder.append(time.substring(0, 10));
		builder.append("T");
		builder.append(time.substring(11, 19));
		return builder.toString();
	}
	
	// ajax.....
	@RequestMapping(value = "/ajax")
	public @ResponseBody String ajaxReceive(Model model, HttpSession session) {
		Users user = (Users)session.getAttribute("addUser");
		CompanyPerson companyperson = service2.selectCompanyPersonByUserId(user.getUserId());
		logger.trace("수업 : " + companyperson);
		TimeTable timetable = new TimeTable();
		List<TimeTable> lists = null;	// DB에서 Get.!
		List<SaveTime> list2 = new ArrayList<SaveTime>();	// Server에 보내기!
		SaveTime savetime = null;
		// 그리고 우리 회사 코드로 작성된 달력 정보 갖고 오기...!
		if (user.getGrade().equals("사장")) {
			lists = service.selectByCompanyCode(companyperson.getCompanyCode());
		} else if(user.getGrade().equals("직원")) {
			lists = service.selectByMemberId(companyperson.getMemberId());
		}
		
		for (int idx = 0; idx < lists.size(); idx++) {
			logger.trace("수업 idx : " + idx);
			savetime = new SaveTime();
			savetime.setTitle(String.valueOf(lists.get(idx).getMemberId()));
			savetime.setStart(settingTime(lists.get(idx).getWorkingStart()));
			savetime.setEnd(settingTime(lists.get(idx).getWorkingEnd()));
			//if(idx > 6) {
				//int length = idx;
			savetime.setColor(color[lists.get(idx).getMemberId()%6]);
			/*	
			}else {
				savetime.setColor(color[idx]);
			}*/
			logger.trace("수업 savetime : " + savetime);
			list2.add(idx, savetime);
		}
		
		logger.trace("수업 lists : " + lists);
		logger.trace("수업 SaveList : " + list2);
		model.addAttribute("Calendar", list2);		
		logger.trace("수업 : " + list2);
		JSONObject objJson = new JSONObject();
		JSONArray arrayJson = new JSONArray();
		
		for (int i = 0; i < list2.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("title", list2.get(i).getTitle());
			obj.put("start", list2.get(i).getStart());
			obj.put("end", list2.get(i).getEnd());
			obj.put("color", list2.get(i).getColor());
			
			arrayJson.add(obj);
		}
		objJson.put("event", arrayJson);
		
		logger.trace("수업 55 : " + objJson.get("event"));
		
		return objJson.toString();
	}
	
}
