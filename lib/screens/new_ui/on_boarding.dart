import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF213753),
      body: PageView(
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
                child: Text('!مرحبا بك في تطبيق تعاون', style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text('اعادة التدوير', style: TextStyle(fontSize: 18)),
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
                        Icons.arrow_back_ios,
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
                child: Text('بحيث الكل يستفيد', style: TextStyle(fontSize: 18)),
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
                        Icons.arrow_back_ios,
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
                child: Text('وبس. بكل بساطة', style: TextStyle(fontSize: 18)),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 50),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffffffff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFF213753),
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
