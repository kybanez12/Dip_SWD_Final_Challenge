﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TeamYaoApp
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TeamYaoDBEntities1 : DbContext
    {
        public TeamYaoDBEntities1()
            : base("name=TeamYaoDBEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Fixture> Fixtures { get; set; }
        public virtual DbSet<Member> Members { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
    }
}
