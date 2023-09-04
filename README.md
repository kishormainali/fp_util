# FPUtil

- Utilities and Extensions for num, BuildContext, EdgeInsets, File, String. Constants for horizontal and vertical spacing.
- Social Buttons - Facebook, Google, Apple
- Gradient Button
- ImagePickerHelper for picking images and files

> if your figma size is different from Size() then make sure to call `SizeUtils.instance.updateDesignSize(size)` on main method;

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
       Sizes.gapV4,

       /// 8px vertical space
       Sizes.gapV8,

       /// 12px vertical space
       Sizes.gapV12,

       /// 16px vertical space
       Sizes.gapV16,

       /// 24px vertical space
       Sizes.gapV24,

       /// 32px vertical space
       Sizes.gapV32,

       /// 48px vertical space
       Sizes.gapV48,

       /// 54px vertical space
       Sizes.gapV54,

       /// 64px vertical space
       Sizes.gapV64,
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
      Sizes.gapH4,

      /// 8px horizontal space
      Sizes.gapH8,

      /// 12px horizontal space
      Sizes.gapH12,

      /// 16px horizontal space
      Sizes.gapH16,

      /// 24px horizontal space
      Sizes.gapH24,

      /// 32px horizontal space
      Sizes.gapH32,

      /// 48px horizontal space
      Sizes.gapH48,

      /// 54px horizontal space
      Sizes.gapH54,

      /// 64px horizontal space
      Sizes.gapH64,
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


/// recase extensions

/// snakeCase
String snakeCase = text.snakeCase;

/// capitalize
String capitalize  = text.capitalize;

/// camelCase
String camelCase = text.camelCase;


/// constantCase
String constantCase = text.constantCase;

/// sentenceCase
String sentenceCase = text.sentenceCase;

/// snakeCase
String snakeCase = text.snakeCase;

/// dotCase
String dotCase = text.dotCase;

/// paramCase
String paramCase = text.paramCase;

/// pathCase
String pathCase = text.pathCase;

/// pascalCase
String pascalCase = text.pascalCase;

/// headerCase
String headerCase = text.headerCase;

/// titleCase
String titleCase = text.titleCase;

/// lowercase
String lowercase = text.lowercase;

/// uppercase
String uppercase = text.uppercase;



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
        10.verticalSpace,
        const Text('Text 2'),
      ],
    );
  }
}
```

- #### horizontalSpace

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
        10.horizontalSpace,
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
  - delayedMicroSeconds()
  - delayedMilliSeconds()
  - delayedSeconds()
  - delayedMinutes()
  - delayedHours()

```dart

/// Creates Future of Duration on microseconds
final duration = 10.delayedMicroSeconds(()async{
  // optional callback
});

/// Creates Future of Duration on milliseconds
final duration = 10.delayedMilliseconds(()async{
  // optional callback
});

/// Creates Future of Duration on seconds
final duration = 10.delayedSeconds(()async{
  // optional callback
});

/// Creates Future of Duration on minutes
final duration = 10.delayedMinutes(()async{
  // optional callback
});

