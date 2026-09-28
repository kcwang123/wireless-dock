# Wireless Dock

Modular 3D-printable desktop dock for wireless audio gear.

This project is focused on the equipment we actually need to manage:

- **Shure SLX-D** — SLXD1 bodypack / SLXD2 handheld
- **MIPRO ACT-5 / ACT-7** — bodypack / handheld
- **Sennheiser EK IEM G4**
- **Electronic name/channel tags**
- Optional **XTAR L8 Pro** AA battery charger tray

The design goal is not a large fixed frame. Every holder is an independent module that can connect to the modules beside it and in front/behind it.

## Core workflow

The basic layout is **person-centric**:

```text
rear
┌──────────────────┐
│ Mic UniSlot      │  Shure SLXD or MIPRO ACT-5/7
├──────────────────┤
│ EK IEM G4        │
├──────────────────┤
│ Electronic Tag   │  name / channel / role
└──────────────────┘
front
```

A person can therefore be represented as:

**1 Tag + 1 IEM + 1 Mic UniSlot**

The system must also support:

- Tag + Mic only
- Tag + IEM only
- Mixed rows of full and partial person modules
- Multiple people joined side-by-side

## UniSlot concept

A **UniSlot holds exactly one transmitter at a time**.

For Shure, one physical slot should accept either:

- SLXD2 handheld, **or**
- SLXD1 bodypack

For MIPRO, one physical slot should accept either:

- ACT-5/7 handheld, **or**
- ACT-5/7 bodypack

This is inspired by the mechanical idea behind products such as the Shure SBC203 / MIPRO universal charging cradles, but this project currently implements **mechanical storage only**. There are no charging contacts or charging electronics in the UniSlot.

## Mechanical architecture

### Horizontal connection

Modules connect left-to-right using a printed sliding/dovetail interface.

Goals:

- tool-less assembly
- repeatable pitch
- enough stiffness for a row of devices
- printable in PETG
- replace a failed module without reprinting the whole dock

Current prototype clearance is **0.6 mm overall** and must be tuned after test prints.

### Front/rear connection

Rows connect front-to-back using a separate bridge connector.

This keeps each holder simple while allowing the person-centric vertical stack:

```text
[ Mic ]
  │
[ IEM ]
  │
[ Tag ]
```

### End caps

Left/right end caps close the exposed side interface and can later provide:

- anti-slip feet
- optional screw mounting
- row locking

## Electronic tag

Each user position has a front tag location. Target display sizes under consideration:

- 1.54-inch e-paper
- 2.13-inch e-paper

Typical content:

```text
CH01
Vocal 1
```

or

```text
IEM3
FOH
```

The tag interface should remain replaceable so the holder geometry is not tied to one display vendor.

## Repository layout

```text
cad/
  wireless_modular_v0_1.scad

docs/
  DESIGN.md
  MEASUREMENTS.md
  images/

stl/
  # generated print files will be added after fit validation
```

## Current status

**V0.1 = fit-test prototype**

The current CAD starts from public nominal dimensions. It is **not yet a production-ready print** because the real hardware includes tapers, clips, antenna bases, corner radii and local protrusions that are not fully represented by published bounding dimensions.

The first validation round should print only:

1. Shure UniSlot ×1
2. MIPRO UniSlot ×1
3. EK IEM G4 slot ×1
4. front/rear bridge ×1
5. electronic tag dummy ×1

After real-device fit checks, the measurements will be folded into V0.2.

## Current nominal dimensions used by V0.1

| Device | Nominal dimensions used |
| --- | --- |
| Shure SLXD1 | 98 × 68 × 25.5 mm |
| Shure SLXD2 | Ø37.1 × 176 mm |
| MIPRO ACT-700 handheld | Ø51 × 272 mm |
| MIPRO ACT-700 bodypack | 63 × 80 × 25 mm |
| Sennheiser EK IEM G4 | approx. 82 × 64 × 24 mm |

ACT-5/ACT-7 real units still need caliper verification before the shared MIPRO UniSlot is finalized.

## Print baseline

For prototype prints:

- PETG
- 0.4 mm nozzle
- 0.20 mm layer height
- 4 walls
- 25–35% infill
- avoid supports when orientation permits
- TPU/EVA contact pads can be added after geometry is stable

## Design principles

1. **No large base frame**
2. **Every module is independently printable**
3. **One person is one front-to-back column**
4. **UniSlot means handheld OR bodypack, never both at once**
5. **Shure and MIPRO use separate UniSlot geometries**
6. **Sennheiser EK IEM G4 has its own dedicated holder**
7. **Electronic tags are replaceable modules**
8. **Charging electronics are outside the scope of the device holders**
9. **Mechanical interfaces should survive repeated reconfiguration**
10. **Real-device fit takes priority over nominal CAD dimensions**

## Next milestone — V0.2

V0.2 will be based on caliper measurements from the actual hardware and will focus on:

- final Shure SLXD1/2 UniSlot contact geometry
- final MIPRO ACT-5/7 UniSlot contact geometry
- EK IEM G4 belt-clip and knob/antenna clearance
- horizontal connector tolerance
- front/rear bridge tolerance
- e-paper tag envelope
- stable center of gravity for handheld transmitters

See [docs/MEASUREMENTS.md](docs/MEASUREMENTS.md) for the measurement checklist.

---

This is a personal DIY hardware project and is not affiliated with or endorsed by Shure, MIPRO, Sennheiser, or XTAR. Product names are used only to identify compatibility targets.
