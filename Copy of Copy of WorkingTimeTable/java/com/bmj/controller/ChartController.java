package com.bmj.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bmj.entity.Company;
import com.bmj.entity.CompanyPerson;
import com.bmj.entity.Stats;
import com.bmj.entity.Users;
import com.bmj.service.CompanyPersonService;
import com.bmj.service.CompanyService;
import com.bmj.service.TimeTableService;

@Controller
public class ChartController {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(ChartController.class);
	}
	
	@Autowired
	TimeTableService service;
	@Autowired
	CompanyPersonService cpservice;
	@Autowired
	CompanyService companyservice;
	
	// 개인 급여 조회~~
	@RequestMapping(value = "/mychart")
	public String goChartAlba() {
		Calendar c1 = Calendar.getInstance();
		logger.trace("수업 : Chart~~~~~~~~~~~~~~!");
		return "chart/myChart";
	}
	
	// 직원 급여 조회~~
		@RequestMapping(value = "/companychart")
		public String goChartcompany() {
			Calendar c1 = Calendar.getInstance();
			logger.trace("수업 : CompanyChart~~~~~~~~~~~~~~!");
			return "chart/CompanyChart";
		}
	
	@RequestMapping(value = "/ajaxChart")
	public @ResponseBody String ajaxReceive(Model model, HttpSession session) {
		// 1. session에서 내 정보를 가져오겠지...?
		Users user = (Users)session.getAttribute("addUser");
		logger.trace("수업 user : " + user);
		String userId = user.getUserId();
		CompanyPerson companyperson= cpservice.selectCompanyPersonByUserId(userId);
		logger.trace("수업 companyperson : " + companyperson);
		// 2. 내 아이디로 나의 직원 아이디를 가져오고!
		// String memberId = service.select~~(userId);
		// 일단여기에선 UserId : Kim , memberId = 6
		// 3. 직원 아이디로 근무표를 조회한다.
		logger.trace("수업 : 어디까지..?0");
		List<Stats> myTimes = new ArrayList<Stats>();
		myTimes = service.selectStatsByMemberId(companyperson.getMemberId());
		// month, memberId, count
		logger.trace("수업 ::::::::::::::::" + myTimes);

		int salary = companyperson.getSalary();
		for (int i = 0; i < myTimes.size(); i++) {
			// 월급 계산.....! 시간 * 시급
			int count = myTimes.get(i).getCount() * salary;
			myTimes.get(i).setCount(count);
		}
		logger.trace("수업, 기본 셋팅 완료 : " + myTimes);
		
		JSONObject objJson = new JSONObject();
		JSONArray arrayJson = new JSONArray();
		
		for(int i = 0; i < myTimes.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("month", myTimes.get(i).getMonth());
			obj.put("memberId", myTimes.get(i).getMemberId());
			obj.put("count", myTimes.get(i).getCount());
			
			arrayJson.add(obj);
		}
		objJson.put("charts", arrayJson);
		
		logger.trace("수업 Json : " + objJson);
		
		return objJson.toString();
	}
	
	/*사장이 직원 월급현황 보기*/
	@RequestMapping(value = "/ajaxCompanyChart")
	public @ResponseBody String ajaxComReceive(Model model, HttpSession session) {
		// 1. session에서 내 정보를 가져오겠지...?
		Users user = (Users)session.getAttribute("addUser");
		logger.trace("수업 user : " + user);
		String userId = user.getUserId();
		CompanyPerson companyperson= cpservice.selectCompanyPersonByUserId(userId);
		logger.trace("수업 사장... companyperson : " + companyperson);
		Company company = companyservice.selectCompanyByCompanyCode(companyperson.getCompanyCode());
		logger.trace("수업 회사 : " + company);
		// 2. 내 아이디로 나의 직원 아이디를 가져오고!
		List<CompanyPerson> employee = cpservice.selectByCompanyCode(companyperson.getCompanyCode());
		
		for(int i = 0; i < employee.size(); i++) {
			if(employee.get(i).getUserId().equals(userId)) {
				employee.remove(i);
			}
		}
		logger.trace("수업 직원들 : " + employee);
		// String memberId = service.select~~(userId);
		// 일단여기에선 UserId : Kim , memberId = 6
		// 3. 직원 아이디로 근무표를 조회한다.
		Stats stats = new Stats();
		List<Stats> myTimes = new ArrayList<Stats>();
		myTimes = service.selectStatsByCompanyCode(companyperson.getCompanyCode());

		// month, memberId, count
		logger.trace("수업 ::::::::::::::::" + myTimes);

		int salary = companyperson.getSalary();
		for(int i = 0; i < myTimes.size(); i++) {
			int count = 0;
			for(int j = 0; j < employee.size(); j++) {
				if(myTimes.get(i).getMemberId() == employee.get(j).getMemberId()) {
					count = myTimes.get(i).getCount() * employee.get(j).getSalary();
					// 추가수당 생각해보기...
					/*if(company.getHolidayComm() != 0) {
						count = (int) (count + count * (company.getHolidayComm()/100));
					} else if*/
				}
			}
			myTimes.get(i).setCount(count);
		}
		
		logger.trace("수업, 기본 셋팅 완료 : " + myTimes);
		
		JSONObject objJson = new JSONObject();
		JSONArray arrayJson = new JSONArray();
		
		for(int i = 0; i < myTimes.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("month", myTimes.get(i).getMonth());
			obj.put("memberId", myTimes.get(i).getMemberId());
			obj.put("count", myTimes.get(i).getCount());
			
			arrayJson.add(obj);
		}
		objJson.put("charts", arrayJson);
		
		logger.trace("수업 Json : " + objJson);
		return objJson.toString();
	}
}
