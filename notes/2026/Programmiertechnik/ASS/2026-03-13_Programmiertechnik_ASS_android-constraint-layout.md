---
title: "Android ConstraintLayout"
date: 2026-03-13
weekday: "Freitag"
subject: "Programmiertechnik"
instructor: "ASS"
program: "FIAE Umschulung 2025-2027"
module: "android"
topic: "ConstraintLayout"
level: "fundamentals"
tags:
  - android
  - layout
  - ui
  - constraintlayout
author: "Sean Matthew Conroy"
license: "CC BY-NC-SA 4.0"
---

# Android ConstraintLayout

## Overview

**ConstraintLayout** is a layout manager in Android used to design flexible and responsive user interfaces with a **flat view hierarchy**.  
Instead of nesting multiple layouts (e.g., `LinearLayout` inside `RelativeLayout`), UI elements are positioned using **constraints** that define relationships between views.

This approach improves:

- **Performance** (fewer nested layouts)
- **Flexibility in positioning**
- **Responsiveness across screen sizes**

ConstraintLayout is the **recommended default layout system in modern Android development**.

---

## Core Concept: Constraints

A **constraint** defines how a UI element is positioned relative to:

- the **parent layout**
- **another view**
- a **guideline or barrier**

Each view should normally have **at least one horizontal and one vertical constraint**, otherwise Android Studio will warn about ambiguous positioning.

Typical constraint directions:

| Direction | Example |
|---|---|
| Top | align to top of another view |
| Bottom | align to bottom of parent |
| Start | align to start (left in LTR layouts) |
| End | align to end (right in LTR layouts) |

Example:

```text
Button.top -> Parent.top
Button.start -> Parent.start
Button.end -> Parent.end
```

This centers the button horizontally while keeping it aligned to the top.

---

## Basic Example

```xml
<androidx.constraintlayout.widget.ConstraintLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Click Me"

        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toEndOf="parent"/>

</androidx.constraintlayout.widget.ConstraintLayout>
```

### Result

The button is:

- aligned to the **top of the parent**
- constrained to **start and end of the parent**
- therefore **centered horizontally**

---

## Why ConstraintLayout Is Efficient

Older Android layouts often required **deep nesting**:

```text
LinearLayout
 └── RelativeLayout
      └── LinearLayout
           └── Button
```

ConstraintLayout allows the same UI with a **flat hierarchy**:

```text
ConstraintLayout
 ├── Button
 ├── TextView
 └── ImageView
```

Benefits:

| Advantage | Explanation |
|---|---|
| Better performance | Fewer nested layout calculations |
| Flexible positioning | Views can depend on each other |
| Easier responsive design | Works well across screen sizes |

---

## Important ConstraintLayout Features

### 1. Guidelines

Guidelines are **invisible alignment helpers** used to structure layouts.

They can be positioned:

- by **percentage**
- by **fixed distance**

Example:

```xml
<androidx.constraintlayout.widget.Guideline
    android:id="@+id/guideline"
    android:orientation="vertical"
    app:layout_constraintGuide_percent="0.5"/>
```

This creates a vertical guideline at **50% of the screen width**.

---

### 2. Barriers

A **Barrier** is a dynamic guideline that moves depending on the **size of referenced views**.

Use case:

- several text fields with different lengths
- another element should start **after the longest one**

Example:

```xml
<androidx.constraintlayout.widget.Barrier
    android:id="@+id/barrier"
    app:barrierDirection="end"
    app:constraint_referenced_ids="text1,text2,text3"/>
```

The barrier position automatically adjusts.

---

### 3. Chains

Chains allow views to be **linked together** along one axis.

Chain styles:

| Chain Type | Behavior |
|---|---|
| spread | equal spacing |
| spread_inside | first & last fixed |
| packed | views grouped together |

Chains often replace the **weight system of LinearLayout**.

---

### 4. Groups

A **Group** allows multiple views to be controlled together.

Example use cases:

- hide multiple elements
- animate multiple elements
- toggle visibility

Example:

```xml
<androidx.constraintlayout.widget.Group
    android:id="@+id/group"
    app:constraint_referenced_ids="button1,button2,text1"/>
```

