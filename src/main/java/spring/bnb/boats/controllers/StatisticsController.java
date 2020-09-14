/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.controllers;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import spring.bnb.boats.services.BoatService;


/**
 *
 * @author mapan
 */
@Controller
public class StatisticsController {
    
    @Autowired
    BoatService boatService;
    
    @GetMapping("/statistics")
    public String showStatistics(ModelMap mm) {
        Map<Integer, Integer> portsBoatsMap = boatService.getCountOfBoatsPerPort();
        Map<String, Double> typesBoatsMap = boatService.getAverageOfBoatsPerBoatType();
        mm.addAttribute("portsBoatsMap", portsBoatsMap);
        mm.addAttribute("typesBoatsMap", typesBoatsMap);
        return "statistics";
    }
}
