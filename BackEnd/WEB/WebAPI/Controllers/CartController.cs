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
    [Route("cart")]
    [EnableCors("SHOES_PROJECT")]
    public class CartController : Controller
    {
        // Chuỗi kết nối đến DB
        string connection = "" +
            "Host = localhost;" +
            "Port = 3306;" +
            "Database = shoes_shop;" +
            "User = root;" +
            "Password = admin;";

        /// <summary>
        /// Hiển thị danh sách đơn hàng
        /// </summary>
        /// <returns>Danh sách đơn hàng</returns>
        [HttpGet("all")]
        public IActionResult Get()
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            var sqlCommand = "SELECT * FROM sale_order";
            var orders = dbConnection.Query<sale_order>(sqlCommand);

            return Ok(orders);
        }

        [HttpGet("{UserID}")]
        public IActionResult GetByUserID(int UserID)
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            var sqlCommand = $"SELECT * FROM sale_order WHERE UserID = '{UserID}'";
            var orders = dbConnection.Query<sale_order>(sqlCommand);

            return Ok(orders);
        }

        [HttpPost]
        public IActionResult Post([FromBody] sale_order _order)
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            //Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();

            //Lấy danh sách thuộc tính
            var properties = _order.GetType().GetProperties();

            //Khởi tạo lấy danh sách các trường
            string fieldName = string.Empty;
            //Khởi tạo lấy danh sách các giá trị
            string fieldValue = string.Empty;

            foreach (var prop in properties)
            {
                var propName = prop.Name;
                var propValue = prop.GetValue(_order);
                if (propName == "ID")
                {
                    continue;
                }
                else if (propName == "Status")
                {
                    propValue = "Chờ xác nhận";
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
            string sqlInsertOrder = $"INSERT INTO sale_order ({fieldName}) VALUES ({fieldValue})";
            var affectedOrderRows = dbConnection.Execute(sqlInsertOrder, param: dynamicParameters);

            string sqlCmd = "SELECT* FROM sale_order ORDER BY ID DESC";
            var order = dbConnection.Query<sale_order>(sqlCmd).FirstOrDefault();

            return Ok(order.ID);
        }

        /// <summary>
        /// chỉnh sửa giỏ hàng
        /// </summary>
        /// <param name="_order"></param>
        /// <param name="ID"></param>
        /// <returns>số bản ghi bị ảnh hưởng</returns>
        [HttpPut("{ID}")]
        public IActionResult Put([FromBody] sale_order _order, [FromRoute] int ID)
        {
            // Khởi tạo và kết nối
            IDbConnection dbConnection = new MySqlConnection(connection);

            //Lấy số lượng phần tử
            var sqlOrder = "SELECT COUNT(*) FROM sale_order";
            var order = dbConnection.Query<sale_order>(sqlOrder).FirstOrDefault();

            // Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();

            // lấy danh sách thuộc tính
            var properties = _order.GetType().GetProperties();
            // Khởi tạo các trường và giá trị
            string updateCommand = string.Empty;

            foreach (var prop in properties)
            {
                string propName = prop.Name;
                if (propName == "ID" || propName == "CreatedAt" || propName == "UserID")
                {
                    continue;
                }  
                var propValue = prop.GetValue(_order);

                updateCommand += $"{propName} = @{propName},";

                dynamicParameters.Add($"@{propName}", propValue);
            }
            // xoá dấu phẩy cuối dòng
            updateCommand = updateCommand.Remove(updateCommand.Length - 1, 1);

            // Câu lệnh truy vấn
            string sqlUpdate = $"Update sale_order set {updateCommand} WHERE ID = '{ID}'";
            // thực thi câu lệnh
            var affectedRows = dbConnection.Execute(sqlUpdate, param: dynamicParameters);

            return Ok(affectedRows);
        }

        /// <summary>
        /// xoá đơn hàng
        /// </summary>
        /// <param name="ID"></param>
        /// <returns>số bản ghi bị ảnh hưởng</returns>
        [HttpDelete("{ID}")]
        public IActionResult Delete(int ID)
        {
            // Khởi tạo và kết nối
            IDbConnection dbConnection = new MySqlConnection(connection);
            // Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();
            // Câu lệnh sql
            string sqlOrder = $"DELETE FROM sale_order WHERE ID = '{ID}'";
            var orderRows = dbConnection.Execute(sqlOrder);
            return Ok(orderRows);
        }
    }
}
