package org.web;

import org.opengis.nix.TareasRealizadas;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "tareasrealizadases", formBackingObject = TareasRealizadas.class)
@RequestMapping("/tareasrealizadases")
@Controller
public class TareasRealizadasController {
}
