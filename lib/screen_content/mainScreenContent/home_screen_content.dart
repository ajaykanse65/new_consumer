import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_consumer/providers/home_providers.dart';
import 'package:new_consumer/static_data/assets_static.dart';
import 'package:new_consumer/static_data/text_static.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  int currentIndex = 0;
  @override
  void initState() {
    final myFormProvider = Provider.of<AuthProvider>(context, listen: false);
    myFormProvider.checkNavigation();
    super.initState();
  }

  // Future<void> checkLocation() async {
  //   final myFormProvider = Provider.of<AuthProvider>(context, listen: false);
  //   final hasPermission = await myFormProvider.handleLocationPermission();
  //   if(hasPermission == true){
  //     myFormProvider.getCurrentPosition();
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthProvider>(context);
    final homeModel = Provider.of<HomeScreenProvider>(context);
    return WillPopScope(
      onWillPop: () => homeModel.onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: null,
                child: Text.rich(TextSpan(children: [
                  const WidgetSpan(
                      child: Icon(
                    Icons.location_on,
                    color: Colors.lightBlue,
                    size: 23,
                  )),
                  TextSpan(
                      text: authModel.userName,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF0D1F37),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.17,
                      )),
                  const WidgetSpan(
                      child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 21,
                  ))
                ])),
              ),
              Text(
                authModel.address,
                style: GoogleFonts.inter(
                  color: const Color(0xFF58595B),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 24),
              width: 40,
              height: 40,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff353535),
                        Color(0xff6A6A6A),
                      ])),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
          bottomOpacity: 0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            CarouselSlider(
                              disableGesture: true,
                              items: homeModel.imageUrls.map((imageUrl) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    if (imageUrl.endsWith('.svg')) {
                                      // Load SVG image from assets
                                      return SvgPicture.asset(imageUrl);

                                    } else {
                                      // Load other image formats (e.g., JPEG, PNG) from assets
                                      return Image.asset(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                      );
                                    }
                                  },
                                );
                              }).toList(),
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 0.9,
                                aspectRatio: 16 / 7.5,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(homeModel.imageUrls.length, (index) {
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == index ? Colors.blue : Colors.grey,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () => homeModel.goToShieldHome(context),
                                child: Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width * 0.45,
                                      height:
                                          MediaQuery.of(context).size.height * 0.15,
                                      margin: const EdgeInsets.only(
                                          right: 8, top: 24, left: 24),
                                      decoration: const ShapeDecoration(
                                        gradient: LinearGradient(
                                          end: Alignment(0.92, -0.39),
                                          begin: Alignment(-0.92, 0.39),
                                          colors: [
                                            Color(0xFFDE562C),
                                            Color(0xFFFFAA5C)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SvgPicture.asset(ImagePath.homeShield)
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () => homeModel.goToRepairHome(context),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      height: MediaQuery.of(context).size.height *
                                          0.15,
                                      margin: const EdgeInsets.only(
                                          top: 24, left: 8, right: 24),
                                      decoration: const ShapeDecoration(
                                        gradient: LinearGradient(
                                          end: Alignment(0.92, -0.40),
                                          begin: Alignment(-0.92, 0.4),
                                          colors: [
                                            Color(0xFF59A4FF),
                                            Color(0xFF9FCAFF)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SvgPicture.asset(ImagePath.homeRepair)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text(
                            AppText.homeRepair,
                            style: GoogleFonts.inter(
                              color: const Color(0xFF0D1F37),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.17,
                            ),
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: MediaQuery.of(context).size.height * 0.16,
                        //       width: MediaQuery.of(context).size.height * 0.16,
                        //       decoration: ShapeDecoration(
                        //         color: const Color(0xFFD8F1FF),
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(12),
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       height: MediaQuery.of(context).size.height * 0.16,
                        //       width: MediaQuery.of(context).size.height * 0.16,
                        //       decoration: ShapeDecoration(
                        //         color: const Color(0xFFD8F1FF),
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(12),
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       height: MediaQuery.of(context).size.height * 0.16,
                        //       width: MediaQuery.of(context).size.height * 0.16,
                        //       decoration: ShapeDecoration(
                        //         color: const Color(0xFFD8F1FF),
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(12),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // )
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.23,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        width: 110,
                                        padding: const EdgeInsets.only(right: 8),
                                        margin: const EdgeInsets.only(
                                            right: 16, bottom: 8),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFD8F1FF),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Image.asset(ImagePath.homeLaptop),
                                      ),
                                      Text(
                                        'Laptop',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF0D1F37),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          height: 1.12,
                                          letterSpacing: -0.16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        width: 110,
                                        padding: const EdgeInsets.only(
                                            right: 8, left: 8),
                                        margin: const EdgeInsets.only(
                                            right: 16, bottom: 8),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFFDF4DB),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Image.asset(ImagePath.homeMobile),
                                      ),
                                      Text(
                                        'Mobile',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF0D1F37),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          height: 1.12,
                                          letterSpacing: -0.16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        width: 110,
                                        padding: const EdgeInsets.only(
                                            right: 8, left: 8),
                                        margin: const EdgeInsets.only(
                                            right: 16, bottom: 8),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFFFE6E6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Image.asset(ImagePath.homeTablet),
                                        // child: SvgPicture.asset(ImagePath.homeTablet),
                                      ),
                                      Text(
                                        'Tablet',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF0D1F37),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          height: 1.12,
                                          letterSpacing: -0.16,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppText.homeOffersText,
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF0D1F37),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.17,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 24,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(
                                    left: 24,
                                  ),
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        ImagePath.homeTestAds,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                width: 12,
                              ),
                            )),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text(
                            AppText.homeMoreText,
                            style: GoogleFonts.inter(
                              color: const Color(0xFF0D1F37),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.17,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 24,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 24, ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(13.89),
                                      width: 75,
                                      height: 75,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFFFDFD5),
                                        shape: OvalBorder(),
                                      ),
                                      child: SvgPicture.asset(ImagePath.homeDTH),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'DTH',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF4D4D4D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 1.29,
                                        letterSpacing: -0.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(13.89),
                                      width: 75,
                                      height: 75,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFE3E9ED),
                                        shape: OvalBorder(),
                                      ),
                                      child: SvgPicture.asset(
                                          ImagePath.homeRecharge),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Mobile\nRecharge',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF4D4D4D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                        letterSpacing: -0.14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(13.89),
                                      width: 75,
                                      height: 75,
                                      decoration: const ShapeDecoration(
                                        color: Color(0x33FFD15B),
                                        shape: OvalBorder(),
                                      ),
                                      child:
                                          SvgPicture.asset(ImagePath.homeLight),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Electricity',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF4D4D4D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 1.29,
                                        letterSpacing: -0.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(13.89),
                                      width: 75,
                                      height: 75,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFFFDFD5),
                                        shape: OvalBorder(),
                                      ),
                                      child: SvgPicture.asset(ImagePath.homeDTH),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'DTH',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF4D4D4D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 1.29,
                                        letterSpacing: -0.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const  EdgeInsets.only(left: 24,right: 24,bottom: 20,top: 24),
                          child : SvgPicture.asset(ImagePath.homeShareApp)
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
