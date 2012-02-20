// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix;

import java.lang.String;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.opengis.nix.Usuario;
import org.opengis.nix.enumerated.TipoUser;

privileged aspect Usuario_Roo_Finder {
    
    public static TypedQuery<Usuario> Usuario.findUsuariosByApellidosLike(String apellidos) {
        if (apellidos == null || apellidos.length() == 0) throw new IllegalArgumentException("The apellidos argument is required");
        apellidos = apellidos.replace('*', '%');
        if (apellidos.charAt(0) != '%') {
            apellidos = "%" + apellidos;
        }
        if (apellidos.charAt(apellidos.length() - 1) != '%') {
            apellidos = apellidos + "%";
        }
        EntityManager em = Usuario.entityManager();
        TypedQuery<Usuario> q = em.createQuery("SELECT o FROM Usuario AS o WHERE LOWER(o.apellidos) LIKE LOWER(:apellidos)", Usuario.class);
        q.setParameter("apellidos", apellidos);
        return q;
    }
    
    public static TypedQuery<Usuario> Usuario.findUsuariosByDniLike(String dni) {
        if (dni == null || dni.length() == 0) throw new IllegalArgumentException("The dni argument is required");
        dni = dni.replace('*', '%');
        if (dni.charAt(0) != '%') {
            dni = "%" + dni;
        }
        if (dni.charAt(dni.length() - 1) != '%') {
            dni = dni + "%";
        }
        EntityManager em = Usuario.entityManager();
        TypedQuery<Usuario> q = em.createQuery("SELECT o FROM Usuario AS o WHERE LOWER(o.dni) LIKE LOWER(:dni)", Usuario.class);
        q.setParameter("dni", dni);
        return q;
    }
    
    public static TypedQuery<Usuario> Usuario.findUsuariosByNombreLike(String nombre) {
        if (nombre == null || nombre.length() == 0) throw new IllegalArgumentException("The nombre argument is required");
        nombre = nombre.replace('*', '%');
        if (nombre.charAt(0) != '%') {
            nombre = "%" + nombre;
        }
        if (nombre.charAt(nombre.length() - 1) != '%') {
            nombre = nombre + "%";
        }
        EntityManager em = Usuario.entityManager();
        TypedQuery<Usuario> q = em.createQuery("SELECT o FROM Usuario AS o WHERE LOWER(o.nombre) LIKE LOWER(:nombre)", Usuario.class);
        q.setParameter("nombre", nombre);
        return q;
    }
    
    public static TypedQuery<Usuario> Usuario.findUsuariosByTelefono(String telefono) {
        if (telefono == null || telefono.length() == 0) throw new IllegalArgumentException("The telefono argument is required");
        EntityManager em = Usuario.entityManager();
        TypedQuery<Usuario> q = em.createQuery("SELECT o FROM Usuario AS o WHERE o.telefono = :telefono", Usuario.class);
        q.setParameter("telefono", telefono);
        return q;
    }
    
    public static TypedQuery<Usuario> Usuario.findUsuariosByTipo(TipoUser tipo) {
        if (tipo == null) throw new IllegalArgumentException("The tipo argument is required");
        EntityManager em = Usuario.entityManager();
        TypedQuery<Usuario> q = em.createQuery("SELECT o FROM Usuario AS o WHERE o.tipo = :tipo", Usuario.class);
        q.setParameter("tipo", tipo);
        return q;
    }
    
}