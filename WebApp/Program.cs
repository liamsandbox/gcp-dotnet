var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureKestrel(options =>
{
    options.ListenAnyIP(5157); // Listen on the port defined
});

var app = builder.Build();



app.MapGet("/", () => "Hello World!");

app.Run();
