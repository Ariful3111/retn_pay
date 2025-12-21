import 'package:get/get.dart'; 

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

  get type => null;

  get date => null;
}

class SupportController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt filterIndex = 0.obs;
  RxList<bool> isShowFAQ = <bool>[].obs;
  final List supportType = ['FAQ', 'Tickets', 'Contact Support'];
  final filterList = ['All', 'Open', 'In Progress', 'Resolved'];
  RxList<TicketModel> tableData = <TicketModel>[].obs;
  RxList<bool> expandedData = <bool>[].obs;
  final List<String> tableColumn = [
    'Ticket ID',
    'Category',
    'Status',
    'Action',
  ];
  void initRows() {
    tableData.value = [
      TicketModel(ticketID: '1', category: 'Payments', issueTitle: 'Payment not going through', status: 'Open', issueDate: 'Sep 12, 2025'),
      TicketModel(ticketID: '2', category: 'Repairs', issueTitle: 'Payment not going through', status: 'In Progress', issueDate: 'Sep 12, 2025'),
      TicketModel(ticketID: '3', category: 'Lease', issueTitle: 'Payment not going through', status: 'Resolved', issueDate: 'Sep 12, 2025'),
      TicketModel(ticketID: '4', category: 'Payments', issueTitle: 'Payment not going through', status: 'Open', issueDate: 'Sep 12, 2025'),
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
                  data.value.status == 'Open'|| data.value.status == 'Resolved'|| data.value.status =='In Progress',
            )
            .toList();
        break;
        case 1:
        filterData = tempData
            .where(
              (data) =>
                  data.value.status == 'Open',
            )
            .toList();
        break;
        case 2:
        filterData = tempData
            .where(
              (data) =>
                  data.value.status == 'In Progress',
            )
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
  final List fAQ = [
    {
      'title': 'How do I pay my rent online?',
      'subTitle':
          'Go to the Payments tab, choose your preferred method (card, bank, or wallet), and confirm the transaction securely.',
    },
    {
      'title': ' How do I submit a repair request?',
      'subTitle':
          'Go to the Payments tab, choose your preferred method (card, bank, or wallet), and confirm the transaction securely.',
    },
    {
      'title': 'Can I track my past payments?',
      'subTitle':
          'Go to the Payments tab, choose your preferred method (card, bank, or wallet), and confirm the transaction securely.',
    },
    {
      'title': 'How can I contact my landlord?',
      'subTitle':
          'Go to the Payments tab, choose your preferred method (card, bank, or wallet), and confirm the transaction securely.',
    },
    {
      'title': 'What happens if I miss a rent payment?',
      'subTitle':
          'Go to the Payments tab, choose your preferred method (card, bank, or wallet), and confirm the transaction securely.',
    },
    {
      'title': 'Can I review my landlord after moving out?',
      'subTitle':
          'Go to the Payments tab, choose your preferred method (card, bank, or wallet), and confirm the transaction securely.',
    },
  ];
  void showExpandedData(int index) {
    if (index >= 0 && index < expandedData.length) {
      expandedData[index] = !expandedData[index];
    }
  }
  @override
  void onInit() {
    isShowFAQ.value = List.filled(fAQ.length + 1, true);
    super.onInit();
  }
  @override
  void onReady() {
    initRows();
    super.onReady();
  }
}
