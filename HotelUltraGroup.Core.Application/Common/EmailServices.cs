using RestSharp;
using System;
using System.Collections.Generic;
using System.Text;
using HotelUltraGroup.Core.Application.Common.Interfaces;

namespace HotelUltraGroup.Core.Application.Common
{
    public class EmailServices : IEmailServices
    {
        public bool EnviarEmailDePedidoConfirmado(string _usuario, string _emailDestino)
        {
            // Crear cliente RestClient
            var client = new RestClient("https://api.mailersend.com/v1/email");

            // Crear la solicitud HTTP
            var request = new RestRequest();
            request.Method = Method.Post;

            // Agregar el token de autorización como un encabezado de tipo Bearer
            request.AddHeader("Authorization", "Bearer mlsn.a588d79856d126f3d65e9961d581586a74f46b44b6e5e779b2c05f6693b93479");

            // Agregar el cuerpo JSON de la solicitud
            request.AddJsonBody(new
            {
                from = new { email = "tiendadealimentos@trial-jy7zpl93zx3l5vx6.mlsender.net", name = "MailerSend" },
                to = new[] { new { email = _emailDestino, name = _usuario } },
                subject = "Confirmacion de pedido",
                text = "Su pedido se encuentra confirmado",
                html = "<b>Su pedido se encuentra confirmado</b>"
            });

            // Ejecutar la solicitud y devolver la respuesta
            RestResponse response = client.Execute(request);
            return response.IsSuccessful;
        }
    }
}
