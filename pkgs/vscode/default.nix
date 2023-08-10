# This my self edited vscode source for my needs only

{ stdenv
, lib
, makeDesktopItem
, unzip
, libsecret
, libXScrnSaver
, libxshmfence
, buildPackages
, atomEnv
, at-spi2-atk
, autoPatchelfHook
, systemd
, fontconfig
, libdbusmenu
, glib
, wayland
, libkrb5
, nodePackages
, bash
, ripgrep
, fetchurl
}:
let
  version = "1.81.1";
  hash = "sha256-Tqawqu0iR0An3CZ4x3RGG0vD3x/PvQyRhVThc6SvdEg=";
  pname = "vscode";
  executableName = "code";
  longName = "Visual Studio Code";
  shortName = "Code";
  commandLineArgs = "";
  src = fetchurl {
    name = "VSCode_${version}_linux-x64.tar.gz";
    url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
    inherit hash;
  };
in
stdenv.mkDerivation {
  inherit pname version src;

  desktopItem = makeDesktopItem {
    name = executableName;
    desktopName = longName;
    comment = "Code Editing. Redefined.";
    genericName = "Text Editor";
    exec = "${executableName} %F";
    icon = "vs${executableName}";
    startupNotify = true;
    startupWMClass = shortName;
    categories = [ "Utility" "TextEditor" "Development" "IDE" ];
    mimeTypes = [ "text/plain" "inode/directory" ];
    keywords = [ "vscode" ];
    actions.new-empty-window = {
      name = "New Empty Window";
      exec = "${executableName} --new-window %F";
      icon = "vs${executableName}";
    };
  };

  urlHandlerDesktopItem = makeDesktopItem {
    name = executableName + "-url-handler";
    desktopName = longName + " - URL Handler";
    comment = "Code Editing. Redefined.";
    genericName = "Text Editor";
    exec = executableName + " --open-url %U";
    icon = "vs${executableName}";
    startupNotify = true;
    categories = [ "Utility" "TextEditor" "Development" "IDE" ];
    mimeTypes = [ "x-scheme-handler/vscode" ];
    keywords = [ "vscode" ];
    noDisplay = true;
  };

  buildInputs = [ libsecret libXScrnSaver libxshmfence at-spi2-atk libkrb5 atomEnv.packages ];
  runtimeDependencies = [ (lib.getLib systemd) fontconfig.lib libdbusmenu wayland libsecret ];
  nativeBuildInputs = [
    unzip
    autoPatchelfHook
    nodePackages.asar
    (buildPackages.wrapGAppsHook.override { inherit (buildPackages) makeWrapper; })
  ];
  dontBuild = true;
  dontConfigure = true;
  noDumpEnvVars = true;

  installPhase = ''
    runHook preInstall
  '' + (
    ''
      mkdir -p "$out/lib/vscode" "$out/bin"
      cp -r ./* "$out/lib/vscode"

      ln -s "$out/lib/vscode/bin/${executableName}" "$out/bin/${executableName}"

      mkdir -p "$out/share/applications"
      ln -s "$desktopItem/share/applications/${executableName}.desktop" "$out/share/applications/${executableName}.desktop"
      ln -s "$urlHandlerDesktopItem/share/applications/${executableName}-url-handler.desktop" "$out/share/applications/${executableName}-url-handler.desktop"

      # These are named vscode.png, vscode-insiders.png, etc to match the name in upstream *.deb packages.
      mkdir -p "$out/share/pixmaps"
      cp "$out/lib/vscode/resources/app/resources/linux/code.png" "$out/share/pixmaps/vs${executableName}.png"

      # Override the previously determined VSCODE_PATH with the one we know to be correct
      sed -i "/ELECTRON=/iVSCODE_PATH='$out/lib/vscode'" "$out/bin/${executableName}"
      grep -q "VSCODE_PATH='$out/lib/vscode'" "$out/bin/${executableName}" # check if sed succeeded

      # Remove native encryption code, as it derives the key from the executable path which does not work for us.
      # The credentials should be stored in a secure keychain already, so the benefit of this is questionable
      # in the first place.
      rm -rf $out/lib/vscode/resources/app/node_modules/vscode-encrypt

      # Unbundle libglvnd as VSCode doesn't include libGLESv2.so.2 which is necessary for GPU acceleration
      # rm -rf $out/lib/vscode/libGLESv2.so
    ''
  ) + ''
    runHook postInstall
  '';

  preFixup = ''
    gappsWrapperArgs+=(
      # Add gio to PATH so that moving files to the trash works when not using a desktop environment
      --prefix PATH : ${glib.bin}/bin
      --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"
      --add-flags ${lib.escapeShellArg commandLineArgs}
    )
  '';

  postPatch = ''
    # this is a fix for "save as root" functionality
    packed="resources/app/node_modules.asar"
    unpacked="resources/app/node_modules"
    asar extract "$packed" "$unpacked"
    substituteInPlace $unpacked/@vscode/sudo-prompt/index.js \
      --replace "/usr/bin/pkexec" "/run/wrappers/bin/pkexec" \
      --replace "/bin/bash" "${bash}/bin/bash"
    rm -rf "$packed"

    # without this symlink loading JsChardet, the library that is used for auto encoding detection when files.autoGuessEncoding is true,
    # fails to load with: electron/js2c/renderer_init: Error: Cannot find module 'jschardet'
    # and the window immediately closes which renders VSCode unusable
    # see https://github.com/NixOS/nixpkgs/issues/152939 for full log
    ln -rs "$unpacked" "$packed"

    rm resources/app/node_modules/@vscode/ripgrep/bin/rg
    ln -s ${ripgrep}/bin/rg resources/app/node_modules/@vscode/ripgrep/bin/rg
  '';
}
