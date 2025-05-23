import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [0, 1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e).toList());
    // imagesIds.addAll([
    //   lastId + 1,
    //   lastId + 2,
    //   lastId + 3,
    //   lastId + 4,
    //   lastId + 5,
    // ]);
    setState(() {});
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!isMounted) return;
    addFiveImages();
    setState(() {
      isLoading = false;
    });
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future<void>.delayed(const Duration(seconds: 2));
    isLoading = false;
    if (!isMounted) return;
    final lastId = imagesIds.last;
    imagesIds
      ..clear()
      ..add(lastId + 1);
    addFiveImages();
    if (!isMounted) return;
    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) {
      return;
    }
    scrollController.animateTo(
      scrollController.position.pixels + 150,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isMounted = false;
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            itemCount: imagesIds.length,
            controller: scrollController,
            itemBuilder: (context, index) {
              return FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300',
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:
            isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Icon(Icons.exit_to_app_outlined),
        onPressed: () {
          if (isLoading) return;
          context.pop();
        },
      ),
    );
  }
}
