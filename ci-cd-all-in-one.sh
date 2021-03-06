echo $buildConfiguration
echo $1
dotnet build MsSQLCodeDiffVerioningWeb.sln --configuration $1

mkdir -p MsSqlCodeDiffVersioningWeb.NET.6.x/bin/$1/net6.0/wwwroot/
cp -rf MsSqlCodeDiffVersioningWeb.NET.6.x/wwwroot/* MsSqlCodeDiffVersioningWeb.NET.6.x/bin/$1/net6.0/wwwroot/

mkdir -p MsSqlCodeDiffVersioningWeb.NET.6.x/bin/$1/net6.0/RoutesConfig/
cp -rf MsSqlCodeDiffVersioningWeb.NET.6.x/RoutesConfig/* MsSqlCodeDiffVersioningWeb.NET.6.x/bin/$1/net6.0/RoutesConfig/

mkdir -p MsSqlCodeDiffVersioningWeb.NET.6.x/bin/$1/net6.0/Plugins/
cp Plugins.StoreProcedureExecutors/MsSQL.StoreProcedureExecutor.Plugin.NET.6.x/bin/$1/net6.0/*Plugin* MsSqlCodeDiffVersioningWeb.NET.6.x/bin/$1/net6.0/Plugins/
cp Plugins.StoreProcedureExecutors/MySQL.StoreProcedureExecutor.Plugin.NET.6.x/bin/$1/net6.0/*Plugin* MsSqlCodeDiffVersioningWeb.NET.6.x/bin/$1/net6.0/Plugins/
cp Plugins.RequestJTokenValidators/JTokenValidatorSamplePlugin.NET.6.x/bin/$1/net6.0/*Plugin* MsSqlCodeDiffVersioningWeb.NET.6.x/bin/$1/net6.0/Plugins/