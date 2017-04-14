//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EntityFW.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class apuesta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public apuesta()
        {
            this.oferta_apuesta = new HashSet<oferta_apuesta>();
        }
    
        public int id_apuesta { get; set; }
        public string terminos { get; set; }
        public System.DateTime fecha_creacion { get; set; }
        public System.DateTime duracion { get; set; }
        public sbyte estado { get; set; }
        public Nullable<sbyte> condicion { get; set; }
        public int id_administrador { get; set; }
        public double veces_a_pagar { get; set; }
    
        public virtual administrador administrador { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<oferta_apuesta> oferta_apuesta { get; set; }
    }
}