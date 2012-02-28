package org.opengis.nix;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

import org.opengis.nix.domain.User;
import org.opengis.nix.enumerated.Tarea;
import javax.persistence.Enumerated;
import javax.persistence.EnumType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Max;
import org.springframework.beans.factory.annotation.Value;

@RooJavaBean
@RooToString
@RooEntity(identifierColumn = "idProducto", finders = { "findProductoesByUsuario", "findProductoesByNombreLike", "findProductoesByNomtarea" })
public class Producto {

    @ManyToOne
    private User propietario;

    @Size(max = 120)
    private String descripcion;

    @Enumerated(EnumType.STRING)
    private Tarea tarea;

    @NotNull
    @Max(999L)
    private int dosis;

    @Value("True")
    private Boolean Activo;
}
