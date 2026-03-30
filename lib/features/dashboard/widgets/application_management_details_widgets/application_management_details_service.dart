import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsService extends StatelessWidget {
  const ApplicationManagementDetailsService({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(
          text:
              'If you have difficulty understanding English, contact the Translating and Interpreting Service (TIS) on 131 450 (for the cost of a local call) and ask to be put through to an Information Officer at Consumer Affairs Victoria on 1300 55 81 81.',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 20.h),

        /// Arabic (special RTL layout)
        _rtlBlock(
          title: 'Arabic',
          text1:
              'إذا كان لديك صعوبة في فهم اللغة الإنكليزية، اتصل بخدمة الترجمة التحريرية والشفوية (TIS) على الرقم 450 131 (بكلفة مكالمة محلية) واطلب أن ',
          text2:
              'يوصلوك بموظف معلومات في دائرة شؤون المستهلك في فكتوريا على الرقم 81 81 55 1300.',
          isDark: isDark,
        ),

        SizedBox(height: 16.h),

        _richBlock(
          title: 'Turkish',
          text:
              'İngilize anlamakta güçlük çekiyorsanız, 131 450\'den (şehir içi konuşma ücretine) Yazılı ve Sözlü Tercümanlık Servisini (TIS) arayarak 1300 55 81 81 numerali telefondan Victoria Tüketici İşleri\'ni aramalarını ve size bir Danişma Memuru ile görüştürmelerini isteyiniz.',
          isDark: isDark,
        ),

        _richBlock(
          title: 'Vietnamese',
          text:
              'Nếu quí vị không hiểu tiếng Anh, xin liên lạc với Dịch Vụ Thông Phiên Dịch (TIS) qua số 131 450 (với giá biểu của cú gọi địa phương) và yêu cầu được nối đường dây tới một Nhân Viên Thông Tin tại Bộ Tiêu Thụ Sự Vụ Victoria (Consumer Affairs Victoria) qua số 1300 55 81 81.',
          isDark: isDark,
        ),

        _richBlock(
          title: 'Somali',
          text:
              'Haddii aad dhibaato ku qabto fahmida Ingiriiska, La xiriir Adeega Tarjumida iyo Afcelinta (TIS) telefoonka 131 450 (qiimaha meesha aad joogto) weydiisuna in lagugu xiro Sarkaalka Macluumaadka ee Arrimaha Macmiilaha \nFiktooriya tel: 1300 55 81 81.',
          isDark: isDark,
        ),

        _richBlock(
          title: 'Chinese',
          text:
              '如果您聽不大懂英語, 請打電話給口譯和筆譯服務處, 電話: 131 450(衹花費一個普通電話費), 讓他們幫您接通維多利亞消費者事務處(Consumer Affairs Victoria)的信息官員, 電話: 1300 55 81 81。',
          isDark: isDark,
        ),

        _richBlock(
          title: 'Serbian',
          text:
              'Ако вам je тешко да разумете енглески, назовите Службу преводилаца и тумача (Translating and Interpreting Service - TIS) на 131 450 (по цену локалног позива) и замолите их да вас повежу ca Службеником за информације (Information Officer) y Викторијској Служби за потрошачка питања (Consumer Affairs Victoria) на 1300 55 81 81.',
          isDark: isDark,
        ),

        _richBlock(
          title: 'Amharic',
          text:
              'በእንግሊዝኛ ቋንቋ ለመረዳት ችግር ካለብዎ የአስተርጓሚ አገልግሎትን (TIS) በስልክ ቁጥር 131 450 (በአካባቢ ስልክ ጥሪ ሂሳብ) በመደወል ለቪክቶሪያ ደንበኞች ጉዳይ ቢሮ በስልክ ቁጥር 1300 55 81 81 ደውሎ ከመረጃ አቅራቢ ሠራተኛ ጋር እንዲያገናኝዎት መጠየቅ።.',
          isDark: isDark,
        ),

        /// Dari (RTL)
        _rtlBlock(
          title: 'Dari',
          text1:
              'اگر شما مشکل دانستن زبان انگلیسی دارید،  با اداره خدمات ترجمانی تحریری و شفاهی (TIS)به شماره 450 131 به قیمت مخابره محلی تماس بگیرید ',
          text2:
              'و بخواهید که شما را به کارمند معلومات دفتر امور مهاجرین ویکتوریا به شماره 1300 55 81 81 ارتباط دهد.',
          isDark: isDark,
        ),

        SizedBox(height: 16.h),

        _richBlock(
          title: 'Croatian',
          text:
              'Ako nerazumijete dovoljno engleski, nazovite Službu tumača i prevoditelja (TIS) na 131 450 (po cijeni mjesnog poziva) i zamolite da vas spoje s djelatnikom za obavijesti u Consumer Affairs Victoria na 1300 55 81 81.',
          isDark: isDark,
        ),

        _richBlock(
          title: 'Greek',
          text:
              'Av έχετε δυσκολίες στην κατανόηση της αγγλικής γλώσσας, επικοινωνήστε με την Υπηρεσία Μετάφρασης και Διερμηνείας (TIS) στο 131 450 (με το κόστος μιας τοπικής κλήσης) και ζητήστε να σας συνδέσουν με έναν Υπάλληλο Πληροφοριών στην Υπηρεσία Προστασίας Καταναλωτών Βικτώριας (Consumer Affairs Victoria) στον αριθμό 1300 55 81 81.',
          isDark: isDark,
        ),

        _richBlock(
          title: 'Italian',
          text:
              'Se avete difficoltà a comprendere l\'inglese, contattate il servizio interpreti e traduttori, cioè il Translating and Interpreting Service (TIS) al 131 450 (per il costo di una chiamata locale), e chiedete di essee messi in comunicazione con un operatore addetto alle informazioni del dipartimento “Consumer Affairs Victoria” al numero 1300 55 81 81.',
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _richBlock({
    required String title,
    required String text,
    required bool isDark,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title  ',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
            ),
            TextSpan(
              text: text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rtlBlock({
    required String title,
    required String text1,
    required String text2,
    required bool isDark,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSecondary(
            text: title,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 6.h),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextSecondary(
                  text: text1,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.darkTextColor,
                ),
                CustomTextSecondary(
                  text: text2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.darkTextColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
