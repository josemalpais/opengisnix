// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.opengis.nix.domain.Role;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect RoleController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String RoleController.create(@Valid Role role, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("role", role);
            return "roles/create";
        }
        uiModel.asMap().clear();
        role.persist();
        return "redirect:/roles/" + encodeUrlPathSegment(role.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String RoleController.createForm(Model uiModel) {
        uiModel.addAttribute("role", new Role());
        return "roles/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String RoleController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("role", Role.findRole(id));
        uiModel.addAttribute("itemId", id);
        return "roles/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String RoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("roles", Role.findRoleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Role.countRoles() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("roles", Role.findAllRoles());
        }
        return "roles/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String RoleController.update(@Valid Role role, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("role", role);
            return "roles/update";
        }
        uiModel.asMap().clear();
        role.merge();
        return "redirect:/roles/" + encodeUrlPathSegment(role.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String RoleController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("role", Role.findRole(id));
        return "roles/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String RoleController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Role.findRole(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/roles";
    }
    
    @ModelAttribute("roles")
    public Collection<Role> RoleController.populateRoles() {
        return Role.findAllRoles();
    }
    
    String RoleController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