---

## Visual Layout Editor (Android Studio)

Android Studio provides a **drag-and-drop visual editor** for ConstraintLayout.

Capabilities:

- create constraints visually
- see layout preview on different screen sizes
- automatically generate constraint XML
- align and distribute views easily

This greatly speeds up UI design.

---

## ConstraintLayout vs LinearLayout

| Feature | LinearLayout | ConstraintLayout |
|---|---|---|
| Layout principle | sequential (row/column) | relational constraints |
| Weight system | yes (`layout_weight`) | replaced by chains |
| Nesting required | often | rarely |
| Performance | lower for complex UI | better for complex UI |
| Flexibility | limited | very high |

---

## Practical Example Scenario

Imagine a login screen:

```text
[Logo]

[Username field]

[Password field]

[Login button]
```

With ConstraintLayout:

- Logo → top of parent
- Username → below logo
- Password → below username
- Button → below password and centered

All elements remain **properly aligned regardless of screen size**.

---

## Exam Relevance (FIAE)

Typical exam topics include:

- purpose of **ConstraintLayout**
- difference between **ConstraintLayout vs LinearLayout**
- understanding **constraints**
- recognizing **guidelines, barriers, chains**
- advantages of a **flat view hierarchy**

Important takeaway:

> ConstraintLayout reduces nested layouts and positions views using relationships (constraints) instead of layout stacking.

---

## Common Mistakes

### Missing Constraints

A view without horizontal or vertical constraints results in **ambiguous positioning**.

Android Studio will show warnings like:

```text
Missing constraints in ConstraintLayout
```

---

### Overusing Nested Layouts

A frequent beginner mistake is still nesting layouts unnecessarily:

```text
ConstraintLayout
 └── LinearLayout
      └── Button
```

Often this can be simplified to:

```text
ConstraintLayout
 └── Button
```

---

### Confusing Constraints with Margins

Constraints define **relationships**, while margins define **spacing**.

Example:

```text
Button.top -> TextView.bottom
marginTop = 16dp
```

Meaning:

- button is **below TextView**
- **16dp spacing** between them

---

## Summary

ConstraintLayout is a **powerful and flexible layout system** for Android UI design.

Key ideas:

- Views are positioned using **constraints**
- Supports **Guidelines, Barriers, Chains, Groups**
- Enables **flat layout hierarchies**
- Improves **performance and responsiveness**
- Integrated with **Android Studio's visual editor**

For modern Android development, ConstraintLayout is usually the **preferred layout manager for complex user interfaces**.

---

# Art Tutorial: Recreating the Example Layouts

## Goal

Recreate the provided layouts using **ConstraintLayout only**, without nesting additional layouts.

We will break this into **four mini-projects**:

1. Color block layout (rainbow example)
2. Nested card-like layout (green/purple/yellow)
3. Login screen UI
4. Form layout with split rows and output area

---

## Important Rule for School / Exam Context

If fixed sizes are penalized, avoid using hardcoded values such as:

- `android:layout_width="120dp"`
- `android:layout_height="80dp"`

Prefer these instead:

| Better option | Why |
|---|---|
| `0dp` | view expands between constraints |
| `wrap_content` | size depends on content |
| guidelines | divide the screen proportionally |
| percent constraints | responsive sizing |
| ratio | keeps proportions without fixed dimensions |

That means the tutorial below uses **match constraints (`0dp`)**, **guidelines**, **percent-based positioning**, and **ratios** wherever possible.

---

## 1. Color Block Layout (Relative Positioning + Chains)

### Concept Focus

- Horizontal constraints
- Chains
- Guidelines
- Ratios instead of fixed heights

### Layout Idea

The rainbow layout can be built with:

- three colored blocks in the top row
- three colored blocks in the middle row
- one full-width block at the bottom
- guidelines to divide the screen vertically into zones
- chains to distribute blocks horizontally

### Structure Sketch

```text
+--------------------------------------+
| RED        ORANGE         YELLOW     |
|                                      |
|      GREEN      BLUE      INDIGO     |
|                                      |
|              VIOLET                  |
+--------------------------------------+
```

### Step-by-Step

