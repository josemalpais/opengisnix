package org.opengis.nix;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.opengis.nix.Usuario;
import javax.persistence.ManyToOne;
import org.opengis.nix.Dispositivo;
import java.util.Calendar;
import javax.validation.constraints.NotNull;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooEntity(finders = { "findPrestamoesByDispositivo", "findPrestamoesByUsuario" })
public class Prestamo {

    @ManyToOne
    private Usuario Usuario;

    @ManyToOne
    private Dispositivo Dispositivo;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Calendar fechaInicio;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Calendar fechaFin;
}
