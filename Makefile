.PHONY: test
test:
	fvm flutter test --coverage
	lcov --remove coverage/lcov.info '*.freezed.dart' '*.g.dart' '*/repository*' -o coverage/lcov.info
	genhtml coverage/lcov.info -o coverage/html
	open /Users/odatetsuo/Projects/teigi_app/coverage/html/index.html

.PHONY: analytics_debug_view_start
analytics_debug_view_start:
	adb shell setprop debug.firebase.analytics.app com.toda.baseball_quiz_app.dev

.PHONY: analytics_debug_view_end
analytics_debug_view_end:
	adb shell setprop debug.firebase.analytics.app .none.

.PHONY: melos_setup
melos_setup:
	melos clean
	melos bootstrap

.PHONY: gen
gen:
	melos gen

.PHONY: release_build_android
release_build_android:
	cd package/app && fvm flutter build appbundle --release --dart-define-from-file=dart_defines/prod.json