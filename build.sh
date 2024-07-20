echo -n “start build android”
flutter build apk
echo -n “start remove old file”
rm -rf ~/Desktop/build/base_template_bloc-release.apk
echo -n “copy file”
cp -R build/app/outputs/flutter-apk/app-release.apk ~/Desktop/build/base_template_bloc.apk
echo -n “success”
exit