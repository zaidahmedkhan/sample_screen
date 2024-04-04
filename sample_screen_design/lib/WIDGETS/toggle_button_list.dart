import 'package:flutter/material.dart';

class ToggleButtonList extends StatefulWidget {
  final int? selected;
  final Function? callback;
  final List<String>? categories;

  const ToggleButtonList({
    Key? key,
    this.selected,
    this.callback,
    this.categories,
  }) : super(key: key);

  @override
  _ToggleButtonListState createState() => _ToggleButtonListState();
}

class _ToggleButtonListState extends State<ToggleButtonList> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selected ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: widget.categories!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    widget.callback!(index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 0 : 0,
                      right: 0,
                      top: 15,
                      bottom: 8,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          widget.categories![index],
                          style: TextStyle(
                            fontSize: 15,
                            color: _selectedIndex == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        _selectedIndex == index
                            ? Container(
                                height: 2,
                                width: 30, // Adjust the width as needed
                                color: const Color(0xffF9C034),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 15),
          const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
          Image.asset('assets/icons/trophy.png', width: 24, height: 24),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
