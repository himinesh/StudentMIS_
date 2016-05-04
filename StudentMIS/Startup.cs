using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(StudentMIS.Startup))]
namespace StudentMIS
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
