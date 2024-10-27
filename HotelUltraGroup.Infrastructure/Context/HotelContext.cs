using HotelUltraGroup.Core.Domain.Entities;
using HotelUltraGroup.Core.Domain.Stored_Procedure;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace HotelUltraGroup.Infrastructure.Context
{
    public class HotelContext:DbContext
    {
        public HotelContext(DbContextOptions<HotelContext> options) : base(options)
        {
        }
        public DbSet<sp_getUserAccess> getUserAccess { get; set; }
        public DbSet<sp_GetHotels> hotels { get; set; }
        public DbSet<sp_GetRoomsByHotel> RoomsWithRoomType { get; set; }
        
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            
            builder.Entity<sp_getUserAccess>().HasNoKey().ToView(null);
            builder.Entity<sp_GetHotels>().HasNoKey().ToView(null);
            builder.Entity<sp_GetRoomsByHotel>().HasNoKey().ToView(null);
            //Aplicamos de forma automatica las configuraciones que se encuentran en la carpeta CONFIGURACIONES
            builder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
        }

    }
}
