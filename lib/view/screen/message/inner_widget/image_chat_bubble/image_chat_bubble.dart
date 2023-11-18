import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageChatBubble extends StatefulWidget {
  const ImageChatBubble({super.key, required this.imageUrl, required this.isMe, required this.time});
  final String imageUrl;
  final bool isMe;
  final String time;

  @override
  State<ImageChatBubble> createState() => _ImageChatBubbleState();
}

class _ImageChatBubbleState extends State<ImageChatBubble> {
  @override
  Widget build(BuildContext context) {
    return widget.isMe? Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, left: 12, top: 10, bottom: 5),
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width-100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
          ),
        ),
      ),
    ): Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, left: 12, top: 10, bottom: 5),
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width-100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(widget.imageUrl,fit: BoxFit.cover,)
          ),
        ),
      ),
    );
  }
}
