import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/helper/iconhelper.dart';
import 'package:course_store/helper/utils.dart';
import 'package:course_store/models/onboardingcontent.dart';
import 'package:course_store/pages/categorylistpage.dart';
import 'package:course_store/widgets/iconfont.dart';
import 'package:course_store/widgets/mainappbar.dart';
import 'package:course_store/widgets/themebutton.dart';
import 'package:flutter/material.dart';



class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<OnboardingContent> _content = Utils.getOnboarding();
  int pageIndex = 0;
  PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (int page) {
                  setState(() {
                    pageIndex = page;
                  });
                },
                children: List.generate(
                  _content.length,
                  (index) => Container(
                    padding: EdgeInsets.all(40),
                    margin: EdgeInsets.only(
                        left: 40, right: 40, top: 40, bottom: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.MAIN_COLOR.withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset.zero,
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconFont(
                                  color: AppColors.MAIN_COLOR,
                                  iconName: IconFontHelper.PAY_PAL,
                                  size: 40,
                                ),
                              ),
                              Image.asset(
                                'assets/imgs/${_content[index].img}.png',
                                height: 300,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                _content[index].message,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.MAIN_COLOR,
                                  fontSize: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: index == _content.length - 1,
                          child: ThemeButton(
                            onClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryListPage(),
                                ),
                              );
                            },
                            label: 'Enter Now',
                            color: AppColors.HIGHLIGHT_DEFAULT,
                            highlight: AppColors.DARK_RED,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _content.length,
                (index) => GestureDetector(
                  onTap: () {
                    _controller.animateTo(
                      MediaQuery.of(context).size.width * index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: 15,
                    height: 15,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.MAIN_COLOR,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 6,
                        color: pageIndex == index
                            ? Color(0xFFB16171)
                            : Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ThemeButton(
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryListPage(),
                  ),
                );
              },
              label: 'Jump onboarding',
            )
          ],
        ),
      ),
    );
  }
}

// AIzaSyAyXOuL-w3bfY7XnCYvoDVX29DSB9_lWGs
