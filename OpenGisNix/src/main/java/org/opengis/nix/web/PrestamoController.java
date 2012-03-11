package org.opengis.nix.web;

import java.util.Collection;
import org.opengis.nix.Dispositivo;
import org.opengis.nix.Prestamo;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "prestamoes", formBackingObject = Prestamo.class)
@RequestMapping("/prestamoes")
@Controller
public class PrestamoController {

	@ModelAttribute("dispositivoes")
    public Collection<Dispositivo> populateDispositivoes() {
        return Dispositivo.findAvaiableDevices();
    }
	
	@ModelAttribute("Todosdispositivoes")
    public Collection<Dispositivo> populateAllDispositivoes() {
        return Dispositivo.findAllDispositivoes();
    }
}
