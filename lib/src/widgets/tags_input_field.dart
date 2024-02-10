import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

typedef TagBuilder = Widget Function(
  Tag tag,
  TagsInputFieldState state,
);

/// {@template tags_input_field}
/// A widget that allows the user to input tags.
/// {@endtemplate}
class TagsInputField extends StatefulWidget {
  /// {@macro tags_input_field}
  const TagsInputField({
    super.key,
    this.focusNode,
    this.controller,
    this.decoration = const TagFieldDecoration(),
    this.initialTags,
    this.onChanged,
    this.separatorKeys = const [',', ';'],
    this.tagBuilder,
    this.editOnClick = false,
    this.addOnFieldSubmitted = true,
    this.keyboardType = TextInputType.visiblePassword,
    this.autofocus = false,
    this.validator,
    this.tagDecoration = const TagDecoration(),
  });

  /// The focus node of the [TagsInputField].
  final FocusNode? focusNode;

  /// The controller of the [TagsInputField].
  final TextEditingController? controller;

  /// The decoration of the [TagsInputField].
  final TagFieldDecoration decoration;

  /// The initial tags of the [TagsInputField].
  final List<Tag>? initialTags;

  /// Called when a tag is either added or removed.
  final ValueChanged<List<Tag>>? onChanged;

  /// The keys that will be used to separate the tags.
  final List<String> separatorKeys;

  /// The custom builder of the tag.
  final TagBuilder? tagBuilder;

  /// Whether the tag should be edited when clicked.
  final bool editOnClick;

  /// Whether a tag should be added when the field is submitted.
  final bool addOnFieldSubmitted;

  /// The keyboard type of the [TagsInputField].
  final TextInputType keyboardType;

  /// Whether the [TagsInputField] should autofocus.
  final bool autofocus;

  /// A validator for the tag.
  final String? Function(Tag tag)? validator;

  /// The decoration of the tag.
  final TagDecoration tagDecoration;

  @override
  TagsInputFieldState createState() => TagsInputFieldState();
}

class TagsInputFieldState extends State<TagsInputField>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _controller;

  late final FocusNode _focusNode;

  final ValueNotifier<List<Tag>> _tags = ValueNotifier<List<Tag>>([]);

  final ValueNotifier<String?> _error = ValueNotifier<String?>(null);

  @override
  void initState() {
    /// Assigning the controller of the widget to _controller. If the widget's controller is null, a new TextEditingController is created.
    _controller = widget.controller ?? TextEditingController();

    /// Assigning the focusNode of the widget to _focusNode. If the widget's focusNode is null, a new FocusNode is created.
    _focusNode = widget.focusNode ?? FocusNode();

    /// If the widget has initial tags, assign them to _tags.
    if (widget.initialTags != null) {
      _tags.value = widget.initialTags!;
    }

    /// Adding a listener to the controller. This listener will be triggered every time the text in the controller changes.
    _controller.addListener(_onTextChanged);
    super.initState();
  }

  /// This method is triggered every time the text in the controller changes.
  void _onTextChanged() {
    // Check if the text in the controller is not empty.
    if (_controller.text.isNotEmpty) {
      // Get the text from the controller.
      final text = _controller.text;
      // Get the last character of the text.
      final lastChar = text.characters.last;
      // Check if the last character is in the list of separator keys.
      if (widget.separatorKeys.contains(lastChar)) {
        // If it is, create a new Tag with the text (excluding the last character) and the last character as the key label, and update the tags.
        _updateTags(Tag(
          value: text.substring(0, text.length - 1),
          keyLabel: lastChar,
        ));
      }
    }
    // Reset the error value to null.
    _error.value = null;
  }

  /// Adds a tag to the [TagsInputField].
  void _updateTags(Tag tag) {
    if (widget.validator != null) {
      _error.value = widget.validator!(tag);
    }
    if (_error.value != null) {
      return;
    }
    _error.value = null;
    _tags.value = [..._tags.value, tag];
    widget.onChanged?.call(_tags.value);
    _controller.clear();
    _focusField();
  }

  /// Removes a tag from the [TagsInputField].
  void removeTag(Tag tag) {
    _tags.value =
        _tags.value.where((element) => element._id != tag._id).toList();
    widget.onChanged?.call(_tags.value);
    if (_tags.value.isEmpty) {
      _focusField();
    }
  }

  /// removes selected tag  from the tags and adds it to the text field
  void editOnClick(Tag tag) {
    if (widget.editOnClick && _controller.text.isBlank) {
      _controller.value = TextEditingValue(
        text: tag.value,
        selection: TextSelection.collapsed(offset: tag.value.length),
      );
      removeTag(tag);
      _focusField();
    } else {
      _error.value = 'Previous tag is not completed';
      _focusField();
    }
  }

  /// Focuses the [TagsInputField].
  void _focusField() {
    if (!_focusNode.hasFocus || !_focusNode.hasPrimaryFocus) {
      _focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _focusNode.requestFocus,
      child: AnimatedBuilder(
        animation: Listenable.merge([_focusNode, _controller, _tags, _error]),
        builder: (context, child) {
          return InputDecorator(
            decoration: widget.decoration.inputDecoration.copyWith(
              errorText: _error.value,
            ),
            child: Wrap(
              direction: widget.decoration.direction,
              alignment: widget.decoration.alignment,
              spacing: widget.decoration.spacing,
              runAlignment: widget.decoration.runAlignment,
              runSpacing: widget.decoration.runSpacing,
              crossAxisAlignment: widget.decoration.crossAxisAlignment,
              textDirection: widget.decoration.textDirection,
              verticalDirection: widget.decoration.verticalDirection,
              clipBehavior: widget.decoration.clipBehavior,
              children: [
                ..._tags.value.map((tag) {
                  if (widget.tagBuilder != null) {
                    return widget.tagBuilder!(tag, this);
                  } else {
                    return TagWidget(
                      key: ValueKey('tag-${tag._id}'),
                      tag: tag,
                      onDeleted: removeTag,
                      onPressed: editOnClick,
                      decoration: widget.tagDecoration,
                    );
                  }
                }),
                child!,
              ],
            ),
          );
        },
        child: IntrinsicWidth(
          child: TextField(
            autofocus: widget.autofocus,
            controller: _controller,
            focusNode: _focusNode,
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
            ),
            textInputAction: TextInputAction.done,
            keyboardType: widget.keyboardType,
            onSubmitted: (value) {
              if (widget.addOnFieldSubmitted) {
                final tag = Tag(value: value);
                _updateTags(tag);
              }
            },
          ),
        ),
      ),
    );
  }
}

