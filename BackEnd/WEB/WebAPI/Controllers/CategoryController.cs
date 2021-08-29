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
    [Route("category")]
    [EnableCors("SHOES_PROJECT")]
    public class CategoryController : Controller
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
        [HttpGet("all")]
        public IActionResult Get()
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            var sqlCommand = "SELECT * FROM category";
            var categories = dbConnection.Query<category>(sqlCommand);

            return Ok(categories);
        }

       /// <summary>
       /// Lấy danh sách sản phẩm theo slug
       /// </summary>
       /// <param name="Slug"></param>
       /// <returns></returns>
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

        /// <summary>
        /// Thêm một danh mục mới
        /// </summary>
        /// <param name="_category"></param>
        /// <returns>số bản ghi được thêm</returns>

        [HttpPost]
        public IActionResult Post([FromBody] category _category)
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            //Lấy số lượng phần tử
            var sqlCount = "SELECT COUNT(*) FROM category";
            int rowCount = dbConnection.ExecuteScalar<int>(sqlCount);

            //Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();

            //Lấy danh sách thuộc tính
            var properties = _category.GetType().GetProperties();

            //Khởi tạo lấy danh sách các trường
            string fieldName = string.Empty;
            //Khởi tạo lấy danh sách các giá trị
            string fieldValue = string.Empty;
            //giá trị id
            string id = "";
            foreach (var prop in properties)
            {
                var propName = prop.Name;
                var propValue = prop.GetValue(_category);
                if (propName == "ID")
                {
                    propValue = (rowCount+100).ToString();
                    id = (rowCount+100).ToString();
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
            string sqlInsert = $"INSERT INTO category ({fieldName}) VALUES ({fieldValue})";
            var affectedRows = dbConnection.Execute(sqlInsert, param: dynamicParameters);

            //string sqlCommand = $"SELECT * FROM category WHERE ID = '{id}'";
            //var category = dbConnection.Query<category>(sqlCommand);
            //return Ok(category);

            return Ok(affectedRows);
        }

        /// <summary>
        /// chỉnh sửa thông tin danh mục 
        /// </summary>
        /// <param name="_category"></param>
        /// <param name="ID"></param>
        /// <returns>số bản ghi được update</returns>
        [HttpPut("{ID}")]
        public IActionResult Put([FromBody] category _category, [FromRoute] string ID)
        {
           // Khởi tạo và kết nối
            IDbConnection dbConnection = new MySqlConnection(connection);
            // Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();
            
            // lấy danh sách thuộc tính
            var properties = _category.GetType().GetProperties();
            // Khởi tạo các trường và giá trị
            string updateCommand = string.Empty;

            foreach (var prop in properties)
            {
                string propName = prop.Name;
                if(propName == "ID" || propName == "CreatedAt")
                {
                    continue;
                }
                var propValue = prop.GetValue(_category);

                updateCommand += $"{propName} = @{propName},";

                dynamicParameters.Add($"@{propName}", propValue);
            }
            // xoá dấu phẩy cuối dòng
            updateCommand = updateCommand.Remove(updateCommand.Length - 1, 1);

            // Câu lệnh truy vấn
            string sqlUpdate = $"Update category set {updateCommand} WHERE ID = '{ID}'";
            // thực thi câu lệnh
            var affectedRows = dbConnection.Execute(sqlUpdate, param: dynamicParameters);

            return Ok(affectedRows);
        }

        /// <summary>
        /// Xoá một danh mục
        /// </summary>
        /// <param name="ID"></param>
        /// <returns>số bản ghi bị xoá (1)</returns>
        [HttpDelete("{ID}")]
        public IActionResult Delete(string ID)
        {
            // Khởi tạo và kết nối
            IDbConnection dbConnection = new MySqlConnection(connection);
            // Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();
            // Câu lệnh sql
            string sqlCommand = $"DELETE FROM category WHERE ID = '{ID}'";
            var affectedRows = dbConnection.Execute(sqlCommand);
            return Ok(affectedRows);
        }
    }
}