#### 1. Create vertical positioning with guidelines

Instead of fixed row heights, define horizontal guidelines:

```xml
<androidx.constraintlayout.widget.Guideline
    android:id="@+id/gTopRowEnd"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:orientation="horizontal"
    app:layout_constraintGuide_percent="0.28"/>

<androidx.constraintlayout.widget.Guideline
    android:id="@+id/gMiddleRowEnd"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:orientation="horizontal"
    app:layout_constraintGuide_percent="0.58"/>

<androidx.constraintlayout.widget.Guideline
    android:id="@+id/gBottomStart"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:orientation="horizontal"
    app:layout_constraintGuide_percent="0.78"/>
```

These guidelines create flexible vertical zones based on screen height.

---

#### 2. Create the top row with a chain

```xml
<View
    android:id="@+id/red"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:background="#FF0000"
    android:layout_margin="8dp"

    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintBottom_toTopOf="@id/gTopRowEnd"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toStartOf="@id/orange"
    app:layout_constraintHorizontal_chainStyle="spread"/>

<View
    android:id="@+id/orange"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:background="#FFA500"
    android:layout_margin="8dp"

    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintBottom_toTopOf="@id/gTopRowEnd"
    app:layout_constraintStart_toEndOf="@id/red"
    app:layout_constraintEnd_toStartOf="@id/yellow"/>

<View
    android:id="@+id/yellow"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:background="#FFFF00"
    android:layout_margin="8dp"

    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintBottom_toTopOf="@id/gTopRowEnd"
    app:layout_constraintStart_toEndOf="@id/orange"
    app:layout_constraintEnd_toEndOf="parent"/>
```

Here:

- width is `0dp` so the chain distributes them
- height is `0dp` so each block fills the space between top and the guideline
- no fixed height is used

---

#### 3. Create the middle row the same way

```xml
<View
    android:id="@+id/green"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:background="#00FF00"
    android:layout_margin="8dp"

    app:layout_constraintTop_toBottomOf="@id/gTopRowEnd"
    app:layout_constraintBottom_toTopOf="@id/gMiddleRowEnd"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toStartOf="@id/blue"
    app:layout_constraintHorizontal_chainStyle="packed"/>

<View
    android:id="@+id/blue"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:background="#0000FF"
    android:layout_margin="8dp"

    app:layout_constraintTop_toBottomOf="@id/gTopRowEnd"
    app:layout_constraintBottom_toTopOf="@id/gMiddleRowEnd"
    app:layout_constraintStart_toEndOf="@id/green"
    app:layout_constraintEnd_toStartOf="@id/indigo"/>

<View
    android:id="@+id/indigo"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:background="#4B0082"
    android:layout_margin="8dp"

    app:layout_constraintTop_toBottomOf="@id/gTopRowEnd"
    app:layout_constraintBottom_toTopOf="@id/gMiddleRowEnd"
    app:layout_constraintStart_toEndOf="@id/blue"
    app:layout_constraintEnd_toEndOf="parent"/>
```

---

#### 4. Bottom block fills the remaining band

```xml
<View
    android:id="@+id/violet"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:background="#EE82EE"
    android:layout_margin="8dp"

    app:layout_constraintTop_toBottomOf="@id/gBottomStart"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```


This version avoids fixed row sizes.  
The colored areas scale with screen size because their dimensions come from **constraints and guidelines**, not hardcoded `dp` heights.

---

## 2. Card Layout (Margins + Responsive Inner Alignment)

### Concept Focus

- Margins
- Guidelines
- Responsive blocks without fixed size

### Layout Idea

The second image has:

- a green outer background
- one large purple panel near the top
- one large purple panel below
- two yellow boxes inside the lower panel

### Structure Sketch

```text
+--------------------------------------+
|              PURPLE                  |
|                                      |
|   +------------------------------+   |
|   |                              |   |
|   +------------------------------+   |
|                                      |
|   +------------------------------+   |
|   |   YELLOW       YELLOW        |   |
|   +------------------------------+   |
+--------------------------------------+
```

### Step-by-Step

#### 1. Use guidelines for vertical sections

