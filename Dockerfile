#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat

FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS buildstage
WORKDIR /aspnet
COPY ["DevopsDemo.Client/DevopsDemo.Client.csproj", "DevopsDemo.Client/"]
RUN dotnet restore "DevopsDemo.Client/DevopsDemo.Client.csproj"
COPY . .
WORKDIR /aspnet/DevopsDemo.Client
RUN dotnet build DevopsDemo.Client.csproj

FROM buildstage AS publishstage
RUN dotnet publish DevopsDemo.Client.csproj --no-restore -c Release -o /app
#/root/aspnet/DevopsDemo.Client/app

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /deploy
COPY --from=publishstage /app .
RUN ls
#contents of app not the directory itself
# /root/deploy/DevopsDemo.Client.dll DevopsDemo.Client.Views.dll
CMD [ "dotnet", "DevopsDemo.Client.dll" ]