package org.opengis.nix.web;

import org.opengis.nix.Parcela;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "parcelas", formBackingObject = Parcela.class)
@RequestMapping("/parcelas")
@Controller
public class ParcelaController {
}
