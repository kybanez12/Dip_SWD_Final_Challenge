using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamYaoApp.Models
{
    public class MemberDetailViewModel
    {
        public Member thisMember { get; set; }
        public int? amount { get; set; }
        public string total { get; set; }

    }
}