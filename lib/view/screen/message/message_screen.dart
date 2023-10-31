import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'chat_bubble/chat_bubble.dart';
import 'chat_bubble/chat_bubble_clipper_5.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              isTrue = !isTrue;
            });
          },
          child: const Icon(Icons.add),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: constraints.maxWidth,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.arrow_back),
                            Text("Srabon Ray")
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: "https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png",
                              fit: BoxFit.fill,
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(20, (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ChatBubble(
                        clipper: ChatBubbleClipper5(),
                        alignment: isTrue? Alignment.centerLeft : Alignment.centerRight,
                        backGroundColor: Colors.purpleAccent,
                        child: const Text("How Are You? "),
                      ),
                    ),),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
