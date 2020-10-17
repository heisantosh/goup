import 'package:Goup/appbar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('About'),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 24.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Linkify(
                        onOpen: (link) async {
                          if (await canLaunch(link.url)) {
                            await launch(link.url);
                          } else {
                            throw 'could not launch $link';
                          }
                        },
                        text:
                            'Goup is an app to help install Go https://golang.org also known as golang. It can also remind when a new version of Go is available!',
                        linkStyle: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Author : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Santosh Heigrujam'),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Github  : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Linkify(
                    onOpen: (link) async {
                      if (await canLaunch(link.url)) {
                        await launch(link.url);
                      } else {
                        throw 'could not launch $link';
                      }
                    },
                    text: 'https://github.com/heisantosh/goup',
                    linkStyle: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Twitter : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Linkify(
                    onOpen: (link) async {
                      if (await canLaunch(link.url)) {
                        await launch(link.url);
                      } else {
                        throw 'could not launch $link';
                      }
                    },
                    text: 'https://twitter.com/heisantosh',
                    linkStyle: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32.0, 0, 0),
                child: Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    } else {
                      throw 'could not launch $link';
                    }
                  },
                  text: 'Made with <3 using Flutter https://flutter.dev !',
                  linkStyle: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
