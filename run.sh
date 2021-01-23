#!/bin/sh
echo "Run Your Flutter App.."
flutter clean && flutter run | grep -v "D/ViewRootImpl"
