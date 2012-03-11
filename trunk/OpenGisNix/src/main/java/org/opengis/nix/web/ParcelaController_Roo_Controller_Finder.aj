// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix.web;

import java.lang.String;
import org.opengis.nix.Parcela;
import org.opengis.nix.domain.User;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ParcelaController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByPartida", "form" }, method = RequestMethod.GET)
    public String ParcelaController.findParcelasByPartidaForm(Model uiModel) {
        return "parcelas/findParcelasByPartida";
    }
    
    @RequestMapping(params = "find=ByPartida", method = RequestMethod.GET)
    public String ParcelaController.findParcelasByPartida(@RequestParam("partida") String Partida, Model uiModel) {
        uiModel.addAttribute("parcelas", Parcela.findParcelasByPartida(Partida).getResultList());
        return "parcelas/list";
    }
    
    @RequestMapping(params = { "find=ByPropietario", "form" }, method = RequestMethod.GET)
    public String ParcelaController.findParcelasByPropietarioForm(Model uiModel) {
        uiModel.addAttribute("users", User.findAllUsers());
        return "parcelas/findParcelasByPropietario";
    }
    
    @RequestMapping(params = "find=ByPropietario", method = RequestMethod.GET)
    public String ParcelaController.findParcelasByPropietario(@RequestParam("propietario") User Propietario, Model uiModel) {
        uiModel.addAttribute("parcelas", Parcela.findParcelasByPropietario(Propietario).getResultList());
        return "parcelas/list";
    }
    
}