# Design Notes

## Product scope

This project is intentionally limited to the current wireless inventory:

- Shure SLX-D
- MIPRO ACT-5 / ACT-7
- Sennheiser EK IEM G4

The system is organized around a **person**, not around equipment type.

A full person position is a front-to-back column:

```text
rear
[ Mic UniSlot ]
[ EK IEM G4   ]
[ Tag         ]
front
```

Partial columns are valid:

- `[Mic] -> [Tag]`
- `[IEM] -> [Tag]`

## UniSlot

A UniSlot does **not** hold a handheld and a bodypack simultaneously.

It is a single physical cradle shaped so that either form factor can be placed in the same position.

### Shure UniSlot

Target:
- SLXD2 handheld
- SLXD1 bodypack

### MIPRO UniSlot

Target:
- ACT-5 handheld/bodypack
- ACT-7 handheld/bodypack

The two brands remain separate modules because their geometry is different.

## Horizontal interface

Each module has a left/right joining interface.

Current V0.1 direction:
- printed dovetail/slide
- one male side
- one female side
- end caps terminate exposed interfaces
- total prototype clearance: 0.6 mm

The interface must prevent:
- side separation
- excessive yaw
- lifting during normal device removal

## Front/rear interface

Front/rear rows use a separate bridge piece rather than putting a second full dovetail on every face.

Goals:
- preserve simple printable holders
- allow person-centric columns
- allow Mic-only / IEM-only layouts
- permit easy replacement

## Electronic tag

The tag is a distinct front module.

Candidate display envelopes:
- 1.54-inch e-paper
- 2.13-inch e-paper

The mechanical interface should allow the tag hardware to change without reworking every device holder.

## Materials

Preferred:
- PETG for structural parts
- TPU/EVA for contact or anti-slip pads

Avoid relying on flexible printed snap features for critical load-bearing connections until fatigue behavior is validated.

## V0.1 exclusions

Not yet included:
- charging contacts
- charging PCBs
- integrated power distribution
- exact electronic tag PCB
- production tolerances
- brand-specific fine surface geometry
