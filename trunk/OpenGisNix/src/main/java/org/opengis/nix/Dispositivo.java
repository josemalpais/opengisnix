package org.opengis.nix;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Value;

@RooJavaBean
@RooToString
@RooEntity(identifierColumn = "idDispositivo")
public class Dispositivo {

    @NotNull
    @Size(max = 20)
    private String modelo;

    @NotNull
    @Size(max = 20)
    private String numSerie;

    @Value("True")
    private Boolean disponible;

    @Value("True")
    private Boolean activo;
}
