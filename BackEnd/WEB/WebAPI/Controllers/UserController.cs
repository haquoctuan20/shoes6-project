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
    [Route("user")]
    [EnableCors("SHOES_PROJECT")]
    public class UserController : Controller
    {
        // Chuỗi kết nối đến DB
        string connection = "" +
            "Host = localhost;" +
            "Port = 3306;" +
            "Database = shoes_shop;" +
            "User = root;" +
            "Password = admin;";

        /// <summary>
        /// Lấy danh sách người dùng
        /// </summary>
        /// <returns>Danh sách người dùng</returns>
        [HttpGet("all")]
        public IActionResult Get()
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            var sqlCommand = "SELECT * FROM user";
            var users = dbConnection.Query<user>(sqlCommand);

            return Ok(users);
        }

        /// <summary>
        /// lấy thông tin chi tiết về người dùng
        /// </summary>
        /// <param name="ID"></param>
        /// <returns>thông tin chi tiết về người dùng</returns>
        [HttpGet("{ID}")]
        public IActionResult GetUserByID(string ID)
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            string sqlCommand = $"SELECT * FROM user WHERE ID = '{ID}'";
            var user = dbConnection.Query<user>(sqlCommand).FirstOrDefault();
            return Ok(user);
        }

        /// <summary>
        /// thêm một người dùng
        /// </summary>
        /// <param name="_user"></param>
        /// <returns>số bản ghi được thêm</returns>
        [HttpPost]
        public IActionResult Post([FromBody] user _user)
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            //Lấy số lượng phần tử
            var sqlCount = "SELECT COUNT(*) FROM user";
            int rowCount = dbConnection.ExecuteScalar<int>(sqlCount);

            //Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();

            //Lấy danh sách thuộc tính
            var properties = _user.GetType().GetProperties();

            //Khởi tạo lấy danh sách các trường
            string fieldName = string.Empty;
            //Khởi tạo lấy danh sách các giá trị
            string fieldValue = string.Empty;

            foreach (var prop in properties)
            {
                var propName = prop.Name;
                var propValue = prop.GetValue(_user);
                if (propName == "ID")
                {
                    continue;
                }
                else if(propName == "UpdatedAt")
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
            string sqlInsert = $"INSERT INTO user ({fieldName}) VALUES ({fieldValue})";
            var affectedRows = dbConnection.Execute(sqlInsert, param: dynamicParameters);

            //string sqlCommand = $"SELECT * FROM user WHERE ID = '{id}'";
            //var user = dbConnection.Query<user>(sqlCommand);
            //return Ok(user);

            return Ok(affectedRows);
        }

        /// <summary>
        /// chỉnh sửa thông tin người dùng
        /// </summary>
        /// <param name="_user"></param>
        /// <param name="ID"></param>
        /// <returns>số bản ghi được chỉnh sửa</returns>
        [HttpPut("{ID}")]
        public IActionResult Put([FromBody] user _user, [FromRoute] int ID)
        {
            // Khởi tạo và kết nối
            IDbConnection dbConnection = new MySqlConnection(connection);
            // Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();

            // lấy danh sách thuộc tính
            var properties = _user.GetType().GetProperties();
            // Khởi tạo các trường và giá trị
            string updateCommand = string.Empty;

            foreach (var prop in properties)
            {
                string propName = prop.Name;
                if (propName == "ID" || propName == "CreatedAt")
                {
                    continue;
                }

                var propValue = prop.GetValue(_user);

                updateCommand += $"{propName} = @{propName},";

                dynamicParameters.Add($"@{propName}", propValue);
            }
            // xoá dấu phẩy cuối dòng
            updateCommand = updateCommand.Remove(updateCommand.Length - 1, 1);

            // Câu lệnh truy vấn
            string sqlUpdate = $"Update user set {updateCommand} WHERE ID = '{ID}'";
            // thực thi câu lệnh
            var affectedRows = dbConnection.Execute(sqlUpdate, param: dynamicParameters);

            //string sqlCommand = $"SELECT * FROM user WHERE ID = '{ID}'";
            //var user = dbConnection.Query<user>(sqlCommand);
            //return Ok(user);

            return Ok(affectedRows);
        }

        /// <summary>
        /// xoá một người dùng
        /// </summary>
        /// <param name="ID"></param>
        /// <returns>số bản ghi bị xoá</returns>
        [HttpDelete("{ID}")]
        public IActionResult Delete(int ID)
        {
            // Khởi tạo và kết nối
            IDbConnection dbConnection = new MySqlConnection(connection);
            // Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();
            // Câu lệnh sql
            string sqlOrder = $"DELETE FROM sale_order WHERE UserID = '{ID}'";
            var orderRows = dbConnection.Execute(sqlOrder);
            string sqlUser = $"DELETE FROM user WHERE ID = '{ID}'";
            var userRows = dbConnection.Execute(sqlUser);
            return Ok(userRows);
        }
    }
}
