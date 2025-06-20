import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class InstagramLikeSearchBar extends StatefulWidget {
  const InstagramLikeSearchBar({super.key});

  @override
  InstagramLikeSearchBarState createState() => InstagramLikeSearchBarState();
}

class InstagramLikeSearchBarState extends State<InstagramLikeSearchBar> {
  bool isSearching = false;
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  void startSearch() {
    setState(() {
      isSearching = true;
    });
    focusNode.requestFocus();
  }

  void stopSearch() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isSearching)
          FadeInLeft(
            duration: const Duration(milliseconds: 200),
            child: IconButton(
              color: Colors.white,
              icon: const Padding(
                padding: EdgeInsets.only(left: 9),
                child: Icon(Icons.arrow_back),
              ),
              onPressed: stopSearch,
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: GestureDetector(
              onTap: startSearch,
              child: FadeInRight(
                duration: const Duration(milliseconds: 200),
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  alignment: Alignment.centerLeft,
                  child: isSearching
                      ? TextField(
                          focusNode: focusNode,
                          controller: controller,
                          decoration: InputDecoration(
                            suffixIcon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Icon(Icons.search),
                            ),
                            hintText: 'Search',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              const Icon(Icons.search),
                              Text('Search',
                                  style: TextStyle(color: Colors.grey[600])),
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
