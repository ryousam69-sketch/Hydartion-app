# Hydration: get the Android APK (no Android Studio needed)

GitHub builds the APK for you, free, in about 5 to 10 minutes.

1. Make a free account at github.com, then press **New repository**. Name it `hydration`, pick Private, and press **Create repository**.
2. On the new repository page, press **uploading an existing file**. Drag in everything from this folder, including the `.github` folder, then press **Commit changes**.
   - If the `.github` folder did not upload: press **Add file > Create new file**, type `.github/workflows/build-apk.yml` as the name, paste in the contents of `build-apk.yml` from this folder, and commit.
3. Open the **Actions** tab. If it asks, press **I understand my workflows, enable them**. Open **Build APK** on the left and press **Run workflow**.
4. When the run turns green, open it, scroll to **Artifacts**, and download `hydration-apk`.
5. Unzip it, send `app-debug.apk` to your phone, open it, and allow "install from this source".
6. Open Hydration, press **Turn on alerts**, allow notifications, and follow "Keep reminders reliable" in the app (battery: Unrestricted, Autostart on).

If the run turns red, open it, copy the red error text, and send it to me.

## Building on your own computer instead
Needs Node 20, Java 21 and Android Studio:

    npm install
    bash scripts/prepare.sh
    npx cap open android

Then press Run in Android Studio, or Build > Build APK.
