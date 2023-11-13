import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final ValueChanged<String>? onTextChanged;
  final VoidCallback? onSearchSubmitted;

  const CustomSearchBar({Key? key, this.onTextChanged, this.onSearchSubmitted})
      : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: widget.onTextChanged,
      onSubmitted: (String value) {
        _focusNode.unfocus();
        widget.onSearchSubmitted?.call();
      },
      style: const TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Search...",
        hintStyle: const TextStyle(color: Colors.black45),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black54,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            _controller.clear();
            widget.onTextChanged?.call('');
          },
          icon: const Icon(Icons.clear, color: Colors.black54),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
