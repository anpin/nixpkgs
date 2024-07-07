{ lib
, buildDotnetGlobalTool
, dotnetCorePackages
}:
let
  inherit (dotnetCorePackages) sdk_8_0;
in

buildDotnetGlobalTool rec {
  pname = "Microsoft.dotnet-interactive";
  version = "1.0.522904";

  nugetSha256 = "sha256-ULnG2D7BUJV39cSC4sarWlrngtv492vpd/BjeB5dKYQ=";

  dotnet-sdk = sdk_8_0;
  dotnet-runtime = sdk_8_0;
  executables = "dotnet-interactive";

  meta = with lib; {
    description = ".NET Interactive";
    mainProgram = "dotnet-interactive";
    homepage = "https://github.com/dotnet/interactive";
    changelog = "https://github.com/dotnet/interactive/releases/tag/v${version}";
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.windows ++ platforms.darwin;
    maintainers = with maintainers; [ anpin ];
  };
}
