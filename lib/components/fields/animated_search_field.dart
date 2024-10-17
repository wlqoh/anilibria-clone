// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:anilibria_clone/theme/colors.dart';

class AnimatedSearchField extends StatefulWidget {
  final bool isSearching;
  final TextEditingController controller;
  final void Function()? onPressed;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final FocusNode focusNode;
  final void Function()? onEnd;

  const AnimatedSearchField({
    super.key,
    required this.isSearching,
    required this.controller,
    required this.focusNode,
    this.onPressed,
    this.onEditingComplete,
    this.onChanged,
    this.onEnd,
  });

  @override
  State<AnimatedSearchField> createState() => _AnimatedSearchFieldState();
}

class _AnimatedSearchFieldState extends State<AnimatedSearchField> {
  double width = 30;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        width = 400;
        if (mounted) setState(() {});
      } else {
        width = 30;
        if (mounted) setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    widget.isSearching
        ? widget.focusNode.requestFocus()
        : widget.focusNode.unfocus();
    !widget.isSearching ? widget.controller.clear() : null;
    return AnimatedContainer(
      onEnd: widget.onEnd,
      duration: const Duration(milliseconds: 500),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AnilibColor.white,
      ),
      child: TextField(
        onChanged: widget.onChanged,
        onEditingComplete: () {},
        textInputAction: TextInputAction.search,
        controller: widget.controller,
        enabled: widget.isSearching,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: width == 400
              ? IconButton(
                  onPressed: widget.onPressed,
                  icon: const Icon(Icons.clear),
                )
              : null,
          hintText: widget.isSearching ? 'Поиск по названию' : null,
          icon: widget.isSearching ? const Icon(Icons.search) : null,
        ),
      ),
    );
  }
}