```xml
<androidx.constraintlayout.widget.Guideline
    android:id="@+id/gCardTopEnd"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:orientation="horizontal"
    app:layout_constraintGuide_percent="0.48"/>

<androidx.constraintlayout.widget.Guideline
    android:id="@+id/gCardBottomStart"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:orientation="horizontal"
    app:layout_constraintGuide_percent="0.52"/>
```

---

#### 2. Top purple box

```xml
<View
    android:id="@+id/topBox"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:background="#8E7CC3"
    android:layout_marginStart="24dp"
    android:layout_marginEnd="24dp"
    android:layout_marginTop="24dp"
    android:layout_marginBottom="12dp"

    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintBottom_toTopOf="@id/gCardTopEnd"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```

---

#### 3. Bottom purple box

```xml
<View
    android:id="@+id/bottomBox"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:background="#8E7CC3"
    android:layout_marginStart="18dp"
    android:layout_marginEnd="18dp"
    android:layout_marginTop="12dp"
    android:layout_marginBottom="18dp"

    app:layout_constraintTop_toBottomOf="@id/gCardBottomStart"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```

---

#### 4. Yellow boxes inside using a horizontal chain

Use the lower purple block as reference bounds:

```xml
<View
    android:id="@+id/y1"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:background="#E6FF00"
    android:layout_marginStart="24dp"
    android:layout_marginEnd="12dp"
    android:layout_marginTop="24dp"
    android:layout_marginBottom="24dp"

    app:layout_constraintTop_toTopOf="@id/bottomBox"
    app:layout_constraintBottom_toBottomOf="@id/bottomBox"
    app:layout_constraintStart_toStartOf="@id/bottomBox"
    app:layout_constraintEnd_toStartOf="@id/y2"
    app:layout_constraintHorizontal_chainStyle="spread"
    app:layout_constraintDimensionRatio="5:3"/>

<View
    android:id="@+id/y2"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:background="#E6FF00"
    android:layout_marginStart="12dp"
    android:layout_marginEnd="24dp"
    android:layout_marginTop="24dp"
    android:layout_marginBottom="24dp"

    app:layout_constraintTop_toTopOf="@id/bottomBox"
    app:layout_constraintBottom_toBottomOf="@id/bottomBox"
    app:layout_constraintStart_toEndOf="@id/y1"
    app:layout_constraintEnd_toEndOf="@id/bottomBox"
    app:layout_constraintDimensionRatio="5:3"/>
```


The purple panels and yellow blocks scale based on available space.  
The yellow cards use **ratio + constraints** instead of fixed width or fixed height.

---

## 3. Login Screen (Real UI Example)

### Concept Focus

- Vertical flow
- Centering
- Guidelines
- Percent width
- No fixed control height unless the school explicitly allows standard control sizing

### Layout Strategy

```text
[Title]
[Email]
[Password]
[Button]
[Divider/Icon]
[Social Buttons]
[Footer]
```

### Better Sizing Approach

For a teacher who dislikes fixed sizes:

- use `wrap_content` for text-based elements
- use `0dp` width for inputs and buttons
- use horizontal guidelines or margins for spacing
- avoid forcing a fixed height unless required by the widget design

### Step-by-Step

#### 1. Title centered

```xml
<TextView
    android:id="@+id/title"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:text="LOGIN"
    android:textSize="24sp"
    android:textStyle="bold"

    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```

---

#### 2. Email field stretched between margins

```xml
<EditText
    android:id="@+id/email"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:hint="Email"
    android:inputType="textEmailAddress"
    android:layout_marginStart="32dp"
    android:layout_marginEnd="32dp"

    app:layout_constraintTop_toBottomOf="@id/title"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```

---

#### 3. Password below email

```xml
<EditText
    android:id="@+id/password"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:hint="Password"
    android:inputType="textPassword"
    android:layout_marginStart="32dp"
    android:layout_marginEnd="32dp"

    app:layout_constraintTop_toBottomOf="@id/email"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```

---

#### 4. Button centered without fixed width

```xml
<Button
    android:id="@+id/loginButton"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:text="Go !"
    android:layout_marginStart="96dp"
    android:layout_marginEnd="96dp"

    app:layout_constraintTop_toBottomOf="@id/password"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```

