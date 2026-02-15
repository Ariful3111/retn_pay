import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/models/support_ticket_model.dart';
import 'package:renter_pay/features/profile/repositories/get_support_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class SupportController extends GetxController {
  final GetSupportTicketRepository getSupportTicketRepository;
  SupportController({required this.getSupportTicketRepository});
  final tickets = Rxn<SupportTicketModel>();
  RxBool isLoading = true.obs;
  RxBool isLoadingMore = false.obs;
  RxInt selectedIndex = 0.obs;
  RxInt filterIndex = 0.obs;
  RxList<bool> isShowFAQ = <bool>[].obs;
  RxBool isCreateTicket = false.obs;
  RxString ticketCategory = 'Inspection Type*'.obs;
  final List<String> ticketCategoryList = ['Payments', 'Repairs', 'Lease'];
  final List<String> supportType = ['FAQ', 'Tickets', 'Contact Support'];
  final List<String> filterList = ['All', 'Open', 'In Progress', 'Resolved'];
  final List<String> _statusValues = ['', 'open', 'in_progress', 'resolved'];
  RxList<XFile> uploadImage = <XFile>[].obs;
  RxList<int> expandedTickets = <int>[].obs;
  TextEditingController issueController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  late final Worker _filterWorker;

  Future<void> getSupportTickets({bool loadMore = false}) async {
    final status =
        (filterIndex.value >= 0 && filterIndex.value < _statusValues.length)
        ? _statusValues[filterIndex.value]
        : '';

    final meta = tickets.value?.data?.meta;
    if (loadMore) {
      if (isLoadingMore.value) return;
      if ((meta?.currentPage ?? 1) >= (meta?.lastPage ?? 1)) return;
      isLoadingMore.value = true;
    } else {
      isLoading.value = true;
      expandedTickets.clear();
    }

    final response = await getSupportTicketRepository.execute(
      page: loadMore ? (meta?.currentPage ?? 1) + 1 : 1,
      perPage: 20,
      status: status,
    );
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        if (!loadMore) {
          tickets.value = data;
        } else {
          final existingPayload = tickets.value?.data;
          if (existingPayload == null) {
            tickets.value = data;
          } else {
            existingPayload.data ??= <SupportTicket>[];
            existingPayload.data!.addAll(data.data?.data ?? const []);
            existingPayload.links = data.data?.links;
            existingPayload.meta = data.data?.meta;
            tickets.refresh();
          }
        }
      },
    );
    isLoading.value = false;
    isLoadingMore.value = false;
  }

  final List<String> tableColumn = [
    'Ticket ID',
    'Priority',
    'Status',
    'Action',
  ];
  final List contactList = [
    {
      'icon': IconsPath.supportChat,
      'title': 'Live Chat',
      'subTitle': 'Chat with our support team in real-time.',
      'action': 'Start Chat',
    },
    {
      'icon': IconsPath.supportEmail,
      'title': 'Email Support',
      'subTitle': 'Send us an email and get a response within 24 hours.',
      'action': 'Send Email',
    },
    {
      'icon': IconsPath.supportCall,
      'title': 'Call Us',
      'subTitle': 'Speak directly with our support agents.',
      'action': 'Number: +880-XXX-XXX-XXXX',
    },
  ];

  void toggleExpandedTicket({required int id}) {
    if (expandedTickets.contains(id)) {
      expandedTickets.remove(id);
    } else {
      expandedTickets.add(id);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _filterWorker = ever(filterIndex, (_) {
      getSupportTickets();
    });
    getSupportTickets();
  }

  @override
  void onClose() {
    _filterWorker.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    issueController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
