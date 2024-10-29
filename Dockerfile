# Use the official .NET SDK image to build the app
# This image will be removed in the final stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

## Copy the .csproj and restore any dependencies (this step is cached)
#COPY *.csproj ./
#RUN dotnet restore

# Copy the rest of the application code and build the app
COPY . ./
RUN dotnet publish -c Release -o /out
RUN ls /out

# Use the official ASP.NET runtime as the base image for the final stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copy the build output from the build stage
COPY --from=build /out ./

# Expose port 80
#EXPOSE 80
EXPOSE 5157

# Start the app
ENTRYPOINT ["dotnet", "WebApp.dll"]

#5157