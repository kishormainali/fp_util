# FPUtil

- Utilities and Extensions for num, BuildContext, EdgeInsets, File, String. Constants for horizontal and vertical spacing.
- Social Buttons - Facebook, Google, Apple
- Common Buttons - AppButton, AppOutlineButton, AppTextButton supports loading and disabled state and highly customizable.
- ImagePickerHelper for picking images and files

> if your figma size is different from Size() then make sure to call    ```SizeUtils.instance.updateDesignSize(size)``` on main method;

## Constants

##### Vertical Spacing

 ```dart

import 'package:flutter/material.dart';

class SpacingTest extends StatelessWidget {
  const SpacingTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [

        /// 4px vertical space
        Sizes.gapV4(true /* set true if you want responsiveness*/),

        /// 8px vertical space
        Sizes.gapV8(true /* set true if you want responsiveness*/),

        /// 12px vertical space
        Sizes.gapV12(true /* set true if you want responsiveness*/),

        /// 16px vertical space
        Sizes.gapV16(true /* set true if you want responsiveness*/),

        /// 24px vertical space
        Sizes.gapV24(true /* set true if you want responsiveness*/),

        /// 32px vertical space
        Sizes.gapV32(true /* set true if you want responsiveness*/),

        /// 48px vertical space
        Sizes.gapV48(true /* set true if you want responsiveness*/),

        /// 54px vertical space
        Sizes.gapV54(true /* set true if you want responsiveness*/),

        /// 64px vertical space
        Sizes.gapV64(true /* set true if you want responsiveness*/),
      ],
    );
  }
}
```

##### Horizontal Spacing

  ```dart

import 'package:flutter/material.dart';

class SpacingTest extends StatelessWidget {
  const SpacingTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [

        /// 4px horizontal space
        Sizes.gapH4(true /* set true if you want responsiveness*/),

        /// 8px horizontal space
        Sizes.gapH8(true /* set true if you want responsiveness*/),

        /// 12px horizontal space
        Sizes.gapH12(true /* set true if you want responsiveness*/),

        /// 16px horizontal space
        Sizes.gapH16(true /* set true if you want responsiveness*/),

        /// 24px horizontal space
        Sizes.gapH24(true /* set true if you want responsiveness*/),

        /// 32px horizontal space
        Sizes.gapH32(true /* set true if you want responsiveness*/),

        /// 48px horizontal space
        Sizes.gapH48(true /* set true if you want responsiveness*/),

        /// 54px horizontal space
        Sizes.gapH54(true /* set true if you want responsiveness*/),

        /// 64px horizontal space
        Sizes.gapH64(true /* set true if you want responsiveness*/),
      ],
    );
  }
}
```

## Extensions

#### String Extensions

```dart

String text = 'hello world';

/// capitalize first letter of string
final capitalize = text.capitalize;

/// checks given string is null or empty
bool isNullOrEmpty = text.isNullOrEmpty;

/// checks given text is not null and not empty
bool isNotNullNotEmpty = text.isNotNullNotEmpty;

/// checks given string is blank
bool isBlank = text.isBlank;

/// checks given string os not blank
bool isNotBlank = text.isNotBlank;

/// checks string is email
bool isEmail = text.isEmail;

/// returns default value is given string is blank
String withDefault = text.getOrDefault('default value');

/// return null if given string is nullOrEmpty
String? withNull = text.getOrNull();

/// checks string is valid phone number
bool isPhoneNumber = text.isValidPhoneNumber;

/// checks string is number
bool isNumeric = text.isNumeric;

/// removes whitespace from string
String removeWhiteSpace = text.removeWhiteSpace;

/// removes \n from string
String removeNextLine = text.removeNextLine;

/// converts to bool
bool? isBool = text.toBool;

/// converts to int
int? isInt = text.isInt;

/// converts to double
double? isDouble = text.toDouble;

/// check string is valid url
bool isUrl = text.isUrl;

/// check string is image  path
bool isImage = text.isImage;

/// checks string is video path
bool isVideo = text.isVideo;

/// checks string is audio path
bool isAudio = text.isAudio;

/// checks string is pdf path
bool isPdf = text.isPdf;

/// checks string is text path
bool isText = text.isTxt;

/// checks string is office word file
bool isDocx = text.isDocx;

/// checks string is office excel
bool isXls = text.isXls;

/// checks string is office presentation file
bool isPpt = text.isPpt;

/// checks string is svg path
bool isSvg = text.isSvg;

/// checks string is xml file path
bool isXml = text.isXml;

/// checks string is file path
bool isFile = text.isFile;

```

