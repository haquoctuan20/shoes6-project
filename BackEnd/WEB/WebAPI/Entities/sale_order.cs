using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI.Entities
{
    public class sale_order
    {
        public int ID { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public double TotalMoney { get; set; }
        public string Status { get; set; }
        public int UserID { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
    }
}
