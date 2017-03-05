package com.diskservice.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.diskservice.model.Disk;
import com.diskservice.model.Takenitem;
import com.diskservice.model.User;
import com.diskservice.services.UserService;

@Controller
public class UserDiskController {

	private Takenitem takenitem = new Takenitem();

	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	@Autowired
	@Qualifier(value = "userService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/userDisks", method = RequestMethod.GET)
	public String listUserDisks(Model model) {
		model.addAttribute("listUserDisks", userService.listUserDisks());
		return "userDisks";

	}

	@RequestMapping(value = "/freeDisks", method = RequestMethod.GET)
	public String listFreeDisks(Model model) {
		model.addAttribute("listFreeDisks", userService.listFreeDisks());
		model.addAttribute("takenitem", takenitem);
		return "freeDisks";
	}

	@RequestMapping(value = "/takenUserDisks", method = RequestMethod.GET)
	public String listTakenUserDisks(Model model) {
		model.addAttribute("takenDisk", new Takenitem());
		model.addAttribute("listTakenUserDisks", userService.listTakenUserDisks());
		return "disksTakenByUser";
	}

	@RequestMapping(value = "/disksTakenFromUser", method = RequestMethod.GET)
	public String listTakenFromUserDisks(Model model) {
		model.addAttribute("givenDisk", new Takenitem());
		model.addAttribute("listGivenUserDisks", userService.listGivenUserDisks());
		return "givenDisks";
	}

	@RequestMapping(value = "/freeDisks/take", method = RequestMethod.POST)
	public String takeDisk(@ModelAttribute("takenitem") Takenitem takenitem, Model model) {
		userService.addTakenItem(userService.findCurrentUser(), userService.findDisk(1));
		return "redirect:/freeDisks";
	}

	@RequestMapping(value = "/give/{id}", method = RequestMethod.GET)
	public String deleteTakenDisk(@PathVariable("id") Integer id, Model model) {
		userService.deleteTakenDisk(id);
		return "redirect:/freeDisks";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "logout";
	}

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String userHome(Model model) {
		model.addAttribute("user", userService.findCurrentUser());
		return "hello";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String errorPage() {
		return "403";
	}

}
