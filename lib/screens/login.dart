import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;
import 'package:shopblocks_flutter/utils/colors.dart' as colors;

import 'package:url_launcher/url_launcher_string.dart';

import '../utils/custom_sliver_widget.dart';
import '../utils/metamask_provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: Stack(
        children:[
      SvgPicture.asset(
            'assets/images/landing-background.svg',
            fit: BoxFit.fill,
          ),
          CustomSliverView(columnList: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.70,),
                Text("LOGIN", style: texts.heading1),
                const SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colors.accentColor,
                      hintStyle: texts.paragraph,
                      hintText: 'Enter your username here.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ChangeNotifierProvider(
                    create: (context) => MetaMaskProvider()..start(),
                    builder: (context, child) {
                      return Consumer<MetaMaskProvider>(
                        builder: (context, provider, child) {
                          late final String message;
                          if (provider.isConnected &&
                              provider.isInOperatingChain) {
                            message = 'Connected';
                          } else if (provider.isConnected &&
                              !provider.isInOperatingChain) {
                            message =
                                'Wrong chain. Please connect to ${MetaMaskProvider.operatingChain}';
                          } else if (provider.isEnabled) {
                            return MaterialButton(
                              onPressed: () =>
                                  context.read<MetaMaskProvider>().connect(),
                              color: colors.primaryColor,
                              padding: const EdgeInsets.all(0),
                              shape: const StadiumBorder(),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30.0, right: 30.0,top: 10.0, bottom: 10.0),
                                child: Text(style: texts.button,'Connect to MetaMask'),
                              ),
                            );
                          } else {
                            message = 'Please use a Web3 supported browser.';
                          }
                          return Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          );
                        },
                      );
                    }),
              ],
            ),
          )
        ])],
      ),
    );
    // return Scaffold(
    //     backgroundColor: colors.scaffoldColor,
    //     body: Stack(children: <Widget>[
    //       SvgPicture.asset(
    //         'assets/images/landing-background.svg',
    //         fit: BoxFit.fill,
    //       ),
    //       Padding(
    //         padding: EdgeInsets.only(
    //           left: MediaQuery.of(context).size.width * 0.05,
    //           right: MediaQuery.of(context).size.width * 0.05,
    //         ),
    //         child: SingleChildScrollView(
    //           child: CustomSliverView(
    //             columnList: [
    //               Expanded(
    //                 flex: 8,
    //                 child: Container(),
    //               ),
    //               Expanded(
    //                 flex: 3,
    //                 child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: <Widget>[
    //                       // Text("LOGIN", style: texts.heading1),
    //                       // const SizedBox(height: 15),
    //                       // SizedBox(
    //                       //   height: 50,
    //                       //   child: TextField(
    //                       //     decoration: InputDecoration(
    //                       //       filled: true,
    //                       //       fillColor: colors.accentColor,
    //                       //       hintStyle: texts.paragraph,
    //                       //       hintText: 'Enter your username here.',
    //                       //       border: OutlineInputBorder(
    //                       //         borderRadius: BorderRadius.circular(5),
    //                       //         borderSide: const BorderSide(
    //                       //           width: 0,
    //                       //           style: BorderStyle.none,
    //                       //         ),
    //                       //       ),
    //                       //     ),
    //                       //   ),
    //                       // ),
    //                       // SizedBox(height: 20),
    //                       ChangeNotifierProvider(
    //                         create: (context) => MetaMaskProvider()..start(),
    //                         builder: (context, child) {
    //                           return Consumer<MetaMaskProvider>(
    //                             builder: (context, provider, child) {
    //                               late final String message;
    //                               if (provider.isConnected &&
    //                                   provider.isInOperatingChain) {
    //                                 message = 'Connected';
    //                               } else if (provider.isConnected &&
    //                                   !provider.isInOperatingChain) {
    //                                 message =
    //                                     'Wrong chain. Please connect to ${MetaMaskProvider.operatingChain}';
    //                               } else if (provider.isEnabled) {
    //                                 return Column(
    //                                   mainAxisSize: MainAxisSize.min,
    //                                   children: [
    //                                     MaterialButton(
    //                                       onPressed: () => context
    //                                           .read<MetaMaskProvider>()
    //                                           .connect(),
    //                                       color: Colors.white,
    //                                       padding: const EdgeInsets.all(0),
    //                                       child: Row(
    //                                         mainAxisSize: MainAxisSize.min,
    //                                         children: [
    //                                           Image.network(
    //                                             'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
    //                                             width: 250,
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 );
    //                               } else {
    //                                 message =
    //                                     'Please use a Web3 supported browser.';
    //                               }
    //                               return Text(
    //                                 message,
    //                                 textAlign: TextAlign.center,
    //                                 style: TextStyle(color: Colors.white),
    //                               );
    //                             },
    //                           );
    //                         },
    //                       ),
    //                     ]),
    //               )
    //             ],
    //           ),
    //         ),
    //       )
    //     ]));
  }
}
