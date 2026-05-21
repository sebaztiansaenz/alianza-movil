#!/usr/bin/env bash
set -euo pipefail

# Vercel no incluye Flutter: hay que compilar web en cada deploy.
FLUTTER_DIR="${HOME}/flutter"
if [ ! -d "${FLUTTER_DIR}/bin" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 "${FLUTTER_DIR}"
fi
export PATH="${FLUTTER_DIR}/bin:${PATH}"

flutter --version
flutter config --enable-web --no-analytics
flutter pub get
flutter build web --release
