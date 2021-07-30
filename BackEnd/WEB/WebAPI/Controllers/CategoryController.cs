using Dapper;
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
    [Route("category")]
    public class CategoryController : Controller
    {
        // Chuỗi kết nối đến DB
        string connection = "" +
            "Host = localhost;" +
            "Port = 3306;" +
            "Database = shoes_shop;" +
            "User = root;" +
            "Password = 170720;";


        /// <summary>
        /// Lấy danh sách danh mục sản phẩm
        /// </summary>
        /// <returns>Danh sách danh mục</returns>
        [HttpGet("all")]
        public IActionResult Get()
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            var sqlCommand = "SELECT * FROM category";
            var categories = dbConnection.Query<category>(sqlCommand);
            return Ok(categories);
        }

        /// <summary>
        /// Lấy danh sách sản phẩm theo slug của danh mục
        /// </summary>
        /// <returns>Danh sách sản phẩm theo danh mục</returns>
        [HttpGet("{Slug}")]
        public IActionResult GetProductsByCategory(string Slug)
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            string sqlCommandCategory = $"SELECT * FROM category WHERE Slug = '{Slug}'";
            var cate = dbConnection.Query<category>(sqlCommandCategory).FirstOrDefault();
            string sqlCommandProduct = $"SELECT * FROM product WHERE CategoryID = '{cate.ID}'";
            var products = dbConnection.Query<product>(sqlCommandProduct);
            return Ok(products);
        }

    }
}
