// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix;

import java.lang.Boolean;
import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.opengis.nix.Apero;
import org.opengis.nix.Tarea;
import org.opengis.nix.TareaDataOnDemand;
import org.opengis.nix.domain.User;
import org.opengis.nix.domain.UserDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect AperoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AperoDataOnDemand: @Component;
    
    private Random AperoDataOnDemand.rnd = new SecureRandom();
    
    private List<Apero> AperoDataOnDemand.data;
    
    @Autowired
    private UserDataOnDemand AperoDataOnDemand.userDataOnDemand;
    
    @Autowired
    private TareaDataOnDemand AperoDataOnDemand.tareaDataOnDemand;
    
    public Apero AperoDataOnDemand.getNewTransientApero(int index) {
        Apero obj = new Apero();
        setActivo(obj, index);
        setDescripcion(obj, index);
        setNombre(obj, index);
        setPropietario(obj, index);
        setTamanyo(obj, index);
        setTarea(obj, index);
        return obj;
    }
    
    public void AperoDataOnDemand.setActivo(Apero obj, int index) {
        Boolean Activo = Boolean.TRUE;
        obj.setActivo(Activo);
    }
    
    public void AperoDataOnDemand.setDescripcion(Apero obj, int index) {
        String descripcion = "descripcion_" + index;
        if (descripcion.length() > 120) {
            descripcion = descripcion.substring(0, 120);
        }
        obj.setDescripcion(descripcion);
    }
    
    public void AperoDataOnDemand.setNombre(Apero obj, int index) {
        String nombre = "nombre_" + index;
        if (nombre.length() > 20) {
            nombre = nombre.substring(0, 20);
        }
        obj.setNombre(nombre);
    }
    
    public void AperoDataOnDemand.setPropietario(Apero obj, int index) {
        User propietario = userDataOnDemand.getRandomUser();
        obj.setPropietario(propietario);
    }
    
    public void AperoDataOnDemand.setTamanyo(Apero obj, int index) {
        int tamanyo = index;
        if (tamanyo > 999) {
            tamanyo = 999;
        }
        obj.setTamanyo(tamanyo);
    }
    
    public void AperoDataOnDemand.setTarea(Apero obj, int index) {
        Tarea tarea = tareaDataOnDemand.getRandomTarea();
        obj.setTarea(tarea);
    }
    
    public Apero AperoDataOnDemand.getSpecificApero(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Apero obj = data.get(index);
        return Apero.findApero(obj.getId());
    }
    
    public Apero AperoDataOnDemand.getRandomApero() {
        init();
        Apero obj = data.get(rnd.nextInt(data.size()));
        return Apero.findApero(obj.getId());
    }
    
    public boolean AperoDataOnDemand.modifyApero(Apero obj) {
        return false;
    }
    
    public void AperoDataOnDemand.init() {
        data = Apero.findAperoEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Apero' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.opengis.nix.Apero>();
        for (int i = 0; i < 10; i++) {
            Apero obj = getNewTransientApero(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> it = e.getConstraintViolations().iterator(); it.hasNext();) {
                    ConstraintViolation<?> cv = it.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
