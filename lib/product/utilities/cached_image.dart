import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

CachedNetworkImage cachedImage(String url) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) => const CircularProgressIndicator(color: Colors.orange),
    errorWidget: (context, url, error) => Image.asset("assets/images/user.png")
  );
  
}