This keeps the button responsive by constraining it between margins instead of assigning a fixed width.

---

#### 5. Social buttons stacked the same way

```xml
<Button
    android:id="@+id/facebookButton"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:text="Login With Facebook"
    android:layout_marginStart="32dp"
    android:layout_marginEnd="32dp"

    app:layout_constraintTop_toBottomOf="@id/loginButton"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```

Repeat the same pattern for Twitter.

### Why This Version Is Better

This approach is more acceptable in school settings because:

- content uses `wrap_content`
- fields/buttons use `0dp` width between constraints
- layout remains adaptive across screen sizes
- no hardcoded box height is required for most components

---

## 4. Form Layout with Split Rows and Output Area

### Target Structure

The fourth image shows a simple form-like structure:

```text
+----------------------------------+
|               TEXT               |
+----------------+-----------------+
|      TEXT      |    EDIT TEXT    |
+----------------+-----------------+
|      TEXT      |    EDIT TEXT    |
+----------------+-----------------+
|             BUTTON               |
+----------------------------------+
|                                  |
|                                  |
|          LARGE EMPTY AREA        |
|                                  |
+----------------------------------+
```

### Concept Focus

- Full-width rows
- Two-column split using a guideline
- Stacked vertical sections
- Large bottom area constrained to remaining space
- No fixed heights

### Layout Strategy

Use:

- one **vertical guideline** at 50% for the two middle rows
- horizontal guidelines to divide the page into flexible bands
- several stacked views constrained top-to-bottom
- bottom result area stretched with `0dp` height

### Step-by-Step

#### 1. Create the parent and guidelines

```xml
<androidx.constraintlayout.widget.ConstraintLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:padding="8dp">

    <androidx.constraintlayout.widget.Guideline
        android:id="@+id/centerGuide"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        app:layout_constraintGuide_percent="0.47"/>

    <androidx.constraintlayout.widget.Guideline
        android:id="@+id/gHeaderBottom"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        app:layout_constraintGuide_percent="0.16"/>

    <androidx.constraintlayout.widget.Guideline
        android:id="@+id/gRow1Bottom"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        app:layout_constraintGuide_percent="0.34"/>

    <androidx.constraintlayout.widget.Guideline
        android:id="@+id/gRow2Bottom"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        app:layout_constraintGuide_percent="0.51"/>

    <androidx.constraintlayout.widget.Guideline
        android:id="@+id/gButtonBottom"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        app:layout_constraintGuide_percent="0.70"/>
```

This creates flexible regions without fixed row heights.

---

#### 2. Add the top full-width header

```xml
<TextView
    android:id="@+id/headerText"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:gravity="center"
    android:text="TEXT"
    android:textStyle="bold"
    android:textSize="24sp"
    android:background="#DDDDDD"
    android:textColor="#000000"

    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintBottom_toTopOf="@id/gHeaderBottom"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```

---

#### 3. First split row: label + input

```xml
<TextView
    android:id="@+id/label1"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:gravity="center"
    android:text="TEXT"
    android:textStyle="bold"
    android:textSize="20sp"
    android:background="#DDDDDD"
    android:textColor="#000000"

    app:layout_constraintTop_toBottomOf="@id/gHeaderBottom"
    app:layout_constraintBottom_toTopOf="@id/gRow1Bottom"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toStartOf="@id/centerGuide"/>

<EditText
    android:id="@+id/input1"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:gravity="center"
    android:hint="EDIT TEXT"
    android:textStyle="bold"
    android:textSize="20sp"
    android:background="#DDDDDD"
    android:textColor="#000000"
    android:inputType="text"

    app:layout_constraintTop_toBottomOf="@id/gHeaderBottom"
    app:layout_constraintBottom_toTopOf="@id/gRow1Bottom"
    app:layout_constraintStart_toEndOf="@id/centerGuide"
    app:layout_constraintEnd_toEndOf="parent"/>
```

---

#### 4. Second split row: same pattern

