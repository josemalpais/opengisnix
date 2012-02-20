// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Arrays;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.opengis.nix.Apero;
import org.opengis.nix.Usuario;
import org.opengis.nix.enumerated.Tarea;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AperoController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String AperoController.create(@Valid Apero apero, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("apero", apero);
            return "aperoes/create";
        }
        uiModel.asMap().clear();
        apero.persist();
        return "redirect:/aperoes/" + encodeUrlPathSegment(apero.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String AperoController.createForm(Model uiModel) {
        uiModel.addAttribute("apero", new Apero());
        return "aperoes/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String AperoController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("apero", Apero.findApero(id));
        uiModel.addAttribute("itemId", id);
        return "aperoes/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String AperoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("aperoes", Apero.findAperoEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Apero.countAperoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("aperoes", Apero.findAllAperoes());
        }
        return "aperoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String AperoController.update(@Valid Apero apero, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("apero", apero);
            return "aperoes/update";
        }
        uiModel.asMap().clear();
        apero.merge();
        return "redirect:/aperoes/" + encodeUrlPathSegment(apero.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String AperoController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("apero", Apero.findApero(id));
        return "aperoes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String AperoController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Apero.findApero(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/aperoes";
    }
    
    @ModelAttribute("aperoes")
    public Collection<Apero> AperoController.populateAperoes() {
        return Apero.findAllAperoes();
    }
    
    @ModelAttribute("usuarios")
    public Collection<Usuario> AperoController.populateUsuarios() {
        return Usuario.findAllUsuarios();
    }
    
    @ModelAttribute("tareas")
    public Collection<Tarea> AperoController.populateTareas() {
        return Arrays.asList(Tarea.class.getEnumConstants());
    }
    
    String AperoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}