### Num Extensions

- #### verticalSpace

Created SizedBox with Height

###### Usage:

```dart
import 'package:flutter/material.dart';

class SpacingYTest extends StatelessWidget {
  const SpacingYTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Text 1'),
        10.verticalSpace(true /* set true if you want responsiveness*/),
        const Text('Text 2'),
      ],
    );
  }
}
```

-  #### horizontalSpace

Created SizedBox with Width

###### Usage:

```dart
import 'package:flutter/material.dart';

class SpacingXTest extends StatelessWidget {
  const SpacingXTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Text 1'),
        10.horizontalSpace(true /* set true if you want responsiveness*/),
        const Text('Text 2'),
      ],
    );
  }
}
```

- ##### Duration
  - microseconds
  - milliseconds
  - seconds
  - minutes
  - hours
  - days
```dart

/// Creates Duration on microseconds
final duration = 10.microseconds;

/// Creates Duration on milliseconds
final duration = 10.milliseconds;

/// Creates Duration on seconds
final duration = 10.seconds;

/// Creates Duration on minutes
final duration = 10.minutes;

/// Creates Duration on hours
final duration = 10.hours;

/// Creates Duration on days
final duration = 10.days;

```


- ##### Delayed Duration
  - delayedMicroSeconds
  - delayedMilliSeconds
  - delayedSeconds
  - delayedMinutes
  - delayedHours

```dart

/// Creates Future of Duration on microseconds
final duration = 10.delayedMicroSeconds;

/// Creates Future of Duration on milliseconds
final duration = 10.delayedMilliseconds;

/// Creates Future of Duration on seconds
final duration = 10.delayedSeconds;

/// Creates Future of Duration on minutes
final duration = 10.delayedMinutes;

/// Creates Future of Duration on hours
final duration = 10.delayedHours;


```


- ##### circularBorderRadius

Created Circular Border Radius

```dart
import 'package:flutter/material.dart';

class RadiusTest extends StatelessWidget {
  const RadiusTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        /// creates 10px rounded corner
        borderRadius: 10.circularBorderRadius(true /* set true if you want responsiveness*/),
      ),
    );
  }
}
```

- ##### circularRadius

Created Circular Radius

```dart
import 'package:flutter/material.dart';

class RadiusTest extends StatelessWidget {
  const RadiusTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        /// creates 10px rounded corner for topLeft and topRight
        borderRadius: BorderRadius.only(topLeft: 10.circularRadius(true /* set true if you want responsiveness*/), 
        topRight: 10.circularRadius(true /* set true if you want responsiveness*/),),),
    );
  }
}
```

- ##### EdgeInsets

    - all
    - padLeft
    - padRight
    - padTop
    - padBottom
    - padX
    - padY

```dart
import 'package:flutter/material.dart';

class EdgeInsetsTest extends StatelessWidget {
  const EdgeInsetsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// creates padding with 10px all
        Padding(padding: 10.all(true /* set true if you want responsiveness*/)),

        /// creates padding with 10px top only
        Padding(padding: 10.padTop(true /* set true if you want responsiveness*/)),

        /// creates padding with 10px right only
        Padding(padding: 10.padRight(true /* set true if you want responsiveness*/)),

        /// creates padding with 10px bottom only
        Padding(padding: 10.padBottom(true /* set true if you want responsiveness*/)),

        /// creates padding with 10px left only
        Padding(padding: 10.padLeft(true /* set true if you want responsiveness*/)),

        /// creates padding with 10px horizontal
        Padding(padding: 10.padX(true /* set true if you want responsiveness*/)),

        /// creates padding with 10px vertical
        Padding(padding: 10.padY(true /* set true if you want responsiveness*/)),
      ],
    );
  }
}

```

