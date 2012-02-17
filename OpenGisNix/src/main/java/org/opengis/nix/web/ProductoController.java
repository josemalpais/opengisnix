package org.opengis.nix.web;

import org.opengis.nix.Producto;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "productoes", formBackingObject = Producto.class)
@RequestMapping("/productoes")
@Controller
public class ProductoController {
}
