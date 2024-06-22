#!/bin/bash

if [[ -z "${APP_TYPE}" ]]; then
    echo "APP_TYPE undefined"
    exit 1
elif [[ -z "${BUILD_PATH}" ]]; then
    echo "BUILD_PATH undefined"
    exit 1
elif [[ -z "${BUILD_OUTPUT}" ]]; then
    echo "BUILD_OUTPUT undefined"
    exit 1
fi

flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

if [ "${APP_TYPE}" == "web" ]; then
    flutter build web --source-maps --no-tree-shake-icons --dart-define=FLUTTER_WEB_USE_SKIA=true
else
    flutter build ${APP_TYPE} --no-tree-shake-icons
fi

flutter packages pub run sentry_dart_plugin

cd ${BUILD_PATH}
tar -zcvf appainter_${APP_TYPE}.tar.gz ${BUILD_OUTPUT}
