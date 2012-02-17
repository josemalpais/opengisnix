package org.opengis.nix;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.opengis.nix.Usuario;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Max;
import org.springframework.beans.factory.annotation.Value;

@RooJavaBean
@RooToString
@RooEntity(identifierColumn = "idParcela")
public class Parcela {

    @ManyToOne
    private Usuario Propietario;

    @NotNull
    @Size(max = 20)
    private String alias;

    @NotNull
    @Max(999L)
    private int numPoblacion;

    @NotNull
    @Max(999L)
    private int numProvincia;

    @NotNull
    @Max(999L)
    private int numParcela;

    @NotNull
    @Max(999L)
    private int numPartida;

    @Value("True")
    private Boolean activa;
}
