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
      height: 60,
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
                    margin: const EdgeInsets.only(
                      left: 0,
                      right: 5,
                      top: 15,
                      bottom: 4,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.categories![index],
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: _selectedIndex == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        _selectedIndex == index
                            ? Container(
                                height: 2,
                                width: 30,
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
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 30,
            ),
          ),
          const SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child:
                Image.asset('assets/icons/trophy.png', width: 40, height: 40),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
