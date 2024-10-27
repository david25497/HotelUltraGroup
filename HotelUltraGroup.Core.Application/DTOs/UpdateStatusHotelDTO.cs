﻿using HotelUltraGroup.Core.Domain.Entities;
using RestSharp;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelUltraGroup.Core.Application.DTOs
{
    public class UpdateStatusHotelDTO
    {
        [Required(ErrorMessage = "idHotel es obligatorio")]
        public int idHotel { get; private set; }

        [Required(ErrorMessage = "isAvailable es obligatorio.")]
        public bool isAvailable { get; set; }
    }
}
