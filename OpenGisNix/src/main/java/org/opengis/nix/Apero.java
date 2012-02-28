package org.opengis.nix;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Max;

import org.opengis.nix.domain.User;
import org.opengis.nix.enumerated.Tarea;
import javax.persistence.Enumerated;
import javax.persistence.EnumType;
import org.springframework.beans.factory.annotation.Value;

@RooJavaBean
@RooToString
@RooEntity(identifierColumn = "idApero", finders = { "findAperoesByUser", "findAperoesByNombreLike", "findAperoesByTarea" })
public class Apero {

    @ManyToOne
    private User propietario;

    @NotNull
    @Size(max = 20)
    private String nombre;

    @NotNull
    @Max(999L)
    private int tamanyo;

    @Size(max = 120)
    private String descripcion;

    @Enumerated(EnumType.STRING)
    private Tarea tarea;

    @Value("True")
    private Boolean Activo;
}
