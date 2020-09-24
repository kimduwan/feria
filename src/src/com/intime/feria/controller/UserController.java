package com.intime.feria.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.intime.feria.service.UserService;
import com.intime.feria.vo.User;

/* 2020-08-07 장유정 / 이원희 */
@Controller
public class UserController {

	private UserService userService;

	public void setService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/main.feria", method = RequestMethod.GET)
	public void index(Model model) {

	}

	@RequestMapping(value = "/login.feria", method = RequestMethod.GET)
	public void loginForm(HttpSession session, @RequestHeader String referer) {

		Object a = session.getAttribute("referer");

		if (a == null) {
			session.setAttribute("referer", referer);
		}
	}

	// 로그인
	@RequestMapping(value = "/login.feria", method = RequestMethod.POST)
	public String login(User user, HttpSession session, RedirectAttributes ra) {

		User loginUser = userService.login(user);

		/*
		 * if (loginUser == null) { ra.addFlashAttribute("msg", "아이디나 비밀번호가 틀렸습니다."); }
		 * else { // 로그인 됨 session.setAttribute(User.LOGIN, loginUser); }
		 */

		if (loginUser != null) {
			session.setAttribute(User.LOGIN, loginUser);
			String referer = (String) session.getAttribute("referer");
			System.out.println(referer);
			session.removeAttribute("referer");
			return "redirect:" + referer;
		} else {
			ra.addFlashAttribute("msg", "아이디나 비밀번호가 틀렸습니다.");
			return "redirect:/login.feria";
		} // if~else end

	}

	// 로그아웃
	@RequestMapping(value = "/logout.feria", method = RequestMethod.GET)
	public String logout(@RequestHeader String referer, HttpSession session) {

		session.invalidate();

		return "redirect:" + referer;
	}

	// 인서트
	@RequestMapping(value = "/join.feria", method = RequestMethod.GET)
	public void joinForm(Model model) {

		model.addAttribute("cities", userService.getSidos());

	}

	// 넘어오는 것
	@RequestMapping(value = "/join.feria", method = RequestMethod.POST)
	public String join(User user) {

		return "redirect:/main.feria";
	}

}
