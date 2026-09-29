# Mango Keyboard Layout

A small DankMaterialShell widget that displays the current keyboard layout used by MangoWM.

Supports:

- English (`EN`)
- Arabic (`AR`)
- Live layout updates
- MangoWM `mmsg watch keyboardlayout`
- DankMaterialShell 1.6.2+

## Requirements

- MangoWM
- DankMaterialShell >= 1.6.2
- `mmsg`
- English and Arabic XKB layouts configured in MangoWM

## MangoWM Configuration

Add the following to your MangoWM configuration:

```ini
xkb_rules_layout=us,ara
xkb_rules_options=grp:alt_shift_toggle
