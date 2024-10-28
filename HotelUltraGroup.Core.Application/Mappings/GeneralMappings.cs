using AutoMapper;
using HotelUltraGroup.Core.Application.DTOs;
using HotelUltraGroup.Core.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelUltraGroup.Core.Application.Mappings
{
    public class GeneralMappings : Profile
    {
        public GeneralMappings()
        {
            CreateMap<sp_GetHotels, ListHotelDTO>();
            CreateMap<sp_GetRoomsByHotel, ListRoomWithRoomTypeDto>();
             
        }

    }
}