- ##### sliverVerticalSpace

Creates SizedBox with height converted to sliver

```dart
import 'package:flutter/material.dart';

class SliverSpaceY extends StatelessWidget {
  const SliverSpaceY({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(/*children*/),
        10.sliverVerticalSpace(true /* set true if you want responsiveness*/),
        SliverList(/*children*/)
      ],
    );
  }
}

```

- ##### sliverHorizontalSpace

Creates SizedBox with width converted to sliver

```dart

import 'package:flutter/material.dart';

class SliverSpaceX extends StatelessWidget {
  const SliverSpaceX({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: [
        SliverPadding(padding: 10.all(true /* set true if you want responsiveness*/)),
        10.sliverHorizontalSpace,
        SliverPadding(padding: 10.all(true /* set true if you want responsiveness*/)),
      ],
    );
  }
}
```

### Widget Extensions

- #### scrollable()

Make widgets scrollable

```dart
import 'package:flutter/material.dart';

class ScrollableTest extends StatelessWidget {
  const ScrollableTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Text 1'),
        Text('Text 2'),
        Text('Text 3'),
      ],
    ).scrollable();
  }
}
```

- #### clickable()

Make widgets clickable

```dart
import 'package:flutter/material.dart';

class ClickableTest extends StatelessWidget {
  const ClickableTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Text 1'),
        Text('Text 2'),
        Text('Text 3'),
      ],
    ).clickable(onTap: () {
      /*
      * onTap Callback
      * */
    },);
  }
}
```

- #### center()

Align widgets to center

```dart
import 'package:flutter/material.dart';

class CenterTest extends StatelessWidget {
  const CenterTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Text 1').center(),
        Text('Text 2').center(),
        Text('Text 3').center(),
      ],
    );
  }
}
```

- #### Align
  - alignTopLeft()
  - alignTopCenter()
  - alignTopRight()
  - alignCenterLeft()
  - alignCenterRight()
  - alignBottomLeft()
  - alignBottomCenter()
  - alignBottomRight()

Create Align widgets

```dart

import 'package:flutter/material.dart';

class AlignTest extends StatelessWidget {
  const AlignTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// align top left
        const Text('Text 1').alignTopLeft(),

        /// align top center
        const Text('Text 1').alignTopCenter(),

        /// align top right
        const Text('Text 1').alignTopRight(),

        /// align center left
        const Text('Text 1').alignCenterLeft(),

        /// align center
        const Text('Text 1').center(),

        /// align center right
        const Text('Text 1').alignCenterRight(),

        /// align bottom left
        const Text('Text 1').alignBottomLeft(),

        /// align bottom center
        const Text('Text 1').alignBottomCenter(),

        /// align bottom right
        const Text('Text 1').alignBottomRight(),
      ],
    );
  }
}
```

- #### Padding
  - pad 
  - padX
  - padY 
  - padLeft 
  - padTop
  - padRight
  - padBottom 
  - padLTRB

Wraps with padding widget

```dart

import 'package:flutter/material.dart';

class PaddingTest extends StatelessWidget {
  const PaddingTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// wraps with all padding
        const Text('Text 1').pad(10,responsive:true /* set true if you want responsiveness */),

        /// wraps with left only padding
        const Text('Text 1').padLeft(10,responsive:true /* set true if you want responsiveness */),

        /// wraps with right only padding
        const Text('Text 1').padRight(10,responsive:true /* set true if you want responsiveness */),

        /// wraps with bottom only padding
        const Text('Text 1').padBottom(10,responsive:true /* set true if you want responsiveness */),

        /// wraps with top only padding
        const Text('Text 1').padTop(10,responsive:true /* set true if you want responsiveness */),

        /// wraps with horizontal padding
        const Text('Text 1').padX(10,responsive:true /* set true if you want responsiveness */),

        /// wraps width vertical padding
        const Text('Text 1').padY(10,responsive:true /* set true if you want responsiveness */),

        /// wraps widget with padding of left top right bottom
        const Text('Text 1').padLTRB(left: 10, top: 5, right: 10, bottom: 10,responsive:true /* set true if you want responsiveness */),

      ],
    );
  }
}
```