/// Creates Future of Duration on hours
final duration = 10.delayedHours(()async{
  // optional callback
});


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
        borderRadius: 10.circularBorderRadius,
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
        borderRadius: BorderRadius.only(topLeft: 10.circularRadius,
        topRight: 10.circularRadius,),),
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
        Padding(padding: 10.all),

        /// creates padding with 10px top only
        Padding(padding: 10.padTop),

        /// creates padding with 10px right only
        Padding(padding: 10.padRight),

        /// creates padding with 10px bottom only
        Padding(padding: 10.padBottom),

        /// creates padding with 10px left only
        Padding(padding: 10.padLeft),

        /// creates padding with 10px horizontal
        Padding(padding: 10.padX),

        /// creates padding with 10px vertical
        Padding(padding: 10.padY),
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
        10.sliverVerticalSpace,
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
        SliverPadding(padding: 10.all),
        10.sliverHorizontalSpace,
        SliverPadding(padding: 10.all),
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
        const Text('Text 1').pad(10),

        /// wraps with left only padding
        const Text('Text 1').padLeft(10),

        /// wraps with right only padding
        const Text('Text 1').padRight(10),

        /// wraps with bottom only padding
        const Text('Text 1').padBottom(10),

        /// wraps with top only padding
        const Text('Text 1').padTop(10),

        /// wraps with horizontal padding
        const Text('Text 1').padX(10),

        /// wraps width vertical padding
        const Text('Text 1').padY(10),

        /// wraps widget with padding of left top right bottom
        const Text('Text 1').padLTRB(left: 10, top: 5, right: 10, bottom: 10),

      ],
    );
  }
}
```

### Context Extensions

- #### theme
- #### colorScheme

  - primaryColor
  - onPrimaryColor
  - primaryContainerColor
  - onPrimaryContainerColor

  /// secondary colors

  - secondaryColor
  - onSecondaryColor
  - secondaryContainerColor
  - onSecondaryContainerColor

  /// tertiary color

  - tertiaryColor
  - onTertiaryColor
  - tertiaryContainerColor
  - onTertiaryContainerColor

  /// surface color

  - surfaceColor
  - onSurfaceColor

  /// surface variant color

  - surfaceVariantColor
  - onSurfaceVariantColor

  /// inverse colors

  - inverseSurfaceColor
  - onInverseSurfaceColor

  /// background color

  - backgroundColor
  - onBackgroundContainerColor

  /// outline color

  - outlineColor
  - outlineVariantColor

  /// error colors

  - errorColor
  - onErrorColor
  - errorContainerColor
  - onErrorContainerColor

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

- #### Platform Brightness
  - platformBrightness

- #### Keyboard Height
  - keyboardHeight

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


/// colors
final Color primaryColor = context.primaryColor;
final Color onPrimaryColor = context.onPrimaryColor;
final Color primaryContainerColor = context.primaryContainerColor;
final Color onPrimaryContainerColor = context.onPrimaryContainerColor;

/// secondary colors
final Color secondaryColor = context.secondaryColor;
final Color onSecondaryColor = context.onSecondaryColor;
final Color secondaryContainerColor = context.secondaryContainerColor;
final Color onSecondaryContainerColor => colorScheme.onSecondaryContainer;

/// tertiary color
final Color tertiaryColor = context.tertiaryColor;
final Color onTertiaryColor = context.onTertiaryColor;
final Color tertiaryContainerColor = context.tertiaryContainerColor;
final Color onTertiaryContainerColor = context.onTertiaryContainerColor;

/// surface color
final Color surfaceColor = context.surfaceColor;
final Color onSurfaceColor = context.onSurfaceColor;

/// surface variant color
final Color surfaceVariantColor = context.surfaceVariantColor;
final Color onSurfaceVariantColor = context.onSurfaceVariantColor;

/// inverse colors
final Color inverseSurfaceColor = context.inverseSurfaceColor;
final Color onInverseSurfaceColor = context.onInverseSurfaceColor;

/// background color
final Color backgroundColor = context.backgroundColor;
final Color onBackgroundContainerColor = context.onBackgroundContainerColor;

/// outline color
final Color outlineColor = context.outlineColor;
final Color outlineVariantColor = context.outlineVariantColor;

/// error colors
final Color errorColor = context.errorColor;
final Color onErrorColor = context.onErrorColor;
final Color errorContainerColor = context.errorContainerColor;
final Color onErrorContainerColor = context.onErrorContainerColor;


  /// sizes
  final width = context.width;
  final height = context.height;

  /// 1% of screen width
  final widthPercentage = context.pw(.1);

  /// 1% of screen height
  final heightPercentage = context.ph(.4);

  /// remove focus / hide keyboard
  context.removeFocus();

  /// check is keyboard is open
  context.hasFocus;

  /// padding
  /// The parts of the display that are partially obscured by system UI,
  /// typically by the hardware display "notches" or the system status bar.
  /// for more check [MediaQuery.paddingOf(context)]
  context.padding;

  /// view insets
  /// The parts of the display that are completely obscured by system UI,
  /// typically by the device's keyboard.
  /// for more check [MediaQuery.viewInsetsOf(context)]
  context.viewInsets;

  /// view padding
  /// The parts of the display that are partially obscured by system UI,
  /// typically by the hardware display "notches" or the system status bar.
  /// for more check [MediaQuery.viewPaddingOf(context)]
  context.viewPadding;

  /// media query
  context.mq;

  /// platform brightness
  /// returns platform brightness using [MediaQuery.platformBrightnessOf(context)]
  context.platformBrightness


  /// keyboard height
  /// returns the space occupied by keyboard i.e. [MediaQuery.viewInsetsOf(context).bottom]
  context.keyboardHeight


  /// responsive value according to device type
  final rValue = context.responsiveValue<double>(10,desktop:30,tablet:20);

```

## FPSnackbar

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
          color:(light:Colors.blue,dark:Colors.green,bar:Colors.red)
          textStyle: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
          titleTextStyle: const TextStyle(fontSize: 18),
          icon: const Icon(Icons.check),
          duration: 4,
        );
  ```
