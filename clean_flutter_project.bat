@echo off
echo ===============================
echo 🧹 Flutter Project Cleaner
echo ===============================

REM حذف مجلدات البناء المؤقتة
echo 🔸 Removing build folders...
rmdir /s /q build
rmdir /s /q .dart_tool
rmdir /s /q .idea
rmdir /s /q .vscode

REM حذف مجلدات الطرف الثالث في Android و iOS
echo 🔸 Cleaning android/ and ios/
rmdir /s /q android\.gradle
rmdir /s /q android\build
rmdir /s /q ios\Pods
rmdir /s /q ios\build

REM تنظيف باستخدام Flutter
echo 🔸 Running flutter clean...
flutter clean

echo ✅ Done! Your project is now ready for zipping.
pause
