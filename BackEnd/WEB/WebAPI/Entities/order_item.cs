using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI.Entities
{
    public class order_item
    {
        public int SaleOrderID { get; set; }
        public string ProductID { get; set; }
        public int Number { get; set; }
        public string Color { get; set; }
        public string Size { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
    }
}
