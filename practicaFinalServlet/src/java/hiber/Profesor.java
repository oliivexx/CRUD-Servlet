package hiber;
// Generated 13-may-2020 12:22:58 by Hibernate Tools 4.3.1



/**
 * Profesor generated by hbm2java
 */
public class Profesor  implements java.io.Serializable {


     private Integer codProfe;
     private String nombre;
     private String apellido1;
     private String dni;

    public Profesor() {
    }

    public Profesor(String nombre, String apellido1, String dni) {
       this.nombre = nombre;
       this.apellido1 = apellido1;
       this.dni = dni;
    }
   
    public Integer getCodProfe() {
        return this.codProfe;
    }
    
    public void setCodProfe(Integer codProfe) {
        this.codProfe = codProfe;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellido1() {
        return this.apellido1;
    }
    
    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }
    public String getDni() {
        return this.dni;
    }
    
    public void setDni(String dni) {
        this.dni = dni;
    }




}


