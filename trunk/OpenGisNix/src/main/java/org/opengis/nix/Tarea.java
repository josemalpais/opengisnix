package org.opengis.nix;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooEntity(identifierColumn = "idTarea")
public class Tarea {

    @NotNull
    private String nombre;

    @NotNull
    private String descripcion;
}
