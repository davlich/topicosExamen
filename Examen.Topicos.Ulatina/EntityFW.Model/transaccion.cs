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
    
    public partial class transaccion
    {
        public int id_administrador { get; set; }
        public int id_cliente { get; set; }
        public string tipo { get; set; }
        public string detalle { get; set; }
        public double monto { get; set; }
        public System.DateTime fecha_transaccion { get; set; }
    
        public virtual administrador administrador { get; set; }
        public virtual cliente cliente { get; set; }
    }
}
