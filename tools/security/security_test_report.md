# Application Security Testing Report

**Date:** Fri Feb 27 05:29:40 PM IST 2026

## Summary of Results

| Test Category | Passed (Secure) | Failed (Vuln) | Status |
|---|---|---|---|
| Insecure Broadcast Receiver Mitigation | 1 | 1 | ❌ Vulnerable |
| Root Detection Bypass Prevention | 2 | 0 | ✅ Secure |
| Improper Platform Usage Mitigation | 3 | 0 | ✅ Secure |
| Improper Code Obfuscation Mitigation | 2 | 0 | ✅ Secure |

## Final Score

- **Total Tests Run**: 9
- **Total Passed (Secure)**: 8
- **Total Failed (Vuln)**: 1
- **Overall Status**: ❌ VULNERABLE

## Detailed Execution Output

### Insecure Broadcast Receiver Mitigation

```text
===========================================================
 Testing Insecure Broadcast Receiver Mitigations
 Package: com.digit.hcm
===========================================================

[*] Testing id.flutter.flutter_background_service.WatchdogReceiver...
    Command: adb shell am broadcast  -n com.digit.hcm/id.flutter.flutter_background_service.WatchdogReceiver
    > Broadcasting: Intent { flg=0x400000 cmp=com.digit.hcm/id.flutter.flutter_background_service.WatchdogReceiver }
    > Broadcast completed: result=0
    Result : [VULNERABLE] Broadcast completed successfully. The receiver is exported!

[*] Testing id.flutter.flutter_background_service.BootReceiver...
    Command: adb shell am broadcast -a android.intent.action.BOOT_COMPLETED -n com.digit.hcm/id.flutter.flutter_background_service.BootReceiver
    > Broadcasting: Intent { act=android.intent.action.BOOT_COMPLETED flg=0x400000 cmp=com.digit.hcm/id.flutter.flutter_background_service.BootReceiver }
    > 
    > Exception occurred while executing 'broadcast':
    > java.lang.SecurityException: Permission Denial: not allowed to send broadcast android.intent.action.BOOT_COMPLETED from pid=25007, uid=2000
    > at com.android.server.am.BroadcastController.broadcastIntentLockedTraced(BroadcastController.java:1067)
    > at com.android.server.am.BroadcastController.broadcastIntentLocked(BroadcastController.java:807)
    > at com.android.server.am.BroadcastController.broadcastIntentWithFeature(BroadcastController.java:740)
    > at com.android.server.am.ActivityManagerService.broadcastIntentWithFeature(ActivityManagerService.java:14408)
    > at com.android.server.am.ActivityManagerShellCommand.runSendBroadcast(ActivityManagerShellCommand.java:1075)
    > at com.android.server.am.ActivityManagerShellCommand.onCommand(ActivityManagerShellCommand.java:280)
    > at com.android.modules.utils.BasicShellCommandHandler.exec(BasicShellCommandHandler.java:97)
    > at android.os.ShellCommand.exec(ShellCommand.java:38)
    > at com.android.server.am.ActivityManagerService.onShellCommand(ActivityManagerService.java:10418)
    > at android.os.Binder.shellCommand(Binder.java:1151)
    > at android.os.Binder.onTransact(Binder.java:953)
    > at android.app.IActivityManager$Stub.onTransact(IActivityManager.java:5739)
    > at com.android.server.am.ActivityManagerService.onTransact(ActivityManagerService.java:2735)
    > at android.os.Binder.execTransactInternal(Binder.java:1426)
    > at android.os.Binder.execTransact(Binder.java:1365)
    Result : [SECURE] Access Denied. The receiver is not exported or requires permissions.

===========================================================
 Testing Complete.
 Total Tests Run : 2
 Passed (Secure) : 1
 Failed (Vuln)   : 1
===========================================================
```

### Root Detection Bypass Prevention

