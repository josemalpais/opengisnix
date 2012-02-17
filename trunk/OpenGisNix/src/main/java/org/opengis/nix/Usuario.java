package org.opengis.nix;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import org.opengis.nix.enumerated.TipoUser;
import javax.persistence.Enumerated;
import javax.persistence.EnumType;
import org.springframework.beans.factory.annotation.Value;

@RooJavaBean
@RooToString
@RooEntity(identifierColumn = "idUsuario", finders = { "findUsuariosByDniLike", "findUsuariosByNombreLike", "findUsuariosByApellidosLike", "findUsuariosByTelefono", "findUsuariosByEmailLike", "findUsuariosByTipo" })
public class Usuario {

    @NotNull
    @Pattern(regexp = "[0-9]{8}[A-Za-z]")
    private String dni;

    @NotNull
    @Size(max = 30)
    private String nombre;

    @NotNull
    @Size(max = 30)
    private String apellidos;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date fechaNacimiento;

    @NotNull
    @Pattern(regexp = "[0-9]+$")
    private String telefono;

    @NotNull
    @Size(max = 40)
    private String direccion;

    @NotNull
    @Size(max = 20)
    private String poblacion;

    @NotNull
    @Size(max = 20)
    private String provincia;

    @Pattern(regexp = "[0-9]{5}")
    private String codPostal;

    @Enumerated(EnumType.STRING)
    private TipoUser tipo;

    @Value("True")
    private Boolean activo;
}
