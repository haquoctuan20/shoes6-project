using Dapper;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using WebAPI.Entities;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("image")]
    [EnableCors("SHOES_PROJECT")]
    public class ImageController : Controller
    {

        // Chuỗi kết nối đến DB
        string connection = "" +
            "Host = localhost;" +
            "Port = 3306;" +
            "Database = shoes_shop;" +
            "User = root;" +
            "Password = admin;";


        /// <summary>
        /// Lấy danh sách danh mục sản phẩm
        /// </summary>
        /// <returns>Danh sách danh mục</returns>
        [HttpGet("byProductID")]
        public IActionResult GetByID(string ID)
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            var sqlCommand = $"SELECT * FROM product_image WHERE ProductID = '{ID}'";
            var pro_imgs = dbConnection.Query<product_image>(sqlCommand);
            return Ok(pro_imgs);
        }
    }
}
