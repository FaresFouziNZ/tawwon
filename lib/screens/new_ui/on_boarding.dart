import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/models/favorite_provider.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/screens/new_ui/page_holder.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser?>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    if (user?.uid != null) {
      favoriteProvider.uid = user!.uid;
      favoriteProvider.getFavorite();
      return const PageHolder();
    }
    return Scaffold(
      backgroundColor: const Color(0xFF213753),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageView(
          controller: controller,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        )),
                    Positioned(
                      top: 15,
                      child: Transform.rotate(
                        angle: 0.8,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            )),
                      ),
                    ),
                    Image.asset(
                      'assets/images/ob1.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50), //Probably need fixing
                  child: Text('مرحبا بك في تطبيق تعاون!', style: TextStyle(color: Colors.white, fontSize: 24)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text('اعادة التدوير', style: TextStyle(fontSize: 18, color: Color(0xff748AA7))),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 50),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffffffff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF213753),
                        )))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        )),
                    Positioned(
                      top: 15,
                      child: Transform.rotate(
                        angle: -0.8,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            )),
                      ),
                    ),
                    Image.asset(
                      'assets/images/ob2.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50), //Probably need fixing
                  child: Text('نساعدك تتخلص من النفايات\n بأفضل الطرق',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text('بحيث الكل يستفيد', style: TextStyle(fontSize: 18, color: Color(0xff748AA7))),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 50),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffffffff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF213753),
                        )))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        )),
                    Positioned(
                      top: 15,
                      child: Transform.rotate(
                        angle: 0.8,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            )),
                      ),
                    ),
                    Image.asset(
                      'assets/images/ob3.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50), //Probably need fixing
                  child: Text(
                    'اشتري/بيع اي غرض ممكن الناس تستفيد منه',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text('وبس. بكل بساطة', style: TextStyle(fontSize: 18, color: Color(0xff748AA7))),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 50),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => const PageHolder()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffffffff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF213753),
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
