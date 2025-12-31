set -e

cargo build --release --target x86_64-pc-windows-msvc
strip target/x86_64-pc-windows-msvc/release/pandora_launcher.exe

mkdir -p dist

mv target/x86_64-pc-windows-msvc/release/pandora_launcher dist/PandoraLauncher-Windows.exe

cargo install cargo-packager
cargo packager --config '{'\
'  "name": "pandora-launcher",'\
'  "outDir": "./dist",'\
'  "productName": "Pandora Launcher",'\
'  "version": "'"$1"'",'\
'  "identifier": "com.moulberry.pandoralauncher",'\
'  "resources": [],'\
'  "binaries": [{ "path": "PandoraLauncher-Windows.exe", "main": true }],'\
'  "icons": ["package/icon_32x32.png"]'\
'}'

mv dist/PandoraLauncher-Windows.exe PandoraLauncher-Windows-$1-x86_64.exe
