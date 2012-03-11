package org.opengis.nix;

import javax.persistence.ManyToOne;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import org.opengis.nix.domain.User;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Calendar;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooEntity
public class TareasRealizadas {

    @NotNull
    @ManyToOne
    private Tarea tarea;

    @NotNull
    @ManyToOne
    private User usuario;

    @NotNull
    @ManyToOne
    private Parcela parcela;

    @NotNull
    @ManyToOne
    private Producto producto;

    @NotNull
    @Max(999L)
    private int dosis;

    @NotNull
    @ManyToOne
    private Apero apero;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Calendar fechaInicio;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Calendar fechaFin;

    private Boolean finalizada;
}
