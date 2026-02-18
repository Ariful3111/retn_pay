import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/notification/models/notification_model.dart';
import 'package:renter_pay/features/notification/repositories/get_notification_repo.dart';
import 'package:renter_pay/shared/extensions/Extractors/content_extractor.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

typedef NotificationSection = ({String title, List<NotificationItem> items});

class NotificationController extends GetxController {
  final GetNotificationRepository getNotificationRepository;
  NotificationController({required this.getNotificationRepository});
  RxBool isLoading = true.obs;
  final notifications = Rxn<NotificationModel>();
  final ScrollController scrollController = ScrollController();
  List iconList = [
    IconsPath.notificationPost,
    IconsPath.favorite,
    IconsPath.notificationShare,
    IconsPath.notificationBookmark,
  ];

  final int _perPage = 20;
  int _page = 1;
  final isLoadingMore = false.obs;
  bool _hasMore = true;

  List<NotificationSection> get notificationSections {
    final items = notifications.value?.data?.data ?? <NotificationItem>[];
    if (items.isEmpty) return const [];

    final grouped = <String, List<NotificationItem>>{};

    for (final item in items) {
      final createdAt = DateTime.tryParse(item.createdAt ?? '')?.toLocal();
      final title = createdAt == null
          ? 'Earlier'
          : createdAt.toNotificationSectionTitle();
      grouped.putIfAbsent(title, () => <NotificationItem>[]).add(item);
    }

    return grouped.entries
        .map((e) => (title: e.key, items: e.value))
        .toList(growable: false);
  }

  @override
  void onInit() {
    scrollController.addListener(_onScroll);
    getNotifications();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;
    final position = scrollController.position;
    if (position.pixels < position.maxScrollExtent - 200) return;
    loadMore();
  }

  void _updateHasMore(NotificationModel data) {
    _hasMore = data.data?.links?.next != null;
  }

  Future<void> getNotifications() async {
    _page = 1;
    isLoading.value = true;
    final response = await getNotificationRepository.execute(
      perPage: _perPage,
      page: _page,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        notifications.value = data;
        _updateHasMore(data);
      },
    );
  }

  Future<void> loadMore() async {
    if (isLoading.value || isLoadingMore.value || !_hasMore) return;
    isLoadingMore.value = true;
    final nextPage = _page + 1;

    final response = await getNotificationRepository.execute(
      perPage: _perPage,
      page: nextPage,
    );

    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        final current = notifications.value;
        if (current == null) {
          notifications.value = data;
        } else {
          (current.data ??= NotificationPayload()).data ??=
              <NotificationItem>[];
          current.data!.data!.addAll(
            data.data?.data ?? const <NotificationItem>[],
          );
          current.data!.links = data.data?.links ?? current.data!.links;
          current.data!.meta = data.data?.meta ?? current.data!.meta;
          notifications.refresh();
        }

        _updateHasMore(data);
        _page = nextPage;
      },
    );

    isLoadingMore.value = false;
  }

  void markRead() {
    final items = notifications.value?.data?.data;
    if (items == null || items.isEmpty) return;
    for (final item in items) {
      item.isRead = true;
    }
    notifications.refresh();
  }
}
