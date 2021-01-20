#!/bin/sh
echo "Run Your Flutter App.."
flutter run | grep -v "D/ViewRootImpl"