```text
===========================================================
 Testing Root Detection Bypass Prevention Mitigation
 Package: com.digit.hcm
===========================================================

[*] Testing Hooking Framework Detection (Frida Bypass Simulation)
    > Creating pseudo frida-server file at /data/local/tmp/frida-server
    > Clear logcat and launch app...
    > Waiting for app to perform security checks (10s)...
    > Log output: 02-27 17:29:50.636 25040 25064 I flutter : Security threat detected: {isPassed: false, threats: [root, root, emulator, hook], checksum: 4d2f6e9d23c861755ffab04e30535fc2c326809d7fb18022a00b5d254d62e42a, timestamp: 2026-02-27T17:29:50.624862}
    Result : [SECURE] App successfully detected the hooking framework!

[*] Testing Root Detection & Emulator Status...
    > Device is an emulator.
    > Clear logcat and launch app...
    > Waiting for app to perform security checks (10s)...
    > Log output: 02-27 17:31:13.298 25226 25250 I flutter : Security threat detected: {isPassed: false, threats: [root, root, emulator], checksum: 7ccdc1f2c3a608ee29a0fe3a1863451feabc42b05aee7c31f5451f78438419e9, timestamp: 2026-02-27T17:31:13.291469}
    Result : [SECURE] App successfully detected insecure environment (root/emulator)!

===========================================================
 Testing Complete.
 Total Tests Run : 2
 Passed (Secure) : 2
 Failed (Vuln)   : 0
===========================================================
```

### Improper Platform Usage Mitigation

```text
===========================================================
 Testing Improper Platform Usage Mitigation
 Package: com.digit.hcm
===========================================================

[*] Testing Broadcast Receiver Spoofing (LocationUpdate)...
    > Clearing logcat and launching the app...
    > Waiting for app to initialize (5s)...
    > Attempting to spoof LocationUpdate broadcast from external shell...
    Command: adb shell am broadcast -a LocationUpdate
    > Broadcasting: Intent { act=LocationUpdate flg=0x400000 }
    > Broadcast completed: result=0
    > No processing logs found in logcat (Receiver ignored or blocked the broadcast).
    Result : [SECURE] Broadcast receiver is not exported / securely configured.

[*] Testing Service Export Configuration (LocationService)...
    > Attempting to start LocationService externally...
    Command: adb shell am startservice -n com.digit.hcm/.LocationService
    > Starting service: Intent { cmp=com.digit.hcm/.LocationService }
    > Error: Requires permission not exported from uid 10220
    Result : [SECURE] Service is not exported and denied external start.

[*] Testing PendingIntent Mutability Configuration (Static Check)...
    > Checking dumpsys for active PendingIntents from com.digit.hcm...
    > No active PendingIntents found to analyze statically via dumpsys.
    Result : [SECURE] Safe by default.

===========================================================
 Testing Complete.
 Total Tests Run : 3
 Passed (Secure) : 3
 Failed (Vuln)   : 0
===========================================================
```

### Improper Code Obfuscation Mitigation

```text
===========================================================
 Testing Improper Code Obfuscation Mitigation
 Package: com.digit.hcm
===========================================================

[*] Testing Code Obfuscation Configuration (Static Analysis)
    > Analyzing android/app/build.gradle for minifyEnabled...
    > Found minifyEnabled true:
                  minifyEnabled true
    > Found shrinkResources true:
                  shrinkResources true
    > Found ProGuard configuration:
                  proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
    Result : [SECURE] ProGuard / R8 code obfuscation and resource shrinking is enabled for the build process.

[*] Testing Flutter Obfuscation Configuration (build_obfuscated.sh)
    > Analyzing the custom build script ../../apps/health_campaign_field_worker_app/build_obfuscated.sh...
    > Found Flutter symbol obfuscation flag:
              --obfuscate \
        --obfuscate \
    Result : [SECURE] The Dart code is compiled with --obfuscate.

===========================================================
 Testing Complete.
 Total Tests Run : 2
 Passed (Secure) : 2
 Failed (Vuln)   : 0
===========================================================
```

