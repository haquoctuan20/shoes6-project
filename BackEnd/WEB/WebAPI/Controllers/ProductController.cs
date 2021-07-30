using Microsoft.AspNetCore.Mvc;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using WebAPI.Entities;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("product")]
    public class ProductController : Controller
    {
        // Chuỗi kết nối đến DB
        string connection = "" +
            "Host = localhost;" +
            "Port = 3306;" +
            "Database = shoes_shop;" +
            "User = root;" +
            "Password = 170720;";


        /// <summary>
        /// Lấy danh sách sản phẩm
        /// </summary>
        /// <returns>Danh sách sản phẩm</returns>
        [HttpGet("all")]
        public IActionResult Get()
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            var sqlCommand = "SELECT * FROM product";
            var products = dbConnection.Query<product>(sqlCommand);
            return Ok(products);
        }

        /// <summary>
        /// Lấy sản phẩm theo slug
        /// </summary>
        /// <returns>chi tiết một sản phẩm</returns>
        [HttpGet("{Slug}")]
        public IActionResult GetProductsBySlug(string Slug)
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            string sqlCommandProduct = $"SELECT * FROM product WHERE Slug = '{Slug}'";
            var _product = dbConnection.Query<product>(sqlCommandProduct).FirstOrDefault();
            string sqlCommandImage = $"SELECT * FROM product_image WHERE ProductID = '{_product.ID}'";
            var imgs = dbConnection.Query<product_image>(sqlCommandImage).ToList();
            return Ok(_product);
        }
    }
}
