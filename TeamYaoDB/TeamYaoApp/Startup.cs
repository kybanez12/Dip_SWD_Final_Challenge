using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TeamYaoApp.Startup))]
namespace TeamYaoApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