### Context Extensions

- #### theme
- #### colorScheme
- #### textTheme
  - displayLarge
  - displayMedium
  - displaySmall
  - headlineLarge
  - headlineMedium
  - headlineSmall
  - titleLarge
  - titleMedium
  - titleSmall
  - labelLarge
  - labelMedium
  - labelSmall
  - bodyLarge
  - bodyMedium
  - bodySmall
- #### size
  - width 
  - height
  - percentWidth
  - percentHeight
- #### Focus
  - removeFocus
  - hasFocus
- #### EdgeInsets
  - padding
  - viewInsets
  - viewPadding
- #### MediaQuery
  - mq
- #### Responsive Value
  - responsiveValue

```dart
  final theme = context.theme;
  final colorScheme = context.colorScheme;

  /// display text styles
  final displayLarge = context.displayLarge;
  final displayMedium = context.displayMedium;
  final displaySmall = context.displaySmall;

  /// headline style
  final headlineLarge = context.headlineLarge;
  final headlineMedium = context.headlineMedium;
  final headlineSmall = context.headlineSmall;

   /// title style
  final titleLarge = context.titleLarge;
  final titleMedium = context.titleMedium;
  final titleSmall = context.titleSmall;

   /// label style
  final labelLarge = context.labelLarge;
  final labelMedium = context.labelMedium;
  final labelSmall = context.labelSmall;

   /// body style
  final bodyLarge = context.bodyLarge;
  final bodyMedium = context.bodyMedium;
  final bodySmall = context.bodySmall;

  /// sizes
  final width = context.width(true /* set true if you want responsiveness */);
  final height = context.height(true /* set true if you want responsiveness */);

  /// 1% of screen width
  final widthPercentage = context.pw(.1,true /* set true if you want responsiveness */);

  /// 1% of screen height
  final heightPercentage = context.ph(.4,true /* set true if you want responsiveness */);

  /// remove focus / hide keyboard
  context.removeFocus();

  /// check is keyboard is open
  context.hasFocus;

  /// padding
  /// The parts of the display that are partially obscured by system UI, 
  /// typically by the hardware display "notches" or the system status bar.
  /// for more check [MediaQuery.of(context).padding]
  context.padding;

  /// view insets
  /// The parts of the display that are completely obscured by system UI, 
  /// typically by the device's keyboard.
  /// for more check [MediaQuery.of(context).viewInsets]
  context.viewInsets;

  /// view padding
  /// The parts of the display that are partially obscured by system UI, 
  /// typically by the hardware display "notches" or the system status bar.
  /// for more check [MediaQuery.of(context).viewPadding]
  context.viewPadding;

  /// media query
  context.mq;

  /// responsive value according to device type
  final rValue = context.responsiveValue<double>(10,desktop:30,tablet:20);

```


## FPSnacbar
 helper class for showing snackbars

- ### Variants
  - #### Success
    Snackbar for success messages
    ```dart
       FPSnackbar.success(
            context,
            title: 'Title',
            message: 'User created successfully',
          );
    ```
  - #### Error
    Snackbar for error messages
    ```dart
       FPSnackbar.error(
            context,
            title: 'Title',
            message: 'Something went wrong!',
          );
    ```
 - #### Info
    Snackbar for info messages
    ```dart
       FPSnackbar.info(
            context,
            title: 'Title',
            message: 'Some informative message',
          );
    ```
  - #### Warning
    Snackbar for warning messages
    ```dart
       FPSnackbar.warning(
            context,
            title: 'Title',
            message: 'Warning message',
          );
    ```
  - #### Custom
    Snackbar for custom snackbars
    ```dart
       FPSnackbar.custom(
            context,
            title: 'Create User',
            message: 'message',
            backgroundColor: Colors.redAccent.shade100,
            sideBarColor: Colors.red,
            textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            titleTextStyle: const TextStyle(fontSize: 18),
            icon: const Icon(Icons.check),
            duration: 4,
          );
    ```