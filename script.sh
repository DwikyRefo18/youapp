#!/bin/bash
echo 'Running Script'
first="flutter pub get"
second="flutter pub run build_runner build --delete-conflicting-outputs"
echo $first
$first
echo $second
$second