class TagWidget extends StatefulWidget {
  const TagWidget({
    super.key,
    required this.tag,
    this.useRawText = false,
    this.onDeleted,
    this.onPressed,
    this.decoration = const TagDecoration(),
  });

  /// tag of the widget.
  final Tag tag;

  /// whether to use raw text or not.
  final bool useRawText;

  /// The decoration of the tag.
  final TagDecoration decoration;

  /// Called when the tag is deleted.
  final ValueChanged<Tag>? onDeleted;

  /// Called when the tag is pressed.
  final ValueChanged<Tag>? onPressed;

  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
      upperBound: 1,
      lowerBound: 0.3,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveLabelColor =
        widget.decoration.labelColor ?? context.onSurfaceColor;
    final effectiveLabelStyle =
        (widget.decoration.labelStyle ?? context.labelLarge)?.copyWith(
      color: effectiveLabelColor,
    );
    final effectiveBackgroundColor = widget.decoration.backgroundColor ??
        context.theme.chipTheme.backgroundColor;
    final effectiveShape = widget.decoration.shape;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child!,
        );
      },
      child: Material(
        type: MaterialType.transparency,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () => widget.onPressed?.call(widget.tag),
          child: Ink(
            decoration: ShapeDecoration(
              color: effectiveBackgroundColor,
              shape: effectiveShape!,
            ),
            height: 32 + (widget.decoration.padding?.vertical ?? 0),
            padding: widget.decoration.padding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    widget.useRawText ? widget.tag.rawText : widget.tag.value,
                    style: effectiveLabelStyle,
                  ),
                ),
                if (widget.onDeleted != null) ...[
                  Sizes.gap4,
                  _ChipIconButton(
                    icon:
                        widget.decoration.deleteIcon ?? const Icon(Icons.close),
                    onPressed: () => widget.onDeleted?.call(widget.tag),
                    iconColor: effectiveLabelColor,
                    padding: widget.decoration.padding,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChipIconButton extends StatelessWidget {
  const _ChipIconButton({
    required this.icon,
    required this.onPressed,
    required this.iconColor,
    required this.padding,
  });

  /// The icon of the button.
  final Widget icon;

  /// onPressed callback of the button.
  final VoidCallback? onPressed;

  /// The color of the icon.
  final Color? iconColor;

  /// this is the padding of the
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      button: true,
      child: InkWell(
        // Radius should be slightly less than the full size of the chip.
        radius: (32 + (padding?.vertical ?? 0)) * .45,
        // Keeps the splash from being constrained to the icon alone.
        splashFactory:
            _UnconstrainedInkSplashFactory(Theme.of(context).splashFactory),
        onTap: onPressed,
        child: IconTheme(
          data: context.theme.iconTheme.copyWith(
            color: iconColor,
            size: 18,
          ),
          child: icon,
        ),
      ),
    );
  }
}

