## 0.0.2

* `LivenessDetectionService`: default challenge sequence reduced to `[blink]` alone. The previous `[blink, turnLeft]` default forced the user to turn left during the liveness step, colliding with the subsequent step-3 left-angle capture during enrollment and reading as "look left" twice. The four head-turn angle captures that follow already provide sufficient liveness evidence. Relaxed the `challenges.length >= 2` guard to `challenges.isNotEmpty` so single-challenge configurations are honoured.

## 0.0.1

* Initial release — offline face verification for field worker attendance using MobileFaceNet + Google ML Kit
* On-device face enrollment and verification with a locally-stored embedding
* Liveness detection to defeat photo/video replay
* Distance-metric based match scoring with a configurable hard match cutoff
* Independent MDMS config for match cutoff, liveness sequence, and localization
* Full i18n via app-level translate
* Ready-to-use capture, enrollment, verification, and attendance-wrapper widgets
