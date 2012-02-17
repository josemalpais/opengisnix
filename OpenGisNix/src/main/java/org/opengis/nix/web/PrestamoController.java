package org.opengis.nix.web;

import org.opengis.nix.Prestamo;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "prestamoes", formBackingObject = Prestamo.class)
@RequestMapping("/prestamoes")
@Controller
public class PrestamoController {
}
