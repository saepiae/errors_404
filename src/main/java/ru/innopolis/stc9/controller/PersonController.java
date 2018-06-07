package ru.innopolis.stc9.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.innopolis.stc9.pojo.Person;
import ru.innopolis.stc9.service.PersonService;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.util.List;


@Controller
public class PersonController extends HttpServlet {
    private static final Logger logger = Logger.getLogger(PersonController.class);

    @Autowired
    private PersonService service;

    @RequestMapping(value = "/addOrUpdate", method = RequestMethod.GET)
    public String addOrUpdate(HttpServletRequest request, Model model) {
        if (model.containsAttribute("person")) {
            model.addAttribute("action", "update");
            model.addAttribute("id", request.getParameter("id"));
        } else {
            model.addAttribute("action", "add");
        }
        return "/addOrUpdate";
    }

    @RequestMapping(value = "/addOrUpdate", method = RequestMethod.POST)
    public String addOrUpdatePerson(HttpServletRequest request,
                                    @RequestAttribute String id,
                                    @RequestAttribute String action,
                                    @RequestAttribute String name,
                                    @RequestAttribute String birthday,
                                    @RequestAttribute String email,
                                    @RequestAttribute String role, Model model) {

        if (action.equals("add")) {
            Person person = new Person(name, Date.valueOf(birthday), email, Integer.parseInt(role));
            service.add(person);
        } else {
            if (action.equals("update")) {
                Person person = new Person(Long.parseLong(id), name, Date.valueOf(birthday), email, Integer.parseInt(role));
                service.updateById(person);
            }
        }
        return "redirect:personAll";
    }

    @RequestMapping(value = "/deletePerson", method = RequestMethod.GET)
    public String deletePerson(HttpServletRequest request,
                               @RequestAttribute String id, Model model) {
        service.deleteById(Long.parseLong(id));
        return ("redirect:personAll");
    }

    @RequestMapping(value = "/personAll", method = RequestMethod.GET)
    public String getAll(HttpServletRequest request, Model model) {
        List<Person> personList = service.getAll();
        if (personList != null) {
            model.addAttribute("personList", personList);
            return "/personList";
        } else {
            return "index";
        }
    }

    @RequestMapping(value = "/updatePerson", method = RequestMethod.GET)
    public String updatePerson(HttpServletRequest request,
                               @RequestAttribute String id, Model model) {
        model.addAttribute("person", service.getById(Long.parseLong(id)));
        model.addAttribute("action", "update");
        return ("/addOrUpdate");
    }

    @RequestMapping(value = "/person", method = RequestMethod.GET)
    public String getPerson(HttpServletRequest request,
                            @RequestAttribute String id, Model model) {
        Person person = service.getById(Long.parseLong(id));
        model.addAttribute("person", person);
        return "/getPerson";
    }
}