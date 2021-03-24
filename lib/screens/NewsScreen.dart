import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/LaunchUrl.dart';
import 'package:tracker/data/NewsData.dart';
import 'package:tracker/models/NewsResponse.dart';
import 'package:tracker/widgets/BottomBar.dart';


class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, '/');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("News Feed"),
        ),
        body: FutureBuilder<List<Articles>>(
          future: Provider.of<NewsData>(context).getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var articles = snapshot.data;
              articles.removeWhere((element) =>
                  element.title == null ||
                  element.url == null ||
                  element.description == null ||
                  element.urlToImage == null);
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Material(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                          elevation: 4,
                          child: NewsTile(
                            imgUrl: articles[index].urlToImage ?? " ",
                            title: articles[index].title ?? " ",
                            desc: articles[index].description ?? " ",
                            posturl: articles[index].url ?? " ",
                            content: articles[index].content,
                            source: articles[index].source.name,
                          )),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        bottomNavigationBar: BottomBar(
          current: 2,
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl, source;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      this.posturl,
      this.source});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await LaunchUrl().launchURL(posturl);
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "From " + source ?? "",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title ?? "",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc ?? "",
                    maxLines: 4,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