/// {@template tag_field_decoration}
/// The decoration of the [TagsInputField].
/// {@endtemplate}
class TagFieldDecoration extends Equatable {
  /// {@macro tag_field_decoration}
  const TagFieldDecoration({
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 4,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 4,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
    this.inputDecoration = const InputDecoration(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(),
      errorBorder: OutlineInputBorder(),
      focusedErrorBorder: OutlineInputBorder(),
      disabledBorder: OutlineInputBorder(),
      contentPadding: EdgeInsets.all(8),
    ),
  });

  /// properties for [Wrap]
  final Axis direction;

  /// alignment for [Wrap]
  final WrapAlignment alignment;

  /// spacing for [Wrap]
  final double spacing;

  /// runAlignment for [Wrap]
  final WrapAlignment runAlignment;

  /// runSpacing for [Wrap]
  final double runSpacing;

  /// crossAxisAlignment for [Wrap]
  final WrapCrossAlignment crossAxisAlignment;

  /// textDirection for [Wrap]
  final TextDirection? textDirection;

  /// verticalDirection for [Wrap]
  final VerticalDirection verticalDirection;

  /// clip behavior for [Wrap]
  final Clip clipBehavior;

  /// properties for [InputDecoration]
  final InputDecoration inputDecoration;

  @override
  List<Object?> get props => [
        direction,
        alignment,
        spacing,
        runAlignment,
        runSpacing,
        crossAxisAlignment,
        textDirection,
        verticalDirection,
        clipBehavior,
        inputDecoration,
      ];
}

/// {@template tag_decoration}
/// The decoration of a [Tag].
/// {@endtemplate}
class TagDecoration extends Equatable {
  /// {@macro tag_decoration}
  const TagDecoration({
    this.backgroundColor,
    this.labelColor,
    this.labelStyle = const TextStyle(fontSize: 14),
    this.deleteIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Colors.white),
    ),
  });

  /// The background color of the tag.
  final Color? backgroundColor;

  /// The color of the label.
  final Color? labelColor;

  /// The style of the label.
  final TextStyle? labelStyle;

  /// The delete icon of the tag.
  final Widget? deleteIcon;

  /// The padding of the tag.
  final EdgeInsetsGeometry? padding;

  /// border radius of the tag
  final ShapeBorder? shape;

  @override
  List<Object?> get props => [
        backgroundColor,
        labelColor,
        labelStyle,
        deleteIcon,
        padding,
        shape,
      ];
}

/// {@template tag}
/// A tag that can be added to the [TagsInputField].
/// {@endtemplate}
class Tag extends Equatable {
  /// {@macro tag}
  Tag({
    required this.value,
    String keyLabel = '',
  })  : _id = UUID.v4(),
        _keyLabel = keyLabel;

  /// The unique id of the tag.
  final String _id;

  /// this is the separator key for the tag
  /// this is necessary if you want to display raw tag value;
  final String _keyLabel;

  /// The value of the tag.
  final String value;

  /// The raw text of the tag.
  String get rawText => '$value$_keyLabel';

  Tag copyWith({
    String? value,
    bool? isRemovable,
    bool? animate,
  }) {
    return Tag(
      value: value ?? this.value,
      keyLabel: _keyLabel,
    );
  }

  @override
  List<Object?> get props => [
        _id,
        value,
        _keyLabel,
      ];
}

/// this is a copy from the flutters material library to remove the constrains
class _UnconstrainedInkSplashFactory extends InteractiveInkFeatureFactory {
  const _UnconstrainedInkSplashFactory(this.parentFactory);

  final InteractiveInkFeatureFactory parentFactory;

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return parentFactory.create(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      rectCallback: rectCallback,
      borderRadius: borderRadius,
      customBorder: customBorder,
      radius: radius,
      onRemoved: onRemoved,
      textDirection: textDirection,
    );
  }
}
