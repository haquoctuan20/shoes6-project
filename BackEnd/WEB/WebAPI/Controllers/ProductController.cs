using Microsoft.AspNetCore.Mvc;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using WebAPI.Entities;
using Microsoft.AspNetCore.Cors;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("product")]
    [EnableCors("SHOES_PROJECT")]
    public class ProductController : Controller
    {
        // Chuỗi kết nối đến DB
        string connection = "" +
            "Host = localhost;" +
            "Port = 3306;" +
            "Database = shoes_shop;" +
            "User = root;" +
            "Password = admin;";


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

        /// <summary>
        /// Thêm một sản phẩm mới
        /// </summary>
        /// <param name="_product"></param>
        /// <returns>Số bản ghi được thêm vào</returns>

        [HttpPost]
        public IActionResult Post([FromBody] product _product)
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            //Lấy số lượng phần tử
            var sqlCount = "SELECT COUNT(*) FROM product";
            int rowCount = dbConnection.ExecuteScalar<int>(sqlCount);

            //Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();

            //Lấy danh sách thuộc tính
            var properties = _product.GetType().GetProperties();

            //Khởi tạo lấy danh sách các trường
            string fieldName = string.Empty;
            //Khởi tạo lấy danh sách các giá trị
            string fieldValue = string.Empty;
            //giá trị id
            string id = "";
            foreach (var prop in properties)
            {
                var propName = prop.Name;
                var propValue = prop.GetValue(_product);
                if (propName == "ID")
                {
                    propValue = (rowCount + 100).ToString();
                    id = (rowCount + 100).ToString();
                }
                else if (propName == "UpdatedAt")
                {
                    propValue = null;
                }
                fieldName += $"{propName},";
                fieldValue += $"@{propName},";
                dynamicParameters.Add($"@{propName}", propValue);
            }
            // Xoá dấu phẩy thừa
            fieldName = fieldName.Remove(fieldName.Length - 1, 1);
            fieldValue = fieldValue.Remove(fieldValue.Length - 1, 1);

            //Thực thi câu lệnh
            string sqlInsert = $"INSERT INTO product ({fieldName}) VALUES ({fieldValue})";
            var affectedRows = dbConnection.Execute(sqlInsert, param: dynamicParameters);

            //string sqlCommand = $"SELECT * FROM product WHERE ID = '{id}'";
            //var product = dbConnection.Query<category>(sqlCommand);
            //return Ok(product);

            return Ok(affectedRows);
            
        }

        /// <summary>
        /// chỉnh sửa thông tin sản phẩm 
        /// </summary>
        /// <param name="_product"></param>
        /// <param name="ID"></param>
        /// <returns>số bản ghi sau khi update</returns>
        [HttpPut("{ID}")]
        public IActionResult Put([FromBody] product _product, [FromRoute] string ID)
        {
            // Khởi tạo và kết nối
            IDbConnection dbConnection = new MySqlConnection(connection);
            // Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();

            // lấy danh sách thuộc tính
            var properties = _product.GetType().GetProperties();
            // Khởi tạo các trường và giá trị
            string updateCommand = string.Empty;

            foreach (var prop in properties)
            {
                string propName = prop.Name;
                if (propName == "ID" || propName == "CreatedAt")
                {
                    continue;
                }
                var propValue = prop.GetValue(_product);

                updateCommand += $"{propName} = @{propName},";

                dynamicParameters.Add($"@{propName}", propValue);
            }
            // xoá dấu phẩy cuối dòng
            updateCommand = updateCommand.Remove(updateCommand.Length - 1, 1);

            // Câu lệnh truy vấn
            string sqlUpdate = $"Update product set {updateCommand} WHERE ID = '{ID}'";
            // thực thi câu lệnh
            var affectedRows = dbConnection.Execute(sqlUpdate, param: dynamicParameters);

            //string sqlCommand = $"SELECT * FROM product WHERE ID = '{ID}'";
            //var product = dbConnection.Query<product>(sqlCommand);
            //return Ok(product);

            return Ok(affectedRows);
        }

        /// <summary>
        /// Xoá một sản phẩm
        /// </summary>
        /// <param name="ID"></param>
        /// <returns>số bản ghi bị xoá(1)</returns>
        [HttpDelete("{ID}")]
        public IActionResult Delete(string ID)
        {
            // Khởi tạo và kết nối
            IDbConnection dbConnection = new MySqlConnection(connection);
            // Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();
            // Câu lệnh sql
            string sqlCommand = $"DELETE FROM product WHERE ID = '{ID}'";
            var affectedRows = dbConnection.Execute(sqlCommand);
            return Ok(affectedRows);
        }
    }
}
