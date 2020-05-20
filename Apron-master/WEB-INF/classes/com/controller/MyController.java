package com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.Apron;
import com.beans.Employee;
import com.beans.Login;
import com.dao.ApronDao;
import com.dao.EmployeeDao;
import com.dao.LoginDao;

@Controller
public class MyController {

	@Autowired
	ApronDao apDao;

	@Autowired
	EmployeeDao empDao;

	@Autowired
	LoginDao logDao;

	@GetMapping("/index")
	public String index() {
		return "index";
	}

	@PostMapping("/login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, RedirectAttributes rd, HttpSession session) {
		Login u = new Login();
		u.setUsername(username);
		u.setPassword(password);
		Login log = logDao.getUser(u);
		if (log != null) {
			model.addAttribute("msg", "Hello! " + log.getName());
			session.setAttribute("user", log);
			session.setMaxInactiveInterval(-1);
		} else {
			rd.addFlashAttribute("err", "Invalid Credentials!");
			return "redirect:/index";
		}
		return "user/home";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rd) {
		session.removeAttribute("user");
		session.invalidate();
		rd.addFlashAttribute("msg", "Logout Successfully.");
		return "redirect:/index";
	}

	@GetMapping("/user/updatePassword")
	public String updatePasswordView() {
		return "user/updatePassword";
	}

	@PostMapping("/user/updatePassword")
	public String updatePass(@RequestParam("id") int id, @RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword, RedirectAttributes rd) {
		Login u = new Login();
		u.setId(id);
		u.setPassword(oldPassword);
		boolean isValid = logDao.validateUser(u);
		if (isValid) {
			u.setPassword(newPassword);
			logDao.update(u);
			rd.addFlashAttribute("msg", "Password Updated successfully.");
		} else {
			rd.addFlashAttribute("err", "Please enter correct Password!");
			return "redirect:/user/updatePassword";
		}
		return "redirect:/user/home";
	}
	
	@GetMapping("/user/home")
	public String userHome() {
		return "user/home";
	}

	@GetMapping("/apronList")
	public ModelAndView apronList() {
		ArrayList<Apron> list = (ArrayList<Apron>) apDao.getAll();
		return new ModelAndView("apron/apronList", "list", list);
	}

	@GetMapping("/addApron")
	public String addApron(RedirectAttributes rd) {
		Apron ap = new Apron();
		ap.setStatus("Available");
		apDao.add(ap);
		String newApron = "New apron area added with id " + ap.getId();
		rd.addFlashAttribute("newApron", newApron);
		return "redirect:/apronList";
	}

	@GetMapping("/editApron")
	public ModelAndView editApron(@RequestParam("id") int id) {
		Apron ap = apDao.getById(id);
		return new ModelAndView("apron/editApron", "apron", ap);
	}

	@PostMapping("/updateApron")
	public String updateApron(@ModelAttribute("apron") Apron ap, BindingResult result, RedirectAttributes rd) {
		if (result.hasErrors()) {
			System.out.println("Error found");
			return "index";
		}

		apDao.update(ap);
		String msg = "Apron " + ap.getId() + " Status updated successfully.";
		rd.addFlashAttribute("msg", msg);
		return "redirect:/apronList";
	}

	@GetMapping("/employee/employeeForm")
	public ModelAndView employeeForm() {
		return new ModelAndView("employee/employeeForm", "employee", new Employee());
	}

	@PostMapping("/employee/newEmployee")
	public String newEmployee(@ModelAttribute("employee") Employee emp, BindingResult result, RedirectAttributes rd) {

		if (result.hasErrors()) {
			result.getFieldErrors().stream()
					.forEach(f -> System.err.println(f.getField() + ": " + f.getDefaultMessage()));

			rd.addFlashAttribute("err", "Something went wrong!!");
			return "redirect:/employee/employeeForm";
		}
		emp.setStatus("Active");
		logDao.save(emp);
		rd.addFlashAttribute("msg", "New Employee added.");
		return "redirect:/employee/employeeForm";
	}

	@GetMapping("/employee/employeeList")
	public ModelAndView employeeList(Model model, RedirectAttributes rd) {
		ArrayList<Employee> list = (ArrayList<Employee>) empDao.getAll();
		return new ModelAndView("employee/employeeList", "list", list);
	}

	@GetMapping("/employee/editEmployee")
	public ModelAndView editEmployee(@RequestParam("id") int id) {
		Employee emp = empDao.getById(id);
		return new ModelAndView("employee/editEmployee", "employee", emp);
	}

	@GetMapping("/employee/inactiveEmployee")
	public String inactiveEmployee(@RequestParam("id") int id, RedirectAttributes rd) {
		Employee emp = empDao.getById(id);
		emp.setStatus("Inactive");
		empDao.saveOrUpdate(emp);
		rd.addFlashAttribute("msg", "Employee account inactivated for ID: " + emp.getId());
		return "redirect:/employee/employeeList";
	}

	@PostMapping("/employee/updateEmployee")
	public String updateEmployee(@ModelAttribute("employee") Employee emp, BindingResult result,
			RedirectAttributes rd) {
		if (result.hasErrors()) {
			System.out.println("Error Found");
			rd.addFlashAttribute("err", "Something went wrong!!");
		}

		empDao.saveOrUpdate(emp);
		rd.addFlashAttribute("msg", "Employee updated with ID: " + emp.getId());
		return "redirect:/employee/employeeList";
	}
}