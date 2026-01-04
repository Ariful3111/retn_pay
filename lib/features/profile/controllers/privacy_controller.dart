import 'package:get/get.dart';

class PrivacyController extends GetxController {
  List appText = [
    {
      'Title':
          'APP 1 (Open and Transparent Management of Personal Information):',
      'subTitle':
          '''Requires us to manage personal information openly and to maintain a clear, up-to-date privacy policy detailing our data handling practices [1].''',
    },
    {
      'Title': 'APP 3 (Collection of Solicited Personal Information):',
      'subTitle':
          '''Stipulates that personal information can only be collected if it is reasonably necessary for the app's functions, such as processing rental applications or managing leases [1]. Sensitive information, a subset receiving higher protection, requires explicit consent for collection and must also be reasonably necessary [1].''',
    },
    {
      'Title':
          'APP 5 (Notification of the Collection of Personal Information):',
      'subTitle':
          '''Mandates that individuals be notified about the purposes of collection and other key details at the time their information is collected .''',
    },
    {
      'Title': 'APP 6 (Use or Disclosure of Personal Information):',
      'subTitle':
          '''Generally restricts the use or disclosure of personal information to the primary purpose for which it was collected, unless consent for a secondary purpose is obtained or specific exceptions apply .''',
    },
    {
      'Title': 'APP 8 (Cross-border Disclosure of Personal Information):',
      'subTitle':
          '''Requires us to take reasonable steps to ensure that overseas recipients of personal information comply with the APPs if data is disclosed internationally [1].''',
    },
    {
      'Title': 'APP 11 (Security of Personal Information):',
      'subTitle':
          '''Obliges us to take reasonable steps to protect personal information from misuse, interference, loss, unauthorized access, modification, or disclosure [1]''',
    },
    {
      'Title': 'APP 12 (Access to Personal Information):',
      'subTitle':
          '''Grants individuals the right to access their personal information held by us [1].''',
    },
    {
      'Title': 'APP 13 (Correction of Personal Information):',
      'subTitle':
          '''Grants individuals the right to request corrections to their personal information if it is inaccurate or misleading [1].''',
    },
  ];
  List victorianText = [
    {
      'Title': 'Privacy and Data Protection Act 2014 (Vic) (PDP Act):',
      'subTitle':
          '''This Act primarily governs Victorian public sector organizations and certain contracted service providers [2]. As a private residential property management app, we are generally not directly subject to the PDP Act unless we operate as a contracted service provider for a Victorian government agency [2].''',
    },
    {
      'Title': 'Health Records Act 2001 (Vic) (HR Act):',
      'subTitle':
          '''This Act is highly relevant if our app collects, uses, or discloses health information (e.g., medical certificates related to tenancy adjustments or accessibility needs) [2].The HR Act applies to both public and private organizations handling health information in Victoria and contains 11 Health Privacy Principles (HPPs) [2].''',
    },
  ];
  List introductionTableColumns = [
    'Category',
    'Specific Examples of Collected Information',
    'Legal Classification',
    'Key Collection Considerations & Implications',
  ];
  List introductionTableData = [
    {'column1': 'Identity Information', 'column2': '''Name, postal address, phone number, email address, gender, date of birth, signature [5]. Formal identification documents or details thereof, such as driver's license (including photo ID), passport, Medicare card, pension card, or healthcare card [5]''', 'column3': '''Personal Information [3]''', 'column4': '''This information is primarily collected for verifying your identity and eligibility to rent [6]. Basic identity information is generally considered reasonably necessary. However, collecting multiple identity verifiers or excessive detail beyond what is required for verification may not be deemed reasonably necessary [5]'''},
    {'column1': 'Contact Information', 'column2': '''Phone number, email address, postal address [5]. Social media accounts/profiles, social network data(e.g., user name, site ID, profile photo)if you choose to link such accounts [5].''', 'column3': '''Personal Information [3]''', 'column4': '''Collected to facilitate communication with applicants and tenants. While basic contact details are reasonably necessary, requests for social media profiles are often considered intrusive and are generally not reasonably necessary for tenancy assessment, as they could lead to discriminatory decisions [10]'''},
    {'column1': '', 'column2': '''''', 'column3': '''Personal Information [3]''', 'column4': ''''''},
    {'column1': '', 'column2': '''''', 'column3': '''Personal Information [3]''', 'column4': ''''''},
    {'column1': '', 'column2': '''''', 'column3': '''Personal Information [3]''', 'column4': ''''''},
    {'column1': '', 'column2': '''''', 'column3': '''Personal Information [3]''', 'column4': ''''''},
  ];
}
