using DevopsDemo.Client.Controllers;
using Microsoft.AspNetCore.Mvc;
using Xunit;

namespace DevopsDemo.Test
{
    public class HomeUnitTest
    {
        [Fact]
        public void Test_Index()
        {
            var sut = new HomeController();
            var view = sut.Index();

            Assert.NotNull(view);
            Assert.IsType<ViewResult>(view);
        }

        [Fact]
        public void Test_Privacy()
        {
            var sut = new HomeController();
            var view = sut.Privacy();

            Assert.NotNull(view);
        }
    }
}