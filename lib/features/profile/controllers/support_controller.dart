import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class TicketModel {
  final String ticketID;
  final String category;
  final String issueTitle;
  final String status;
  final String issueDate;

  TicketModel({
    required this.ticketID,
    required this.category,
    required this.issueTitle,
    required this.status,
    required this.issueDate,
  });
}

class SupportController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt filterIndex = 0.obs;
  RxList<bool> isShowFAQ = <bool>[].obs;
  RxBool isCreateTicket = false.obs;
  RxString ticketCategory = 'Inspection Type*'.obs;
  final List<String> ticketCategoryList = ['Payments', 'Repairs', 'Lease'];
  final List<String> supportType = ['FAQ', 'Tickets', 'Contact Support'];
  final List<String> filterList = ['All', 'Open', 'In Progress', 'Resolved'];
  RxList<XFile> uploadImage = <XFile>[].obs;
  RxList<TicketModel> tableData = <TicketModel>[].obs;
  RxList<bool> expandedData = <bool>[].obs;
  TextEditingController issueController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final List<String> tableColumn = [
    'Ticket ID',
    'Category',
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
  void initRows() {
    tableData.value = [
      TicketModel(
        ticketID: '1',
        category: 'Payments',
        issueTitle: 'Payment not going through',
        status: 'Open',
        issueDate: 'Sep 12, 2025',
      ),
      TicketModel(
        ticketID: '2',
        category: 'Repairs',
        issueTitle: 'Payment not going through',
        status: 'In Progress',
        issueDate: 'Sep 12, 2025',
      ),
      TicketModel(
        ticketID: '3',
        category: 'Lease',
        issueTitle: 'Payment not going through',
        status: 'Resolved',
        issueDate: 'Sep 12, 2025',
      ),
      TicketModel(
        ticketID: '4',
        category: 'Payments',
        issueTitle: 'Payment not going through',
        status: 'Open',
        issueDate: 'Sep 12, 2025',
      ),
    ];
    expandedData.value = List.generate(tableData.length, (_) => false);
    update();
  }

  List<MapEntry<int, TicketModel>> get filterData {
    final tempData = <MapEntry<int, TicketModel>>[];
    for (int i = 0; i < tableData.length; i++) {
      tempData.add(MapEntry(i, tableData[i]));
    }
    List<MapEntry<int, TicketModel>> filterData;
    switch (filterIndex.value) {
      case 0:
        filterData = tempData
            .where(
              (data) =>
                  data.value.status == 'Open' ||
                  data.value.status == 'Resolved' ||
                  data.value.status == 'In Progress',
            )
            .toList();
        break;
      case 1:
        filterData = tempData
            .where((data) => data.value.status == 'Open')
            .toList();
        break;
      case 2:
        filterData = tempData
            .where((data) => data.value.status == 'In Progress')
            .toList();
        break;
      case 3:
        filterData = tempData
            .where((data) => data.value.status == 'Resolved')
            .toList();
        break;
      default:
        filterData = tempData;
    }
    return filterData;
  }

  void showExpandedData(int index) {
    if (index >= 0 && index < expandedData.length) {
      expandedData[index] = !expandedData[index];
    }
  }

  @override
  void onReady() {
    initRows();
    super.onReady();
  }

  @override
  void dispose() {
    issueController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
