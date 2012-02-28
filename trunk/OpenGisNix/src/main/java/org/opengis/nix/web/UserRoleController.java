package org.opengis.nix.web;

import org.opengis.nix.domain.UserRole;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "userroles", formBackingObject = UserRole.class)
@RequestMapping("/userroles")
@Controller
public class UserRoleController {
}
