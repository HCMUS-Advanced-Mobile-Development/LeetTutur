import 'package:flutter/material.dart';

class FilterChips extends StatefulWidget {
  final Map<String, String> optionMap;
  final Function(String)? onSelected;
  final Function(String)? onDeSelected;
  final Set<String>? initialSelectedItems;

  const FilterChips({
    Key? key,
    required this.optionMap,
    this.onSelected,
    this.onDeSelected,
    this.initialSelectedItems,
  }) : super(key: key);

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  final _selectedItems = <String>{};

  @override
  void initState() {
    if (widget.initialSelectedItems != null) {
      _selectedItems.addAll(widget.initialSelectedItems!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.from(widget.optionMap.entries).map((e) {
        var entry = e as MapEntry<String, String>;
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: FilterChip(
            label: Text(
              entry.value,
              softWrap: true,
            ),
            selectedColor: Theme.of(context).primaryColor,
            selected: _selectedItems.contains(entry.key),
            onSelected: (isSelected) {
              if (isSelected) {
                setState(() {
                  _selectedItems.add(entry.key);
                });

                widget.onSelected?.call(entry.key);
              } else {
                setState(() {
                  _selectedItems.remove(entry.key);
                });

                widget.onDeSelected?.call(entry.key);
              }
            },
          ),
        );
      }).toList(),
    );
  }
}
