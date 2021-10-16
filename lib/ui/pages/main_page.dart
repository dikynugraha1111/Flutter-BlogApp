import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_app/bloc/post/post_bloc.dart';
import 'package:flutter_blog_app/bloc/post/post_event.dart';
import 'package:flutter_blog_app/bloc/post/post_state.dart';
import 'package:flutter_blog_app/model/post_model.dart';
import 'package:flutter_blog_app/provider/login_page_provider.dart';
import 'package:flutter_blog_app/shared/app_route.dart';
import 'package:flutter_blog_app/shared/theme.dart';
import 'package:flutter_blog_app/ui/widgets/main/main_post_widget.dart';
import 'package:flutter_blog_app/ui/widgets/main/quarter_circle_widget.dart';
import 'package:flutter_blog_app/ui/widgets/main/shimmer_post_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../shared/photo.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PostBloc>(
        create: (context) => PostBloc(),
          child: MainPageDetail())
    );
  }
}
 class MainPageDetail extends StatefulWidget {
   const MainPageDetail({Key? key}) : super(key: key);

  @override
  State<MainPageDetail> createState() => _MainPageDetailState();
}

class _MainPageDetailState extends State<MainPageDetail> {
  @override
  void initState() {
    PostBloc bloc = BlocProvider.of<PostBloc>(context);
    bloc.add(FetchPost());
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 24),
                   child: Image.asset(
                     'assets/bitmap/logo.png',
                     width: 72,
                   ),
                 ),Consumer<LoginProvider>(
                   builder: (context, token, child) {
                     return InkWell(
                       child: Stack(
                         alignment: Alignment.centerRight,
                         children: <Widget>[
                           const SizedBox(
                             width: 55,
                             height: 55,
                             child: QuarterCircle(
                               circleAlignment: CircleAlignment.topRight,
                               color: greyColor,
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(bottom: 10),
                             child: SvgPicture.asset(
                               'assets/vector/ic_switch_account.svg',
                               width: 30,
                             ),
                           )
                         ],
                       ),
                       onTap: () {
                         token.token == "token"
                             ? Navigator.pushNamed(
                             context, AppRoute.loginRoute)
                             : showDialog<String>(
                           context: context,
                           builder: (BuildContext context) =>
                               AlertDialog(
                                 title: const Text('Log Out'),
                                 content: const Text('Awakmu Arep Metu ta?'),
                                 actions: <Widget>[
                                   TextButton(
                                     onPressed: () =>
                                         Navigator.pop(context, 'Ora'),
                                     child: const Text('Ora'),
                                   ),
                                   TextButton(
                                     onPressed: () {
                                       context
                                           .read<LoginProvider>()
                                           .changeAccount(
                                           "username", "token");
                                       Navigator.pop(context, 'Iyo');
                                     },
                                     child: const Text('Iyo'),
                                   ),
                                 ],
                               ),
                         );
                       },
                     );
                   },
                 )
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Container(
                   width: 42,
                   height: 42,
                   margin: const EdgeInsets.only(left: 24, top: 33),
                   decoration: BoxDecoration(
                     border: Border.all(color: blackColor),
                     shape: BoxShape.circle,
                     image: DecorationImage(
                         image: NetworkImage(
                           Photo.randomPhoto(),
                         ),
                         fit: BoxFit.cover),
                   ),
                 ),
                 Container(
                   padding: const EdgeInsets.only(top: 31, left: 10),
                   width: 150,
                   child: Text(context.watch<LoginProvider>().name,
                       style: greyTextFont.copyWith(
                           fontWeight: semiBold, fontSize: 20),
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis),
                 ),
                 Expanded(child: Container()),
                 GestureDetector(
                   child: Padding(
                     padding: const EdgeInsets.only(top: 31),
                     child: Text(
                       'Search Post',
                       style: greyTextFont.copyWith(fontSize: 15),
                     ),
                   ),
                   onTap: () {
                     Navigator.pushNamed(context, AppRoute.searchRoute);
                   },
                 ),
                 GestureDetector(
                   child: Padding(
                       padding:
                       const EdgeInsets.only(top: 31, left: 11, right: 33),
                       child: SvgPicture.asset('assets/vector/ic_search.svg')),
                   onTap: () {
                     Navigator.pushNamed(context, AppRoute.searchRoute);
                   },
                 ),
               ],
             ),
             const SizedBox(
               height: 58,
             ),
             Container(
               width: 352,
               alignment: Alignment.center,
               child:
               BlocBuilder<PostBloc, PostState>(builder: (context, state) {
                 if (state is PostLoaded) {
                   List<PostModel> posts = state.posts;
                   var title = posts.map((e) => e.title!.rendered).toList();

                   return ListView.builder(
                     primary: false,
                     shrinkWrap: true,
                     scrollDirection: Axis.vertical,
                     itemCount: posts.length,
                     itemBuilder: (_, index) => GestureDetector(
                       child: MainPostWidget(
                         title: title[index],
                       ),
                       onTap: () {
                         Navigator.pushNamed(context, AppRoute.detailRoute,
                             arguments: posts[index]);
                       },
                     ),
                   );
                 } else {
                   return ListView.builder(
                     primary: false,
                     shrinkWrap: true,
                     scrollDirection: Axis.vertical,
                     itemCount: 6,
                     itemBuilder: (_, index) => const ShimmerPostWidget(),
                   );
                 }
               }),
             ),
           ],
         ),
       ),
     );
   }
}