```xml
<TextView
    android:id="@+id/label2"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:gravity="center"
    android:text="TEXT"
    android:textStyle="bold"
    android:textSize="20sp"
    android:background="#DDDDDD"
    android:textColor="#000000"

    app:layout_constraintTop_toBottomOf="@id/gRow1Bottom"
    app:layout_constraintBottom_toTopOf="@id/gRow2Bottom"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toStartOf="@id/centerGuide"/>

<EditText
    android:id="@+id/input2"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:gravity="center"
    android:hint="EDIT TEXT"
    android:textStyle="bold"
    android:textSize="20sp"
    android:background="#DDDDDD"
    android:textColor="#000000"
    android:inputType="text"

    app:layout_constraintTop_toBottomOf="@id/gRow1Bottom"
    app:layout_constraintBottom_toTopOf="@id/gRow2Bottom"
    app:layout_constraintStart_toEndOf="@id/centerGuide"
    app:layout_constraintEnd_toEndOf="parent"/>
```

---

#### 5. Add the full-width button row

```xml
<Button
    android:id="@+id/actionButton"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:text="BUTTON"
    android:textStyle="bold"
    android:textSize="20sp"
    android:backgroundTint="#DDDDDD"
    android:textColor="#000000"

    app:layout_constraintTop_toBottomOf="@id/gRow2Bottom"
    app:layout_constraintBottom_toTopOf="@id/gButtonBottom"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```

---

#### 6. Add the large bottom area

```xml
<TextView
    android:id="@+id/outputArea"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:gravity="top|start"
    android:background="#DDDDDD"
    android:textColor="#000000"
    android:padding="16dp"

    app:layout_constraintTop_toBottomOf="@id/gButtonBottom"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintBottom_toBottomOf="parent"/>
```

This bottom area fills the remaining space automatically because:

- height is `0dp`
- it is constrained from the button region down to the parent bottom

---

### Full Example Layout

```xml
<androidx.constraintlayout.widget.ConstraintLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:padding="8dp">

    <androidx.constraintlayout.widget.Guideline
        android:id="@+id/centerGuide"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        app:layout_constraintGuide_percent="0.47"/>

    <androidx.constraintlayout.widget.Guideline
        android:id="@+id/gHeaderBottom"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        app:layout_constraintGuide_percent="0.16"/>

    <androidx.constraintlayout.widget.Guideline
        android:id="@+id/gRow1Bottom"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        app:layout_constraintGuide_percent="0.34"/>

    <androidx.constraintlayout.widget.Guideline
        android:id="@+id/gRow2Bottom"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        app:layout_constraintGuide_percent="0.51"/>

    <androidx.constraintlayout.widget.Guideline
        android:id="@+id/gButtonBottom"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        app:layout_constraintGuide_percent="0.70"/>

    <TextView
        android:id="@+id/headerText"
        android:layout_width="0dp"
        android:layout_height="0dp"
        android:background="#DDDDDD"
        android:gravity="center"
        android:text="TEXT"
        android:textColor="#000000"
        android:textSize="24sp"
        android:textStyle="bold"

        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintBottom_toTopOf="@id/gHeaderBottom"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toEndOf="parent"/>

    <TextView
        android:id="@+id/label1"
        android:layout_width="0dp"
        android:layout_height="0dp"
        android:background="#DDDDDD"
        android:gravity="center"
        android:text="TEXT"
        android:textColor="#000000"
        android:textSize="20sp"
        android:textStyle="bold"

        app:layout_constraintTop_toBottomOf="@id/gHeaderBottom"
        app:layout_constraintBottom_toTopOf="@id/gRow1Bottom"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toStartOf="@id/centerGuide"/>

    <EditText
        android:id="@+id/input1"
        android:layout_width="0dp"
        android:layout_height="0dp"
        android:background="#DDDDDD"
        android:gravity="center"
        android:hint="EDIT TEXT"
        android:inputType="text"
        android:textColor="#000000"
        android:textSize="20sp"
        android:textStyle="bold"

        app:layout_constraintTop_toBottomOf="@id/gHeaderBottom"
        app:layout_constraintBottom_toTopOf="@id/gRow1Bottom"
        app:layout_constraintStart_toEndOf="@id/centerGuide"
        app:layout_constraintEnd_toEndOf="parent"/>

    <TextView
        android:id="@+id/label2"
        android:layout_width="0dp"
        android:layout_height="0dp"
        android:background="#DDDDDD"
        android:gravity="center"
        android:text="TEXT"
        android:textColor="#000000"
        android:textSize="20sp"
        android:textStyle="bold"

        app:layout_constraintTop_toBottomOf="@id/gRow1Bottom"
        app:layout_constraintBottom_toTopOf="@id/gRow2Bottom"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toStartOf="@id/centerGuide"/>

    <EditText
        android:id="@+id/input2"
        android:layout_width="0dp"
        android:layout_height="0dp"
        android:background="#DDDDDD"
        android:gravity="center"
        android:hint="EDIT TEXT"
        android:inputType="text"
        android:textColor="#000000"
        android:textSize="20sp"
        android:textStyle="bold"

        app:layout_constraintTop_toBottomOf="@id/gRow1Bottom"
        app:layout_constraintBottom_toTopOf="@id/gRow2Bottom"
        app:layout_constraintStart_toEndOf="@id/centerGuide"
        app:layout_constraintEnd_toEndOf="parent"/>

    <Button
        android:id="@+id/actionButton"
        android:layout_width="0dp"
        android:layout_height="0dp"
        android:backgroundTint="#DDDDDD"
        android:text="BUTTON"
        android:textColor="#000000"
        android:textSize="20sp"
        android:textStyle="bold"

        app:layout_constraintTop_toBottomOf="@id/gRow2Bottom"
        app:layout_constraintBottom_toTopOf="@id/gButtonBottom"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toEndOf="parent"/>

    <TextView
        android:id="@+id/outputArea"
        android:layout_width="0dp"
        android:layout_height="0dp"
        android:background="#DDDDDD"
        android:gravity="top|start"
        android:padding="16dp"
        android:textColor="#000000"

        app:layout_constraintTop_toBottomOf="@id/gButtonBottom"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintBottom_toBottomOf="parent"/>

</androidx.constraintlayout.widget.ConstraintLayout>
```

