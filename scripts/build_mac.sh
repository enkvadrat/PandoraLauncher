set -e

cargo build --release --target aarch64-apple-darwin
cargo build --release --target x86_64-apple-darwin

strip target/aarch64-apple-darwin/release/pandora_launcher
strip target/x86_64-apple-darwin/release/pandora_launcher

mkdir -p dist

lipo -create -output dist/PandoraLauncher-macOS target/x86_64-apple-darwin/release/pandora_launcher target/aarch64-apple-darwin/release/pandora_launcher

cargo install cargo-packager
cargo packager --config '{'\
'  "name": "pandora-launcher",'\
'  "outDir": "./dist",'\
'  "productName": "Pandora Launcher",'\
'  "version": "'"$1"'",'\
'  "identifier": "com.moulberry.pandoralauncher",'\
'  "resources": [],'\
'  "binaries": [{ "path": "PandoraLauncher-macOS", "main": true }],'\
'  "icons": ["package/icon_32x32.png"]'\
'}'

mv dist/PandoraLauncher-macOS PandoraLauncher-macOS-$1-Universal
