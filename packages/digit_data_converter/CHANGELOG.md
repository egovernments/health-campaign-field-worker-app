## 0.0.4

- Fix checkbox fields sending `null` instead of `false` in `additionalFields`
- Fix bednet delivery eligibility, `additionalFields` null filtering, and IHM config updates
- Added `add member` config; capture `dateTime` mapping in scanner builder
- Added `indirect delivery` transformer config, `collect as` variation, and reverse mapping
- Fix edit-flow update from `additionalFields`; duplicate mapping fix
- Fix update for different project; multiple product-variant issue; per-project beneficiary lookup
- Removed string `additionalDetail` mapping; renamed from form package

## 0.0.2

- Added transformer support for the HF-Referral feature

## 0.0.1

- Fixed mapping for update flow
- Updated digit_data_model dependency to ^1.3.0

## 0.0.3-dev

- fixed update model mapping function to create entities which does not exists

## 0.0.2-dev

- Added list generation of models based on the given listSource

## 0.0.1-dev

- Initial release of `digit_data_converter`.
- Supports basic, object, and list mappings for Dart model transformation.
- Adds support for additional fields, fallback models, and special dynamic keys:
    - `__context`
    - `__ref`
    - `__switch` 
    - `__generate:uuid`
    - `__generate:client`
    - `__generate:audit`