***This form layout demonstrates several core ConstraintLayout patterns at once:***

| Pattern | Purpose |
|---|---|
| `Guideline` at 50% | creates a clean two-column split |
| horizontal percent guidelines | create rows without fixed heights |
| `0dp` width | allows row elements to stretch between constraints |
| `0dp` height | allows sections to fill constrained regions |
| stacked constraints | create predictable vertical structure |
| full-width controls | useful for headers, buttons, and result panels |

### Exam-Relevant Insight

***This example is especially useful for exams because it combines:***

- **guidelines**
- **match constraints (`0dp`)**
- **top-to-bottom view relationships**
- **responsive resizing without nested layouts**
- **no fixed heights or widths for the main structure**

It is a strong demonstration of how a structured form can be built in a single `ConstraintLayout`.

---

## Common School-Safe Sizing Patterns

| Situation | Preferred approach |
|---|---|
| full-width element | `layout_width="0dp"` + start/end constraints |
| full-height region | `layout_height="0dp"` + top/bottom constraints |
| text label | `wrap_content` |
| equal screen split | guideline with percent |
| proportional box | `layout_constraintDimensionRatio` |
| flexible row | chain + `0dp` widths |

### Pattern Example

```xml
<TextView
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent"/>
```

```xml
<Button
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```

```xml
<View
    android:layout_width="0dp"
    android:layout_height="0dp"
    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent"/>
```

---

## Key Learning from the Tutorial

| Technique | When to Use |
|---|---|
| Chains | distribute elements evenly |
| `0dp` (match constraints) | flexible sizing |
| Margins | spacing between elements |
| Top-to-bottom constraints | vertical flow |
| Start/End constraints | centering |
| Guidelines | divide areas cleanly |
| Dimension ratio | preserve proportions without fixed size |
| Bottom constraint with `0dp` height | fill remaining space |

---

## Final Insight

All four designs demonstrate the same principle:

> Complex layouts are built by **combining simple constraints**, not by nesting layouts and not by relying on fixed sizes.

Mastering this mindset is essential for efficient Android UI development.
