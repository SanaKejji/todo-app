import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/bot_toast_utils.dart';

class InfiniteListWidget extends StatefulWidget {
  const InfiniteListWidget(
      {super.key,
      required this.itemBuilder,
      required this.itemLength,
      required this.hasReachedMax,
      required this.onFetchNextPage,
      required this.onrefresh});
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Function() onFetchNextPage;
  final Function() onrefresh;
  final int itemLength;
  final bool hasReachedMax;
  @override
  InfiniteListWidgetState createState() => InfiniteListWidgetState();
}

class InfiniteListWidgetState extends State<InfiniteListWidget> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) widget.onFetchNextPage();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        widget.onrefresh();
      },
      child: ListView.separated(
        controller: _scrollController,
        itemCount:
            widget.hasReachedMax ? widget.itemLength : widget.itemLength + 1,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          return index >= widget.itemLength
              ? const Loader()
              : widget.itemBuilder(context, index);
        },
      ),
    );
  }
}
