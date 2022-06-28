import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/compentents/my_material-button/my_material-button.dart';
import 'package:task1/compentents/my_text_button/my_text_button.dart';
import 'package:task1/login/login_screen.dart';


class BoardingModel
{
  final String image;
  final String title;
  final String body;

  BoardingModel({
   required this.image,
   required this.title,
   required this.body,
  });
}

List<BoardingModel> boarding =
[
  BoardingModel(
      image: 'assets/images/first.png',
      title: 'On Boarding Title First',
      body: 'On Boarding body First',
  ),
  BoardingModel(
      image: 'assets/images/second.png',
      title: 'On Boarding Title Second',
      body: 'On Boarding body Second',
  ),
];

var boardingController = PageController();
bool isLast = false;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              onPressed: ()
              {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),),
                        (route) => false);
              },
              child: Text(
                'skip',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '7',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.amber,
                        ),
                  ),
                  Text(
                    'Krave',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.teal[300],
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index)
                {
                  if(index == boarding.length -1)
                  {
                    setState(()
                    {
                      isLast = true;
                    });
                  }else{
                    setState(()
                    {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: boardingController,
                itemBuilder: (context, index) => buildOnBoardingItem(context,boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            // const SizedBox(
            //   height: 15.0,
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SmoothPageIndicator(
                      controller: boardingController,
                      count: boarding.length,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 5.0,
                      dotHeight: 5.0,
                      activeDotColor: Colors.amber,
                      dotColor: Colors.grey,
                      spacing: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  MyButton(
                      onPressed: ()
                      {
                        if(isLast)
                        {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),),
                                  (route) => false);
                        }
                          boardingController.nextPage(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.fastLinearToSlowEaseIn,
                          );

                      },
                      text: 'Get Started',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text(
                    'Don\'t have an account ?',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                      fontSize: 16.0
                    ),
                  ),
                  MyTextButton(
                      onPressed: (){},
                      text: 'Sign Up',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnBoardingItem(context,BoardingModel model) => Column(
        children: [
           Image(
            height: 250,
            width: double.infinity,
            image: AssetImage(
                model.image,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            model.title,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            model.title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
          ),
        ],
      );
}
