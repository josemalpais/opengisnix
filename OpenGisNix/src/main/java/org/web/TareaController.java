package org.web;

import org.opengis.nix.Tarea;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "tareas", formBackingObject = Tarea.class)
@RequestMapping("/tareas")
@Controller
public class TareaController {
}
