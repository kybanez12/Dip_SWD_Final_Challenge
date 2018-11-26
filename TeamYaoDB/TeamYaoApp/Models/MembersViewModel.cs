using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamYaoApp.Models
{
    public class MembersViewModel
    {
        public Member username { get; set; }

        public MembersViewModel(string email)
        {
            username = new Member();
            username.Email = email;
        }
    }
}