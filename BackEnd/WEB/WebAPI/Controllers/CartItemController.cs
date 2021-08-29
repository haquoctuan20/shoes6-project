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
    [Route("cart-item")]
    [EnableCors("SHOES_PROJECT")]
    public class CartItemController : Controller
    {
        // Chuỗi kết nối đến DB
        string connection = "" +
            "Host = localhost;" +
            "Port = 3306;" +
            "Database = shoes_shop;" +
            "User = root;" +
            "Password = admin;";

        /// <summary>
        /// Danh sách chi tiết đơn hàng theo ID đặt hàng
        /// </summary>
        /// <param name="SaleOrderID"></param>
        /// <returns>Danh sách chi tiết đơn hàng</returns>
        [HttpGet("{SaleOrderID}")]
        public IActionResult GetItemsByOrderID(int SaleOrderID)
        {
            IDbConnection dbConnection = new MySqlConnection(connection);

            string sqlCommand = $"SELECT * FROM order_item WHERE SaleOrderID = '{SaleOrderID}'";
            var items = dbConnection.Query<order_item>(sqlCommand);
            return Ok(items);
        }

        /// <summary>
        /// Thêm một mảng chi tiết đơn hàng
        /// </summary>
        /// <param name="_items"></param>
        /// <returns>Số bản ghi thêm vào</returns>
        [HttpPost]
        public IActionResult Post([FromBody] order_item[] _items)
        {
            IDbConnection dbConnection = new MySqlConnection(connection);
            var affectedItemRows = 0;

            foreach (order_item item in _items)
            {
                //Khởi tạo DynamicParameters
                DynamicParameters dynamicParameters = new DynamicParameters();

                //Lấy danh sách thuộc tính
                var properties = item.GetType().GetProperties();

                //Khởi tạo lấy danh sách các trường
                string fieldName = string.Empty;
                //Khởi tạo lấy danh sách các giá trị
                string fieldValue = string.Empty;

                foreach (var prop in properties)
                {
                    var propName = prop.Name;
                    var propValue = prop.GetValue(item);
                    if (propName == "UpdatedAt")
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
                string sqlInsertItem = $"INSERT INTO order_item ({fieldName}) VALUES ({fieldValue})";
                affectedItemRows += dbConnection.Execute(sqlInsertItem, param: dynamicParameters);
            }

            return Ok(affectedItemRows);
        }

        /// <summary>
        /// Cập nhật chi tiết đơn hàng
        /// </summary>
        /// <param name="_order"></param>
        /// <param name="ProductID"></param>
        /// <param name="SaleOrderID"></param>
        /// <returns>số bản ghi ảnh hưởng</returns>
        [HttpPut("{SaleOrderID}/{ProductID}")]
        public IActionResult Put([FromBody] order_item _order, [FromRoute] string ProductID, int SaleOrderID)
        {
            // Khởi tạo và kết nối
            IDbConnection dbConnection = new MySqlConnection(connection);
            // Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();

            // lấy danh sách thuộc tính
            var properties = _order.GetType().GetProperties();
            // Khởi tạo các trường và giá trị
            string updateCommand = string.Empty;

            foreach (var prop in properties)
            {
                string propName = prop.Name;
                if (propName == "ProductID" || propName == "SaleOrderID")
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
            string sqlUpdate = $"Update order_item set {updateCommand} WHERE ProductID = '{ProductID}' AND SaleOrderID = '{SaleOrderID}'";
            // thực thi câu lệnh
            var affectedRows = dbConnection.Execute(sqlUpdate, param: dynamicParameters);

            return Ok(affectedRows);
        }

        /// <summary>
        /// Xoá chi tiết đơn hàng theo ID sản phẩm và đơn hàng
        /// </summary>
        /// <param name="ProductID"></param>
        /// <param name="SaleOrderID"></param>
        /// <returns></returns>
        [HttpDelete("{SaleOrderID}/{ProductID}")]
        public IActionResult Delete(string ProductID, int SaleOrderID)
        {
            // Khởi tạo và kết nối
            IDbConnection dbConnection = new MySqlConnection(connection);
            // Khởi tạo DynamicParameters
            DynamicParameters dynamicParameters = new DynamicParameters();
            // Câu lệnh sql
            string sqlCommand = $"DELETE FROM order_item WHERE SaleOrderID = '{SaleOrderID}' AND ProductID = '{ProductID}'";
            var affectedRows = dbConnection.Execute(sqlCommand);
            return Ok(affectedRows);
        }
    }
}


