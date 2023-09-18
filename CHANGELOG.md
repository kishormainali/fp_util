# 1.2.8
- fixed timeAgo displaying negative date
- added formatParse extension method on DateTime

# 1.2.7
- added `match` method in `FormField`
- fixed `withValidator` adding duplicate validators
- added `timeAgo()` extension on DateTime
- added `parseAndFormat` string extension to parse date string and format it


# 1.2.6
- added platformBrightness extension to `BuildContext`
- minor fixes


# 1.2.5
- added missing textstyle property to ImagePickerButton
# 1.2.4
- added `GradientButton`
- updated `ImagePickerButton` to support gradient
- refactored `ImagePickerButton`

# 1.2.3
- added `onLimitExceed` to ImagePickerButton

# 1.2.2
- added `ImagePickerButton`

# 1.2.1
- added `ScrollableColumn` and `ScrollableRow` widget
- updated docs
- updated field validators

# 1.2.0
- removed `showPlatformDialog` in favor of `showAdaptiveDialog` from flutter, please see flutter 3.13 docs for more on this
- export XFile class from image picker
- removed `BasicDialog` in favor of AlertDialog.adaptive() from flutter, please see flutter 3.13 docs for more on this

# 1.1.3
- added recase extensions on String
- updated EdgeInsets extensions

# 1.1.2
- added `ConditionalWidget` for conditional rendering

# 1.1.1
- added HideKeyboard widget and extension
- added `themedValue` extension on BuildContext
# 1.1.0
BREAKING CHANGES:
- removed responsive parameter from all the extension functions
- changed extension methods into getters
- renamed `removeNextLineSpace` with `replaceNextLine`
- added boolean const
- updated size const
- added `Map<String,dynamic> extra` field to FormField

# 1.0.18
- added removeNextLineSpace extension on String
# 1.0.17
- added platformModalSheet
- added basic dialog and bottom sheet
- updated dialog actions data
# 1.0.16
- updated validator
- fixed form field to support [MatchValidator]
- added pickMedia and pickMultiMedia methods to [ImagePickerHelper]

# 1.0.15
- fixed validator showing previous error message

# 1.0.14
- removed buttons
# 1.0.13+1
- updated usage of MediaQuery.of(context).size with MediaQuery.sizeOf(context)
- updated usage of MediaQuery.of(context).padding with MediaQuery.paddingOf(context)
- updated usage of MediaQuery.of(context).viewPadding with MediaQuery.viewPaddingOf(context)
- updated usage of MediaQuery.of(context).viewInsets with MediaQuery.viewInsetsOf(context)

# 1.0.13
- moved to separate repository
- removed async_status
- added form_status

# 1.0.12
- added colorScheme properties extensions on BuildContext
- added support to pick specific size file from ImagePickerHelper
- updated snackbar width for tablet and desktop

# 1.0.11
- added common buttons
- updated social buttons
- updated snackbar
- added custom network image
- added svg image

# 1.0.10
- update extensions
# 1.0.9
-  removed unwanted margin of snackbar content
# 1.0.8
# 1.0.7+1
- update FormField

# 1.0.7
- update FormField
- removed FormStatus use AsyncStatus

# 1.0.6
BREAKING CHANGES
- updated FormField
- updated snackbar
- updated image_picker_helper
- added icon property to social button
- added snackbar docs

# 1.0.5
BREAKING CHANGES
- updated FormField
- added AsyncStatus
- added align extensions
- moved ImagePickerHelper to helpers directory

# 1.0.4
BREAKING CHANGES
- added SizeUtils class for responsiveness
- updated extensions to support responsiveness
- refactored size getters to method to support responsiveness


# 1.0.3
- upgrade lower sdk constraints to 3.0.0
- export logger topLevel getter
# 1.0.2
- added context extensions for TextTheme styles
- updated docs
  
# 1.0.1
- downgrade intl version to match flutter_localization sdk
# 1.0.0+1
- lower sdk constraints to 2.19.6
# 1.0.0
- upgrade lower sdk constraints to 3.0.0
- removed some list extensions which exported by dart:core/dart:collection

# 1.0.0-dev.15
- added responsiveValue extension on BuildContext
# 1.0.0-dev.14
- updated min and max length validator
  
# 1.0.0-dev.13
- updated form field
- updated value as required named parameter
  
# 1.0.0-dev.12
# 1.0.0-dev.11
- updated form field
  
# 1.0.0-dev.10
BREAKING CHANGES:
- renamed *spacingX* to *horizontalSpace*
- renamed *spacingY* to *verticalSpace*
- renamed *sliverSpacingX* to *sliverHorizontalSpace*
- renamed *sliverVerticalY* to *sliverVerticalSpace* 


# 1.0.0-dev.9

- added form field types

# 1.0.0-dev.8

- added key as optional parameter for widget extensions
- updated docs

# 1.0.0-dev.7

- added string extensions toInt, toBool and toDouble, isValidPhoneNumber
- added padding extension for widget
- added count options to select limited file for ImagePickerHelper
- added pickMultiImageFromGallery to pick multiple file

# 1.0.0-dev.6

- updated social button properties (side,overlay color)

# 1.0.0-dev.5

- added center and align extension
- added social button

# 1.0.0-dev.4

- updated ScaffoldWrapper

# 1.0.0-dev.3

- added ScaffoldWrapper widget

# 1.0.0-dev.2

- pass static analysis

# 1.0.0-dev.1

- updated snackbar
- added scrollable() and clickable() widget extensions
- added data getter in FormMixin

# 0.0.5

- updated snackbar
- updated form field
- updated validation logic for form field

# 0.0.4+4

- added isXml extension

# 0.0.4+3

# 0.0.4+2

# 0.0.4+1

- updated snackbar

# 0.0.4

- updated snackbar

# 0.0.3

- updated snackbars and dialogs

# 0.0.2+1

- updated extensions

# 0.0.2

- updated extensions

# 0.0.1

- initial release