using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI.Entities
{
    public class product
    {
        public string ID { get; set; }

        public string Name { get; set; }

        public string Slug { get; set; }

        public string Description { get; set; }

        public string Material { get; set; }

        public string? Type { get; set; }

        public int? Rate { get; set; }

        public double? OriginPrice { get; set; }

        public double SalePrice { get; set; }

        public int Qunatity { get; set; }

        public DateTime? CreatedAt { get; set; }

        public DateTime? UpdatedAt { get; set; }

        public string CategoryID { get; set; }
    }
}
