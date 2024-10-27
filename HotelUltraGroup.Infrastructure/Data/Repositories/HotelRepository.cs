﻿using HotelUltraGroup.Core.Application.Common;
using HotelUltraGroup.Core.Application.Interfaces.Repositories;
using HotelUltraGroup.Core.Domain.Entities;
using HotelUltraGroup.Core.Domain.Stored_Procedure;
using HotelUltraGroup.Infrastructure.Common;
using HotelUltraGroup.Infrastructure.Context;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelUltraGroup.Infrastructure.Data.Repositories
{
    public class HotelRepository : IHotelRepository
    {
        private readonly HotelContext _context;
        private readonly ErrorBD _errorBD;
        public HotelRepository(HotelContext context, ErrorBD errorDBServices)
        {
            _context = context;
            _errorBD = errorDBServices;
        }

        public async Task<ResultBD<IEnumerable<sp_GetHotels>>> GetHotelsAsync(int idUser)
        {
            var idUserParam = new SqlParameter("@idUser", idUser) { SqlDbType = SqlDbType.Int };

            return await _errorBD.EjecutarOperacionDB(async () =>
            {
                var hotels = await _context.hotels
                    .FromSqlRaw("EXEC GetHotels @idUser", idUserParam)
                    .ToListAsync();

                return hotels.AsEnumerable();
            }, "Error al obtener los hoteles.");
        }        

        public async Task<ResultBD<string>> CreateHotelAsync(Hotel hotel)
        {
            var idUserParam = new SqlParameter("@IdUser", hotel.idUser) { SqlDbType = SqlDbType.Int };
            var nameParam = new SqlParameter("@name", hotel.name) { SqlDbType = SqlDbType.NVarChar };
            var idCityParam = new SqlParameter("@idCity", hotel.idCity) { SqlDbType = SqlDbType.Int };
            var addressParam = new SqlParameter("@address", hotel.address) { SqlDbType = SqlDbType.NVarChar };

            return await _errorBD.EjecutarOperacionDB(async () =>
            {
                var resultados = await _context.getUserAccess
                     .FromSqlRaw("EXEC CreateHotel @IdUser, @name , @idCity, @address", idUserParam, nameParam, idCityParam, addressParam)
                     .ToListAsync();
                return "Creación Exitosa";
            }, "Error en la creación.");

        }

        public async Task<ResultBD<string>> UpdateHotelAsync(Hotel hotel)
        {
            var idHotelParam = new SqlParameter("@idHotel", hotel.idHotel) { SqlDbType = SqlDbType.Int };
            var idUserParam = new SqlParameter("@idUser", hotel.idUser) { SqlDbType = SqlDbType.Int };
            var nameParam = new SqlParameter("@name", hotel.name) { SqlDbType = SqlDbType.NVarChar };
            var idCityParam = new SqlParameter("@idCity", hotel.idCity) { SqlDbType = SqlDbType.Int };
            var addressParam = new SqlParameter("@address", hotel.address) { SqlDbType = SqlDbType.NVarChar };
            var isAvailableParam = new SqlParameter("@isAvailable", hotel.isAvailable) { SqlDbType = SqlDbType.Bit };

            return await _errorBD.EjecutarOperacionDB(async () =>
            {
                await _context.Database.ExecuteSqlRawAsync("EXEC UpdateHotel @idHotel, @idUser, @name, @idCity, @address, @isAvailable",
                    idHotelParam, idUserParam, nameParam, idCityParam, addressParam, isAvailableParam);

                return "Actualización Exitosa";
            }, "Error en la actualizacion");
        }

        public async Task<ResultBD<string>> UpdateStatusHotelAsync(Hotel hotel)
        {
            // Parámetros para el procedimiento almacenado
            var idHotelParam = new SqlParameter("@idHotel", hotel.idHotel) { SqlDbType = SqlDbType.Int };
            var idUserParam = new SqlParameter("@idUser", hotel.idUser) { SqlDbType = SqlDbType.Int };
            var isAvailableParam = new SqlParameter("@isAvailable", hotel.isAvailable) { SqlDbType = SqlDbType.Bit };

            return await _errorBD.EjecutarOperacionDB(async () =>
            {
                // Ejecutar el procedimiento almacenado
                await _context.Database.ExecuteSqlRawAsync("EXEC UpdateStatusHotel @idHotel, @idUser, @isAvailable",
                    idHotelParam, idUserParam, isAvailableParam);

                return "Actualización Exitosa";
            }, "Error en la actualizacion");
        }




    }



}
