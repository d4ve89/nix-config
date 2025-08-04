{
  stdenv,
  lib,
  fetchurl,
  unzip,
  undmg
}:
stdenv.mkDerivation rec {
  pname = "ActivInspire";
  version = "3.5.18";
  lang = "de";

  src = fetchurl {
    name = "${pname}_${lang}_mac.dmg";
    url = "https://inspire.activsoftware.co.uk/ActivInspire/${pname}_${lang}_mac.dmg";
    hash = "sha256-f4L5MUQpdMpZH5n2fbqqBlD/SShXGcsT7qj/yoW8bYA=";
  };

  nativeBuildInputs = [ unzip undmg ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/Applications
    cp -R ActivInspire.app $out/Applications
    runHook postInstall
  '';

  meta = with lib; {
    description = "Whiteboard software by Promethean";
    homepage = "https://www.prometheanworld.com/";
    license = licenses.unfree;
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    mainProgram = "ActivInspire.app";
    #maintainers = with maintainers; [ "d4ve89" ];
    platforms = platforms.darwin;
  };
}
