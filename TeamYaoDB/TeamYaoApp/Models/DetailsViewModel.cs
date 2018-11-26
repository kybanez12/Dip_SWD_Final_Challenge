using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamYaoApp.Models
{
    public class DetailsViewModel
    {
        public Fixture game { get; set; }
        public IQueryable<string> Pay { get; set; } 
    }
}