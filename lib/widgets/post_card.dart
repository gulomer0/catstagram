import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCart extends StatefulWidget {
  
  var snap;

  PostCart({this.snap});

  @override
  State<PostCart> createState() => _PostCartState();
}

class _PostCartState extends State<PostCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.00,
                    bottom: MediaQuery.of(context).size.width * 0.00,
                    left: MediaQuery.of(context).size.width * 0.00,
                    right: MediaQuery.of(context).size.width * 0.00),
                elevation: 0,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.width *
                                        0.03,
                                    top: MediaQuery.of(context).size.width *
                                        0.03,
                                    left: MediaQuery.of(context).size.width *
                                        0.03),
                                child: CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.04,
                                  backgroundImage: NetworkImage(widget.snap[
                                          'profImage']
                                      .toString()),
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.025),
                                  child: Text(
                                    "${widget.snap['username'].toString()}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.025),
                                  child: Text("Konum Bilgisi Yok",
                                      style: TextStyle(color: Colors.grey)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Image.network(
                      "${widget.snap['postUrl'].toString()}",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.favorite_border,
                              color: Colors.grey,
                              size: MediaQuery.of(context).size.width * 0.07),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.mode_comment_outlined,
                              color: Colors.grey,
                              size: MediaQuery.of(context).size.width * 0.07),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("1${widget.snap['likes'].length} beğenme",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("${widget.snap['username'].toString()}",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(" "),
                          Text("${widget.snap['description']}")
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("14 yorumu gör",
                              style: TextStyle(color: Colors.grey))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                    DateFormat.yMMMd()
                        .format(widget.snap['datePublished'].toDate()),
                              style: TextStyle(color: Colors.grey))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
