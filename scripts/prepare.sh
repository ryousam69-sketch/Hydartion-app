#!/usr/bin/env bash
set -euo pipefail

rm -rf www && mkdir -p www
cp index.html manifest.webmanifest icon-192.png icon-512.png www/

rm -rf android
npx cap add android

APP=android/app/src/main
RES=$APP/res

sed -i 's|<application|<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />\n    <uses-permission android:name="android.permission.USE_EXACT_ALARM" />\n    <uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />\n    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />\n    <application|' $APP/AndroidManifest.xml

mkdir -p $RES/drawable
cp android-res/ic_stat_water.xml $RES/drawable/ic_stat_water.xml

for d in $RES/mipmap-*; do
  case "$d" in
    *anydpi*) rm -rf "$d" ;;
    *) cp icon-192.png "$d/ic_launcher.png"; cp icon-192.png "$d/ic_launcher_round.png"; rm -f "$d/ic_launcher_foreground.png" ;;
  esac
done

npx cap sync android
echo "Android project ready in ./android"
