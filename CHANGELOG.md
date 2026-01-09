# Changelog

## 0.0.2
- Use `MediaQuery.sizeOf(context)` and `MediaQuery.textScalerOf(context)` (no deprecated `textScaleFactor`).
- `.sp` now applies `TextScaler`.
- Web resize/orientation rebuild remains supported.

## 0.0.1

## 0.0.1

- Initial release.
- Fix: ensure widgets update when resizing the window on Web (forces subtree rebuild on size changes).
- `MiniScreenInit` app wrapper (ScreenUtilInit-like).
- Responsive numeric extensions: `.w`, `.h`, `.r`, `.sp`.
- Optional system text scale support + clamp.
